#! /bin/bash

#paths
hst_c_svr="/c/Users/hp/LIBRARY/09_Shell_scripts/edx_final_project/HST_C_SVR"
lookup_log="$hst_c_svr/look_up.log"

data=$(find "$hst_c_svr" -name "*.htpasswd")

for file in $data
do
file_name=$(basename "$file")
date_modified=$(stat -c "%Y" $file)
echo -e "file:\t $file_name \t date_modified: $date_modified" >> $lookup_log
done
echo "done executing"
