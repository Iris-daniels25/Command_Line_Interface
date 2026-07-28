require "sinatra"
require_relative "lib/task_manager"

set :bind, "0.0.0.0"
set :port, 4567
set :host_authorization, { permitted_hosts: [] }

manager = TaskManager.new

get "/" do
  @tasks = manager.tasks
  erb :index
end

post "/tasks" do
  task = params[:task]&.strip

  manager.add_task(task) unless task.nil? || task.empty?

  redirect "/"
end

post "/tasks/:index/delete" do
  manager.delete_task(params[:index].to_i)

  redirect "/"
end
