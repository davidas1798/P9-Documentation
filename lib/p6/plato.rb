require './lib/p6/plato.rb'

class Plato_i
	include Comparable
	include Enumerable 

	attr_accessor :nombre_, :alimentos_, :peso_

	def initialize(string, alimentos, peso)
		@nombre_ = string
		@alimentos_ = List.new
		@peso_ = List.new
		@alimentos_.insert_many(alimentos)
		@peso_.insert_many(peso)
	end

	def porc_proteinas
		total_prot = 0
		total_macro = 0

		@alimentos_.size.times do |i|
			total_prot += proteinas(i)
			total_macro += proteinas(i) + carbo(i) + lipidos(i)
		end

		return (total_prot / total_macro) * 100
	end

	def porc_carbo
		total_carb = 0
		total_macro = 0

		@alimentos_.size.times do |i|
			total_carb += carbo(i)
			total_macro += proteinas(i) + carbo(i) + lipidos(i)
		end

		return (total_carb / total_macro) * 100
	end

	def porc_lipidos
		total_lipidos = 0
		total_macro = 0

		@alimentos_.size.times do |i|
			total_lipidos += lipidos(i)
			total_macro += proteinas(i) + carbo(i) + lipidos(i)
		end

		return (total_lipidos / total_macro) * 100
	end

	def vct
		total = 0
		puntero = @alimentos_.head
		while(puntero != nil)
			total += puntero.value.calorias
			puntero = puntero.next
		end

		return total
	end

	def proteinas(i)
		return (peso_[i] * alimentos_[i].proteinas_) / 100
	end

	def carbo(i)
		return (peso_[i] * alimentos_[i].carbo_) / 100
	end

	def lipidos(i)
		return (peso_[i] * alimentos_[i].lipidos_) / 100
	end

	def calorias(i)
		return (peso_[i] * alimentos[i].calorias) / 100
	end

	def <=>(other)
		vct <=> other.vct
	end

end

class Plato < Plato_i
	include Comparable

	attr_accessor :emision_, :terreno_

	def initalize(string, alimentos, peso)
		super(string, alimentos, peso)
		@emision_ = emision_total
		@terreno_ = terreno_total
	end

	def emision_total
		total = 0

		@alimentos_.size.times do |i|
			total += emision(i)
		end

		return total
	end

	def terreno_total
		total = 0

		@alimentos_.size.times do |i|
			total += terreno(i)
		end

		return total
	end

	def emision(i)
		return (peso_[i] * alimentos_[i].emision_) / 100
	end

	def terreno(i)
		return (peso_[i] * alimentos_[i].terreno_) / 100
	end

	def impacto
		return emision_ + terreno_
	end

	def <=>(other)
		emision_total <=> other.emision_total
	end
end


