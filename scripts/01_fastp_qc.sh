#!/bin/bash

# 定义路径
RAW_DIR="../data/raw"
RES_DIR="../results"
LOG_DIR="../logs"

# 运行 fastp
fastp -i ${RAW_DIR}/test_R1.fastq.gz -I ${RAW_DIR}/test_R2.fastq.gz \
      -o ${RES_DIR}/clean_R1.fastq.gz -O ${RES_DIR}/clean_R2.fastq.gz \
      -h ${RES_DIR}/fastp_report.html \
      -j ${RES_DIR}/fastp_report.json \
      2> ${LOG_DIR}/fastp.log

echo "✅ fastp 处理完成！"
echo "清理后的数据已存入 results/ 文件夹。"
echo "请查看 results/fastp_report.html 获取体检报告。"
