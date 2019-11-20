Node = Struct.new(:value, :next, :prev)

class List
	attr_accessor :size, :head, :tail

	def initialize()
		@size = 0
		@head = nil
		@tail = nil
	end

	def push(item)
		if(size == 0)
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
		if(size == 0)
			@head = item
			item.prev = nil
		else
			tail.next = item
			item.prev = @tail
		end

		@tail = item
		item.next = nil
		@size += 1
	end

	def insert_many(array)
		array.each do |item|
			n = Node.new(item,nil,nil)
			@tail.next = n
			n.prev = @tail
			@tail = n
		end
	end


	def pop_head()
		if(@size == 0)
			puts "Lista vacía"
		else
			aux = @head
			@head.next.prev = nil
			@head = @head.next
			@size -= 1
			return aux 
		end
	end

	def pop_tail()
		if(@size == 0)
			puts "Lista vacía"
		else
			aux = @tail
			@tail.prev.next = nil
			@tail = @tail.prev
			@size -= 1
			return aux
		end
	end

end