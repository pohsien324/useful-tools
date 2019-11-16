# 1. Read replacing file and store content into variables
# 2. Find the value of variable1 from the files and get the paths
# 4. Use sed to replace the strings from files

filename='replace.txt'
while IFS=' ' read -r value1 value2 
do
    grep -rw '.' -e $value1 --exclude=$filename | sed 's/:/ /g' | awk '{print $1}' | xargs sed -i '' "s/${value1}/${value2}/g"
    
    # Same as below command
    # grep -rw '.' -e $value1 --exclude=$filename | sed 's/:/ /g' | awk '{print $1}' | xargs -I @@@ sed -i '' "s/${value1}/${value2}/g" @@@
done < $filename


