#!/bin/bash

ns=(4)
# rates=()
# rates=(11 12)
rates=(3.6 3.9 4.2 4.5 4.8)
export HF_HOME=$(pwd)/huggingface
model=facebook/opt-30b
# model=facebook/opt-13b
# dataset=./ShareGPT_V3_unfiltered_cleaned_split.json
dataset=./alpaca_data.json

for (( i = 0; i < 1; i ++ )); do
	for (( j = 0; j < 5; j ++)) do
		n=${ns[$i]}
		# rate=${rates[$j]}
		rate=${rates[$(($i*3))+$j]}
		# rate=25
		echo $n $rate $dataset $model | tee -a test.log
		python3 benchmark_serving.py --tokenizer $model --dataset $dataset --best-of $n --request-rate=$rate --num-prompts 1800 | tee -a test.log
	done
done
