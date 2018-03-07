#
# Cookbook:: chef-wso2apim
# Recipe:: java_installation
#
# Copyright:: 2018, The Authors, All Rights Reserved.

install_path = "#{node['wso2am']['java_file_install_path']}"

extract_cache_path = node['wso2am']['java_extracted_path']
java_home = node['wso2am']['java_home']
java_home_path = "#{java_home}/bin"
package 'tar'


remote_file "#{Chef::Config[:file_cache_path]}/jdk-8u121-linux-x64.tar.gz" do
  source "#{node['wso2am']['java_file_cache_path']}"
  mode '0755'
  not_if { ::File.exist?(install_path) }
end


#adding java to extracted path
bash "adding java to #{extract_cache_path}" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
	tar -xvzf jdk-8u121-linux-x64.tar.gz -C "#{extract_cache_path}"
  EOH
  not_if {::File.exists?(java_home)}
end

#setting java home
ENV['JAVA_HOME'] = java_home
bash 'env_test' do
  code <<-EOH
  echo $JAVA_HOME
  EOH
end



#export java home
#file '/etc/profile.d/jdk.sh' do
# content "export JAVA_HOME=#{java_home}"
#  content "export PATH=$PATH:$JAVA_HOME/bin"
# mode '0755'
# only_if {node['wso2am']['set_etc_environment'] == true}
#end



#ruby_block 'set-env-java-home' do
# block do
# ENV['JAVA_HOME'] = java_home
#  end
#  not_if { ENV['JAVA_HOME'] == java_home }
#end
#


#setting envirnmental variables in etc environment

ruby_block 'set JAVA_HOME in /etc/environment' do
 block do
    file = Chef::Util::FileEdit.new('/etc/environment')
    file.insert_line_if_no_match(/^JAVA_HOME=/, "JAVA_HOME=#{java_home}")
   file.search_file_replace_line(/^JAVA_HOME=/, "JAVA_HOME=#{java_home}")
   file.write_file
 end
 only_if { node['wso2am']['set_etc_environment'] }
end


