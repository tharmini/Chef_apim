

default['wso2is']['java_home'] = nil
default['wso2is']['wso2is_home'] = nil
default['wso2is']['java_extracted_path']='/opt'
default['wso2is']['java_file_cache_path']='/home/tharmini/jdk/jdk-8u121-linux-x64.tar.gz'
default['wso2is']['wso2is_file_cache_path']='/home/tharmini/Downloads/wso2api/wso2am-2.1.0.zip'
default['wso2is']['wso2api_extracted_path']='/home/tharmini/Downloads/wso2api3'
default['wso2is']['set_default'] = true
default['wso2is']['owner'] = 'root'
default['wso2is']['group'] = 'root'
default['wso2is']['set_etc_environment'] = true
default['wso2is']['use_alt_suffix'] = false
default['wso2is']['reset_alternatives'] = true
default['wso2is']['alternatives_priority'] = 1062
default[:wso2is][:product_install_dir]="/home/tharmini/Downloads/wso2api"
default[:wso2is][:product_version]="2.1.0"

