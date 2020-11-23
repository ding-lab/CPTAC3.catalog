#!/bin/bash

# Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
# https://dinglab.wustl.edu/

read -r -d '' USAGE <<'EOF'
Evaluate number of cases in DCC analysis summary file

Usage:
  DCC_case_counts.sh [options] DCC_analysis_summary

Options:
-h: Print this help message
-f CASE_LIST: evaluate case counts only for given cases
-C C3Y_FILTER: retain only cases whose C3Y value matches given string (e.g., -C Y3)

Prints number of cases associated with given DCC analysis summary file as well as total
EOF

# http://wiki.bash-hackers.org/howto/getopts_tutorial
while getopts ":hdf:C:" opt; do
  case $opt in
    h)
      echo "$USAGE"
      exit 0
      ;;
    f) # example of value argument
      CASE_LIST=$OPTARG
      if [ ! -e $CASE_LIST ]; then 
        >&2 echo ERROR: $CASE_LIST does not exist
        exit 1
      fi
      ;;
    C) # example of value argument
      C3Y_FILTER=$OPTARG
      ;;
    \?)
      >&2 echo "Invalid option: -$OPTARG" 
      echo "$USAGE"
      exit 1
      ;;
    :)
      >&2 echo "Option -$OPTARG requires an argument." 
      echo "$USAGE"
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

if [ "$#" -ne 1 ]; then
    >&2 echo Error: Wrong number of arguments
    echo "$USAGE"
    exit 1
fi

# DCC analysis summary file format
# 1. case
# 2. disease
# 3. pipeline_name
# 4. pipeline_version
# 5. timestamp
# 6. C3Y 
# 7. DCC_path
# 8. filesize
# 9. file_format
#10. md5sum

DAS=$1
if [ -z $DAS ]; then
    >&2 echo ERROR: DCC_analysis_summary not defined
    >&2 echo "$USAGE"
    exit 1
fi
if [ ! -e $DAS ]; then
    >&2 echo ERROR: $DAS not found
    exit 1
fi

# if CASE_LIST specified, limit analysis to just those cases by incorporating `grep -f $CASE_LIST` filter
# otherwise, if C3Y_FILTER is specified, filter out based on value of column 6, C3Y
# otherwise, just filter out the column header ("case")
# Note that this is pretty awkward and cannot filter both by CASE_LIST and C3Y_FILTER
if [ $CASE_LIST ]; then
    FILTER="grep -f $CASE_LIST"
elif [ $C3Y_FILTER ]; then
    FILTER="awk -v cf=$C3Y_FILTER 'BEGIN{FS=\"\t\";OFS=\"\t\"}{if (\$3 == cf) print}'"
else
    FILTER="grep -v case "
fi

echo $DAS
echo Cases per disease
CMD="cut -f 1,2,6 $DAS | $FILTER | sort -u | cut -f 2 | sort | uniq -c"
#echo Running: $CMD
eval $CMD

echo Cases total
CMD="cut -f 1,2,6 $DAS | $FILTER | cut -f 1 | sort -u | wc -l"
eval $CMD
