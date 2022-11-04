# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new('Can only add Todo objects') unless
    todo.instance_of?(Todo)
    self.todos << todo
  end

  alias_method(:<<,:add)

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each do |todo|
      todo.done!
    end
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    raise IndexError if todos.delete_at(idx).equal?(nil)
  end

  def to_s
    string_list = "---- Today's Todos ----"

    todos.each do |todo|
      string_list += "\n#{todo.to_s}"
    end

    string_list
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    selected_list = TodoList.new(title)

    each do |todo|
      selected_list.add(todo) if yield(todo)
    end

    selected_list
  end

  def find_by_title(title)
    each do |todo|
      return todo if todo.title.downcase == title.downcase
    end
    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private

  attr_accessor :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                   # adds todo1 to end of list, returns list
list.add(todo2)                   # adds todo2 to end of list, returns list
list << todo3                     # adds todo3 to end of list, returns list

p list.find_by_title('buy milk')
puts
p list.mark_done('clean room')
puts
p list.all_done
puts
p list.all_not_done
puts
p list.mark_all_done
puts
p list.mark_all_undone
