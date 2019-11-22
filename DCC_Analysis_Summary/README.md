# DCC Analysis Summary files

Files here provide a unified summary of all genomic analysis results and their location on 
[CPTAC-DCC](https://cptc-xfer.uis.georgetown.edu/aspera/user/).

Note: not all CPTAC3 Year 2 analysis summaries are available yet.

# Format

DCC Analysis Summary files have the following columns:
```
 1. case
 2. disease
 3. pipeline_name
 4. pipeline_version
 5. timestamp
 6. DCC_path
 7. filesize
 8. file_format
 9. md5sum
```

Additional columns are specific to individual pipelines and will typically indicate the input data associated with this analysis.
Pipelines which generate multiple result files per case will have multiple entries in the analysis summary file.

# Workflows

Details about workflows and format of associated `DCC_analysis_aummary.dat` files.  Below are links and notes about state of
analysis summary files, which may not be complete.  Additional pipeline details are included in documentation included with
data files on DCC.

## Methylation_Array

**TODO** Update with past results, modify format to use GDC UUID

## miRNA-Seq

`miRNA-Seq.DCC_analysis_summary.dat` has results on 1570 samples from 1064
CPTAC3 cases.  Each sample has results for mature_miRNA, precursor_miRNA, and
total_miRNA.  See [GitHub
documentation](https://github.com/ding-lab/CPTAC_miRNA) and processing
descriptions released with data on DCC for additional details.

**TODO**: improve GitHub documentation

## QC

85 LSCC cases currently in `QC.DCC_analysis_summary.dat`.  Additional Y2 cases to be added

[CPTAC3 QC pipeline](https://github.com/ding-lab/CPTAC3_QC)


## RNA-Seq_Expression

All Y1 and Y2 cases are analyzed. TODO: get counts

[CPTAC3 RNA-Seq Expression pipeline](https://github.com/ding-lab/cptac_rna_expression)

## WGS_SV

85 LSCC cases currently in `WGS_SV.DCC_analysis_summary.dat`.  Addititional Y2 cases to be added.

[CPTAC3 somatic_sv_workflow pipeline](https://github.com/ding-lab/somatic_sv_workflow)

## WGS_CNV_Somatic

309 CPTAC3 Year 2 cases in `WGS_CNV_Somatic.DCC_analysis_summary.dat`.

[DingLab BICSeq2 WGS CNV pipeline](https://github.com/ding-lab/BICSEQ2)

## WXS_Somatic

113 LSCC cases currently in `WXS_Somatic.DCC_analysis_summary.dat`.  Additional Y2 cases to be analyzed.

[TinDaisy somatic variant caller](https://github.com/ding-lab/TinDaisy)

## WXS_Adjacent_Somatic

**TODO** Update with past results


