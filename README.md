# oracle12c-vagrant
A vagrant box that provisions Oracle 12c automatically, using only Vagrant and a shell script.
This is fork of https://github.com/steveswinsburg/oracle12c-vagrant that adds  [Microsoft Hyper-V](https://www.vagrantup.com/docs/hyperv/) provider support.
You should have Vagrant and VM provider (Hyper-V for Windows system or VirtualBox for others) installed. 
In case of VirtualBox install VirtualBox plugin `vagrant plugin install vagrant-vbguest`.
You can use also VirtualBox for Windows but the main purpose of this config is Microsoft Hyper-V support. 
Because of Hyper-V has shared folder issues and does not support port forwarding (see https://www.vagrantup.com/docs/hyperv/limitations.html#limited-networking) then I use static IP config and folder sharing is switched off. See "Connecting to Oracle".

## Getting started
1. Clone this repository
2. Download the Oracle Database 12c binaries `linuxamd64_12102_database_1of2.zip` and `linuxamd64_12102_database_2of2.zip`
from http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html to `install/`
3. You should have Vagrant and VM provider installed.
4. Run `vagrant up`
  * The first time you run this it will provision everything and may take a while. Ensure you have a good internet connection!
5. Connect to the database (see below).
6. You can shutdown the box via the usual `vagrant halt` and the start it up again via `vagrant up`.

## Connecting to Oracle
* Hostname: `localhost` or 10.0.74.2 in case of Hyper-V
* Port: `1521`
* SID: `orcl`
* All passwords are `password`.

## Tablespaces
If you have Oracle schemas that will consume a lot of space, create a tablespace for your schema in the folder `oradata` instead of using the built in tablespaces. See [tablespace.sql](/scripts/tablespace.sql) for an example of how to create a tablespace in this directory.

## Other info

* If you need to, you can connect to the machine via `vagrant ssh`.
* You can `sudo su - oracle` to switch to the oracle user.
* The Oracle installation path is `/opt/oracle/`
* On the guest OS, the directory `/vagrant` is a shared folder and maps to wherever you have this file checked out.

## Known issues

#### Connection time after startup
Once Oracle and the listener starts up, it may take a few moments until you are able to connect to the DB, eg via SQL Developer.