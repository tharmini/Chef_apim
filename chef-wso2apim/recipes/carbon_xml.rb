#
# Cookbook:: chef-wso2apim
# Recipe:: carbon_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.
carbon_xml = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/conf/carbon.xml"
template carbon_xml do
  source 'carbon.xml.erb'
  mode 0644

  variables(
  )
end