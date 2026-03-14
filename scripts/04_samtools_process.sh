#!/bin/bash

# 1. 转换并排序 (SAM -> Sorted BAM)
echo "📦 正在将 SAM 转换为 Sorted BAM..."
samtools sort -@ 4 -o ../results/sample_sorted.bam ../results/sample.sam

# 2. 建立索引 (为 BAM 生成 .bai 文件，相当于书的页码索引)
echo "📇 正在为 BAM 文件建立索引..."
samtools index ../results/sample_sorted.bam

# 3. 查看简要比对统计
echo "📊 比对结果简报："
samtools flagstat ../results/sample_sorted.bam

echo "✅ 处理完成！生成了 sample_sorted.bam 和 sample_sorted.bam.bai"
