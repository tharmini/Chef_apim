#
# Cookbook:: wso2is
# Recipe:: java
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Cookbook:: wso2is
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
file_cache_path = node['wso2is']['java_file_cache_path']
extract_cache_path =node['wso2is']['java_extracted_path']
tarball_name='jdk-1.8.0_121'
java_home = node['wso2is']['java_home']
default = node['wso2is']['set_default']
java_home = '/opt/jdk1.8.0_121' if java_home.nil? || java_home.empty?
java_home2='/opt/jdk1.8.0_121/bin'

ruby_block 'set-env-java-home' do
  block do
    ENV['JAVA_HOME'] = java_home
  end
  not_if { ENV['JAVA_HOME'] == java_home }
end

directory '/etc/profile.d' do
  mode '0755'
end



file '/etc/profile.d/jdk.sh' do
  content "export JAVA_HOME=#{java_home2}"
  mode '0755'
end

ruby_block 'set JAVA_HOME in /etc/environment' do
  block do
    file = Chef::Util::FileEdit.new('/etc/environment')
    file.insert_line_if_no_match(/^JAVA_HOME=/, "JAVA_HOME=#{java_home}")
    file.search_file_replace_line(/^JAVA_HOME=/, "JAVA_HOME=#{java_home}")
    file.write_file
  end
  only_if { node['wso2is']['set_etc_environment'] }
end

package 'tar'

java_dir_name = "jdk1.8.0_121"

java_root = java_home.split('/')[0..-1].join('/')

java_dir = "#{java_root}/#{java_dir_name}"

ruby_block "adding java to #{java_dir}" do 
  block do
    

	extract = Mixlib::ShellOut.new(
      %( tar -xvzf "#{file_cache_path}" -C "#{extract_cache_path}")
    )
    extract.run_command
    raise("Failed to extract file #{tarball_name}!") unless extract.exitstatus == 0
	end
  not_if { ::File.exist?(java_home) }
end
