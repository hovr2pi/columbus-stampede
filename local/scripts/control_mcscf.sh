#!/bin/bash

# launcer_mcscf.sh: a shell script to drive COLUMBUS that interacts with slurm and launcher correectly
export PATH="$HOME/perl5/perlbrew/perls/perl-5.19.5/bin/perl:$WORK/columbus/Columbus:$PATH"
export PERL5LIB=$PERL5LIB:/work/00416/csim/columbus/Columbus/perlscripts

# Argument = -t test -r server -p password -v

usage()
{
cat << EOF
usage: $0 options

This script drives COLUMBUS and interacts with slurm and launcher"

OPTIONS:
   -h      Show this message
   -n      Number of points (default :1)
   -s      Starting point in loop index (default: 0)
   -d      Dry run (default OFF)
   -v      Verbose / debug on
EOF
}

number_of_points=1
DRY_RUN=0
starting_point=0
VERBOSE=0
while getopts “hn:s:dv” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         n)
             number_of_points=$OPTARG
             ;;
         s)
             starting_point=$OPTARG
             ;;
         d)
             DRY_RUN=1
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

if [ $VERBOSE = 0 ]
   then
   echo "shutting the hell up..."
   else
   echo "turning on debug mode..."
   set -x
fi

# do some error checking and make sure the user is running what he intends to run
if [ $DRY_RUN = 1 ]
   then
   echo "DRY RUN ONLY ..."
   echo "ONLY files that would have been run are listed"
   echo ""
else
   echo "processing input files ..."
   echo ""
fi 


if [ $number_of_points = 1 ]
   then
   echo "running a single point at $starting_point" 
else
   finishing_point=`expr $starting_point + $number_of_points`
   echo "running points from $starting_point to $finishing_point"    
fi   

#lets figure out the number of 0s that need to be padded"
actual_file_suffix=`ls geom.*$starting_point | head -n1 | cut -f2 -d. `

echo "starting with point geom.$actual_file_suffix"

input_file_name=geom."$actual_file_suffix"
echo ""
echo ""
 
current_point=$starting_point

#outer loop to run multiple jobs

for i in =`seq $starting_point $finishing_point`
  do
  echo "current loop_index: $i"
  #let's check to see if our input file is there
  file=$input_file_name
    if [ -f "$file" ]
    then
      echo "input file $file found."
    else
      echo "ABORT: input file $file not found."
      exit
    fi
 

  #initial current point to the starting point

  echo starting geometry $input_file_name

cat $input_file_name > geom << EOF
EOF
cat geom > log.$current_point
cp  mcscf1/* .
FILE_LIST=LISTINGS MOCOEFS MOLDEN 
for LIST_OF_FILES in $FILE_LIST
  do
  echo "removing file $LIST_OF_FILES$current_point"
  rm -rf $LIST_OF_FILES.$current_point 
done

echo "making new work directories"

for LIST_OF_FILES in $FILE_LIST
  do
  mkdir $LIST_OF_FILES.$current_point
done


echo "invoking runc the first time on point $current_point" 
runc -m 8000 >> log.$current_point
mv MOLDEN/molden_mo_mc.sp MOLDEN/molden_mo_mc.sp1
cp MOCOEFS/mocoef_mc.sp mocoef
cp  mcscf3/* .
echo "invoking runc the second time on point $current_point"
runc -m 8000 >> log.$current_point
cp -r LISTINGS LISTINGS_$current_point
cp -r MOCOEFS MOCOEFS_$current_point
cp -r MOLDEN MOLDEN_$current_point
echo finishing geometry geom.$current_point


current_point=`expr $current_point + 1`
done
