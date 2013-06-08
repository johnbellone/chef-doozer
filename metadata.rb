name                    "doozer"
maintainer              "John Bellone"
maintainer_email        "john.bellone.jr@gmail.com"
license                 "Apache 2.0"
description             "Manages doozer and its installed libraries."
long_description        IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version                 "0.1.0"
recipe                  "doozer", "Main Doozer configuration"
recipe                  "doozer::doozer", "Doozer CLI"

depends 'build-essential'
depends 'golang'

supports 'redhat', '>= 6.0'
supports 'centos', '>= 6.0'
supports 'ubuntu'
