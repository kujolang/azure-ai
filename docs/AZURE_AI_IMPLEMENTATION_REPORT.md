# Azure AI Implementation Report

## Executive Summary

Deployment-scoped native client for current Azure OpenAI/Microsoft Foundry
endpoints. The repository name follows the current organization convention and
avoids creating separate obsolete-brand repositories.

## Official API Evidence

- https://learn.microsoft.com/azure/ai-foundry/openai/reference
- https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle
- https://learn.microsoft.com/azure/ai-foundry/openai/how-to/switching-endpoints

## Evidence Date

2026-08-27.

## Protocol Classification

MANAGED CLOUD PLATFORM and DEPLOYMENT-SCOPED REST API.

## Native Center / Coverage

Resource endpoint, deployment, API version, API-key/Entra auth, and chat
completion request/response handling.

## AI SDK Applicability Matrix

| Operation | Classification |
|---|---|
| Deployment chat | NATIVE ONLY in this release |
| Embeddings | NATIVE ONLY / not claimed |
| Resource/model management | NATIVE ONLY / not claimed |

## Public Exports

`create_client`, `chat`.

## Kujo Requirement / Dependencies

Kujo `>= 1.0.2`; no AI SDK dependency while deployment-specific auth/version
semantics await a governed generic adapter.

## Authentication / Security

Supports API-key and externally acquired Entra bearer token. Approved Azure
OpenAI/Foundry HTTPS hosts, embedded-credential rejection, and redaction are
covered by deterministic tests.

## Tests / Clean Room / Release

Three offline native tests pass. Clean-room Kennel installation, lockfile
reinstall, installed consumer smoke, and immutable release are recorded after
the release loop.

## Live Validation

SKIPPED — credentials/environment unavailable.

## AI SDK Changes / Kujo Changes / Kennel Changes

None.

## Contract Conformance

See `AZURE_AI_PROVIDER_PACKAGE_CONFORMANCE.md`.

## Limitations

No cloud identity acquisition, deployment creation, or model catalog API is
implemented. Credentials are not stored and signed cloud flows remain external.
