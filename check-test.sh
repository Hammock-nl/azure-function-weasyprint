#!/usr/bin/env bash

curl -X POST https://hammock-weasyprint-test.wittydune-6fb6a25a.westeurope.azurecontainerapps.io/api/http-trigger?code= \
    --verbose \
    -H "Content-Type: text/html" \
    --data '<h1>Hello from WeasyPrint!</h1>' \
    -o check-test.pdf