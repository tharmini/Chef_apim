#
# Cookbook:: chef-wso2apim
# Recipe:: user_mgt_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.
user_mgt_xml = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/conf/user-mgt.xml"
template user_mgt_xml do
  source 'user-mgt.xml.erb'
  mode 0644

  variables(

  )


end
