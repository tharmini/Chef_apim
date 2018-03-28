#
# Cookbook:: chef-wso2apim
# Recipe:: registry_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.
registry_xml = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/conf/registry.xml"
template registry_xml do
  source 'registry.xml.erb'
  mode 0644

  variables(

      )


end
