#!/bin/bash

ns=(2 4 6)
# rates=()
# rates=(11 12)
export HF_HOME=$(pwd)/huggingface
model=facebook/opt-30b
# model=facebook/opt-13b
# dataset=./ShareGPT_V3_unfiltered_cleaned_split.json
dataset=./alpaca_data.json

for (( i = 0; i < 3; i ++ )); do
	for (( j = 0; j < 1; j ++)) do
		n=${ns[$i]}
		# rate=${rates[$j]}
		# rate=${rates[$(($i*3))+$j]}
		rate=100
		echo $n $rate $dataset $model | tee -a test.log
		numactl --cpubind=0 python3 benchmark_serving.py --tokenizer $model --dataset $dataset --best-of $n --request-rate=$rate --num-prompts 60 | tee -a test.log
	done
done
