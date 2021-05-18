run 2 (for now) containers for emulating hosts in LAN;
execute on both
bridge_nssetup -> $icont_nssetup;

first gives overlay ns with bridge and vxlan interface
second adds cont$i ns, connected with bridge;
TODO: run server inside of it
