# -*- mode: ruby -*-
#
# Cookbook Name:: doozer
# Attributes:: default
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

default['doozerd']['git_url'] = 'git://github.com/ha/doozerd.git'
default['doozerd']['git_tag'] = 'v0.8'

default['doozer']['git_url'] = 'git://github.com/ha/doozer.git'
default['doozer']['git_tag'] = 'v0.8'

default['doozerd']['install_prefix'] = '/usr/local'
default['doozer']['install_prefix'] = '/usr/local'
