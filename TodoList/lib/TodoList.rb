require 'pry'
require_relative 'Task'

class TodoList
  FILE = "public/savedTODOs.txt"
  attr_reader :tasks, :owner
  def initialize(name)
  	@owner = name
    @tasks = []
  end

  def add_task(task)
    @tasks.push(task)
    task.id
  end

  def delete_task(id)
   	@tasks.delete_if {|task| task.id==id}
  end

  def find_task_by_id(id)
   	task = @tasks.bsearch do |task| 
      binding.pry
      task.id == id
    end
    task
  end

  def sort_by_created(asc=true)
  	if asc
  		sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
   	else	
   		sorted_tasks = @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
   	end
  end

  def load_tasks
    IO.foreach(FILE) do |line|
      task = line.strip.split(";")
      add_task(Task.new(task[1],task[0].to_i,task[2],task[3],task[4]))
    end
  end

  def save_tasks
    tasks=""
    @tasks.each do |task| 
      tasks+=task.to_string+"\n"
    end
    IO.write(FILE, tasks)
  end
end