# Product specification

> **Living document.** The first draft is due before Class 3; coding starts as soon as it is merged. After the instructor's review it is tagged `spec-v1`, which the MVP is graded against. Keep it in step with the code: changes go through pull requests, and MVP-scope changes need the instructor's approval in the pull request.

## 1. Problem, users and roles

- **Problem:** who suffers, how they cope today, why that is not good enough.
- **Users and roles** (at least 2): …

## 2. User stories (MVP of 5 to 8, in priority order)

Each story has Given / When / Then acceptance criteria, including at least one unhappy path. Keep the Jira key next to each story.

### KEY-1: As a …, I want …, so that …

- **Given** … **when** … **then** …
- **Given** … **when** … **then** … *(unhappy path)*

## 3. Non-functional requirements (measurable)

| Quality | Requirement | How we will check it |
|---|---|---|
| Performance | e.g., order history loads in under 1 s with 1,000 orders | |
| Security | | |
| Usability / accessibility | | |

## 4. Scope

- **MVP:** …
- **Out of scope** (we will not build these): …

## 5. Wireframes

Add images under `docs/img/` and link them here, one per key story.

## 6. Main entities and relationships (at least 5)

| Entity | Key fields | Related to |
|---|---|---|
| | | |

## 7. Risks, KPIs and scale estimate

- **Biggest risks** (50 words or fewer): …
- **KPIs** (2 to 3, measurable): …
- **Scale estimate** from Class 1 (users, daily actives, peak requests per second, storage per year, with working): …

## 8. Privacy and ethics

What personal data we store, why, who can see it, and how long we keep it. No real personal data in seeds or tests.

## 9. External API

Which API, what the product uses it for, its free or sandbox limits, and the fallback when it is down.
