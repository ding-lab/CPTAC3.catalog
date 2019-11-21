# DCC Analysis Summary files

Files here provide a unified summary of all genomic analysis results and their location on 
[CPTAC-DCC](https://cptc-xfer.uis.georgetown.edu/aspera/user/).

## TODO

Not all CPTAC3 Year 2 analysis summaries are available yet.

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


# Workflows

Details about workflows and format of associated `DCC_analysis_aummary.dat` files

## Methylation_Array

**TODO** Update with past results, modify format to use GDC UUID

## miRNA-Seq

**TODO** Update with past results

## QC

[CPTAC3 QC pipeline](https://github.com/ding-lab/CPTAC3_QC)

Example results in `QC.DCC_analysis_summary.dat`
```
     1	# case	C3L-01884
     2	disease	LSCC
     3	pipeline_name	QC
     4	pipeline_version	v1.0
     5	timestamp	20191120
     6	DCC_path	/CPTAC3.Y2_WashU/LSCC/CPTAC3_LSCC_QC_v1.0_LSCC-remainder_20191120/C3L-01884.8df61ace-1d12-451f-b246-d43e6e2a026e_wgs_gdc_realn_fastqc.html.gz
     7	filesize	183979
     8	file_format	html
     9	md5sum	415f7a7a93c672217a1be0b81fd4c057
    10	Input_Sample_Name	C3L-01884.WGS.T.hg38
    11	Input_UUID	e667336b-a6c8-4bbc-864c-7256ba2fdcb4
```

## RNA-Seq_Expression

[CPTAC3 RNA-Seq Expression pipeline](https://github.com/ding-lab/cptac_rna_expression)

## WGS_SV



## WGS_CNV_Somatic

## WXS_Somatic

## WXS_Adjacent_Somatic





