CPTAC miRNA-Seq analysis
========================

### github: <https://github.com/ding-lab/CPTAC_miRNA>

### Lijun Yao lijunyao@wustl.edu
### Pipeline developed by Sunantha Sethuraman, modified by Lijun Yao

------------------------------------------------------------------------

Processing description
----------------------

The raw data was made available as .unaln.bam files.

Annotation pre-processing:

Annotation information to be used in the pipeline were downloaded from
miRBase v22 and GENCODE v29. The downloaded GTFs were converted to BED
format files. For GENCODE, only the transcript variant labeled with the
'Basic' tag was used since it is the predominant transcript variant.
Annotations were limited to standard chromosomes Chr 1-22, X,Y and MT.

Unaligned BAM to FASTQ:

The unaligned bams were first converted to fastq.gz files by samtools bam2fq

Adapter trimming:

The fastq.gz files were then trimmed using TRIMMOMATIC (Bolger, A. M.,
Lohse, M., & Usadel, B. (2014). Trimmomatic: A flexible trimmer for
Illumina Sequence Data. Bioinformatics, btu170) with the adapter
sequences provided in Adapters.fa. The following constraints were used
during trimming: 1. Random 4 nucleotides at the start and end of the
read after adapter trimming were cropped; 2. Any read with average read
quality &lt; 30 was dropped; 3. Any read with average base quality &lt;
20 in any sliding window of 10 bases was dropped; 4. Reads shorter than
15 bases after processing were dropped.

Quality check:

FASTQC (<https://www.bioinformatics.babraham.ac.uk/projects/fastqc/>)
was used to quality check the reads before and after trimming to ensure
adapter removal.

Alignment:

The reads were aligned to the human genome (Reference GRCh38) using bwa
aln, allowing no mismatches. For any given read up to 10 alignments were
permitted. The aligned SAM file contains one line per read with the
information about multiple alignments reported in that line. For
downstream analysis purposes, it was required to have one alignment per
line and this was accomplished using the xa2multi.pl script. The SAM
file was then converted to a BED file and sorted.

Annotation:

The BED file was annotated using BEDTOOLS 'intersect' and several
preprocessed annotation files (see annotation pre-processing above). A
custom python script (mirna\_annotation.py) was used to handle multiple
annotations and multi-mapping of the reads to obtain one unique mapping
per read and one unique annotation per mapping.

Multiple annotations were resolved in the order of priority:

'miRNA', 'miRNA\_primary\_transcript', 'tRNA', 'rRNA', 'sRNA', 'snRNA',
'snoRNA', 'scaRNA', 'scRNA', 'ribozyme', 'vaultRNA', 'Mt\_tRNA',
'Mt\_rRNA', 'protein\_coding','3prime\_overlapping\_ncRNA',
'bidirectional\_promoter\_lncRNA', 'lincRNA','macro\_lncRNA',
'misc\_RNA', 'non\_coding','antisense', 'sense\_intronic',
'sense\_overlapping', 'IG\_C\_gene', 'IG\_D\_gene', 'IG\_J\_gene',
'IG\_V\_gene', 'TR\_C\_gene', 'TR\_D\_gene', 'TR\_J\_gene',
'TR\_V\_gene', 'IG\_C\_pseudogene','IG\_J\_pseudogene',
'IG\_V\_pseudogene', 'IG\_pseudogene', 'TR\_J\_pseudogene',
'TR\_V\_pseudogene', 'rRNA\_pseudogene', 'processed\_transcript',
'pseudogene', 'polymorphic\_pseudogene', 'processed\_pseudogene',
'transcribed\_processed\_pseudogene',
'transcribed\_unitary\_pseudogene',
'transcribed\_unprocessed\_pseudogene',
'translated\_processed\_pseudogene', 'unitary\_pseudogene',
'unprocessed\_pseudogene', 'TEC','unannotated'

Since mature miRNAs are processed from precursor miRNAs (referred above
as 'miRNA\_primary\_transcript'), most of the reads mapping to mature
miRNAs also map to precursor miRNAs and vice-versa. The priorities were
assigned by overlap length, allowing a 3 nt additional advantage to
mature miRNAs. This advantage allow to correct for processing errors
(biological and sequencing based) and the number 3 was empirically
determined.

Multimapping was resolved based on the same order of priority as above.
Additionally, multi-maps within the same annotation group were assigned
randomly to one location.

Couting:

For each mature miRNA and precursor miRNA, the number of reads were
counted. The raw counts were then converted to TPM (Transcripts per
million) values using (raw\_counts)\*10e6/(total\_counts), where
total\_counts = total number of reads aligned to all miRNAs (mature +
precursor). It is important to note that TPM was not calculated as a
function of library size. The counts were summed for each precursor
miRNA (precursor + isoforms) and is reported as one file.

Output:

For each sample, three output files are provided with the following
suffixes: ".mature.txt", ".precursor.txt" and ".total.txt" which contain
information on mature miRNA counts, precursor miRNA counts and total
miRNA counts, respectively.

------------------------------------------------------------------------

Sample nomenclature
-------------------

The samples follow the naming system "\[SubjectID\].\[T or
A\].type.txt", where T or A specifies whether it is a tumor or a
tumor\_normal sample (for example: C3N-01521.T.mature.txt). Type refers
to mature, precursor or total.
