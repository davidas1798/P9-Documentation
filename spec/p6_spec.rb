RSpec.describe P6 do

	it "has a version number" do
		expect(P6::VERSION).not_to be nil
	end
	
	before(:each) do
		@alimento1 = Alimento.new("Chocolate", 5.3, 47, 30, 2.3, 3.4)
		@alimento2 = Alimento.new("Tofu", 8, 1.9, 4.8, 2.0, 2.2)
		@alimento3 = Alimento.new("Pollo", 20.6, 0, 5.6, 5.7, 7.1)
	end

	it "Debe existir un metodo para obtener el nombre para el alimento" do
		expect(@alimento1.nombre_).to eq("Chocolate")
		expect(@alimento2.nombre_).to eq("Tofu")
		expect(@alimento3.nombre_).to eq("Pollo")
	end

	it "Debe existir un metodo para obtener la cantidad de emision de gases del efecto invernadero en kgCO2eq" do
		expect(@alimento1.obtener_gei).to eq(2.3)
		expect(@alimento2.obtener_gei).to eq(2.0)
		expect(@alimento3.obtener_gei).to eq(5.7)
	end

	it "Debe existir un metodo para obtener la cantidad de terreno en m2" do
		expect(@alimento1.obtener_terreno).to eq(3.4)
		expect(@alimento2.obtener_terreno).to eq(2.2)
		expect(@alimento3.obtener_terreno).to eq(7.1)	
	end

	it "Debe existir un metodo para obtener el valor energetico" do
		expect(@alimento1.obtener_ValorEnergetico).to eq(479.2)
		expect(@alimento2.obtener_ValorEnergetico).to eq(82.8)
		expect(@alimento3.obtener_ValorEnergetico).to eq(132.8)
	end

	it "Debe calcular corectamente el imparto ambiental de un hombre/mujer de 20-39 años" do
	#	expect(impacto_ambiental("hombre")).to eq()
	#	expect(impacto_ambiental("mujer")).to eq()
	end

	it "Debe existir un metodo para formatear el alimento" do
		@alimento1.formatear
		@alimento2.formatear
		@alimento3.formatear
	end
	
	it "Comprobacion de que se formateo el alimento" do
	#	expect(@alimento1.obtener_nombre).to eq(nil)
	end

end
