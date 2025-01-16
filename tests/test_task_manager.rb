require 'minitest/autorun'
require_relative '../lib/task_manager'

class TestTaskManager < Minitest::Test
  def setup
    @manager = TaskManager.new
  end

  def test_add_task
    @manager.add_task("Walk the dog")
    assert_includes @manager.tasks, "Walk the dog"
  end

  def test_list_tasks
    @manager.add_task("Buy groceries")
    # Capture output to test the list
    output = capture_io do
      @manager.list_tasks
    end.first

    assert_match /Buy groceries/, output
  end
end
