#
# Cookbook:: chef-wso2apim
# Recipe:: wso2_apim_installation
#
# Copyright:: 2018, The Authors, All Rights Reserved.

install_path = "#{node['wso2am']['wso2am_file_install_path']}"
wso2api_extracted_path=node['wso2am']['wso2api_extracted_path']
wso2am_dir_name = "wso2am-2.1.0"
wso2am_dir = "#{wso2api_extracted_path}/#{wso2am_dir_name}"
wso2am_bin_name = "wso2am-2.1.0/bin"
bin_path = "#{wso2api_extracted_path}/#{wso2am_bin_name}"


remote_file "#{Chef::Config[:file_cache_path]}/wso2am-2.1.0.zip" do
  source "#{node['wso2am']['wso2am_file_cache_path']}"
  mode '0755'
  not_if { ::File.exist?(install_path) }
end




#extract wso2 apim
bash "adding wso2 to #{wso2api_extracted_path}" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
	unzip wso2am-2.1.0.zip -d "#{wso2api_extracted_path}"
  EOH
  not_if { ::File.exist?(wso2am_dir) }
end


#start wso2 server

bash "start_wso2_server " do
  code <<-EOH
  	cd #{bin_path}
	./wso2server.sh --start
  EOH
end

