#!/bin/bash
export HF_HOME=$(pwd)/huggingface
python3 -m vllm.entrypoints.api_server --model facebook/opt-30b --swap-space 30 --disable-log-requests
#python3 -m vllm.entrypoints.api_server --model facebook/opt-13b --swap-space 60 --disable-log-requests --max-num-seqs=1024 --max-num-batched-tokens=8192