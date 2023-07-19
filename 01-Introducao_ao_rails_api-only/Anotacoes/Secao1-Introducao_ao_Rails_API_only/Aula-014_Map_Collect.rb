## map/Collect


rails c               # Abrir o console
x = [1,2,3,4,5]       # Cria um array
x.class               # ver a class de x
x.map {|i| i*3}       # gera um novo array no caso multiplicado casa item por 3
x.collect {|i| i*3}   # gera um novo array no caso multiplicado casa item por 3
y = x.map {|i| i*3}   # salvado na variavel y o array gerado pelo map

x.collect! {|i| i*3}  # A Exclamação no comando forca alterar a variavel x com o valor doa array gerado


x.each {|i| puts i*3}      # Apenas faz o calculo