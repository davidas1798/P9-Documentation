Node = Struct.new(:value, :next, :prev)

class List
	attr_accessor :size, :head, :tail

	def initialize()
		@size = 0
		@head = nil
		@tail = nil
	end

	def push(item)
		item = Node.new(item, nil, nil)
		if(empty)
			@tail = item
			item.next = nil
		else 
			head.prev = item
			item.next = @head
		end

		@head = item
		item.prev = nil
		@size += 1
	end

	def insert(item)
		item = Node.new(item, nil, nil)
		if(empty)
			@head = item
			item.prev = nil
		else
			@tail.next = item
			item.prev = @tail
		end

		@tail = item
		item.next = nil
		@size += 1
	end

	def insert_many(array)
		array.each do |item|
			item = Node.new(item,nil,nil)
			if(empty)
				@head = item
				item.prev = nil
			else
				@tail.next = item
				item.prev = @tail
			end

			@tail = item
			item.next = nil
			@size += 1
		end
	end

	def pop_head()
		if(empty)
			puts "Lista vacía"
		else
			aux = @head
			@head.next.prev = nil
			@head = @head.next
			@size -= 1
		end
	end

	def pop_tail()
		if(empty)
			puts "Lista vacía"
		else
			aux = @tail
			@tail.prev.next = nil
			@tail = @tail.prev
			@size -= 1
		end
	end

	def empty()
		if(@size == 0)
			return true
		else
			return false
		end
	end

end