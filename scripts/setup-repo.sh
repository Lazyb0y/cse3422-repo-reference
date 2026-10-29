#!/usr/bin/env bash
# One-time repository setup for the team lead (needs the GitHub CLI: https://cli.github.com, then `gh auth login`).
# Protects main, sets merge options, and switches on the security features. Safe to run again.
set -euo pipefail

repo="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
echo "Setting up $repo"

echo "- Merge options: squash only, delete branches after merge"
gh repo edit "$repo" --enable-squash-merge --enable-merge-commit=false --enable-rebase-merge=false --delete-branch-on-merge

echo "- Security: Dependabot alerts and fixes, secret scanning with push protection, private vulnerability reporting"
gh api -X PUT "repos/$repo/vulnerability-alerts" --silent
gh api -X PUT "repos/$repo/automated-security-fixes" --silent
gh api -X PATCH "repos/$repo" --silent --input - <<'JSON'
{ "security_and_analysis": { "secret_scanning": { "status": "enabled" }, "secret_scanning_push_protection": { "status": "enabled" } } }
JSON
gh api -X PUT "repos/$repo/private-vulnerability-reporting" --silent

echo "- Code scanning: CodeQL default setup"
gh api -X PATCH "repos/$repo/code-scanning/default-setup" -f state=configured --silent \
  || echo "  CodeQL could not be enabled yet (it needs code in a supported language); run this script again later."

echo "- Protecting main: pull requests, 1 approving review, required checks, no force pushes"
gh api -X PUT "repos/$repo/branches/main/protection" --silent --input - <<'JSON'
{
  "required_status_checks": { "strict": true, "contexts": ["pr-title", "secrets", "build"] },
  "enforce_admins": true,
  "required_pull_request_reviews": { "required_approving_review_count": 1, "dismiss_stale_reviews": true },
  "restrictions": null,
  "required_linear_history": true,
  "required_conversation_resolution": true,
  "allow_force_pushes": false,
  "allow_deletions": false
}
JSON

echo "Done. Check Settings > Branches and Settings > Code security on GitHub."
