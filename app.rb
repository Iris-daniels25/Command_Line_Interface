require "sinatra"
require "date"
require_relative "lib/task_manager"

set :bind, "0.0.0.0"
set :port, 4567
set :host_authorization, { permitted_hosts: [] }

manager = TaskManager.new

get "/" do
  @tasks = manager.tasks
  @today = Date.today

  erb :index
end

post "/tasks" do
  description = params[:task]&.strip
  priority = params[:priority] || "medium"
  due_date = params[:due_date]

  unless description.nil? || description.empty?
    manager.add_task(description, priority, due_date)
  end

  redirect "/"
end

post "/tasks/:index/toggle" do
  manager.toggle_task(params[:index].to_i)

  redirect "/"
end

post "/tasks/:index/delete" do
  manager.delete_task(params[:index].to_i)

  redirect "/"
end
