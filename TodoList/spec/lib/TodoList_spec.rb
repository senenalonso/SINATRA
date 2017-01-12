require 'pry'
require_relative '../../TodoList'
require '../spec_helper'

describe TodoList do 

	before :each do
		@list = TodoList.new("Senén")
	end

  let (:task) {Task.new("Support Rayo")}
  let (:othertask) {Task.new("Support Real Madrid")}

  describe "#add_task" do
    it "Test if a task is included" do
      @list.add_task(task)
      expect(@list.tasks.length).to eq(1)
      expect(@list.tasks[task.id]=task.content)
    end
  end

  describe "#delete_task" do
    it "Test if a task is removed" do
      @list.delete_task(@list.add_task(task))
      expect(@list.tasks.length).to eq(0)
      expect(@list.tasks[task.id]==nil)
    end
    it "Test if a task doesn't exits" do
      @list.add_task(task)
      size = @list.tasks.length
      @list.delete_task(10000)
      expect(@list.tasks.length).to eq(size)
    end
  end

  describe "#find_task_by_id" do
    it "Test if a task is found" do      
      expect(@list.find_task_by_id(@list.add_task(task))).to eq(task)
    end
    it "Test returns nil if the task isn't found" do      
      expect(@list.find_task_by_id(task.id)).to eq(nil)
    end
  end

  describe "#sort_by_created" do
    it "Test if the list is empty returns []" do      
      expect(@list.sort_by_created).to eq([])
    end
    it "Test if the list is correctly ordered ASC by created_at" do      
      @list.add_task(task)
      @list.add_task(othertask)
      sorted_list=@list.sort_by_created
      expect(sorted_list[0].content).to eq(task.content)
    end
    it "Test if the list is correctly ordered DESC by created_at" do      
      @list.add_task(task)
      sleep(1)
      @list.add_task(othertask)
      sorted_list=@list.sort_by_created(false)
      expect(sorted_list[0].content).to eq(othertask.content)
    end
  end
  
end