class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    self.tail.next = new_node if self.tail
    self.tail = new_node
    self.size += 1
    self.head = new_node unless self.head
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = self.head if self.head
    self.head = new_node
    self.size += 1
    self.tail = new_node unless self.tail
  end

  def at index
    self.check_node_index(self.head, index)
  end

  def check_node_index(node, index, pointer = 0)
    if pointer == index
      return node
    elsif pointer < self.size
      pointer += 1
      self.check_node_index(node.next, index, pointer)
    end
  end

  def pop
    self.size -= 1
    new_tail = self.at(self.size - 1)
    new_tail.next = nil
    self.tail = new_tail
  end

  def contains?(value, node = self.head)
    if node.next 
      node.value == value ? true : self.contains?(value, node.next)
    else
      false
    end
  end

  def find(value, node = self.head, pointer = 0)
    if node.value == value
      return pointer
    elsif pointer < self.size - 1
      pointer += 1
      self.find(value, node.next, pointer)
    else
      return nil
    end
  end

  def to_s
    string = ""
    node = self.head
    while node
      string += "( #{node.value} )"
      string += " -> " if node.next
      node = node.next
    end
    string
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    left_node = self.at(index - 1)
    right_node = self.at(index)
    left_node.next = new_node
    new_node.next = right_node
    self.size += 1
  end

  def remove_at(index)
    left_node = self.at(index - 1)
    right_node = self.at(index + 1)
    left_node.next = right_node
    self.size -= 1
  end

end

class Node
  attr_accessor :value, :next

  def initialize value = nil
    @value = value
    @next = nil
  end

end
