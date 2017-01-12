require "sinatra"
require "sinatra/reloader" if development?
require "pry"

require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')

enable(:sessions)

todo_list = TodoList.new("Nen")
todo_list.load_tasks

get '/' do
  session[:owner] = todo_list.owner
  redirect("/tasks")
end

get '/tasks' do
  @tasks = todo_list.tasks
  erb(:task_index)
end

get '/new_task' do
  erb(:new_task)
end

post '/create_task' do
  task = params[:task]
  todo_list.add_task(Task.new(task))
  todo_list.save_tasks
  redirect("/tasks")
end

get '/complete_task/:id' do
  task  = todo_list.find_task_by_id(params[:id].to_i)
  task.complete!
  todo_list.save_tasks
  redirect("/tasks")
end

get '/uncomplete_task/:id' do
  task  = todo_list.find_task_by_id(params[:id].to_i)
  binding.pry
  task.make_incomplete!
  todo_list.save_tasks
  redirect("/tasks")
end

get '/delete_task/:id' do
  task  = todo_list.find_task_by_id(params[:id].to_i)
  todo_list.delete_task(task)
  todo_list.save_tasks
  redirect("/tasks")
end