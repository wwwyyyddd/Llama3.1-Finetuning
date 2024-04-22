NCCL_P2P_DISABLE=1 \
NCCL_IB_DISABLE=1 \
CUDA_VISIBLE_DEVICES=4,5,6,7 \
torchrun \
--nproc_per_node 4 \
--nnodes 1 \
--node_rank 0 \
--master_addr localhost \
--master_port 6600 \
../finetune.py \
--model_name_or_path "../model_hub/LLM-Research/Meta-Llama-3-8B-Instruct/" \
--data_path "../data/西西嘛呦.json" \
--bf16 True \
--output_dir "../output/llama3_8B_full" \
--num_train_epochs 5 \
--per_device_train_batch_size 1 \
--per_device_eval_batch_size 1 \
--gradient_accumulation_steps 8 \
--evaluation_strategy "no" \
--save_strategy "steps" \
--save_steps 5 \
--save_total_limit 1 \
--learning_rate 1e-5 \
--weight_decay 0.1 \
--adam_beta2 0.95 \
--warmup_ratio 0.01 \
--lr_scheduler_type "cosine" \
--logging_steps 1 \
--report_to "none" \
--model_max_length 4096 \
--gradient_checkpointing True \
--lazy_preprocess True \
--deepspeed "../config/ds_config_zero2.json"