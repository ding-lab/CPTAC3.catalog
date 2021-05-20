
Last updated: 5/20/21


## Analysis Summaries - Case counts - Y3 only
Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
Methylation Array               | 43  | 222   | 8   | 169 | 111  | 113  | 229  | 164 | 19  | 249  | 1327
miRNA-Seq                       |  4  | 43    | 3   |**83**|  22   |  15  |  72  |  82 |  0  |  35  | **359**
RNA-Seq Expression              | 42  | 222   | 8  |176| 111  | 113  | 229  | 164 | 19  | 252  | 1336
RNA-Seq Fusion                  |  0  | 110   | 0   |**69**| 0    |   0  |**109**| 81 |  0  | 170  |**539** 
RNA-Seq Transcript + Splicing   |  0  | 110   | 0  |69|   0   |   0  |109| 81 |  0  | 170  | 539
WGS CNV Somatic                 |  0  | 146   | 0   | 115 | 111   | 113  |   0  | 166 |  0  | 242| 893
WGS SV                          |  0  | 222   | 0  |114| 111  |  85  |109| 89 |  0  |  203 | 1024
WXS MSI                         |  0  | 156  | 0   |   0 |   0   |   0  |   0  | 166 |  0  | 104  | 426
WXS Somatic TD                  | 0   | 0    | 0   |57| 0    | 113   |109| 0   | 0   | 0    | 279
WXS Somatic SW                  | 0   |  0    | 0   |**57**| 0   | 113  |**109**| 166 | 0   | 247  | **692**
WXS Germline                    | 0   | 110   | 0   |157|110  | 110  |218| 145 | 0   |  95  | 945

<!-- Note, WXS Somatic CCRCC was not reported to DCC analysis summary -->
## All results (Y1, Y2, Y3) - Case counts

Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
Methylation Array               | 43  | 222   | 8   | 169 | 111   | 113  | 229  | 164 | 19  | 249  | 1327
miRNA-Seq                       | 42  | 264   | 8   | 184 | 125   | 126  | 235  | 165 | 19  | 253  | 1341
RNA-Seq Expression              | 42  | 222   | 8   | 176 | 111   | 113  | 229  | 164 | 19  | 252  | 1336
RNA-Seq Fusion                  | 11  | 222   | 8   | 188 | 111   | 113  | 273  | 164 | 19  | 247  | 1311
RNA-Seq Transcript + Splicing   | 1   | 222   | 3   | 188 | 111   | 113  | 162  | 164 | 0   | 247  | 1167
WGS SV                          | 0   | 222   | 0   | 173 | 132   | 113  | 220  | 166 | 0   | 242  | 1337
WGS CNV Somatic                 |  0  | 222   | 0   | 115 | 111   | 113  | 121  | 166 |  0  | 242  | 1090
WXS MSI                         | 0   | 222   | 0   | 118 | 111   | 113  | 111  | 166 | 0   | 247  | 1088
WXS Somatic TD                  | 0   |  0    | 0   | 57  | 0     | 113  | 109  | 0   | 0   | 0    | 279 
WXS Somatic SW                  | 0   | 0     | 0   | 59  | 0     | 113  | 218  | 166 | 0   | 247  | 800
WXS Germline                    | 0   | 110   | 0   | 157 |110    | 110  | 218  | 145 | 0   |  95  | 945


### Technical
Generate Y3 counts with,
```
bash src/DCC_case_counts.sh -C Y3 RNA-Seq_Expression.DCC_analysis_summary.dat
```

