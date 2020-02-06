#!/usr/local/bin/bash
# add header "C3Y" and value "Y2" in column 6 of every file
#  1. case
#  2. disease
#  3. pipeline_name
#  4. pipeline_version
#  5. timestamp
#  6. C3Y - CPTAC3 Year
#  7. DCC_path
#  8. filesize
#  9. file_format
# 10. md5sum
# 11-end. Variable

function process {
    FN=$1
    if [ ! -e $FN ]; then
        >&3 echo $FN not found
        exit 1
    fi

    OUTFN=$( basename $FN )

    echo Processing $FN, writing to $OUTFN

    paste <(cut -f 1-5 $FN ) <( awk 'BEGIN{FS="\t";OFS="\t"} NR==1{print "C3Y"} NR>1{print "Y2"}' $FN ) <(cut -f 6- $FN ) > $OUTFN

}

for F in tmp/*.dat; do
    process $F
done
