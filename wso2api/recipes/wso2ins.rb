#
# Cookbook:: wso2api
# Recipe:: wso2ins
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Cookbook:: wso2is
# Recipe:: wso2server
#
# Copyright:: 2018, The Authors, All Rights Reserved.


file_cache_path = node['wso2am']['wso2am_file_cache_path']
wso2am_tarball_name='wso2am-2.1.0'

wso2api_extracted_path=node['wso2am']['wso2api_extracted_path']
package 'tar'
wso2am_dir_name = "wso2am-2.1.0"
wso2am_root = wso2api_extracted_path.split('/')[0..-1].join('/')
wso2am_dir = "#{wso2api_extracted_path}/#{wso2am_dir_name}"


bash "adding wso2 to #{wso2api_extracted_path}" do
  cwd ::File.dirname(file_cache_path)
  code <<-EOH
	unzip "#{file_cache_path}" -d "#{wso2api_extracted_path}"
  EOH
  not_if { ::File.exist?(wso2am_dir) }
end