#!/bin/bash
array=(https://google.com https://facebook.com https://twitter.com)
filename=website_status.log

echo "Test started at $(date)" >> $filename
for item in "${array[@]}"; do
    response=$(curl --write-out '%{http_code}' -L --silent --output /dev/null $item)
    if [ $response -eq 200 ];
    then
        echo "<$item> is UP" >> $filename
    else
        echo "<$item> is DOWN" >> $filename
    fi
done
echo "Test ended at $(date)" >> $filename

echo "Results are logged to $(pwd)/$filename file"