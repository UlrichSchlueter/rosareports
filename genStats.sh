
#set -x
FOLDER=$1

cd $FOLDER

grep -l -e "Product:.*rosa" * | xargs cat  | grep Organization | sort | uniq -c | sort -r > rosa.by.organization.txt

grep -l -e "Product:.*rosa" * | xargs cat  | grep -i creator | sort | uniq -c | sort -r > rosa.by.creator.txt

TOTAL=$( grep -e "Product:.*rosa" * | wc -l)
RH=$( grep -l -e "Product:.*rosa" * | xargs cat| grep Organization |  grep -i -e "Red.* Hat"| wc -l )
NONRH=$( grep -l -e "Product:.*rosa" * | xargs cat | grep Organization | grep -v "Red Hat" | wc -l)

echo "TOTAL:                 $TOTAL" > rosa.summary.txt
echo "Created by Redhat:     $RH"    >> rosa.summary.txt
echo "Created by Customers:  $NONRH" >> rosa.summary.txt


echo "Report files are in $FOLDER"
ls $FOLDER/rosa.*


