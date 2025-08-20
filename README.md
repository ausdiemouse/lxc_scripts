# lxc_scripts

14-Jul-24 - imported in the notes and scripts from the 32bit system debian-ntbk for documentation and version control

Note: containers run as root hence the 'sudo' prefix is not required  

Name|Description  
------------------------|-----------------------  
0_generic_cleanup.sh|the usual update, upgrade,autoremove/clean statements run without 'sudo' prefix  
1_update_all_containers.sh|updates all running containers by reading in the generic_cleanup.sh script to be executed within the each container   
2_stop_all_containers.sh|stops all running containers  
3_start_allcontainers.sh|starts up all containers  
4_setup_ip.sh|This file setups up firewall and nat rules that map the container's ip and port to the host machines(external) ip and port of choice  
lxcNotes|Initial Notes. has been added to .gitignore. review and remove as required  


20-Aug-25 - issue with all containers unable to update, running the update script threw errors as the source.list file was set to stable and it created errors with the new debian 13 'trixie' release. Need to change from stable to bookworm. Used Claude Sonnet 4 to test correction hypothesis and generate code. Tested code on expendable containers. Tests and Production updates ran on first pass. 
Details in the "fix_container_repos_deb12_not_deb13" folder
