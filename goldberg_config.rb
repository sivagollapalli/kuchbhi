Project.configure do |config|
  config.frequency = 20
  config.ruby = '1.9.3'                                     # Your server needs to have rvm installed for this setting     to be considered
  config.environment_variables = {"FOO" => "bar"}
  Project::Configuration::NO_TIMEOUT
  #config.timeout = 10.minutes                               # Defaults to 10.minutes if not configured. Set it to Proj    ect::Configuration::NO_TIMEOUT if you don't want it to ever timeout
  config.nice = 5                                           # Use this to reduce the scheduling priority (increase nic    eness) of CPU
  # intensive builds that may otherwise leave the Goldberg web application
  # unresponsive. Uses the UNIX `nice` command. Defaults to '0'.
  # Positive values have lower priority with a max of 19 on OSX and 20 on
  # Linux. You can set negative values, but we don't see the point.
  config.command = 'rake ci:build'                                   # To be used if you're using anything other than rak    e
  #config.rake_task = 'ci'                                   # To be used if your CI build runs something other than t    he default rake.
  # Not relevant if you're using config.command.
  config.group = 'Rails Rumble'                                      # Running a lot of projects on one server? Use this to lo    gically group them.
  config.use_bundle_exec = true                             # Run 'bundle exec rake', recommended for Rails projects
  #config.bundle_options = '--without deployment mac'        # Command-line options for bundle install
end

Project.configure do |config|
  config.on_build_completion do |build,notification,previous_build_status|
    # sending mail
    notification.from('ci@joshsoftware.com').to('siva@joshsoftware.com, jiren@joshsoftware.com, manoj@joshsoftware.com').with_subject("build for #{build.project.name} #{build.status}").send
  end
end
