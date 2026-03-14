#!/bin/bash

# 1. 定义路径
INDEX="../data/ref/grch38_chr22"
CLEAN_DIR="../results"
OUT_DIR="../results"
LOG_DIR="../logs"

# 2. 运行 HISAT2 比对
# -p 4: 使用 4 个线程
# -x: 索引文件的路径前缀
# -1/-2: 输入的双端测序清理后的数据
# -S: 输出的 SAM 文件路径
echo "🚀 正在进行比对 (Mapping)... 请稍候..."

hisat2 -p 4 -x ${INDEX} \
       -1 ${CLEAN_DIR}/clean_R1.fastq.gz \
       -2 ${CLEAN_DIR}/clean_R2.fastq.gz \
       -S ${OUT_DIR}/sample.sam \
       2> ${LOG_DIR}/align.log

echo "✅ 比对完成！"
echo "结果已保存为 results/sample.sam"
echo "比对统计信息请查看 logs/align.log"
