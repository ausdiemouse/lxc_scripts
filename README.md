# lxc_scripts

14-Jul-24 - imported in the notes and scripts from the 32bit system debian-ntbk for documentation and version control

Note: containers run as root hence the 'sudo' prefix is not required  

Name|Description  
------------------------|-----------------------  
0_generic_cleanup.sh|the usual update, upgrade,autoremove/clean statements run without 'sudo' prefix  
lxcNotes|Initial Notes. has been added to .gitignore. review and remove as required  
4_setup_ip.sh|This file setups up firewall and nat rules that map the container's ip and port to the host machines(external) ip and port of choice  
3_start_allcontainers.sh|starts up all containers  
2_stop_all_containers.sh|stops all running containers  
1_update_all_containers.sh|updates all running containers by reading in the generic_cleanup.sh script to be executed within the each container   
