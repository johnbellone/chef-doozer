Description
===========

Installs [doozerd][1], a highly available, consistent, distributed data
store, and associated [client libraries][2].

For more information about doozerd:

* [https://github.com/ha/doozerd][1]

For more information about the doozer client library:

* [https://github.com/ha/doozer][2]

About Doozer
===========

In brief, Doozer is a highly available, consistent, distributed data store
which is based on the [Google Chubby][3] white paper. When the data is changed
the connected clients will be immediately notified without polling. Doozer is
an excellent choice for a name service, database master election or
configuration data shared among machines.

The [Apache Zookeeper](http://zookeeper.apache.org/) is a similar software
distribution which is found in both [Apache Solr](http://lucene.apache.org/solr/)
and [Apache Hadoop](http://hadoop.apache.org/).

Requirements
============

## Platform:

* Ubuntu
* RHEL/CentOS

Attributes
==========

See `attributes/default.rb` for defaults generated per platform.

* `node[:doozerd][:go_url]` - GitHub address to the [Doozerd][1] project.
* `node[:doozerd][:install_prefix]` - Full path to the default installation directory.
* `node[:doozerd][:user_group]` - System group for the installation files.
* `node[:doozerd][:user]` - User the daemon will run as.
* `node[:doozerd][:run_options]` - Configuration options for the daemon.

* `node[:doozer][:go_url]` - GitHub address to the [Doozer][2] project.
* `node[:doozer][:install_prefix]` - Full path to the default installation directory.

Recipes
=======

default
-------

The default recipe installs doozerd and starts the service using one of
the templates available depending on the operating system. For the installation
from source it uses the *doozerd* recipe (below).

doozerd
-------

The doozerd recipe performs what is necessary to install daemon from source.
The *golang* executable is required and thus the recipe to build it is required.

doozer
------

The doozer recipe performs what is necessary to install the client from source.
The *golang* executable is required and thus the recipe to build it is required.

iptables
--------

This recipe sets up the iptables rules for firewalls. It requires the *iptables*
recipe to do so.

Usage
=====

To get doozerd installed on supported platforms use `recipe[doozer]`,
which will install doozerd from source and start the daemon using
the options specified.

For the command-line library use `recipe[doozer::doozer]` to perform
the build from source.
