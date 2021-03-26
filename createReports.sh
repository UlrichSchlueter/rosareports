DATE_WITH_TIME=`date "+%Y-%m-%d-%H%M%S"`

LOGFOLDER="clusters-$DATE_WITH_TIME"
SUMMARY="clusters-$DATE_WITH_TIME.txt"

clusters=$( ocm list clusters --managed | grep rosa | awk '{print $1}')

echo "$clusters" > $SUMMARY

mkdir -p $LOGFOLDER

for x in $clusters;do
	ocm describe cluster $x > $LOGFOLDER/$x
done

./genStats.sh $LOGFOLDER



