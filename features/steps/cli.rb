Given %r{^a .tabtab.yml config file} do
  Given "a safe folder"
  in_home_folder do
    config = { 
      'external' => { 
        '-h' => %w[rails test_app], 
        '-?' => [] 
      }
    }
    File.open('.tabtab.yml', 'w') do |f|
      f << config.to_yaml
    end
  end
end

Then %r{^(\w+) completions are ready to be installed for applications: (.*)$} do |type, app_list|
  in_home_folder do
    contents = File.read(".tabtab.sh")
    app_list.split(/,\s*/).each do |app|
      contents.should =~ /complete -o default -C 'tabtab --#{type}' #{app}/
    end
  end
end