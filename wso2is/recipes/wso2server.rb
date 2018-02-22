#
# Cookbook:: wso2is
# Recipe:: wso2server
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#
# Cookbook:: wso2is
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
file_cache_path = node['wso2is']['wso2is_file_cache_path']
wso2am_tarball_name='wso2am-2.1.0'
wso2is_home =node['wso2is']['wso2is_home']
wso2is_home = '/home/tharmini/Downloads/exwso2api' if wso2is_home.nil? || wso2am_home.empty?
wso2api_extracted_path=node['wso2is']['wso2api_extracted_path']
package 'tar'
wso2am_dir_name = "wso2am-2.1.0"
wso2am_root = wso2api_extracted_path.split('/')[0..-1].join('/')
wso2am_dir = "#{wso2api_extracted_path}/#{wso2am_dir_name}"



ruby_block "adding wso2 to #{wso2api_extracted_path}" do 
  block do
    extract = Mixlib::ShellOut.new(
      %( unzip "#{file_cache_path}" -d "#{wso2api_extracted_path}")
    )
    extract.run_command
    raise("Failed to extract file #{wso2am_tarball_name}!") unless extract.exitstatus == 0
	end
  not_if { ::File.exist?(wso2am_dir) }
end

