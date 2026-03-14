import pandas as pd
import re

# 1. 读取我们之前生成的 Top 10 数据（或者直接读 clean_counts.matrix）
# 假设我们处理刚才 R 里的 top10 数据
df = pd.read_csv('../results/clean_counts.matrix', sep='\t', header=None, names=['gene_id', 'count'])

# 2. 从 GTF 文件中提取 ID 和 Name 的对应关系
# GTF 每一行都很长，我们只需要包含 'gene_id' 和 'gene_name' 的部分
id_to_name = {}
with open('../data/ref/Homo_sapiens.GRCh38.111.gtf', 'r') as f:
    for line in f:
        if line.startswith('#'): continue
        if 'gene_id' in line and 'gene_name' in line:
            # 使用正则表达式提取
            gid = re.search(r'gene_id "(.*?)";', line).group(1)
            gname = re.search(r'gene_name "(.*?)";', line).group(1)
            id_to_name[gid] = gname

# 3. 转换并保存
df['gene_symbol'] = df['gene_id'].map(id_to_name)
df_sorted = df.sort_values(by='count', ascending=False)

# 打印前 10 个看看
print("--- Top 10 Genes with Symbols ---")
print(df_sorted.head(10))

# 保存结果
df_sorted.to_csv('../results/final_counts_with_names.txt', sep='\t', index=False)
