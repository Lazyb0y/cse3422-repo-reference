# API tests (Postman)

> From Class 7.

Export the team's Postman collection here (`collection.json`) with one environment file per target, for example `local.postman_environment.json` and `deployed.postman_environment.json`. Every request has tests on status, body and important headers, not only the status code.

- **No secrets in these files.** Keep tokens as environment variables with empty values here, and set the real values in GitHub secrets for CI.
- CI runs the collection with Newman or the Postman CLI once the API exists (Class 7 adds the step).
