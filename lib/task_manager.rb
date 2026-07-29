class TaskManager
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add_task(description, priority = "medium", due_date = nil)
    @tasks << {
      description: description,
      priority: priority,
      due_date: due_date,
      completed: false
    }
  end

  def delete_task(index)
    @tasks.delete_at(index)
  end

  def toggle_task(index)
    task = @tasks[index]
    task[:completed] = !task[:completed] if task
  end

  def list_tasks
    @tasks.each_with_index do |task, index|
      status = task[:completed] ? "Completed" : "Pending"
      due_date = task[:due_date].to_s.empty? ? "No due date" : task[:due_date]

      puts "#{index + 1}. #{task[:description]}"
      puts "   Priority: #{task[:priority].capitalize}"
      puts "   Due: #{due_date}"
      puts "   Status: #{status}"
    end
  end
end
