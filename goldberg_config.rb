Project.configure do |config|
  config.ruby = '1.9.3'     
  config.environment_variables = {"RAILS_ENV" => "test"}
  config.rake_task = 'ci'  
  config.group = 'OpenSource' 
  config.use_bundle_exec = true
end

Project.configure do |config|
  config.on_build_completion do |build,notification,previous_build_status|
    # sending mail
    notification.from('ci@joshsoftware.com').to('siva@joshsoftware.com, jiren@joshsoftware.com, manoj@joshsoftware.com').with_subject("build for #{build.project.name} #{build.status}").send
  end
end
