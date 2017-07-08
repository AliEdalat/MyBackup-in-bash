#! /bin/bash

OLDTIME=120

check_time_of_backup(){
	dif=$(expr $(date +%s) - $(stat $entry -c %Z))
	echo $dif
	if [ $dif -lt $OLDTIME ]; then
		cp -f -R $entry $destination/${diractory##*/}/$(basename $entry)
		regex="\s+"$(basename $entry) "\s+"
		file_content=$( cat "$destination/${diractory##*/}/packup.log" )

		if [[ " $file_content " =~ $regex ]] # please note the space before and after the file content
    	then
        	echo "found"
        	sed -i '/'"$(basename $entry)"'/c\'"$(basename $entry) $(date '+%Y-%m-%d %T')"'' "$destination/${diractory##*/}/packup.log"
    	else
        	echo "not found"
        	echo "$(basename $entry) $(date '+%Y-%m-%d %T')" >> "$destination/${diractory##*/}/packup.log"
		fi
		 
    	echo "file $(basename $entry) successfully backed up"
	fi
}
echo -e "what diractory would you like to back up ?"
read diractory

if [ ! -d "$diractory" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "$diractory does not exist."
  exit $?
fi

echo -e "what diractory would you like to save backups ?"
read destination

mkdir -p "$destination/${diractory##*/}"

echo -e "write time between packups like : " 
echo -e "(m<number>) or (s<number>) or (h<number>) or (d<number>) "
read input_time

while true
do
	for entry in "$diractory"/*
	do
		if [  -f "$destination/${diractory##*/}/$(basename $entry)" ]
		then
			echo -e "found in destination!"
			check_time_of_backup entry destination OLDTIME
		else
			echo -e "not found in destination!"
			cp -f -R $entry $destination/${diractory##*/}/$(basename $entry)
			echo "$(basename $entry) $(date '+%Y-%m-%d %T')" >> "$destination/${diractory##*/}/packup.log"
		fi
		
	done
done
d=`date '+%d/%m/%y %H:%M:%S'`

echo $d