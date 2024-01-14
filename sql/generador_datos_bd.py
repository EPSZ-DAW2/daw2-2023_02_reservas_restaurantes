from faker import Faker
import random

fake = Faker()

def generar_datos(fichero='data.sql'):
    
    # abrimos el fichero
    with open(fichero, 'w', encoding='utf-8') as file:
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `usuarios`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `foto_perfil_usuario`, `notas`) VALUES\n")

        for i in range(1, 32 + 1):
            nombre_usuario = fake.user_name()
            email = fake.email()
            password = fake.password()
            foto_perfil_usuario = "NULL"
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_usuario}', '{email}', '{password}', {foto_perfil_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 32:
                file.write(",\n")
            else:
                file.write(";\n")
            
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `administradores`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `administradores` (`ref_administrador`, `id_usuario`, `notas`) VALUES\n")

        for i in range(1, 2 + 1):
            ref_administrador = f"ADM{i:07d}" 
            id_usuario = i
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"('{ref_administrador}', {id_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 2:
                file.write(",\n")
            else:
                file.write(";\n")
            
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `gestores`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `gestores` (`ref_gestor`, `es_propietario`, `id_usuario`, `notas`) VALUES\n")


        for i in range(1, 10 + 1):
            ref_gestor = f"GES{i:07d}"
            es_propietario = random.choice([0, 1])  # 0 para solo gestor, 1 para propietario
            id_usuario = i+2
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"('{ref_gestor}', {es_propietario}, {id_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `moderadores`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `moderadores` (`ref_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ref_moderador = f"MOD{i:07d}"
            ciudad_moderador = fake.city()
            comunidad_autonoma_moderador = fake.state()
            id_usuario = i+12
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"('{ref_moderador}', '{ciudad_moderador}', '{comunidad_autonoma_moderador}', {id_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `clientes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `clientes` (`ref_cliente`, `id_usuario`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ref_cliente = f"CLI{i:07d}"
            id_usuario = i+22
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"('{ref_cliente}', {id_usuario}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `categorias`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            nombre_categoria = f"Categoria{i}"
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_categoria}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `subcategorias`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `subcategorias` (`id_subcategoria`, `id_categoria`, `notas`) VALUES\n")

        for i in range(6, 10 + 1):
            id_categoria = fake.random_int(min=1, max=6)
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_categoria}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
                
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `tipos_comida`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `tipos_comida` (`id_tipo_comida`, `nombre_tipo`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            nombre_tipo = f"Tipo{i}"
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_tipo}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `subtipos_comida`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `subtipos_comida` (`id_subtipo_comida`, `id_tipo_comida`, `notas`) VALUES\n")

        for i in range(6, 10 + 1):
            id_tipo_comida = fake.random_int(min=1, max=6)
            notas = "NULL" 

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_tipo_comida}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `restaurantes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `foto_perfil_restaurante`, `carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            nombre_restaurante = f"Restaurante{i}"
            foto_perfil_restaurante = f"ruta_foto_perfil_{i}.jpg"
            carta = f"ruta_carta_{i}.jpg"
            calle_restaurante = fake.street_name()
            barrio_restaurante = "NULL"
            ciudad_restaurante = fake.city()
            comunidad_autonoma_restaurante = fake.state()
            precio_medio_comensal = round(fake.random.uniform(10, 100), 2) if i % 2 == 0 else "NULL"
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_restaurante}', '{foto_perfil_restaurante}', '{carta}', '{calle_restaurante}', {barrio_restaurante}, '{ciudad_restaurante}', '{comunidad_autonoma_restaurante}', {precio_medio_comensal}, {notas})"
           
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
        file.write("-- Volcado de datos para la tabla `imagenes_restaurantes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `imagenes_restaurantes` (`id_imagen_restaurante`, `ruta_imagen_restaurante`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ruta_imagen_restaurante = f"ruta_imagen_{i}.jpg"
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{ruta_imagen_restaurante}', {id_restaurante}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `eventos`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            titulo_evento = f"Evento {i}"
            descripcion_evento = fake.text(max_nb_chars=500)
            fecha_evento = fake.date_between(start_date='-30d', end_date='today')
            imagen_promocional = f"ruta_imagen_promocional_{i}.jpg"
            incidencia_evento = fake.random_int(min=0, max=2)  if i % 2 == 0 else "NULL"
            id_restaurante = fake.random_int(min=1, max=10) 
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{titulo_evento}', '{descripcion_evento}', '{fecha_evento}', '{imagen_promocional}', {incidencia_evento}, {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `reseñas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `reseñas` (`id_reseña`, `titulo_reseña`, `cuerpo_reseña`, `puntuacion`, `precio_x_persona`, `incidencia_reseña`, `fecha_reseña`, `ref_cliente`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            titulo_reseña = f"Reseña {i}"
            cuerpo_reseña = fake.text(max_nb_chars=500)
            puntuacion = fake.random_int(min=0, max=5)
            precio_x_persona = round(fake.random.uniform(10, 100), 2) if i % 2 == 0 else "NULL"
            incidencia_reseña = fake.random_int(min=0, max=2)  if i % 2 == 0 else "NULL"
            fecha_reseña = fake.date_between(start_date='-30d', end_date='today') 
            ref_cliente = f"CLI{i:07d}"
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{titulo_reseña}', '{cuerpo_reseña}', {puntuacion}, {precio_x_persona}, {incidencia_reseña}, '{fecha_reseña}', '{ref_cliente}', {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `imagenes_reseñas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `imagenes_reseñas` (`id_imagen_reseña`, `ruta_imagen_reseña`, `id_reseña`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ruta_imagen_reseña = f"ruta_imagen_{i}.jpg"
            id_reseña = fake.random_int(min=1, max=10) 
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{ruta_imagen_reseña}', {id_reseña}, {notas})"
           
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `respuestas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `respuestas` (`id_respuesta`, `texto_respuesta`, `incidencia_respuesta`, `id_reseña`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            texto_respuesta = fake.text(max_nb_chars=200)
            incidencia_respuesta = fake.random_int(min=0, max=2)  if i % 2 == 0 else "NULL"
            id_reseña = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{texto_respuesta}', {incidencia_respuesta}, {id_reseña}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `subrespuestas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `subrespuestas` (`id_subrespuesta`, `id_respuesta`, `notas`) VALUES\n")

        for i in range(6, 10 + 1):
            id_respuesta = fake.random_int(min=1, max=6)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, {id_respuesta}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `favoritos`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `favoritos` (`ref_cliente`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ref_cliente = f"CLI{i:07d}"
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"('{ref_cliente}', {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `reservas`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `ref_cliente`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            datos_pago = f"Tarjeta {fake.credit_card_number()}"
            num_comensales = fake.random_int(min=1, max=10)
            fecha_reserva = fake.date_between(start_date='today', end_date='+30d')
            ref_cliente = f"CLI{i:07d}"
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{datos_pago}', {num_comensales}, '{fecha_reserva}', '{ref_cliente}', {id_restaurante}, {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
        
        
        file.write("-- --------------------------------------------------------\n")
        file.write("-- Volcado de datos para la tabla `control_restaurantes`\n")
        file.write("-- --------------------------------------------------------\n")
        file.write("INSERT INTO `control_restaurantes` (`ref_gestor`, `id_restaurante`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            ref_gestor = f"GES{i:07d}"
            id_restaurante = fake.random_int(min=1, max=10)
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"('{ref_gestor}', {id_restaurante}, {notas})"
            
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
        file.write("INSERT INTO `configuraciones` (`id_variable`, `nombre_variable`, `valor_variable`, `notas`) VALUES\n")

        for i in range(1, 10 + 1):
            nombre_variable = fake.word()
            valor_variable = fake.word()
            notas = "NULL"

            # Crear una cadena SQL de inserción
            insert_query = f"({i}, '{nombre_variable}', '{valor_variable}', {notas})"
            
            file.write(insert_query)
            
            if i < 10:
                file.write(",\n")
            else:
                file.write(";\n")
                
                
                
                

def main():
    generar_datos()

if __name__ == "__main__":
    main()
