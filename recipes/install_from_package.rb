#
# Cookbook Name:: zeromq
# Recipe:: install_from_package
#
# Copyright (C) 2013 Johannes Plunien
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

case node['platform']
when 'ubuntu'
  libzmq_package = 'libzmq-dev' if Chef::VersionConstraint.new(">= 12.0").include?(node['platform_version'])
when 'debian'
  libzmq_package = 'libzmq-dev' if Chef::VersionConstraint.new(">= 7.0").include?(node['platform_version'])
end

unless libzmq_package.nil?
  package libzmq_package
else
  Chef::Application.fatal!("There are no zeromq packages for this platform; please use the source method to install")
end
