#!/usr/bin/env bash

## script to create folders in sequence; useful when creating versions of an app when there is a need to rollback

# exit if undeclared variable used
set -o nounset #set -u

# current file name
declare -rx SCRIPT=${0##*/}

# where the directories are created
declare baseDir="/Users/Sam/Desktop/github/BASH"

function newDirs(){
	declare today=$(date "+%Y%m%d")
	declare status="fail"
	declare revision=0
	
	while [[ $status == "fail" ]]; do
		((revision++))
		declare max=9

		if [[ $revision -lt $max ]]; then
			# if revision is less than 9 it should appear as _01
			declare folder_name="${today}_0${revision}"
			
		else 
			declare folder_name="${today}_${revision}"
			echo "$folder_name"
	
		fi
		
		if [[ ! -d "$folder_name" ]]; then
			echo "createing ${folder_name}"
			mkdir "$folder_name"
			status="success"
		
		else
			status="fail"

			fi
		echo " " 


	done
	return 
}

newDirs

