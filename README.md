# CSE 3422 repository reference

[![CI](https://github.com/Lazyb0y/cse3422-repo-reference/actions/workflows/ci.yml/badge.svg)](https://github.com/Lazyb0y/cse3422-repo-reference/actions/workflows/ci.yml)

The **finished state** every team repository reaches by the end of the term: one example of each engineering practice the course teaches, fully configured. Teams start from the structure-only **team starter** and add each practice themselves after it has been shown in class; this repository is the instructor's reference and the model shown in class.

## What is here, and when teams build it

| Practice | Files and settings in this repository | Taught in |
|---|---|---|
| Repository from a template, collaborators | (repository settings) | Class 1 |
| Help-request issue form | `.github/ISSUE_TEMPLATE/help-request.yml` | Class 1 |
| Project-idea issue form, bug-report form, issue settings | `.github/ISSUE_TEMPLATE/project-idea.yml`, `bug-report.yml`, `config.yml` | Class 1 (idea), Class 3 (others) |
| Team contract and first pull request | `docs/team-contract.md` | Class 1 |
| Living specification | `docs/specification.md` | Class 2 |
| Licence | `LICENSE` | Class 2 |
| Branch protection, merge settings | Settings → Branches; `scripts/setup-repo.ps1` / `.sh` automate it | Class 3 |
| Pull-request template, code owners, contributing rules | `.github/PULL_REQUEST_TEMPLATE.md`, `.github/CODEOWNERS`, `CONTRIBUTING.md` | Class 3 |
| Secrets kept out of the repository | `.gitignore`, `.env.example` | Class 3 |
| Consistent formatting and line endings | `.editorconfig`, `.gitattributes` | Class 3 |
| Design document and ADRs | `docs/design.md`, `docs/adr/` | Class 3 |
| CI with required checks (title, secret scan, build and test) | `.github/workflows/ci.yml` | Class 7 |
| Dependency updates | `.github/dependabot.yml` | Class 7 |
| Secret scanning with push protection | Settings → Code security | Class 7 |
| Postman API tests | `api-tests/` | Class 7 |
| Test evidence | `docs/test-evidence.md` | Class 7 |
| Releases, semantic versioning, changelog | `CHANGELOG.md`, release tags | Class 8 |
| Usability report | `docs/usability.md` | Class 9 |
| CodeQL, security policy, private vulnerability reporting | `SECURITY.md`; Settings → Code security | Class 10 |
| Weekly status reports | `reports/` | Every week |

## Using the setup script

`scripts/setup-repo.ps1` (Windows) or `scripts/setup-repo.sh` applies every repository setting above in one go through the GitHub CLI. Teams configure these by hand in Class 3, 7 and 10 so they understand each one; the script shows what "done" looks like and is useful for the instructor's own repositories.

## Layout

```text
.github/            issue forms, pull-request template, code owners, Dependabot, CI workflow
frontend/  backend/ application code (or one app at the root, or two repositories)
api-tests/          Postman collection and environments
docs/               team contract, specification, design + ADRs, test evidence, usability
reports/            weekly status files
scripts/            one-time repository setup
```

## Licence

[MIT](LICENSE).
