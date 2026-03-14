#!/bin/bash

# 定义变量
GTF="../data/ref/Homo_sapiens.GRCh38.111.gtf"
BAM="../results/sample_sorted.bam"
OUT="../results/counts.txt"

echo "📊 正在统计基因表达量 (featureCounts)..."

# -p: 针对双端测序数据
# -t exon: 统计落在“外显子”上的 reads
# -g gene_id: 以基因 ID 为单位进行汇总
# -a: 输入注释文件 (GTF)
# -o: 输出结果文件
featureCounts -p -t exon -g gene_id -a $GTF -o $OUT $BAM

echo "✅ 定量完成！结果保存在 results/counts.txt"
