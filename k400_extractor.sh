#!/bin/bash

# Download directories vars
root_dl="data/kinetics400"
root_dl_targz="data/kinetics400/targz"

# Make root directories
[ ! -d $root_dl ] && mkdir $root_dl

# Extract train
curr_dl=$root_dl_targz/train
curr_extract=$root_dl/train
[ ! -d $curr_extract ] && mkdir -p $curr_extract
tar_list=$(ls $curr_dl)
for f in $tar_list
do
	f_stem="${f%%.*}"
	[[ $f == *.tar.gz ]] && mkdir -p $curr_extract/$f_stem && echo Extracting $curr_dl/$f to $curr_extract/$f_stem && tar zxf $curr_dl/$f -C $curr_extract/$f_stem
done

# Extract validation
curr_dl=$root_dl_targz/val
curr_extract=$root_dl/val
[ ! -d $curr_extract ] && mkdir -p $curr_extract
tar_list=$(ls $curr_dl)
for f in $tar_list
do
	f_stem="${f%%.*}"
	[[ $f == *.tar.gz ]] && mkdir -p $curr_extract/$f_stem && echo Extracting $curr_dl/$f to $curr_extract && tar zxf $curr_dl/$f -C $curr_extract
done

# Extract test
curr_dl=$root_dl_targz/test
curr_extract=$root_dl/test
[ ! -d $curr_extract ] && mkdir -p $curr_extract
tar_list=$(ls $curr_dl)
for f in $tar_list
do
	f_stem="${f%%.*}"
	[[ $f == *.tar.gz ]] && mkdir -p $curr_extract/$f_stem && echo Extracting $curr_dl/$f to $curr_extract && tar zxf $curr_dl/$f -C $curr_extract
done

# Extract replacement
curr_dl=$root_dl_targz/replacement
curr_extract=$root_dl/replacement
[ ! -d $curr_extract ] && mkdir -p $curr_extract
tar_list=$(ls $curr_dl)
for f in $tar_list
do
	[[ $f == *.tgz ]] && mkdir -p $curr_extract/$f_stem && echo Extracting $curr_dl/$f to $curr_extract && tar zxf $curr_dl/$f -C $curr_extract
done

# Extraction complete
echo -e "\nExtractions complete!"