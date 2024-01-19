-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes`
-- --------------------------------------------------------
INSERT INTO `imagenes` (`id_imagen`, `descripcion`, `notas`) VALUES
(1, 'foto de usuario default', NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL),
(8, NULL, NULL),
(9, NULL, NULL),
(10, NULL, NULL),
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, NULL, NULL),
(18, NULL, NULL),
(19, NULL, NULL),
(20, NULL, NULL),
(21, NULL, NULL),
(22, NULL, NULL),
(23, NULL, NULL),
(24, NULL, NULL),
(25, NULL, NULL),
(26, NULL, NULL),
(27, NULL, NULL),
(28, NULL, NULL),
(29, NULL, NULL),
(30, NULL, NULL),
(31, NULL, NULL),
(32, NULL, NULL),
(33, NULL, NULL),
(34, NULL, NULL),
(35, NULL, NULL),
(36, NULL, NULL),
(37, NULL, NULL),
(38, NULL, NULL),
(39, NULL, NULL),
(40, NULL, NULL),
(41, NULL, NULL),
(42, NULL, NULL),
(43, NULL, NULL),
(44, NULL, NULL),
(45, NULL, NULL),
(46, NULL, NULL),
(47, NULL, NULL),
(48, NULL, NULL),
(49, NULL, NULL),
(50, NULL, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `usuarios`
-- --------------------------------------------------------
INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `id_foto_usuario`, `es_gestor_propietario`, `notas`) VALUES
(1, 'cliente1', 'cliente1@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(2, 'cliente2', 'cliente2@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(3, 'cliente3', 'cliente3@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(4, 'cliente4', 'cliente4@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(5, 'cliente5', 'cliente5@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(6, 'cliente6', 'cliente6@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(7, 'cliente7', 'cliente7@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(8, 'cliente8', 'cliente8@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(9, 'cliente9', 'cliente9@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(10, 'cliente10', 'cliente10@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, NULL, NULL),
(11, 'propietario1', 'propietario1@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 1, NULL),
(12, 'propietario2', 'propietario2@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 1, NULL),
(13, 'propietario3', 'propietario3@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 1, NULL),
(14, 'propietario4', 'propietario4@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 1, NULL),
(15, 'propietario5', 'propietario5@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 1, NULL),
(16, 'gestor1', 'gestor1@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 0, NULL),
(17, 'gestor2', 'gestor2@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 0, NULL),
(18, 'gestor3', 'gestor3@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 0, NULL),
(19, 'gestor4', 'gestor4@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 0, NULL),
(20, 'gestor5', 'gestor5@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 0, NULL),
(21, 'moderador1', 'moderador1@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(22, 'moderador2', 'moderador2@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(23, 'moderador3', 'moderador3@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(24, 'moderador4', 'moderador4@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(25, 'moderador5', 'moderador5@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(26, 'moderador6', 'moderador6@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(27, 'moderador7', 'moderador7@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(28, 'moderador8', 'moderador8@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(29, 'moderador9', 'moderador9@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(30, 'moderador10', 'moderador10@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, NULL, NULL),
(31, 'administrador1', 'administrador1@prueba.com', '$2y$13$VcfOxmSbPsYZ0Gy46Vze4.fY3vcd26Q4Fi7.W1eu1oBGqAgNg0QIS', NULL, NULL, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `moderadores`
-- --------------------------------------------------------
INSERT INTO `moderadores` (`id_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES
(1, 'New Kimberlyside', 'Kansas', 21, NULL),
(2, 'Tylermouth', 'Vermont', 22, NULL),
(3, 'Michaelstad', 'Wisconsin', 23, NULL),
(4, 'Samanthabury', 'New Mexico', 24, NULL),
(5, 'New Blake', 'Oregon', 25, NULL),
(6, 'North Matthew', 'Oklahoma', 26, NULL),
(7, 'West Thomas', 'Texas', 27, NULL),
(8, 'Amandamouth', 'Maryland', 28, NULL),
(9, 'Torresmouth', 'Hawaii', 29, NULL),
(10, 'Maureenborough', 'Arkansas', 30, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categorias`
-- --------------------------------------------------------
INSERT INTO `categorias` (`id_categoria`, `id_categoria_padre`, `nombre_categoria`, `notas`) VALUES
(1, NULL, 'Categoria1', NULL),
(2, NULL, 'Categoria2', NULL),
(3, NULL, 'Categoria3', NULL),
(4, NULL, 'Categoria4', NULL),
(5, NULL, 'Categoria5', NULL),
(6, NULL, 'Categoria6', NULL),
(7, 1, 'Categoria7', NULL),
(8, 1, 'Categoria8', NULL),
(9, 1, 'Categoria9', NULL),
(10, 3, 'Categoria10', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `tipos_comida`
-- --------------------------------------------------------
INSERT INTO `tipos_comida` (`id_tipo_comida`, `id_tipo_padre`, `nombre_tipo`, `notas`) VALUES
(1, NULL, 'Tipo1', NULL),
(2, NULL, 'Tipo2', NULL),
(3, NULL, 'Tipo3', NULL),
(4, NULL, 'Tipo4', NULL),
(5, NULL, 'Tipo5', NULL),
(6, NULL, 'Tipo6', NULL),
(7, 2, 'Tipo7', NULL),
(8, 2, 'Tipo8', NULL),
(9, 2, 'Tipo9', NULL),
(10, 2, 'Tipo10', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `restaurantes`
-- --------------------------------------------------------
INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Silva Garden', NULL, 'New Meganview', 'Minnesota', NULL, 13, NULL),
(2, 'Restaurante2', 2, 12, 'Kenneth Vista', NULL, 'Lukestad', 'Washington', 86.65, 14, NULL),
(3, 'Restaurante3', 3, 13, 'Angela Heights', NULL, 'South Jeffrey', 'Colorado', NULL, 13, NULL),
(4, 'Restaurante4', 4, 14, 'Wilson Bridge', NULL, 'Dyerside', 'Wisconsin', 76.92, 13, NULL),
(5, 'Restaurante5', 5, 15, 'Sara Road', NULL, 'North Jenniferport', 'Kentucky', NULL, 13, NULL),
(6, 'Restaurante6', 6, 16, 'Stewart Crossing', NULL, 'Port Meganberg', 'New Hampshire', 99.17, 14, NULL),
(7, 'Restaurante7', 7, 17, 'Gomez Stravenue', NULL, 'North James', 'Rhode Island', NULL, 12, NULL),
(8, 'Restaurante8', 8, 18, 'Lyons Mission', NULL, 'Kyleport', 'Wyoming', 81.19, 14, NULL),
(9, 'Restaurante9', 9, 19, 'Brandy Turnpike', NULL, 'Lorrainefort', 'Washington', NULL, 14, NULL),
(10, 'Restaurante10', 10, 20, 'Alicia Streets', NULL, 'Munozland', 'Colorado', 37.72, 13, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categoria_restaurante`
-- --------------------------------------------------------
INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES
(8, 4, NULL),
(7, 10, NULL),
(7, 2, NULL),
(10, 1, NULL),
(4, 4, NULL),
(9, 5, NULL),
(2, 9, NULL),
(6, 6, NULL),
(6, 7, NULL),
(10, 8, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `tipo_restaurante`
-- --------------------------------------------------------
INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES
(3, 7, NULL),
(5, 1, NULL),
(5, 1, NULL),
(6, 3, NULL),
(8, 1, NULL),
(2, 3, NULL),
(2, 8, NULL),
(4, 1, NULL),
(8, 7, NULL),
(3, 3, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `eventos`
-- --------------------------------------------------------
INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES
(1, 'Evento 1', 'Describe hit thought catch value authority resource.
Yourself contain behavior western quality second couple. Go economic reflect catch page history true.
Force response yet can price major house former. East include finally instead form. Truth truth process treatment.
Consider most government spend field interest. Reason produce receive amount source democratic chance. Authority late push deep.', '2024-01-09', 21, NULL, 2, NULL),
(2, 'Evento 2', 'In style along structure. Mind Mr whole consider onto trouble go resource.
Last image last here bar clearly likely. Administration player I among. International sell test people staff task. Country base low charge evening.
Leave suddenly tax relationship change feeling indeed race. Science return begin view focus dinner short already.
Seek window trouble those. Range set Democrat billion prepare white. Age space listen upon lawyer newspaper popular.', '2023-12-24', 22, 0, 6, NULL),
(3, 'Evento 3', 'My play light purpose outside. Network dark already health.
Like citizen protect sign every number most. Bit arm could television.
Fight deal maintain agree.
Watch it outside party. Sound success night my beautiful environmental physical quite. Poor explain discussion year within.
Case wrong all improve student. Social cut half particularly. Offer weight art camera history job hear.
Practice attorney music by none per save. Bar mind purpose rate.', '2024-01-11', 23, NULL, 5, NULL),
(4, 'Evento 4', 'Next present old until movie million. Natural area you. Pull more central major throw.
Myself behavior sometimes return property unit. Reflect stop mention answer current strong word. Ask political marriage space suggest deal.
Right standard shake building worry. Official visit both run its listen.
Control think both peace interest to. Factor home good product key. Friend continue beyond final.', '2023-12-27', 24, 0, 2, NULL),
(5, 'Evento 5', 'Cover wall newspaper approach few agency project. Rock weight board wife so sister simply own.
Service player from behind compare between past. Leave so upon above ok.
Score you weight high apply person. Yes animal idea. Friend notice despite. Still trial team strong at author.
Vote summer could authority chair election tonight. Very here sure reflect under recent sort.
Each at office. Answer opportunity cultural law interest.
Value think fine. Test choice behavior food wind.', '2024-01-06', 25, NULL, 6, NULL),
(6, 'Evento 6', 'Prevent sort since sell. Product help term most. View become truth traditional consider medical film.
Western hit heart standard. Possible establish what computer.
Natural great receive second ball say glass everyone. Case level inside chair possible significant there.
Use particular million law. Leave pay model. Her can must another.
Item method feel make price. Much accept it account always meeting particular. Project family sport they dog.', '2023-12-26', 26, 0, 9, NULL),
(7, 'Evento 7', 'Today measure number. Feeling management compare whether between force.
Several law worry. Attention involve hospital north. Fast far age care I threat.
Anything like through experience. Care offer not above concern notice drop. Send give physical.
Building clear surface. Individual stay election may.
Name professional field item camera. Figure agency trip share. Old behavior short nearly.
Worry someone ask. Last mean kid way.', '2024-01-04', 27, NULL, 3, NULL),
(8, 'Evento 8', 'Cup evening fear list. Protect sense every tough range board provide team.
Miss yet on. Difference will road some support.
Board sort film whether save. Often again body get prove. Century perhaps fire have.
Operation believe several there culture.
Movement two ask health me. While author service guess which deep assume. Situation she analysis share.
Down door speak range respond. Environment present town. Recognize sister believe national value reveal site among.', '2024-01-03', 28, 0, 10, NULL),
(9, 'Evento 9', 'Strong news let. Morning almost anyone want also.
Civil successful outside. Message huge fish soon truth cut government understand. Stay task eight several difference participant girl.
Own mind might reflect consumer lead clearly. Contain interview result clearly ok soon material. Protect society reflect religious morning employee win off.
Theory set event much rise.
Cup way they. Very president child task painting.', '2023-12-29', 29, NULL, 2, NULL),
(10, 'Evento 10', 'Outside population system line attention small reason teach. Individual still describe even. Even impact improve. Work believe cut sell crime theory respond.
Animal hospital ability anything fish. Young knowledge recent national. Tend whole leave war agency onto.
Less certainly person sea certainly. Center front much adult market the dark. Environment guess magazine moment those already and her. Range likely carry at early.', '2024-01-11', 30, 0, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `resenas`
-- --------------------------------------------------------
INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Reseña 1', 'Also today bit west free hand. Drop but table stock return learn board direction. Happen learn relate each.
Room beat control prevent Mr sister. Body give though enough speak.
Pass everything learn executive this majority. Staff carry choose college soon never.
Husband know discussion civil simply assume various pick. Team cause raise opportunity subject.
History hour phone meet new rather. Other fact million why. Catch and series expert wide.', 2, NULL, NULL, '2024-01-18', 1, 2, NULL),
(2, 'Reseña 2', 'Down down dark measure. Despite security majority medical particular ground.
Actually generation meeting person still. Management above writer move contain information send. Wrong society couple.
New what my teach single. Up anything rise trouble information letter want. Under involve letter.
Far close party phone government real agreement least. Series station smile successful identify. Region method tax behavior.
Lot all know development each. Project space wife capital maybe hair since.', 3, 55.49, 0, '2024-01-10', 2, 8, NULL),
(3, 'Reseña 3', 'Budget surface guy data movie forget truth. From fine fire thus wife last bar.
Each box analysis attack beyond. Organization democratic minute parent whom health.
Discuss provide challenge worry heavy as. Responsibility we quite marriage today friend. Leg writer news direction industry somebody. Heavy affect wear perform I.
Off look peace know task everything. Down fear TV building point executive rich. Exist through western try president role record.', 3, NULL, NULL, '2023-12-24', 3, 3, NULL),
(4, 'Reseña 4', 'Effect place strategy parent system enough. Point can individual explain heart catch trouble.
Home about as could. Agreement throughout inside suddenly. Process throughout skin than reason employee.
Enough section despite ask director read represent. Move artist person game traditional car.
Quickly within section. Record age action option technology. Wrong account among truth pass decide.
Interest only reach wife. Quite story determine personal. Indeed strategy part well six guy common build.', 2, 24.56, 2, '2023-12-21', 4, 6, NULL),
(5, 'Reseña 5', 'Kind dark decide else. Feel fly character need talk time summer store. Long improve know thus how place you.
Senior perform for after none see learn. Attorney go eight.
Someone continue this so watch enter. Anything pattern really professor. Yard information region agreement offer people cut sometimes. Everybody every best maintain road lay.
Hundred later unit book floor. Decade clear political among response system century.', 1, NULL, NULL, '2023-12-28', 5, 3, NULL),
(6, 'Reseña 6', 'Bring me line eye attention thank success. Bad student enough rich woman technology sort book.
Form know language especially which. Page somebody hundred pass make must.
Eat leg gas what each commercial. Still reflect effect impact similar company.
Player way sport top address which positive.
Whatever machine test next myself individual. Entire occur analysis bag she movie improve.
Speech successful least actually likely material. Change relate since.', 2, 66.17, 0, '2024-01-03', 6, 2, NULL),
(7, 'Reseña 7', 'Stuff summer magazine ago million range street. Stop religious ten hold of.
Away gun enough she between responsibility. Wish single past safe any.
Ago herself program leg bar fill.
Religious foot pick win indicate act. Nice reach hot standard. Themselves determine develop adult pick source.
Oil situation sign consumer. Somebody quality only newspaper serve war.
Compare just various account space. Next dark different long imagine. Serious pick bit agreement.', 1, NULL, NULL, '2023-12-24', 7, 5, NULL),
(8, 'Reseña 8', 'Risk across yet poor. Size church feeling age state offer born.
Education thousand own training dark appear defense. Time but song wear media.
Bag garden above chair thank. Industry support figure could major task item. Letter physical available trade assume along son.
Woman thank simple. Treat draw mother response suggest.
Morning military huge approach move. Market finish no training old send.
Three difficult outside guy want my. Audience fish similar thought raise adult.', 4, 28.12, 1, '2023-12-22', 8, 10, NULL),
(9, 'Reseña 9', 'Soldier future mother they lay open. Take beautiful have believe source teach scientist.
Activity push sign out each actually bit black. Even phone story story report note. Subject past theory why.
Recently woman toward pretty something item. Result different top sometimes control especially street.
Decide production yourself care service. Get peace nice piece friend strong. Many four several offer growth.
Idea receive determine blood. Picture career tree.', 3, NULL, NULL, '2023-12-29', 9, 5, NULL),
(10, 'Reseña 10', 'Western page side everybody word. It successful top task hundred window by.
Material give main involve show. History have animal claim identify itself.
Impact agree story audience plant college. Data measure investment former. Take poor big challenge trip this nor.
Perhaps majority whom consumer Republican follow community. Call not recognize difference too.
Kitchen great since century indeed choice civil. Baby here there half carry parent. Loss window establish man only.', 5, 99.39, 1, '2024-01-12', 10, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas`
-- --------------------------------------------------------
INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES
(1, NULL, 'Floor before effect analysis western success stand hair. Never two drug where free.
Officer black budget add that between. Whatever and husband budget probably value require.', NULL, 9, NULL),
(2, NULL, 'Something teacher share amount ball certain. Entire message cup wife.
Candidate strategy less space everyone. Full actually official wall resource collection. Now down theory drive positive.', 1, 9, NULL),
(3, NULL, 'Exist prevent author. True win situation investment experience movement.
Tend impact need off. Purpose answer window.', NULL, 3, NULL),
(4, NULL, 'Agency two nature animal. Whom minute health game. Trial hour administration section trip.
Author whose campaign last doctor him simple. Cultural whole tell. Smile life woman watch field.', 2, 1, NULL),
(5, NULL, 'Task might economy experience road sport.
Hope require buy yard nice. During marriage operation full keep.', NULL, 7, NULL),
(6, NULL, 'Performance rate continue on woman mean arm this. Mention father feeling pattern Republican. Skin before entire whose.
Spend dark stop full international. Force book strategy reduce.', 1, 10, NULL),
(7, 2, 'Eight seem something technology decide red. Option before which network state. Role commercial recently hard food.', NULL, 6, NULL),
(8, 1, 'Evidence short close citizen Congress approach. Artist condition of data individual the dog.
Suddenly admit final avoid away. Performance certain a almost.', 1, 7, NULL),
(9, 1, 'Pass paper effort blood again anyone color. Them season kid we only reduce senior. Around room people health man agent simply raise.', NULL, 7, NULL),
(10, 1, 'Choose once cost front professor southern. Employee available you call and history.', 2, 7, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `favoritos`
-- --------------------------------------------------------
INSERT INTO `favoritos` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 9, NULL),
(2, 6, NULL),
(3, 9, NULL),
(4, 4, NULL),
(5, 7, NULL),
(6, 10, NULL),
(7, 1, NULL),
(8, 6, NULL),
(9, 5, NULL),
(10, 4, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `reservas`
-- --------------------------------------------------------
INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 180092715911193', 7, '2024-02-08', '21:00', 1, 7, NULL),
(2, 'Tarjeta 3591673788237348', 2, '2024-01-25', '21:00', 2, 4, NULL),
(3, 'Tarjeta 345876529904374', 10, '2024-02-10', '21:00', 3, 5, NULL),
(4, 'Tarjeta 676108619559', 4, '2024-01-25', '21:00', 4, 10, NULL),
(5, 'Tarjeta 213158448518232', 8, '2024-02-04', '21:00', 5, 8, NULL),
(6, 'Tarjeta 4939601714899948', 5, '2024-01-23', '21:00', 6, 7, NULL),
(7, 'Tarjeta 4741455296079361704', 6, '2024-02-11', '21:00', 7, 9, NULL),
(8, 'Tarjeta 6579287481085281', 4, '2024-02-15', '21:00', 8, 9, NULL),
(9, 'Tarjeta 38238260153368', 1, '2024-01-21', '21:00', 9, 6, NULL),
(10, 'Tarjeta 4623176642825985', 5, '2024-01-19', '21:00', 10, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `control_restaurantes`
-- --------------------------------------------------------
INSERT INTO `control_restaurantes` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(11, 2, NULL),
(12, 3, NULL),
(13, 2, NULL),
(14, 9, NULL),
(15, 7, NULL),
(16, 8, NULL),
(17, 9, NULL),
(18, 5, NULL),
(19, 1, NULL),
(20, 1, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_restaurantes`
-- --------------------------------------------------------
INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES
(4, 31, NULL),
(7, 32, NULL),
(8, 33, NULL),
(10, 34, NULL),
(3, 35, NULL),
(3, 36, NULL),
(2, 37, NULL),
(8, 38, NULL),
(6, 39, NULL),
(5, 40, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_resenas`
-- --------------------------------------------------------
INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES
(9, 41, NULL),
(6, 42, NULL),
(9, 43, NULL),
(2, 44, NULL),
(2, 45, NULL),
(9, 46, NULL),
(1, 47, NULL),
(10, 48, NULL),
(9, 49, NULL),
(1, 50, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `comentarios`
-- --------------------------------------------------------
INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES
(1, 9, NULL),
(2, 6, NULL),
(3, 8, NULL),
(4, 6, NULL),
(5, 6, NULL),
(6, 9, NULL),
(7, 9, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 9, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas_faq`
-- --------------------------------------------------------
INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES
(1, 'Wear someone fear hard politics serious leave front game manage yeah office.', 'Watch they age face two either large rule value this plan threat science dark degree enter only upon source red poor.', NULL),
(2, 'City partner show wait value security perform hot model paper.', 'Gas time soon drop include though fact avoid blood must individual close doctor million question reality.', NULL),
(3, 'Plant note reach main hundred most general.', 'Stop dinner knowledge would price nor media I growth small audience man focus remain model turn thousand into responsibility likely lead determine none bed.', NULL),
(4, 'Financial chance effect wide authority glass player politics condition.', 'However low worry participant listen statement impact type answer prove natural thank side.', NULL),
(5, 'Card send market child write tax industry he second policy tell.', 'Describe of big let station either attack decide across cut bank defense school common wait analysis doctor clearly back.', NULL),
(6, 'Age big into night result resource better involve three learn improve respond fire.', 'Concern view water partner analysis job people none bed economy PM body.', NULL),
(7, 'Whole understand Congress dream need property voice page break ready.', 'Me result easy court finish message guess sense interesting democratic run land them shake by trade interest find career sea.', NULL),
(8, 'These partner both mean moment bit back none impact chair clear.', 'Child sort accept it sound stand son institution member avoid cell man institution exist tonight early truth social skill agreement wrong lawyer into.', NULL),
(9, 'Sort time claim expect great interview response interesting.', 'Glass including take anyone turn show talk respond seem situation training news nation list suddenly accept different box here assume right add place.', NULL),
(10, 'Way perform great apply now sign decade.', 'Mrs local condition major total break specific become move pull position film late bad view man military world large argue our.', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `logs`
-- --------------------------------------------------------
INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES
(1, 'LOG_TIPO 1', 'Raise suddenly all grow write case as hand method address collection return.', '1991-03-23 22:58:32', NULL),
(2, 'LOG_TIPO 2', 'Surface seem child put then ago growth term act business series likely suggest because safe.', '1977-12-15 13:33:59', NULL),
(3, 'LOG_TIPO 3', 'Hope worker government party maybe memory pattern brother well senior always continue forget leader show happy research bit letter local.', '2022-08-29 04:20:35', NULL),
(4, 'LOG_TIPO 4', 'Draw people see stay free bed record stay just agree hear add back sure employee part evidence yes.', '1989-02-02 16:04:01', NULL),
(5, 'LOG_TIPO 5', 'Suffer itself century ever professor major anyone during course yes picture money international at structure the figure offer finish son.', '2010-03-26 02:40:19', NULL),
(6, 'LOG_TIPO 6', 'Why foot teacher choice agency bag sign a page magazine party record almost ready fight hand investment eat.', '2003-12-23 22:42:47', NULL),
(7, 'LOG_TIPO 7', 'College my notice increase section manage say exactly allow use job theory work senior coach property create watch rock only.', '2008-01-03 17:09:34', NULL),
(8, 'LOG_TIPO 8', 'Certainly through need almost career build within close anything price color billion player interesting nearly already add school PM real only.', '2009-06-15 06:33:06', NULL),
(9, 'LOG_TIPO 9', 'Store include mouth church indicate minute medical day option blood participant response read outside east south.', '2015-04-22 18:51:33', NULL),
(10, 'LOG_TIPO 10', 'Office drive under operation social best leader part summer including.', '1977-03-31 09:27:57', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `configuraciones`
-- --------------------------------------------------------
INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES
('able', 'skill', NULL),
('movie', 'foreign', NULL),
('nearly', 'mean', NULL),
('me', 'source', NULL),
('performance', 'improve', NULL),
('special', 'from', NULL),
('owner', 'from', NULL),
('project', 'culture', NULL),
('off', 'make', NULL),
('success', 'quality', NULL);
