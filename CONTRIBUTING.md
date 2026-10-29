# Contributing

This repository is run like a real product. These rules apply to every member, every change.

## The path of every change

1. **Jira issue first.** Every change starts from an issue on the team's Jira board (story, task or bug).
2. **Branch from `main`** and put the Jira key in the name: `KEY-12-login-form`.
3. **Commit small and often** with the key in the message: `KEY-12: validate email on sign-up`. Use the imperative mood and keep the summary under 72 characters; add a body when the *why* is not obvious.
4. **Open a pull request** whose title starts with the key: `KEY-12: login form with validation`. Fill in the template, including how you tested it and any AI use.
5. **Checks must be green.** CI runs on every pull request: title format, secret scan, build and tests.
6. **One approving review** from another member. Reviewers comment on behaviour, tests, naming and risks, not just style.
7. **Squash and merge.** The branch is deleted automatically.

`main` is protected: nobody pushes to it directly, including the repository owner.

## Pull requests

- One Jira issue per pull request; aim for under 400 changed lines.
- Update the docs (`README.md`, `docs/specification.md`, `docs/design.md`) in the same pull request when behaviour or design changes.
- User-visible changes get a line under **Unreleased** in `CHANGELOG.md`.
- Never commit secrets, API keys, passwords or real personal data. Use environment variables and keep `.env.example` up to date.

## Help

Ask the instructor through a **Help request** issue (Issues → New issue → Help request). Help requests are not handled in Jira, chat or email.

## Releases and milestones

- Releases use semantic versioning tags: `v0.1.0`, `v0.2.0`, …, each with GitHub release notes and a `CHANGELOG.md` entry.
- Milestone snapshots are tagged `m1-check`, `m2-check` and `m3-final` when the instructor asks; work added later counts for the next milestone.
