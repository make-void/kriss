desc "Task description"
task :run do
  sh "rackup -p 9292"
end

task default: :run

desc "Build docker"
task :docker_build do
  sh 'docker build -t kriss .'
end

desc "Run docker locally"
task :docker_run do
  sh 'docker run -p 3000:80 kriss'
end

desc "Run docker locally (port 80)"
task :docker_run_80 do
  sh 'docker run -p 80:80 kriss'
end
