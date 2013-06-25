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

template "/etc/init/doozerd.conf" do
  source "doozerd.conf.erb"
  owner "root"
  group node['doozerd']['root_group']
  mode 00644
  notifies :restart, "service[doozerd]"
  variables({
              :doozerd_user => node['doozerd']['user'],
              :doozerd_path => node['doozerd']['install_prefix'],
              :doozerd_options => node['doozerd']['run_options']
            })
  only_if { platform_family?("debian") }
end

service "doozerd" do
  case node[:platform]
    when "ubuntu"
    provider Chef::Provider::Service::Upstart
    when "redhat"
    provider Chef::Provider::Service::Init::Redhat
  end
  supports [:restart, :status, :start, :stop]
  action :enable
end
