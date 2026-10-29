# One-time repository setup for the team lead (needs the GitHub CLI: https://cli.github.com, then `gh auth login`).
# Protects main, sets merge options, and switches on the security features. Safe to run again.
#   powershell -ExecutionPolicy Bypass -File scripts/setup-repo.ps1
$ErrorActionPreference = 'Stop'

function Invoke-Gh {
    param([Parameter(ValueFromRemainingArguments)][string[]]$GhArgs)
    & gh @GhArgs
    if ($LASTEXITCODE -ne 0) { throw "gh $($GhArgs -join ' ') failed" }
}

function Invoke-GhJson([string]$Method, [string]$Path, [string]$Json) {
    $tmp = New-TemporaryFile
    try {
        [IO.File]::WriteAllText($tmp.FullName, $Json)
        Invoke-Gh api -X $Method $Path --silent --input $tmp.FullName
    }
    finally { Remove-Item $tmp.FullName }
}

$repo = (& gh repo view --json nameWithOwner -q .nameWithOwner).Trim()
if (-not $repo) { throw 'Run this from inside the repository folder after `gh auth login`.' }
Write-Host "Setting up $repo"

Write-Host '- Merge options: squash only, delete branches after merge'
Invoke-Gh repo edit $repo --enable-squash-merge --enable-merge-commit=false --enable-rebase-merge=false --delete-branch-on-merge

Write-Host '- Security: Dependabot alerts and fixes, secret scanning with push protection, private vulnerability reporting'
Invoke-Gh api -X PUT "repos/$repo/vulnerability-alerts" --silent
Invoke-Gh api -X PUT "repos/$repo/automated-security-fixes" --silent
Invoke-GhJson PATCH "repos/$repo" '{ "security_and_analysis": { "secret_scanning": { "status": "enabled" }, "secret_scanning_push_protection": { "status": "enabled" } } }'
Invoke-Gh api -X PUT "repos/$repo/private-vulnerability-reporting" --silent

Write-Host '- Code scanning: CodeQL default setup'
& gh api -X PATCH "repos/$repo/code-scanning/default-setup" -f state=configured --silent
if ($LASTEXITCODE -ne 0) { Write-Host '  CodeQL could not be enabled yet (it needs code in a supported language); run this script again later.' }

Write-Host '- Protecting main: pull requests, 1 approving review, required checks, no force pushes'
Invoke-GhJson PUT "repos/$repo/branches/main/protection" @'
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
'@

Write-Host 'Done. Check Settings > Branches and Settings > Code security on GitHub.'
