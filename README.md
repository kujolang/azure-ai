# Azure AI Provider for Kujo

[![Version](https://img.shields.io/badge/version-0.1.1-black)](https://github.com/kujolang/azure-ai/releases/tag/v0.1.1)
[![License](https://img.shields.io/badge/license-MIT-black)](LICENSE)
[![built with Kujo](https://img.shields.io/badge/built%20with-Kujo-black)](https://github.com/kujolang/kujo)

Native Azure OpenAI / Microsoft Foundry deployment client for Kujo. Resource,
deployment, API version, and credential mode remain explicit. This source uses Kujo 1.2.0 or newer for credentialed HTTP requests.

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
if result["ok"] {
    print(result["data"])
} else {
    eprint(result["message"])
    exit(1)
}
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

Configure a resource URL under `openai.azure.com` or `services.ai.azure.com`.
The resource origin and the same URL ending in `/openai` are accepted. Requests
use the selected deployment and API version and keep redirects disabled.

Configure `AZURE_OPENAI_API_KEY` or pass an externally acquired Entra token as
`access_token`. A supplied Entra token takes precedence and only its
authorization header is sent. Failed request messages and structured error
details redact both configured credentials.

## Testing and docs

```bash
bash scripts/release_quality_gate.sh
```

The fixture contracts run on published Kujo 1.2.0. For the standalone example on that runtime, use `kujo run examples/quickstart.kujo --interpreter`. The current default VM path is verified on Kujo 1.10.0.

See [`docs/`](docs/) for implementation and conformance reports.
