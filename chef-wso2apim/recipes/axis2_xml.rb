#
# Cookbook:: chef-wso2apim
# Recipe:: axis2_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.
axis2_xml = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/conf/axis2/axis2.xml"
template axis2_xml do
  source 'axis2.xml.erb'
  mode 0644

  variables(

  )


end
