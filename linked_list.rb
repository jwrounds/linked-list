class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append value
    new_node = Node.new(value)
    self.tail.next = new_node if self.tail
    self.tail = new_node
    self.size += 1
    self.head = new_node unless self.head
  end

  def prepend value
    new_node = Node.new(value)
    new_node.next = self.head if self.head
    self.head = new_node
    self.size += 1
    self.tail = new_node unless self.tail
  end

  def at index
    self.check_node_index(self.head, index)
  end

  def check_node_index node, index, pointer = 0
    if pointer == index
      return node
    elsif pointer < self.size
      pointer += 1
      self.check_node_index(node.next, index, pointer)
    end
  end

  def pop
    
  end

  def contains? value

  end

  def find value

  end

  def to_s

  end

end

class Node
  attr_accessor :value, :next

  def initialize value = nil
    @value = value
    @next = nil
  end

end

list = LinkedList.new 
list.append 12
list.append 14
list.append 5
list.prepend 15
list.prepend "hello"

p list.head.value
p list.tail.value
p list.at(2).value