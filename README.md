# Azure AI Provider for Kujo

[![Version](https://img.shields.io/badge/version-0.1.1-black)](https://github.com/kujolang/azure-ai/releases/tag/v0.1.1)
[![License](https://img.shields.io/badge/license-MIT-black)](LICENSE)
[![built with Kujo](https://img.shields.io/badge/built%20with-Kujo-black)](https://github.com/kujolang/kujo)

Native Azure OpenAI / Microsoft Foundry deployment client for Kujo. Resource,
deployment, API version, and credential mode remain explicit.

## Install

```bash
kujo kennel add github:kujolang/azure-ai@v0.1.1
kujo kennel install
```

## 30-second quick start

```kujo
from azure_ai import create_client, chat

client := create_client({
    "endpoint": env("AZURE_OPENAI_ENDPOINT"),
    "api_key": env("AZURE_OPENAI_API_KEY"),
    "deployment": "my-model",
})

result := chat(client, {
    "messages": [{"role": "user", "content": "Say hello."}],
})
print(result["data"])
```

## Native Provider API

Azure APIs target a resource deployment rather than a global model catalog.
This package preserves deployment, API version, endpoint, and native response
data. Entra bearer tokens may be supplied through `access_token`.

```kujo
from azure_ai import create_client, chat

client := create_client({
    "endpoint": "https://example.openai.azure.com",
    "deployment": "gpt-4o",
    "api_version": "2024-10-21",
    "access_token": env("AZURE_OPENAI_ACCESS_TOKEN"),
})

result := chat(client, {
    "messages": [
        {"role": "user", "content": "Summarize Azure deployment semantics."},
    ],
})
```

## AI SDK integration

AI SDK normalization is not advertised until deployment-scoped auth and API
version behavior have a governed generic adapter. Use the native client.

## Authentication and security

Use `AZURE_OPENAI_API_KEY` or an externally acquired `AZURE_OPENAI_ACCESS_TOKEN`.
Only HTTPS Azure OpenAI/Foundry hosts are accepted; embedded credentials and
secret leakage are rejected or redacted.

## Testing and docs

```bash
bash scripts/release_quality_gate.sh
```

See [`docs/`](docs/) for implementation and conformance reports.
