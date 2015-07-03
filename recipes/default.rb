#
# Cookbook Name:: bitmonk_runit_wtf
# Recipe:: default
#
# Copyright (C) 2015 Justin Alan Ryan (ZipRealty / Realogy)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# temp, .kitchen.yml should be doing this
include_recipe 'runit'

user 'wtf'

runit_service 'wtf' do
  default_logger true
  action [:enable, :start]
end

template '/etc/foosball.conf' do
  source "foosball.conf.erb"
  owner "wtf"
  action :create
  mode "0644"
  notifies :restart, "service[wtf]", :delayed
end

# y u fail !?

