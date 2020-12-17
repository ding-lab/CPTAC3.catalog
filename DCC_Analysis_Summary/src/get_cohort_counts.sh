# Ad hoc script for reporting cohort information 
# Edit the output to avoid overwrites
# Usage: bash src/get_cohort_counts.sh

# Writes a document with two sections:
# * Cohort Counts
# * Heterogeneity Counts
# 
# In Cohort Count, for a given pipeline, list the number of cases per disease For
# In Heterogeneity Count, for a given pipeline, list number of cases which have "HET_"
# as part of sample name, broken out by disease

OUT="README.cohort.20201217.md"

function get_cohort_count {

    DCCAS=$1
    PIPE=$( echo $DCCAS | cut -f 1 -d '.' )
    echo "## $PIPE"
    echo 
    echo " Cases | Disease | Cohort"
    echo " --- | --- | --- "
    join <(cat $DCCAS | cut -f 1 | grep -v case | sort -u) <( grep -v case ../CPTAC3.cases.dat) | cut -f 2- -d ' ' | sort | uniq -c | sed 's/^[ \t]*//;s/[ \t]*$//' | tr ' ' '|'

    echo 
}

# For a given pipeline,
# returns the number of cases which have "HET_" as part of sample name,
# broken out by disease
function get_het_count {

    DCCAS=$1
    PIPE=$( echo $DCCAS | cut -f 1 -d '.' )
    echo "## $PIPE"
    echo 
    echo " Cases | Disease "
    echo " --- | ---  "
    
    grep "HET_" $DCCAS  | cut -f 1,2 | sort -u | cut -f 2 | sort | uniq -c | sed 's/^[ \t]*//;s/[ \t]*$//' | tr ' ' '|'
    echo 
}


echo "# Cohort Counts " > $OUT

get_cohort_count Methylation_Array.DCC_analysis_summary.dat             >> $OUT
get_cohort_count miRNA-Seq.DCC_analysis_summary.dat                     >> $OUT
get_cohort_count RNA-Seq_Expression.DCC_analysis_summary.dat            >> $OUT
get_cohort_count RNA-Seq_Fusion.DCC_analysis_summary.dat                >> $OUT
get_cohort_count RNA-Seq_Transcript.DCC_analysis_summary.dat            >> $OUT
get_cohort_count WGS_CNV_Somatic.DCC_analysis_summary.dat               >> $OUT
get_cohort_count WGS_SV.DCC_analysis_summary.dat                        >> $OUT
get_cohort_count WXS_Germline.DCC_analysis_summary.dat                  >> $OUT
get_cohort_count WXS_MSI.DCC_analysis_summary.dat                       >> $OUT
get_cohort_count WXS_Normal_Adjacent.DCC_analysis_summary.dat           >> $OUT
get_cohort_count WXS_Somatic.DCC_analysis_summary.dat                   >> $OUT
get_cohort_count WXS_Somatic_Variant_SW.DCC_analysis_summary.dat        >> $OUT


echo "# Heterogeneity Counts " >> $OUT

get_het_count Methylation_Array.DCC_analysis_summary.dat             >> $OUT
get_het_count miRNA-Seq.DCC_analysis_summary.dat                     >> $OUT
get_het_count RNA-Seq_Expression.DCC_analysis_summary.dat            >> $OUT
get_het_count RNA-Seq_Fusion.DCC_analysis_summary.dat                >> $OUT
get_het_count RNA-Seq_Transcript.DCC_analysis_summary.dat            >> $OUT
get_het_count WGS_CNV_Somatic.DCC_analysis_summary.dat               >> $OUT
get_het_count WGS_SV.DCC_analysis_summary.dat                        >> $OUT
get_het_count WXS_Germline.DCC_analysis_summary.dat                  >> $OUT
get_het_count WXS_MSI.DCC_analysis_summary.dat                       >> $OUT
get_het_count WXS_Normal_Adjacent.DCC_analysis_summary.dat           >> $OUT
get_het_count WXS_Somatic.DCC_analysis_summary.dat                   >> $OUT
get_het_count WXS_Somatic_Variant_SW.DCC_analysis_summary.dat        >> $OUT

>&2 echo Written to $OUT
