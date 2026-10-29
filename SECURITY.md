# Security policy

## Reporting a vulnerability

Please **do not open a public issue** for a security problem. Report it privately through **Security → Report a vulnerability** on this repository (private vulnerability reporting is enabled by `scripts/setup-repo`). The team will reply within a week.

## What we do

- Secrets live in environment variables and GitHub secrets, never in the repository; `.env.example` lists the names without values.
- Secret scanning with push protection, Dependabot alerts and CodeQL are switched on.
- Dependency updates from Dependabot are reviewed and merged like any other pull request.
- Seed and test data contain no real personal data.
