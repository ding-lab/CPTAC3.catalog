

#Pipeline                        | AML | CCRCC | CM  | GBM | HNSCC | LSCC | LUAD | PDA | SAR | UCEC | Total
#---                             | --- | ----- | --- | --- | ----- | ---- | ---- | --- | --- | ---- | ---
#Methylation Array               | 43  | 222   | 8   | 116 | 111   | 113  | 229  | 164 | 19  | 246  | 1271

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

OUT="README.cohort.md"

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
