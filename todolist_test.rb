require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_same(@todo1, @list.first)
  end

  def test_last
    assert_same(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_same(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_same(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    done_list = @list.done!
    assert_equal(true, @list.done?)
  end

  def test_add_raise_typerror
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel
    todo4 = Todo.new("test")
    @list << todo4
    assert_includes(@list.to_a, todo4)
  end

  def test_add
    todo4 = Todo.new("test")
    @list.add(todo4)
    assert_includes(@list.to_a, todo4)
  end

  def test_item_at
    assert_same(@todo1, @list.item_at(0))
    assert_same(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }

    @list.remove_at(1)
    assert_equal(false, @list.to_a.include?(@todo2))
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output2 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    @list.mark_done_at(0)

    assert_equal(output2, @list.to_s)
  end

  def test_to_s_3
    output3 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.done!

    assert_equal(output3, @list.to_s)
  end

  def test_each
    @list.each do |todo|
      todo.title = 'test'
    end

    assert_equal('test',@todo1.title)
    assert_equal('test',@todo2.title)
    assert_equal('test',@todo3.title)
  end

  def test_each_2
    each_return = @list.each {}
    assert_same(@list, each_return)
  end

  def test_select
    @list.mark_done_at(0)
    @list.mark_done_at(1)

    select_return = @list.select do |todo|
      todo.done?
    end

    assert_equal([@todo1, @todo2], select_return.to_a)
    refute_same(@list, select_return)
    assert_instance_of(TodoList, select_return)
  end

  def test_find_by_title
    assert_same(@todo1, @list.find_by_title('buy milk'))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    @list.done!
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
    @list.done!
    assert_equal([], @list.all_not_done.to_a)
  end

  def test_mark_done
    assert_same(nil, @list.mark_done('fake todo'))
    @list.mark_done('buy milk')
    assert(@todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
end
