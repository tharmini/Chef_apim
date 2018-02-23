#
# Cookbook:: wso2api
# Recipe:: wso2server
#
# Copyright:: 2018, The Authors, All Rights Reserved.

wso2api_extracted_path=node['wso2am']['wso2api_extracted_path']
wso2am_dir_name = "wso2am-2.1.0/bin"
bin_path = "#{wso2api_extracted_path}/#{wso2am_dir_name}"



bash "start_wso2_server " do
  code <<-EOH
  	cd #{bin_path}
	./wso2server.sh --start
  EOH
end
