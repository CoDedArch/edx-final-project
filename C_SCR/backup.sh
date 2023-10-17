#! /bin/bash

hst_c_svr="/c/Users/hp/LIBRARY/09_Shell_scripts/edx_final_project/HST_C_SVR"
look_up="$hst_c_svr/look_up.log"
backup_PWD="/c/Users/hp/LIBRARY/09_Shell_scripts/edx_final_project/backup_PWD"

encr_passwd=$(find "$hst_c_svr" -name "*.htpasswd")
# data=$(cat look_up.log)
for encr_PWD in $encr_passwd
do
# get encrypted data
last_modified=$(stat -c "%Y" $encr_PWD)
file_name=$(basename $encr_PWD)

log_date=$(grep "$file_name" "$look_up" | awk '{print $4}')
if [ "$last_modified" -ne "$log_date" ]
then
# Backup the files
tar -czvf "$backup_PWD/backup_$(date '+%Y%m%d').tar.gz" "$encr_PWD"

#update the log to the new last modified date
sed -i "s|$file_name.*|$file_name\tdate_modified: $last_modified|g" "$look_up"
fi

done

echo "done executing"