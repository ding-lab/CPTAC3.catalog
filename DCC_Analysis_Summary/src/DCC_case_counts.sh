#!/bin/bash

# Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
# https://dinglab.wustl.edu/

# TODO:
# * Allow multiple DCC_analysis_summary entries, loop over them all
# * Allow filters by year (e.g., -f Y1 )

read -r -d '' USAGE <<'EOF'
Evaluate number of cases in DCC analysis summary file

Usage:
  DCC_case_counts.sh [options] DCC_analysis_summary

Options:
-h: Print this help message

Prints number of cases associated with given DCC analysis summary file as well as total
EOF

# http://wiki.bash-hackers.org/howto/getopts_tutorial
while getopts ":hdf:" opt; do
  case $opt in
    h)
      echo "$USAGE"
      exit 0
      ;;
#    f) # example of value argument
#      FILTER=$OPTARG
#      >&2 echo "Setting memory $MEMGB Gb" 
#      ;;
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

echo $DAS
echo Cases per disease
cut -f 1,2 $DAS | grep -v "case" | sort -u | cut -f 2 | sort | uniq -c
echo Cases total
cut -f 1 $DAS | grep -v "case" | sort -u | wc -l
