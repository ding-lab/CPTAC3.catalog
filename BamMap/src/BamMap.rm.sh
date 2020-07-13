#!/bin/bash

# Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
# https://dinglab.wustl.edu/

read -r -d '' USAGE <<'EOF'
Test and remove BamMap-defined data.  Prints new BamMap file excluding deleted UUIDs to stdout

Usage: BamMap.rm.sh [options] UUID [UUID2 ...]

 -d: dry run.  Perform all existence tests but do not remove data
 -v: verbose
 -B BamMap: BamMap path.  Required
 -t tmp.txt: temporary file listing UUIDs successfully removed.  Default: uuids-deleted.tmp
 -n: do not remove temporary file 
 -C: Continue even if unable to find / remove UUID.  

If UUID is '-', read UUIDs from STDIN

Removes data file and associated directory 
EOF

function removeUUID {
    LUUID=$1

    if ! grep -q "$LUUID" "$BAMMAP"  ;  then
        if [ -z $CONTINUE_ON_ERROR ]; then 
            >&2 echo Error: $LUUID not found in $BAMMAP.  Quitting
            exit 1
        else
            >&2 echo Note: $LUUID not found in $BAMMAP.  Continuing
        fi
    fi
    DIR=$(dirname $(grep "$LUUID" "$BAMMAP" | cut -f 6))
    if [ $VERBOSE ]; then
        >&2 echo Removing $DIR
    fi

    CMD="rm -rf $DIR"
    if [ $DRYRUN ]; then
        >&2 echo Dry Run: $CMD
    else
        eval $CMD
    fi

    # Test exit status
    rc=$?
    if [[ $rc != 0 ]]; then
        if [ -z $CONTINUE_ON_ERROR ]; then 
            >&2 echo Fatal error $rc: $!.  Exiting.
            exit $rc;
        else
            >&2 echo Error removing $DIR
            >&2 echo $rc: $!
            >&2 echo Continuing
        fi
    else    # Success
        if [ $VERBOSE ]; then
            >&2 echo Success
        fi
        echo $LUUID >> $TMP
    fi

}


TMP="uuids-deleted.tmp"
while getopts ":B:dvt:Cn" opt; do
  case $opt in
    h)
      echo "$USAGE"
      exit 0
      ;;
    t)  
      >&2 echo TMP output: $TMP
      TMP=$OPTARG
      ;;
    B)  
      BAMMAP=$OPTARG
      >&2 echo BAMMAP: $BAMMAP
      ;;
    C) 
      CONTINUE_ON_ERROR=1
      ;;
    n) 
      NO_DELETE_TMP=1
      ;;
    d) 
      DRYRUN=1
      ;;
    v) 
      VERBOSE=1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "$USAGE"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      echo "$USAGE"
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

if [ "$#" -eq 0 ]; then
    >&2 echo Error: require one or more arguments
    echo "$USAGE"
    exit 1
fi

if [ -z $BAMMAP ]; then
    >&2 echo Error: BamMap not defined \[-B\]
    exit 1
fi
if [ ! -e $BAMMAP ]; then
    >&2 echo Error: BamMap does not exist: $BAMMAP
    exit 1
fi

# TMP holds list of all UUIDs successfully deleted.  It is used to generate new BamMap which excludes these
rm -f $TMP
rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal error $rc: $!.  Exiting.
    exit $rc;
fi

touch $TMP
rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal error $rc: $!.  Exiting.
    exit $rc;
fi

if [ "$#" -lt 1 ]; then
    >&2 echo Error: Pass at least one UUID
    exit
fi

# this allows us to get UUIDs in one of two ways:
# 1: start_step.sh UUID1 UUID2 UUID3
# 2: cat UUIDS.dat | start_step.sh -
if [ $1 == "-" ]; then
    UUIDS=$(cat - )
else
    UUIDS="$@"
fi

for UUID in $UUIDS; do
    removeUUID $UUID 
done

# Now print out the new BamMap which excludes the deleted UUIDs.
grep -v -f $TMP $BAMMAP 

if [ -z $NO_DELETE_TMP ]; then
    rm -f $TMP
fi
