# CPTAC3 data catalog

Holds details about CPTAC3 data at GDC and in Ding Lab.

## Overview 

* `CPTAC3.cases.dat`: All known cases associated with CPTAC3 project.  This is the master list
* `CPTAC3.AR.dat`: Details about all sequence data (WGS, WXS, RNA-Seq, miRNA-Seq) at GDC associated with all known cases
    * Note that this was previously called `CPTAC3.SR.dat`
* `*.BamMap.dat`: "BamMap" files for various systems indicating locations of downloaded hg19, hg38, and FASTQ sequence data
* `CPTAC3.Demographics.dat`: Demographic information associated with all known cases
* `CPTAC3.file-summary.txt`: Summary of files available for each case on GDC. Lists counts of tumor (T), blood normal (N), and adjacent / tissue normal (A) for each of
    * WGS.hg19 - WGS data as submitted to GDC.  Assuming hg19
    * WXS.hg19 - WXS (aka WES, exome) data as submitted to GDC.  Assuming hg19
    * RNA.fq - RNA-Seq data as submitted to GDC, FASTQ format
        * R1 and R2 FASTQs are listed individually, so will typically have two of each sample type
    * miRNA.fq - miRNA-Seq data as submitted to GDC, FASTQ format
    * WGS.hg38 - Harmonized WGS data
    * WXS.hg38 - Harmonized WXS data
    * RNA.hg38 - Harmonized RNA-Seq data
        * Harmonization generates chimeric, genomic, and transcriptome BAM files, so each entry will have 3 of each sample type
* `*.BamMap-summary.txt` - summary of files available on a given system as well as GDC.
    * For given system (e.g., katmai), format is similar to CPTAC3.file-summary.txt, except that upper-case symbol indicates presence on given system
      and lower-case symbol indicates that that sample is in GDC but not on system


## Details
### Reference information

[Pipeline Development Roadmap](https://docs.google.com/spreadsheets/d/1Q0GdJpyqJAJBAwk7VkI0Jbqtyldnm4qRjwLjxgLLxRE/edit?usp=drive_web&ouid=101417742046588217932)

### Cases file

Complete list of cases and their diseases, collected from various emails.
See `shiso:/Users/mwyczalk/Projects/CPTAC3/CPTAC3.Cases`
* `cases.analysis`
* `cases.analysis.HarmonizationBatch2`
* `cases.analysis.011518`

### AR file

List of all WGS, WXS, RNA-Seq sequence data available at GDC.  Obtained with 
scripts in [CPTAC3.discover](https://github.com/ding-lab/discover.CPTAC3.b1)

Note that submitted reads are listed as having reference hg19, which is empirically
true, but may change silently in the future.

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


## Additional modifications

The file `SampleRename.dat` contains aliquot ID and sample name suffix as first and second columns, respectively.
It is currently used in step `3b_append_suffix.sh` of https://github.com/ding-lab/discover.CPTAC3.b1 to add suffixes (-core and -bulk, currently)
to samples identified by aliquot ID (UUID would also work).  This is necessary to distinguish -bulk and -core samples easily.

## Contact

Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
