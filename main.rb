# main.rb

require_relative 'lib/task_manager'

def main
  manager = TaskManager.new

  puts "Welcome to the Task Manager CLI!"
  loop do
    puts "\nType 'add' to add a task, 'list' to see all tasks, or 'exit' to quit."
    print "> "
    input = gets.chomp.downcase

    case input
    when 'add'
      print "Enter a task description: "
      task_description = gets.chomp
      manager.add_task(task_description)
      puts "Task '#{task_description}' added."
    when 'list'
      puts "Here are your tasks:"
      manager.list_tasks
    when 'exit'
      puts "Goodbye!"
      break
    else
      puts "Invalid command, please try again."
    end
  end
end

main
