#!/bin/bash

course=${1}
filePath=${2}
a=${3}
sub_a=${4}
q=${5}
sub_q=${6}

source /u/cs246/setup

if [[ $sub_a == "t" ]] ; then
        ls ${filePath} | egrep "a${a}q[0-9][a-z]?.txt" > filesList.sh
        while read line; do
                echo "- Submit $line"
                st=1
                ed=5
                aTitle=$(echo ${line} | cut -c${st}-${ed})
                marmoset_submit ${course} ${aTitle} ${filePath}${line}
        done < filesList.sh
elif [[ $sub_q == "t" ]] ; then
        ls ${filePath} | egrep "a${a}q${q}[a-z]?.txt" > filesList.sh
        while read line; do
                echo "- Submit $line"
                st=1
                ed=5
                aTitle=$(echo ${line} | cut -c${st}-${ed})
                marmoset_submit ${course} ${aTitle} ${filePath}${line}
        done < filesList.sh
else
        echo "Error, please check config.sh."
fi

echo "Completed."

exit 0
