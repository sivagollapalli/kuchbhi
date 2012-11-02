namespace :ci do
  task :spec do
    p "Specs are running..."
    system("bundle install")
    system("bundle exec rspec spec/") 
  end

  desc "Prepare for CI and run entire test suite"
  task :build => ['ci:spec'] do
  end
end
