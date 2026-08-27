# Azure AI Provider Package Contract v1 Conformance

Contract version: `1.0.1`.

| Requirement | Result | Evidence |
|---|---|---|
| README/license/source/tests | PASS | Required artifacts and first-request README. |
| Native client/fidelity | PASS | Deployment/API-version/resource request fields. |
| AI SDK adapter | N/A | Deployment-scoped auth/version semantics need generic support. |
| Authentication/security | PASS | API key/Entra headers, host policy, redaction tests. |
| Deterministic tests | PASS | Three credential-free tests. |
| Kennel manifest/exports | PASS | Valid manifest and explicit exports. |
| Clean-room distribution | PASS | Fresh v0.1.1 install, reinstall, validation, and installed smoke. |
| Release metadata | PASS | Immutable v0.1.1 tag and verified remote commit. |
| Documentation/agent guidance | PASS | README, reports, example, AGENTS. |

All applicable native requirements pass; AI SDK integration is intentionally N/A.
