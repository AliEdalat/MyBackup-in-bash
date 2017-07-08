declare file="/home/ali/workspace/BackUpOfBig/packup.log"
declare regex="\s+A5.txt\s+"

declare file_content=$( cat "${file}" )
if [[ " $file_content " =~ $regex ]] # please note the space before and after the file content
    then
        echo "found"
    else
        echo "not found"
fi

date -d '2007-09-01 17:30:24' '+%s'

#diff time of file is less than input time and diff time of log is greater than input
# input time
#change file not write again same fle data 
#show all update times of a file (optional)
