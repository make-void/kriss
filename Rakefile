desc "Task description"
task :run do
  sh "rackup -p 9292"
end

task default: :run

desc "Build docker"
task :docker_build do
  sh 'docker build -t makevoid/kriss .'
end

desc "Push docker"
task :docker_push do
  sh 'docker push makevoid/kriss'
end

desc "Build & Push docker image"
task :docker_build_n_push do
  Rake::Task['docker_build'].invoke
  Rake::Task['docker_push'].invoke
end

desc "Build & Push docker image (requires docker-compose binary)"
task :docker_build_n_push_compose do
  sh 'docker-compose build && docker-compose push'
end

desc "Run docker locally"
task :docker_run do
  sh 'docker run -p 3000:80 kriss'
end

desc "Run docker locally (port 80)"
task :docker_run_80 do
  sh 'docker run -p 80:80 kriss'
end
