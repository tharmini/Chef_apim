#
# Cookbook:: chef-wso2apim
# Recipe:: broker_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.
broker_xml = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/conf/broker.xml"
template broker_xml do
  source 'broker_xml.erb'
  mode 0644

  variables(

      :mb_store_datasource_jndi_config => node["wso2am"]["mb_store_datasource_jndi_config"],

      )


end