Node = Struct.new(:value, :next, :prev)

class List
	include Enumerable

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

	def each()					# esto me lo estoy medio inventando
		puntero = @head
		while(puntero != nil)
			yield puntero.value
			puntero = head.next
		end
	end

	def [](i)
		if i.is_a?Integer
			if i == 0
				return @head.value
			elsif i == (@size - 1)
				return @tail.value
			elsif i < @size - 1 && i > 0
				puntero = @head
				i.times{puntero = puntero.next}
				return puntero.value
			else 
				return nil
			end
		end
	end

	def to_s
		nodo = @head
		cadena =""
		while (nodo != nil)
			cadena =cadena + nodo.value.to_s
			nodo = nodo.next
		end
		return cadena
	end

end