# Team contract

Agree on this before writing code and commit it through a pull request. The author signs by opening that pull request; **every other member signs by approving it** (GitHub doesn't let you approve your own). Merge only when every approval is in. Revisit it after each milestone.

## Members and roles

Every member writes code. Roles say who leads an area, not who does all of it.

| Name | GitHub | Role(s) | Strength we can rely on | Something I want to learn |
|---|---|---|---|---|
| | @ | Team lead / Scrum master | | |
| | @ | Backend lead | | |
| | @ | Frontend lead | | |
| | @ | Quality and DevOps lead | | |

## Communication

- Main channel (e.g., a Messenger or Discord group): …
- We reply to teammates within: … hours on weekdays
- Decisions are recorded in: Jira comments, pull requests or ADRs (not only in chat)
- Help from the instructor: through GitHub **Help request** issues

## Meeting rhythm

- Weekly planning: day and time …, about 30 minutes, online or in person
- Short check-ins: … (e.g., Monday and Thursday, 10 minutes)
- Weekly status report in `reports/YYYY-MM-DD.md`, written by: … (rotates weekly)

## Definition of Done

A Jira issue is done only when:

- [ ] The acceptance criteria pass
- [ ] Tests are written or updated and CI is green
- [ ] The pull request is reviewed and approved by another member, then merged
- [ ] Documentation and `CHANGELOG.md` are updated where needed
- [ ] The Jira issue is moved to Done with the pull request linked

## When things go wrong

1. Missed deadline or silence: the team lead messages the member within 24 hours.
2. Still unresolved after 48 hours: discuss it at the next meeting and record the agreed action in the weekly report.
3. Still unresolved: open a **Help request** issue for the instructor, with facts (dates, Jira issues, pull requests), not feelings.

Disagreements about design are settled with evidence: a quick prototype, a measurement, or an ADR.

## AI use agreement

Within the course policy:

- Fundamentals first: no AI-generated code in work that is meant to show your own understanding.
- When AI helps, say so in the pull request (which tool, for what) and in the README's "AI use" section.
- Every member can explain every line they submit; anything you cannot explain is rewritten.
- Never paste secrets, keys or personal data into an AI tool.

Our extra rules: …

## Signatures

The author opens the pull request that adds this file; every other member approves it before it is merged. Date agreed: …
