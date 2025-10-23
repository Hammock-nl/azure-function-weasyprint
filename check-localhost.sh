#!/usr/bin/env bash

curl -X POST http://localhost:8080/api/http-trigger \
    --verbose \
    -H "Content-Type: text/html" \
    --data '<h1>Hello from WeasyPrint!</h1>' \
    -o check-localhost.pdf