Create a branch named 'shim-xx-somename'
ensure it has a master.sh confirming to what's needed and the scripts required in the scripts folder
--> changes that need to be made should be done so via scripts to handle the process and report success etc

Latest Upstream is pulled
all Shim branches latest commits based on shim-xx-whatever is pulled in order incrememently starting at 00
once all of those branches are merged into midstream/latest along with upstream/latest then the master script
is executed and each shim is called within it's working folder. 

Keep anything you need, within the working folder and use your script to check and overlay those changes into the upstream latest.

Don't break the build. 