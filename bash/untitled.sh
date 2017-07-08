entry="/home/ali/workspace/BigNumber/Makefile.bak"
destination="/home/ali/workspace/alibackup"
diractory="/home/ali/workspace/BigNumber"

#if grep -Fxq "$(basename $entry)" "$destination/${diractory##*/}/packup.log"
#		then
    		# code if found
 #   		echo -e "found" 
  #  		sed -i '/'"$(basename $entry)"'/c\'"$(basename $entry) $(date '+20%y-%m-%d %H:%M:%S')"'' "$destination/${diractory##*/}/packup.log"
	#	else
    		# code if not found
    #		echo "$(basename $entry) $(date '+20%y-%m-%d %H:%M:%S')" >> "$destination/${diractory##*/}/packup.log"
	#	fi
#regex="\s+"$(basename $entry)"\s+"
#file_content=$( cat "$destination/${diractory##*/}/packup.log" )

#if [[ " $file_content " =~ $regex ]] # please note the space before and after the file content
 #   then
  #      echo "found"
   #     sed -i '/'"$(basename $entry)"'/c\'"$(basename $entry) $(date '+20%y-%m-%d %H:%M:%S')"'' "$destination/${diractory##*/}/packup.log"
    #else
     #   echo "not found"
      #  echo "$(basename $entry) $(date '+20%y-%m-%d %H:%M:%S')" >> "$destination/${diractory##*/}/packup.log"
#fi
#while true
#do
#	for i
#	do
#  		echo $i
#	done
#done
result=`grep -i "$(basename $entry) " $destination/${diractory##*/}/packup.log`;
echo $result
#result="A5.pdf 2017-07-08 14:51:58"
idw="$( cut -d ' ' -f 2 <<< "$result" ) $( cut -d ' ' -f 3 <<< "$result" )"
dif=$(expr $(date +%s) - $(date -d "$idw" '+%s'))
echo $idw
echo $dif
