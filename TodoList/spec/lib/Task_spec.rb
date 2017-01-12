require_relative '../../Task'
require_relative '../spec_helper'

describe Task do 

	before :each do
		@task = Task.new("Task")
	end

  describe "#complete?" do
    it "Test if after creation the completed attribute is false" do
      expect(@task.completed?).to eq(false)
    end
  end

  describe "#complete!" do
    it "Test if the method change the value" do
      status = @task.completed?
      @task.complete!
      expect(@task.completed?).to eq(!status)
    end
  end

  describe "#make_incomplete!" do
    it "Test if completed attibute is false" do
      @task.complete!
      expect(@task.make_incomplete!).to eq(false)
    end
  end

  describe '#update_content!' do
    it 'Test if the text is changed to the new value' do
      text = "Play padel"
      date = @task.update_content!(text)
      expect(@task.content).to eq(text)
      expect(@task.updated_at).to eq(date)    
    end
    
  end
  
end