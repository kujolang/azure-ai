# Azure AI hardening, 2026-11-26

Baseline `a11891c`. Reviewed the package and exported client, deployment descriptor, HTTPS destination and credential boundaries, versioned routing, provider-response handling, and the release fixture.

`e284b34` validates the complete HTTPS resource origin, canonicalizes the optional `/openai` base path, validates deployment and API-version fields, disables redirects, and sends one authentication mode. It preserves structured provider error details while redacting the API key and Entra token from messages, nested values and keys. A successful HTTP status now requires a JSON object. [Microsoft Foundry deployment route](https://learn.microsoft.com/en-us/azure/ai-foundry/agents/how-to/ai-gateway)

The baseline passed three tests. Four additional deterministic tests failed on the baseline and pass with the change. The seven-test gate passed on checksum-verified published Kujo 1.2.0 and on local 1.10.0. A separate consumer resolved the candidate's public archive exports and produced identical redacted output through the 1.2.0 interpreter and 1.10.0 default VM. An older default VM import incompatibility also reproduced on the baseline. The published 1.2.0 interpreter is the verified minimum execution path. All requests used injected fixture transports.
