# CPTAC3 data catalog

Holds details about CPTAC3 data at GDC and results at DCC, as well as details about downloaded data

## Overview 

* `CPTAC3.cases.dat`: All known cases associated with CPTAC3 project.  This is the master list
    * This also defines the cohort (discovery or confirmatory) and batch of each case.  Note that each case may be in multiple batches
* `CPTAC3.AR.dat`: Details about all sequence data (WGS, WXS, RNA-Seq, miRNA-Seq) at GDC associated with all known cases
    * Note that this was previously called `CPTAC3.SR.dat`
* `CPTAC3.Demographics.dat`: Demographic information associated with all known cases
* `CPTAC3.file-summary.txt`: Summary of files available for each case on GDC. Lists counts of tumor (T), blood normal (N), and adjacent / tissue normal (A) for each of
    * WGS.hg19 - WGS data as submitted to GDC.  Assuming hg19
    * WXS.hg19 - WXS (aka WES, exome) data as submitted to GDC.  Assuming hg19
    * RNA.fq - RNA-Seq data as submitted to GDC, FASTQ format
        * R1 and R2 FASTQs are listed individually, so will typically have two of each sample type
    * miRNA.fq - miRNA-Seq data as submitted to GDC, BAM format
    * WGS.hg38 - Harmonized WGS data
    * WXS.hg38 - Harmonized WXS data
    * RNA.hg38 - Harmonized RNA-Seq data
        * Harmonization generates chimeric, genomic, and transcriptome BAM files, so each entry will have 3 of each sample type
    * miRNA.hg38 - Harmonized miRNA-Seq data
* `./BamMap` - has details about GDC data downloaded to Ding Lab
    * `*.BamMap.dat`: "BamMap" files for various systems indicating locations of downloaded hg19, hg38, and FASTQ sequence data
    * `*.BamMap-summary.txt` - summary of files available on a given system as well as GDC.
        * For given system (e.g., katmai), format is similar to CPTAC3.file-summary.txt, except that upper-case symbol indicates presence on given system
          and lower-case symbol indicates that that sample is in GDC but not on system
* `./DCC_Analysis_Summary` - has details about analyses uploaded to DCC


## Details

### Cases file

Comprehensive list of cases along with their disease, cohort, and batch information.
* Current cases list consists of 3696 cases and their disease. This information is as obtained from file `Batches1through9_samples_attribute_tumorcode_added.xlsx`.  
* Cohort is an ad hoc column which tries to categorize cases according to Discovery or Confirmatory cohort, per year of contract.
* Batch column indicates the year and batch(es) in which each case was processed.  Y1 and Y2 correspond to Year 1 and 2, respectively.
  Note that a given case may belong to several different batches, since not all data for a given case was available at a given time.
  Such batches are listed as comma-separated names.  In the future batch information should be indicated in a differnet file.

### AR file

List of all WGS, WXS, RNA-Seq, miRNA-SEq sequence data available at GDC.  Obtained with 
scripts in [CPTAC3.discover](https://github.com/ding-lab/discover.CPTAC3.b1)

Note that submitted reads are listed as having reference hg19 for WXS and WGS and hg38 for miRNA-Seq.  This appears to be empirically
true, but subject to change.

### DCC Analysis Summary

Files here track analyses uploaded to DCC, with one file per analysis pipeline.  DCC Analysis Summary files have
the following columns:
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

### BamMap files

These change frequently and are specific to Ding Lab systems

### File summary
As an example:
```
C3L-00079   CCRCC   WGS.hg19 T N A  WXS.hg19 T N A  RNA.fq TT  AA   miRNA.fq T  A   WGS.hg38 T N A  WXS.hg38 T N A  RNA.hg38 TTT  AAA
```
This indicates that the kidney case C3L-00079 has tumor, blood normal, and adjacent normal samples for WGS and WXS data as submitted (hg19);
tumor and adjacent normal RNA-Seq data (TT, AA because FASTQ data comes in pairs); and tumor and adjacent miRNA data in FASTQ format.  All
these are available as harmonized hg38 WGS and WXS, and harmonized hg38 RNA-Seq chimeric, genomic, and transcriptome BAMs are available 
for tumor and adjacent normal.

### BamMap summary
As an example from `MGI.BamMap-summary.txt`:
```
CCRCC	    WGS.hg19 t n a	    WXS.hg19 t n a	    RNA.fq TT  AA	    miRNA.fq t  a	    WGS.hg38 T N a	    WXS.hg38 T N A	    RNA.hg38 Ttt  Aaa
```
This indicates that all RNA-Seq FASTQ, harmonized WGS tumor and blood normal, all harmonized WXS, and genomic hg38 RNA-Seq data are available at MGI.
Lower case letters indicate which data are available at GDC but not at MGI. 

*NOTE* BamMap summary files are not updated regularly and are considered deprectated.


## Additional modifications

The file `SampleRename.dat` contains aliquot ID and sample name suffix as first and second columns, respectively.
It is currently used in step `3b_append_suffix.sh` of https://github.com/ding-lab/discover.CPTAC3.b1 to add suffixes (-core and -bulk, currently)
to samples identified by aliquot ID (UUID would also work).  This is necessary to distinguish -bulk and -core samples easily.

## Contact

Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
