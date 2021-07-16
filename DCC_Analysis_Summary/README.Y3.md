
Last updated: 7/15/21

**BOLD** are new since 6/18/21

## Analysis Summaries - Case counts - Y3 only
Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
Methylation Array               | 43  | 222   | 8   | 184 | 111   | 113  | 229  | 164 | 19  | 249  |  1342 
miRNA-Seq                       |  4  | 43    | 3   | 83  |  22   |  15  |  72  |  82 |  0  |  35  |  359 
RNA-Seq Expression              | 42  | 222   | 8   | 187 | 111   | 113  | 229  | 164 | 19  | 252  |  1347 
RNA-Seq Fusion                  |  0  | 110   | 0   | 69  | 0     |   0  | 109  | 81  |  0  | 170  | 539  
RNA-Seq Transcript + Splicing   |  0  | 110   | 0   | 69  |   0   |   0  |**208**| 81  |  0  | 170  |**638** 
WGS CNV Somatic                 |  0  | 146   | 0   | 115 | 111   | 113  |   0  | 166 |  0  | 242  | 893
WGS SV                          |  0  | 222   | 0   | 114 | 111   |  85  | 109  | 89  |  0  |  203 | 1024
WXS MSI                         |  0  | 156   | 0   | 57  | 0     |   0  | 108  | 166 |  0  | 104  |  591 
WXS Somatic TD                  | 0   | 222   | 0   | 157 | 111   | 202  | 218  | 164 | 0   | 233  |  1319 
WXS Somatic SW                  | 0   |  0    | 0   | 57  | 0     | 113  | 109  | 166 | 0   | 247  |  692 
WXS Germline                    | 0   | 110   | 0   | 157 |110    | 110  | 218  | 145 | 0   |  95  | 945

<!-- Note, WXS Somatic CCRCC was not reported to DCC analysis summary -->
## All results (Y1, Y2, Y3) - Case counts

Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
Methylation Array               | 43  | 222   | 8   | 184 | 111   | 113  | 229  | 164 | 19  | 249  | 1342
miRNA-Seq                       | 42  | 222   | 8   | 183 | 111   | 113  | 229  | 164 | 19  | 250  | 1341 
RNA-Seq Expression              | 42  | 222   | 8   | 187 | 111   | 113  | 229  | 164 | 19  | 252  | 1347 
RNA-Seq Fusion                  | 11  | 222   | 8   | 188 | 111   | 113  | 229  | 164 | 19  | 246  | 1311 
RNA-Seq Transcript + Splicing   | 1   | 222   | 3   | 188 | 111   | 113  | 218  | 164 | 0   | 246  | 1266
WGS SV                          | 0   | 222   | 0   | 173 | 111   | 113  | 219  | 166 | 0   | 242  | 1337 
WGS CNV Somatic                 |  0  | 222   | 0   | 115 | 111   | 113  | 121  | 166 | 0   | 242  | 1090 
WXS MSI                         | 0   | 222   | 0   | 175 | 111   | 113  | 219  | 166 | 0   | 247  | 1253 
WXS Somatic TD                  | 0   | 222   | 0   | 157 | 111   | 202  | 218  | 164 | 0   | 233  | 1319
WXS Somatic SW                  | 0   | 0     | 0   | 57  | 0     | 113  | 217  | 166 | 0   | 247  | 800 
WXS Germline                    | 0   | 110   | 0   | 157 |110    | 110  | 218  | 145 | 0   |  95  | 945


### Technical
Generate Y3 counts with,
```
bash src/DCC_case_counts.sh -C Y3 RNA-Seq_Expression.DCC_analysis_summary.dat
```

