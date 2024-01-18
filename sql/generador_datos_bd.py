from faker import Faker
import random

fake = Faker()

def generar_datos(fichero='datos_generados_BD.sql'):
    
    # abrimos el fichero
    with open(fichero, 'w', encoding='utf-8') as file:
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `imagenes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `imagenes` (`id_imagen`, `descripcion`, `notas`) VALUES\n")

        for i in range(1, 50 + 1):
            descripcion = "NULL"
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {descripcion}, {notas})"
           
            file.write(insert_query)
            
            if i < 50:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `usuarios`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `id_foto_usuario`, `es_gestor_propietario`, `notas`) VALUES\n")

        for i in range(1, 31 + 1):
            #PARA CLIENTES DE PRUEBA
            if i<=10:
                nombre_usuario = f"cliente{i}"
                email = f"cliente{i}@prueba.com"
                password = "cliente"
                es_gestor_propietario = "NULL"
            #PARA PROPIETARIOS DE PRUEBA
            elif i>10 and i<=15:
                nombre_usuario = f"propietario{i-10}"
                email = f"propietario{i-10}@prueba.com"
                password = "propietario"
                es_gestor_propietario = 1
            #PARA GESTORES DE PRUEBA
            elif i>15 and i<=20:
                nombre_usuario = f"gestor{i-15}"
                email = f"gestor{i-15}@prueba.com"
                password = "gestor"
                es_gestor_propietario = 0
            #PARA MODERADORES DE PRUEBA
            elif i>20 and i<=30:
                nombre_usuario = f"moderador{i-20}"
                email = f"moderador{i-20}@prueba.com"
                password = "moderador"
                es_gestor_propietario = "NULL"
            # PARA EL ADMIN DE PRUEBA
            else:
                nombre_usuario = f"administrador{i-30}"
                email = f"administrador{i-30}@prueba.com"
                password = "administrador"
                es_gestor_propietario = "NULL"
            id_foto_usuario = "NULL"
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_usuario}', '{email}', '{password}', {id_foto_usuario}, {es_gestor_propietario}, {notas})"
            
            file.write(insert_query)
            
            if i < 31:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `moderadores`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `moderadores` (`id_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ciudad_moderador = fake.city()
            comunidad_autonoma_moderador = fake.state()
            id_usuario = i+20
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{ciudad_moderador}', '{comunidad_autonoma_moderador}', {id_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `categorias`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `categorias` (`id_categoria`, `id_categoria_padre`, `nombre_categoria`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            if i<=6:
                id_categoria_padre = "NULL"
            else:
                id_categoria_padre = fake.random_int(min=1, max=3)
            nombre_categoria = f"Categoria{i}"
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_categoria_padre}, '{nombre_categoria}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
                
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `tipos_comida`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `tipos_comida` (`id_tipo_comida`, `id_tipo_padre`, `nombre_tipo`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            if i<=6:
                id_tipo_padre = "NULL"
            else:
                id_tipo_padre = fake.random_int(min=1, max=3)
            nombre_tipo = f"Tipo{i}"
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_tipo_padre}, '{nombre_tipo}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `restaurantes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            nombre_restaurante = f"Restaurante{i}"
            id_foto_restaurante = i
            id_carta = i+10
            calle_restaurante = fake.street_name()
            barrio_restaurante = "NULL"
            ciudad_restaurante = fake.city()
            comunidad_autonoma_restaurante = fake.state()
            precio_medio_comensal = round(fake.random.uniform(10, 100), 2) if i % 2 == 0 else "NULL"
            id_propietario = fake.random_int(min=11, max=15)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_restaurante}', {id_foto_restaurante}, {id_carta}, '{calle_restaurante}', {barrio_restaurante}, '{ciudad_restaurante}', '{comunidad_autonoma_restaurante}', {precio_medio_comensal}, {id_propietario}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
                
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `categoria_restaurante`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_categoria = fake.random_int(min=1, max=10)
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({id_categoria}, {id_restaurante}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `tipo_restaurante`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_tipo_comida = fake.random_int(min=1, max=10)
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({id_tipo_comida}, {id_restaurante}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `eventos`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            titulo_evento = f"Evento {i}"
            descripcion_evento = fake.text(max_nb_chars=500)
            fecha_evento = fake.date_between(start_date='-30d', end_date='today')
            id_imagen_promocional = i+20
            incidencia_evento = fake.random_int(min=0, max=2)  if i % 2 == 0 else "NULL"
            id_restaurante = fake.random_int(min=1, max=10) 
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{titulo_evento}', '{descripcion_evento}', '{fecha_evento}', {id_imagen_promocional}, {incidencia_evento}, {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `resenas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_usuario`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            titulo_reseña = f"Reseña {i}"
            cuerpo_reseña = fake.text(max_nb_chars=500)
            puntuacion = fake.random_int(min=0, max=5)
            precio_x_persona = round(fake.random.uniform(10, 100), 2) if i % 2 == 0 else "NULL"
            incidencia_reseña = fake.random_int(min=0, max=2)  if i % 2 == 0 else "NULL"
            fecha_reseña = fake.date_between(start_date='-30d', end_date='today') 
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{titulo_reseña}', '{cuerpo_reseña}', {puntuacion}, {precio_x_persona}, {incidencia_reseña}, '{fecha_reseña}', {i}, {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
                
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `respuestas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            if i<=6:
                id_respuesta_padre = "NULL"
            else:
                id_respuesta_padre = fake.random_int(min=1, max=3)
            texto_respuesta = fake.text(max_nb_chars=200)
            incidencia_respuesta = fake.random_int(min=0, max=2)  if i % 2 == 0 else "NULL"
            id_reseña = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_respuesta_padre}, '{texto_respuesta}', {incidencia_respuesta}, {id_reseña}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `favoritos`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `favoritos` (`id_usuario`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `reservas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_usuario`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            datos_pago = f"Tarjeta {fake.credit_card_number()}"
            num_comensales = fake.random_int(min=1, max=10)
            fecha_reserva = fake.date_between(start_date='today', end_date='+30d')
            hora_reserva = "21:00"
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{datos_pago}', {num_comensales}, '{fecha_reserva}', '{hora_reserva}', {i}, {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `control_restaurantes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `control_restaurantes` (`id_usuario`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i+10}, {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
                
                
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `imagenes_restaurantes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_restaurante = fake.random_int(min=1, max=10)
            id_imagen = i+30
            notas = "NULL"
            
            # Crear una cadena SQL de inserción
            insert_query = f"({id_restaurante}, {id_imagen}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `imagenes_resenas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_reseña = fake.random_int(min=1, max=10)
            id_imagen = i+40
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({id_reseña}, {id_imagen}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `comentarios`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            id_usuario = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")


        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `respuestas_faq`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            pregunta = fake.sentence(nb_words=10, variable_nb_words=True, ext_word_list=None)
            respuesta = fake.sentence(nb_words=20, variable_nb_words=True, ext_word_list=None)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{pregunta}', '{respuesta}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
                
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `logs`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            tipo_log = f"LOG_TIPO {i}"
            texto_log = fake.sentence(nb_words=15, variable_nb_words=True, ext_word_list=None)
            fecha_hora = fake.date_time().strftime('%Y-%m-%d %H:%M:%S')
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{tipo_log}', '{texto_log}', '{fecha_hora}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
          
          
          
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `configuraciones`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            nombre_variable = fake.word()
            valor_variable = fake.word()
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"('{nombre_variable}', '{valor_variable}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
                
                
                
                

def main():
    generar_datos()

if __name__ == "__main__":
    main()
