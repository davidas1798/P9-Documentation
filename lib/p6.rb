require 'p6/version'

  class Alimento
  	attr_accessor :nombre_, :proteinas_, :carbo_, :lipidos_, :emision_, :terreno_

  	def initialize(nombre, proteinas, carbo, lipidos, emision, terreno)
  		@nombre_ = nombre
  		@proteinas_ = proteinas
  		@carbo_ = carbo
  		@lipidos_ = lipidos
  		@emision_ = emision
  		@terreno_ = terreno
  	end

  	def calorias
  		@carbo_*4 + @lipidos_*9 + @proteinas_*4
  	end

  	def formateo
      print "(#{@nombre},#{@proteinas}, #{@carbo}, #{@lipidos}, #{@emision}, #{@terreno})"
  	end
end

