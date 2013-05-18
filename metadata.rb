name                    "doozer"
maintainer              "John Bellone"
maintainer_email        "john.bellone.jr@gmail.com"
license                 "Apache 2.0"
description             "Manages doozer and its installed libraries."
long_description        IO.read('README.md')
version                 "0.0.1"

requires 'build-essential'
requires 'golang'

%w(ubuntu debian redhat centos).each do |os|
  supports os
end
