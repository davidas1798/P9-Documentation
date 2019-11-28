require './lib/p6/alimento.rb'
require './lib/p6/list.rb'
require './lib/p6/plato.rb'
RSpec.describe P6 do

	it "has a version number" do
		expect(P6::VERSION).not_to be nil
	end
	
	before(:each) do
		@chocolate = Alimento.new("Chocolate", 5.3, 47, 30, 2.3, 3.4)
		@tofu = Alimento.new("Tofu", 8, 1.9, 4.8, 2.0, 2.2)
		@pollo = Alimento.new("Pollo", 20.6, 0, 5.6, 5.7, 7.1)
		@salmon = Alimento.new("Salmon", 19.9, 0, 13.6, 6, 3.7)
		@huevos = Alimento.new("Huevos", 13, 1.1, 11, 4.2, 5.7)
	    @lentejas = Alimento.new("Lentejas", 23.5, 52, 1.4, 0.4, 3.4)

		@comida_mujer = [@salmon, @tofu, @chocolate, @tofu]
		@comida_hombre = [@chocolate, @huevos, @lentejas]

		def impacto(menu)
			impac_terreno = 0
			impac_emision = 0
			menu.each{| alimento |
				impac_terreno+=alimento.terreno_
				impac_emision+=alimento.emision_
			}
			
			[impac_terreno.round(2), impac_emision.round(2)]
		end

		def emision_dieta(lista)
			total = 0
			puntero = lista.head
			while(puntero != nil)
				total += puntero.value.emision_
				puntero = puntero.next
			end
			
			return total
		end

		def emision_dieta_año(lista)
			return emision_dieta(lista) * 365
		end

		def terreno_dieta(lista)
			total = 0
			puntero = lista.head
			while(puntero != nil)
				total += puntero.value.terreno_
				puntero = puntero.next
			end
			
			return total
		end

	end

	describe "Alimento" do

		it "Existe un metodo para obtener el nombre para el alimento" do
			expect(@chocolate.nombre_).to eq("Chocolate")
			expect(@tofu.nombre_).to eq("Tofu")
			expect(@pollo.nombre_).to eq("Pollo")
		end

		it "Existe un metodo para obtener la cantidad de emision de gases del efecto invernadero en kgCO2eq" do
			expect(@chocolate.emision_).to eq(2.3)
			expect(@tofu.emision_).to eq(2.0)
			expect(@pollo.emision_).to eq(5.7)
		end

		it "Existe un metodo para obtener la cantidad de terreno en m2" do
			expect(@chocolate.terreno_).to eq(3.4)
			expect(@tofu.terreno_).to eq(2.2)
			expect(@pollo.terreno_).to eq(7.1)	
		end

		it "Existe un metodo para obtener el valor energetico" do
			expect(@chocolate.calorias).to eq(479.2)
			expect(@tofu.calorias).to eq(82.8)
			expect(@pollo.calorias).to eq(132.8)
		end

		it "Existe un metodo para calcular el impacto ambiental de un hombre/mujer de 20-39 años" do	
			expect(impacto(@comida_mujer)).to eq([11.5, 12.3])
			expect(impacto(@comida_hombre)).to eq([12.5, 6.9])
		end

		it "Existe un metodo para formatear el alimento" do
			expect(@chocolate.to_s).to eq("#{@chocolate}")
			expect(@tofu.to_s).to eq("#{@tofu}")
			expect(@pollo.to_s).to eq("#{@pollo}")

		end

		context "Comparable" do
			it "Probando el método comparable" do
				expect(@chocolate > @tofu).to be(true)
				expect(@pollo < @chocolate).to be(true)
				expect(@chocolate >= @tofu).to be(true)
				expect(@pollo <= @chocolate).to be(true)
				expect(@chocolate == @chocolate).to be(true)
				expect(@pollo.between?(@tofu, @chocolate)).to be(true)
			end
		end
	end

	describe "Lista" do

		before (:each) do
			@lista = List.new
			@lista.insert_many(@comida_mujer)
			@lista_vacia = List.new
		end
	
		it "Debe existir un nodo de la lista con sus datos, su siguiente y su previo" do
			expect(@lista.head.value).to eq(@salmon)
			expect(@lista.head.prev).to eq(nil)
			expect(@lista.head.next.value).to eq(@tofu)
		end

		it "Debe existir una lista con su cabeza y su cola" do
			expect(@lista.head.value).to eq(@salmon)
			expect(@lista.tail.value).to eq(@tofu)
		end

		it "Se puede insertar un elemento en la lista" do
			expect(@lista_vacia.head).to eq(nil)
			@lista_vacia.insert(@pollo)
			expect(@lista_vacia.head.value).to eq(@pollo)
		end

		it "Se pueden insertar varios elementos en la lista" do
			expect(@lista_vacia.head).to eq(nil)
			@lista_vacia.insert_many(@comida_mujer)
			expect(@lista.head.value).to eq(@salmon)
			expect(@lista.tail.value).to eq(@tofu)
		end

		it "Se extrae el primer elemento de la lista" do
			expect(@lista.head.value).to eq(@salmon)
			@lista.pop_head
			expect(@lista.head.value).to eq(@tofu)
		end

		it "Se extrae el último elemento de la lista" do
			expect(@lista.tail.value).to eq(@tofu)
			@lista.pop_tail
			expect(@lista.tail.value).to eq(@chocolate)
		end

		it "Emision de gases de efecto invernadero" do
			expect(emision_dieta(@lista)).to eq(12.3)
		end

		it "Emision de gases de efecto invernadero anual" do
			expect(emision_dieta_año(@lista)).to eq(4489.5)
		end

		it "Uso de terreno por m2" do
			expect(terreno_dieta(@lista)).to eq(11.5)
		end

		context "Enumerable" do
			
		end

	end

	describe "Plato_i" do

		before (:each) do
			@plato_mujer = Plato_i.new("Salmon con tofu", @comida_mujer, [25,10,10,15])
			@plato_mujer_completo = Plato.new("Salmon con tofu", @comida_mujer, [25,10,10,15])
		end

		it "Obteniendo el nombre de un plato" do
			expect(@plato_mujer.nombre_).to eq("Salmon con tofu")
		end

		it "Existe un conjunto de alimentos" do
			expect(@plato_mujer.alimentos_.head).not_to be nil
			expect(@plato_mujer.alimentos_.tail).not_to be nil
		end

		it "Existe un conjunto de cantidades de alimentos en gramos" do
			expect(@plato_mujer.peso_.head).not_to be nil
			expect(@plato_mujer.peso_.tail).not_to be nil
		end

		it "Porcentaje de proteínas del conjunto de alimentos" do
			expect(@plato_mujer.porc_proteinas).to eq(35.01076426264801)
		end

		it "Porcentaje de hidratos de carbono del conjunto de alimentos" do
			expect(@plato_mujer.porc_carbo).to eq(24.085037674919274)
		end

		it "Porcentaje de lípidos del conjunto de alimentos" do
			expect(@plato_mujer.porc_lipidos).to eq(40.90419806243272)
		end

		it "Valor calórico total del conjunto de alimentos" do
			expect(@plato_mujer.vct).to eq(846.8)
		end

		it "Valor total de las emisiones diarias de gases de efecto invernadero" do
			expect(@plato_mujer_completo.emision_total).to eq(1.73)
		end

		it "Estimación de los metros cuadrados de uso de terreno" do
			expect(@plato_mujer_completo.terreno_total).to eq(1.8150000000000002)
		end

		it "Comprobando la clase del objeto" do
			expect(@plato_mujer.class).to eq(Plato_i)
		end

		it "Comprobando jerarquía" do
			expect(@plato_mujer.instance_of?Plato_i).to eq(true)
			expect(@plato_mujer.is_a?Plato_i).to eq(true)
			expect(@plato_mujer.is_a?Object).to eq(true)
			expect(@plato_mujer.is_a?BasicObject).to eq(true)
		end

		it "Comprobando tipo de objeto" do
            expect(@plato_mujer.kind_of?Plato_i).to eq(true)
            expect(@plato_mujer.kind_of?Object).to eq(true)
            expect(@plato_mujer.kind_of?BasicObject).to eq(true)
        end

        
        	

	end


end

