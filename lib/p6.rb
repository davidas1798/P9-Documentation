require "p6/version"

module P6
  class Alimento
  	attr_accessor :nombre_, :proteinas_, :carbo_, :lipidos_ :emision_, :terreno_

  	def initialize(nombre, proteinas, carbo, lipidos, emision, terreno)
  		nombre_ = nombre
  		proteinas_ = proteinas
  		carbo_ = carbo
  		lipidos_ = lipidos
  		emision_ = emision
  		terreno_ = terreno
  	end

  	def nombre
  		@nombre_
  	end

  	def proteinas
  		@proteinas_
  	end

  	def carbo
  		@carbo_
  	end

  	def lipidos
  		@lipidos_
  	end

  	def emision
  		@emision_
  	end

  	def terreno
  		@terreno_
  	end

  	def calorias
  		@carbo_*4 + @lipidos_*9 + @proteinas_*4
  	end

  	def formateo
  		print "Alimento: #{@nombre_}\n"
  		print "\tProteinas: #{@proteinas_}\n"
  		print "\tCarbohidratos: #{@carbo_}\n"
  		print "\tLipidos: #{@lipidos_}\n"
  		print "\tEmisión de gases: #{@emision_}\n"
  		print "\tTerreno utilizado: #{@terreno_}\n\n"
  	end

end
