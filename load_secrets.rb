require 'yaml'                                                      
                                                                    
path = 'config/application.yml'                                     
environment = ENV['RACK_ENV']                                       
                                                                    
parsed_yaml = YAML.load(ERB.new(File.read(path)).result)            
envs = parsed_yaml[environment]                                     
                                                                    
envs.each do |key, value|                                           
    ENV[key] = value unless ENV.key?(key)                           
end   