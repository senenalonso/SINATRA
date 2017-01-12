require 'date'
require 'pry'

class Task
  attr_reader :content, :id, :created_at, :updated_at
  @@current_id = 1
  def initialize(content,id=nil,completed=false,created=nil,updated=nil)
    created ||= DateTime.now.strftime('%d-%m-%Y %H:%M:%S.%L')
    @content = content
    if id
      @id=id.to_i
      @@current_id = id.to_i
    else
      @@current_id += 1
      @id = @@current_id.to_i
    end 
    @completed = completed=="true" ? true : false
    @created_at = created
    @updated_at = updated
  end

  def completed?
  	@completed
  end

  def complete!
  	@completed=true
  end

  def make_incomplete!
    @completed=false
  end

  def update_content!(text)
    @content=text
    @updated_at = DateTime.now.strftime('%d-%m-%Y %H:%M:%S.%L')
    @updated_at
  end

  def to_string
    "#{@id};#{@content};#{@completed};#{@created_at};#{@updated_at}"
  end
end