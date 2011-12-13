set :application, "Docbic9"
set :repository,  "git://github.com/cuciferus/docbic9"
set :scm, :git


role :web, "Nginx"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "Postgresql", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"
