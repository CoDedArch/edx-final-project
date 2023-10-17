#! /bin/bash

hst_c_svr="/c/Users/hp/LIBRARY/09_Shell_scripts/edx_final_project/HST_C_SVR"
cd $hst_c_svr
encr_passwd=$(find *.htpasswd)
data=$(cat look_up.log)
for encr_PWD in $encr_passwd
do
last_modified=$(stat -c "%y $encr_PWD")
file_name=$(stat -c "%n" $encr_PWD)


done