# lib/task_manager.rb

class TaskManager
  attr_accessor :tasks  # example: using attr_accessor for @tasks

  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def list_tasks
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end
end
