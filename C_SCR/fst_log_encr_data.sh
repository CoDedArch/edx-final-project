#! /bin/bash
lookup_log="./look_up.log"

#general idea

# Go to the core_server
hst_c_svr="/c/Users/hp/LIBRARY/09_Shell_scripts/edx_final_project/HST_C_SVR"
cd $hst_c_svr
data=$(find *.htpasswd)
for file in $data
do
date_modified=$(stat -c "%y" $file | cut -d "." -f1)
echo -e "file:\t $file \t date_modified: $date_modified" >> $lookup_log
done
echo "done executing"
