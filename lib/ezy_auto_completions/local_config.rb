require 'yaml'

module EzyAutoCompletions::LocalConfig
  def config
    @config ||= begin
      config_file = File.join(home, '.ezy_auto_completions.yml')
      return nil unless File.exists?(config_file)
      YAML.load(File.read(config_file))
    end
  end
  
  def home
    ENV["HOME"] || ENV["HOMEPATH"] || File::expand_path("~")
  end
  
end