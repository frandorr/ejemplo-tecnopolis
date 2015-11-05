require 'image_suckr'
# Default url mappings are:
#
# * a controller called Main is mapped on the root of the site: /
# * a controller called Something is mapped on: /something
#
# If you want to override this, add a line like this inside the class:
#
#  map '/otherurl'
#
# this will force the controller to be mounted on: /otherurl.
class MainController < Controller
  # the index action is called automatically when no other action is specified
  def index
    @title = '¡Frontend!'
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Welcome to Ramaze!'

    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end


  def plato_respuesta
    system "clear"

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
     imagen = preparar_plato plato
     @title = plato.partition(" ").first
     return "<img src=#{imagen}>"
   end
   def realizar_pedido plato
     sleep(5.0)
     puts "(Mozo) Los chicos pidieron un #{plato}.
     ¿Lo podés preparar? "
     sleep(4.0)
     system "clear"

   end
   def seleccionar_ingredientes plato
     puts "(Chef) Sí, ya mismo voy a buscar los ingredientes..."
     sleep(4.0)
     system "clear"
     puts "(Chef) Listo, conseguí todo lo necesario para preparar un excelente #{plato}, mi especialidad"
     sleep(4.0)
   end

   def preparar_plato plato

     # busca imagen en google
     puts "
     =========== El chef está preparando el plato ========="
     sleep(5.0)
     system "clear"
     puts "(Chef)- Le agrego un poco de pimienta... un poco de sal"
     sleep(1.0)
     puts "(Chef) mmmm, que buena pinta tiene"
     sleep(2.0)
     puts "(Chef) Y ahora le voy a dar mi gran toque...LISTO"
     sleep(4.0)
     system "clear"
     puts "(Chef) Mozo! Venga a buscar el plato para los chicos!!"
     sleep(4.0)
     system "clear"
     puts "(Mozo) Acá estoy señor Chef, ¡Qué buena pinta que tiene ese #{plato}!"
     sleep(5.0)
     system "clear"

     suckr = ImageSuckr::GoogleSuckr.new
    #  si no hay internet_
    # imagen = suckr.get_image_url({"q" => plato})
    #  case plato
    #   when "Milanga con fritas"
    #     imagen = "images/milanga.jpg"
    #   when "Pollo al curry"
    #     imagen = "images/pollo.jpg"
    #   when "Pizza"
    #     imagen = "images/pizza.jpg"
    #   when "Pancho"
    #     imagen = "images/pancho.jpg"
    #  end

     imagen = suckr.get_image_url({"q" => plato})
     return imagen
   end

end
