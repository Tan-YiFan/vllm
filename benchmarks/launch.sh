#!/bin/bash
python3 -m vllm.entrypoints.api_server --model facebook/opt-30b --swap-space 60 --disable-log-requests