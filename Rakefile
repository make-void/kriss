desc "Task description"
task :run do
  sh "rackup -p 9292"
end

task default: :run


desc "Build docker"
task :docker_build do
  sh `docker build -t kriss .`
end
