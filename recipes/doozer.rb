# -*- mode: ruby -*-
#
# Cookbook Name:: doozer
# Recipe:: doozer
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

bash "install_doozer" do
  code "go get #{node['doozer']['git_url']}"
  environment 'GOPATH' => node['doozer']['install_prefix']
  not_if {::File.exists?(File.join(node['doozer']['install_prefix'], 'doozer'))}
end
