# DCC Analysis Summary files

Files here provide a unified summary of all Year 2 and later CPTAC3 genomic analysis results and their location on 
[CPTAC-DCC](https://cptc-xfer.uis.georgetown.edu/aspera/user/).

## Format

DCC Analysis Summary files have the following initial columns:
```
 1. case
 2. disease
 3. pipeline_name
 4. pipeline_version
 5. timestamp
 6. C3Y 
 7. DCC_path
 8. filesize
 9. file_format
10. md5sum
```

NEW: Column C3Y indicates "CPTAC3 Year" and takes values `Y1`, `Y2`, etc.  It is used for administrative purposes.

Additional columns are specific to individual pipelines and will typically indicate the input data associated with this analysis.
Pipelines which generate multiple result files per case will have multiple entries in the analysis summary file.

## Analysis Summaries

Counts of cases processed per disease and pipeline.  Counts of results to reference other than GDC hg38 excluded.

Pipeline (last updated 7/15/21) | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
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


<!--
### QC Pipelines

QC Pipelines                    | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
miRNA-Seq QC                    | 11  | 28    | 5   | 52  | 17    | 27   | 10   | 77  | 19  | 39   | 285 
RNA-Seq QC                      | 11  | 112   | 8   | 119 | 111   | 113  | 53   | 83  | 19  | 77   | 706 
WGS QC                          | 0   | 0     | 0   | 60  | 21    | 113  | 0    | 77  | 0   | 39   | 310
WXS QC                          | 5   | 87    | 4   | 118 | 111   | 113  | 101  | 44  | 9   | 51   | 643
-->

## Year 1

Processing performed during CPTAC3 Year 1 consisted analyses for CCRCC, LUAD,
and UCEC discovery cohort, and a visual summary of processing per batch can be
found in this [processing update description](doc/ProcessingUpdate.2.1.19.png).
A subset of Year 1 calls is included in the DCC analysis summaries here, mainly
those calls whose pipeline versions are consistent with those in Year 2.  Year
1 analyses can be identified by "Y1" in C3Y column, and do not have details
about input data.

# Pipeline details

Details and notes about pipelines and processing status below. More complete
pipeline details are included in documentation included with data files on DCC.

## Methylation_Array

Methylation array analysis has been performed for all cases available on DCC
through December 2019, details in
[`Methylation_Array.DCC_analysis_summary.dat`](Methylation_Array.DCC_analysis_summary.dat)

[CPTAC3 Methylation pipeline details](https://github.com/ding-lab/cptac_methylation)

## miRNA-Seq

### miRNA-Seq analysis

Analysis details [`miRNA-Seq.DCC_analysis_summary.dat`](miRNA-Seq.DCC_analysis_summary.dat) 
Note that each sample has results for mature miRNA, precursor miRNA, and total miRNA.  

[miRNA-Seq pipeline documentation](https://github.com/ding-lab/CPTAC_miRNA) and [processing description](processing_description/miRNA-Seq.processing_description.md).

### miRNA-Seq QC

Analysis details [`miRNA-Seq_QC.DCC_analysis_summary.dat`](miRNA-Seq_QC.DCC_analysis_summary.dat) 

[QC pipeline documentation](https://github.com/ding-lab/CPTAC3_QC)

## RNA-Seq

### RNA-Seq Expression

965 cases (consisting of all Y1 and Y2 cases) been analyzed

Analysis details [`RNA-Seq_Expression.DCC_analysis_summary.dat`](RNA-Seq_Expression.DCC_analysis_summary.dat)

[CPTAC3 RNA-Seq Expression pipeline](https://github.com/ding-lab/cptac_rna_expression)

### RNA-Seq Fusion

1259 samples across 817 cases analyzed, including all of Y2 cases and LUAD from Y1.  

Analysis details [`RNA-Seq_Fusion.DCC_analysis_summary.dat`](RNA-Seq_Fusion.DCC_analysis_summary.dat), and 
[pipeline documentation on GitHub](https://github.com/cuidaniel/Fusion_hg38)

### RNA-Seq Transcript + Splicing

Analysis details [`RNA-Seq_Transcript.DCC_analysis_summary.dat`](RNA-Seq_Transcript.DCC_analysis_summary.dat)

[Pipeline documentation on GitHub](https://github.com/ding-lab/CPTAC3_splicing)

### RNA-Seq QC

Analysis details [`RNA-Seq_QC.DCC_analysis_summary.dat`](RNA-Seq_QC.DCC_analysis_summary.dat)

[QC pipeline documentation](https://github.com/ding-lab/CPTAC3_QC)


## WGS

### WGS SV

Year 1 LUAD analyses are included.  
Also in the DCC analysis summary file are 109 HNSCC cases aligned to a custom reference (`GRCh38_full_analysis_set_plus_decoy_hla`) for UMich group

Analysis details [`WGS_SV.DCC_analysis_summary.dat`](WGS_SV.DCC_analysis_summary.dat)

[CPTAC3 SomaticSV pipeline on GitHub](https://github.com/ding-lab/somatic_sv_workflow)

### WGS CNV Somatic

Analysis details [`WGS_CNV_Somatic.DCC_analysis_summary.dat`](WGS_CNV_Somatic.DCC_analysis_summary.dat)

[WGS CNV pipeline](https://github.com/ding-lab/BICSEQ2)

All Y1 analyses with pipeline version v2.0 have been added to the analysis summary.

### WGS QC

Analysis details [`WGS_QC.DCC_analysis_summary.dat`](WGS_QC.DCC_analysis_summary.dat)

[CPTAC3 QC pipeline](https://github.com/ding-lab/CPTAC3_QC)

## WXS

### WXS MSI

Analysis details [`WXS_MSI.DCC_analysis_summary.dat`](WXS_MSI.DCC_analysis_summary.dat)

[WXS MSI pipeline on GitHub](https://github.com/cuidaniel/MSI_hg38)

### WXS Normal Adjacent

Analysis details [`WXS_Normal_Adjacent.DCC_analysis_summary.dat`](WXS_Normal_Adjacent.DCC_analysis_summary.dat)

WXS Normal Adjacent analysis generated using [TinDaisy pipeline](https://github.com/ding-lab/TinDaisy)

### WXS QC

Analysis details [`WXS_QC.DCC_analysis_summary.dat`](WXS_QC.DCC_analysis_summary.dat)

[CPTAC3 QC pipeline](https://github.com/ding-lab/CPTAC3_QC)

### WXS Somatic

WXS Somatic analysis is new for CPTAC3 Year 3.  So far only 113 LSCC cases have been analyzed using 
[TinDaisy variant caller v2.1](https://github.com/ding-lab/TinDaisy)

Analysis details [`WXS_Somatic.DCC_analysis_summary.dat`](WXS_Somatic.DCC_analysis_summary.dat)

### WXS Somatic SW

113 LSCC and 109 LUAD cases in [`WXS_Somatic_Variant_SW.DCC_analysis_summary.dat`](WXS_Somatic_Variant_SW.DCC_analysis_summary.dat).  

This is an ad hoc upload of calls generated by [SomaticWrapper v1.5](https://github.com/ding-lab/somaticwrapper) 
and is provided for backwards compatiblity with prior SomaticWrapper calls.
`WXS_Somatic_Variant` pipeline above (based on TinDaisy) is expected to
ultimately replace these calls.

