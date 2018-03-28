#
# Cookbook:: chef-wso2apim
# Recipe:: master_datasouces_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.
master_datasouces_xml = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/conf/datasources/master-datasources.xml"

  template master_datasouces_xml do
    source 'master-datasources.xml.erb'
    mode '0644'
    variables(

    )

end