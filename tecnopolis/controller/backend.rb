require 'ramaze'
require 'image_suckr'
class MyController < Ramaze::Controller
  map '/'
  helper(:xhtml)
  def index

  end

 def plato_respuesta
   puts "Hola"
   if  request.post?
       plato = request[:plato]
       %| #{hacer_pedido plato}|
      #  redirect rs(:index)
   end
 end

  private
  def hacer_pedido plato
    realizar_pedido plato
    seleccionar_ingredientes plato
    sleep(2.0)
    imagen = preparar_plato plato
    sleep(5.0)
    return "<img src=#{imagen}>"
  end
  def realizar_pedido plato
    puts "(Mozo) Los chicos pidieron un #{plato}.
    ¿Se los podés preparar? "
    sleep(3.0)

  end
  def seleccionar_ingredientes plato
    puts "(Chef) Sí, ya mismo voy a buscar los ingredientes..."
    sleep(4.0)
    puts "(Chef) Listo, conseguí todo lo necesario para preparar un excelente #{plato}, mi especialidad"
    sleep(2.0)
  end

  def preparar_plato plato
    # busca imagen en google
    puts "
    =========== El chef está preparando el plato ========="
    sleep(2.0)
    puts "(Chef)- Le agrego un poco de pimienta... un poco de sal"
    sleep(2.0)
    puts "(Chef) mmmm, que buena pinta tiene"
    sleep(2.0)
    puts "(Chef) Y ahora le voy a dar mi gran toque... el elemento X y listo!"
    sleep(2.0)
    puts "(Chef) Mozo! Venga a buscar el plato para los chicos!!"
    sleep(3.0)
    puts "(Mozo) Acá estoy señor Chef, ¡Qué buena pinta que tiene ese #{plato}!"
    sleep(2.0)

    suckr = ImageSuckr::GoogleSuckr.new
    imagen = suckr.get_image_url({"q" => plato})
    return imagen
  end





end

Ramaze.start
