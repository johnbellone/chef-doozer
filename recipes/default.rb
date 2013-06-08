# -*- mode: ruby -*-
#
# Cookbook Name:: doozer
# Recipe:: default
#
# Author:: John Bellone <john.bellone.jr@gmail.com>
#
# Copyright 2013, John Bellone, Jr.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "doozer::doozerd"

service "doozerd" do
  case platform
    when "ubuntu"
    start_command "/usr/sbin/invoke-rc.d doozerd start"
    stop_command "/usr/sbin/invoke-rc.d doozerd stop"
    restart_command "/usr/sbin/invoke-rc.d doozerd restart"
    status_command "/usr/sbin/invoke-rc.d doozerd status"
  end

  supports [:restart]
  action :enable
end

template "/etc/init.d/doozerd" do
  source "init.erb"
  owner "root"
  group node['doozerd']['root_group']
  mode 00644
  notifies :restart, "service[doozerd]"
  variables({
    :doozerd_path => node['doozerd']['install_prefix'],
    :doozerd_pidfile => node['doozerd']['pid_file']
  })
  only_if { platform_family?("debian") }
end

service "doozerd" do
  action :start
end
