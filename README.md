# CPTAC3 data catalog

Holds details about CPTAC3 data at GDC and in Ding Lab.

*Analysis as of 9/26/18*

## Reference information

[Pipeline Development Roadmap](https://docs.google.com/spreadsheets/d/1Q0GdJpyqJAJBAwk7VkI0Jbqtyldnm4qRjwLjxgLLxRE/edit?usp=drive_web&ouid=101417742046588217932)

## Cases file

Complete list of 325 cases associated with CPTAC3 Y1 project, including their diseases and nominal batch.
Obtained from,
`epazote:/Users/mwyczalk/Projects/CPTAC3/CPTAC3.Cases/cases.analysis/dat/CPTAC3.C325.cases.dat`

## SR file

List of all hg19 WGS, WXS, RNA-Seq sequence data available at GDC for 325 cases.  Current version 
is 20180917, from
`denali:/home/mwyczalk_test/Projects/CPTAC3/Discover/discover.CPTAC3.C322/dat.20180917/CPTAC3.C325.SR.dat`

The following cases have two tumor BAMs for WGS/WXS, and four tumor RNA-Seq FASTQs:
* C3L-00908
* C3N-00545
* C3N-01825

Mathangi writes (9/20/18):
```
All 3 have the exact same reason. We sent an aliquot for sequencing and then we
had to marginally fail pathology, but genomics came fine for both hence we have
2 versions. The 545 is a lung sample and it is up to the lung team to pick
which one they want to use after checking proteomic data.  Same with 1825. If I
find out, I will let you know.
```

## BamMap files

Current versions of BamMap files are tagged 20180918.  They correspond to analysis performed through
9/18/18 on katmai:/Users/mwyczalk/Projects/CPTAC3/CPTAC3.Cases/BamMap.analysis
`CPTAC3.C325.dat` is equivalent to `CPTAC3.C325.SR.20180917.dat`.  Does not include LUAD.b4.B (katmai)

### Files
[Source](https://docs.google.com/spreadsheets/d/1Q0GdJpyqJAJBAwk7VkI0Jbqtyldnm4qRjwLjxgLLxRE/edit#gid=1679748692)

## Updates

### 20180926

Copied BAM / FASTQ associated with LUAD.b4.B and 0918-Sync from Katmai to MGI.  Details of move:

* MGI: `/gscuser/mwyczalk/projects/CPTAC3/import/examine_import/README`
* Katmai:
    * `/home/mwyczalk_test/Projects/CPTAC3/import/import.CPTAC3.LUAD.b4.B/MGI-upload`
    * `/home/mwyczalk_test/Projects/CPTAC3/import/export_to_MGI` 

## Contact

Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
