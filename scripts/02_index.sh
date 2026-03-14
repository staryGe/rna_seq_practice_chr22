#!/bin/bash

# 定义路径
REF_DIR="../data/ref"
FASTA=${REF_DIR}/Homo_sapiens.GRCh38.dna.chromosome.22.fa

# 运行 hisat2-build
# 参数说明：输入 FASTA 文件，输出索引的前缀为 grch38_chr22
echo "正在构建索引，请稍候..."
hisat2-build -p 4 $FASTA ${REF_DIR}/grch38_chr22

echo "✅ 索引构建完成！请查看 data/ref/ 下生成的 .ht2 文件。"
