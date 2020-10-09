## Analysis Summaries - Y3 only

Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
Methylation Array               | 43  | 222   | 8   | 116 | 111   | 113  | 229  | 164 | 19  | 246  | 1271
RNA-Seq Expression              | 42  | 222   | 8   | 118 | 111   | 113  | 229  | 164 | 19  | 249  | 1275
RNA-Seq Fusion                  |  0  | 110   | 0   |   0 |   0   |   0  |   0  |  81 |  0  | 145  | 336
RNA-Seq Transcript + Splicing   |  0  | 110   | 0   |   0 |   0   |   0  |   0  |  81 |  0  | 145  | 336
WGS CNV Somatic                 |  0  |   0   | 0   |  59 | 109   | 113  |   0  | 116 |  0  |  39  | 486
WGS SV                          |  0  | 222   | 0   |   0 | 109   |   0  |   0  |  89 |  0  |  0   | 420
miRNA-Seq                       |  4  |   5   | 3   |  14 |  22   |  15  |  72  |  82 |  0  |  32  | 249
WXS MSI                         |  0  | 117   | 0   |   0 |   0   |   0  |   0  | 166 |  0  | 101  | 384
WXS Somatic                     | 0   | 0     | 0   | 0   | 0     | 113  | 0    | 0   | 0   | 0    | 113
WXS Somatic SW                  | 0   | 0     | 0   | 0   | 0     | 113  |   0  | 0   | 0   | 0    | 113

## All results (Y1, Y2, Y3)

Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
Methylation Array               | 43  | 222   | 8   | 116 | 111   | 113  | 229  | 164 | 19  | 246  | 1271
miRNA-Seq                       | 42  | 222   | 8   | 114 | 111   | 113  | 229  | 164 | 19  | 247  | 1269
RNA-Seq Expression              | 42  | 225   | 8   | 120 | 118   | 117  | 230  | 164 | 19  | 251  | 1275
RNA-Seq Fusion                  | 11  | 222   | 8   | 119 | 111   | 113  | 164  | 164 | 19  | 222  | 1152
RNA-Seq Transcript + Splicing   | 1   | 222   | 3   | 119 | 111   | 113  | 53   | 164 | 0   | 222  | 1007
WGS SV                          | 0   | 222   | 0   | 59  | 109 * | 113  | 111  | 166 | 0   | 39   | 819
WGS CNV Somatic                 | 0   | 117   | 0   | 59  | 109   | 113  | 121  | 166 | 0   | 39   | 724
WXS MSI                         | 0   | 222   | 0   | 118 | 111   | 113  | 111  | 166 | 0   | 244  | 1085
WXS Normal Adjacent             | 0   | 80    | 0   | 0   | 5     | 22   | 101  | 0   | 0   | 21   | 229
WXS Somatic                     | 0   | 0     | 0   | 0   | 0     | 113  | 0    | 0   | 0   | 0    | 113
WXS Somatic SW                  | 0   | 0     | 0   | 0   | 0     | 113  | 109  | 0   | 0   | 0    | 222

### Technical
Generate Y3 counts with,
```
bash src/DCC_case_counts.sh -C Y3 RNA-Seq_Expression.DCC_analysis_summary.dat
```
