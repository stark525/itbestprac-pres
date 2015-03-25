Vagrant known issues
---------------------
The Windows VM I'm using has the Administrator account disabled, so the powershell script to install Puppet fails by default.  A quick fix can be to re enable the Administrator account (you can even do this before the script is called).

Right click My Computer > Manage
Set Administrator password and un-disable account
Log out and log back in.
Get it done before provisioning script and itll run

The powershell script lands in C:\tmp. You should run it, since it will create a hosts entry to point to your Linux puppetmaster, and it will download the Puppet package.  After you login as Administrator you should be able to execute the msi.

You'll also want to show hidden files and folders, as most of the Puppet stuff uses C:\ProgramData which is a hidden folder.

Additionally, you'll need to tell Vagrant to use this Vagrantfile and associated scripts.  You can either copy them to the default install directory C:\HashiCorp\Vagrant\bin, or set an environment variable to wherever you clone the repo.  If you chose to do the latter, make sure to exclude the created box in .gitignore.