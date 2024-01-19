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
INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `id_foto_usuario`, `rol`, `bloqueado`, `notas`) VALUES
(1, 'cliente1', 'cliente1@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(2, 'cliente2', 'cliente2@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(3, 'cliente3', 'cliente3@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(4, 'cliente4', 'cliente4@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(5, 'cliente5', 'cliente5@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(6, 'cliente6', 'cliente6@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(7, 'cliente7', 'cliente7@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(8, 'cliente8', 'cliente8@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(9, 'cliente9', 'cliente9@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(10, 'cliente10', 'cliente10@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', NULL, 'cliente', 0, NULL),
(11, 'propietario1', 'propietario1@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 'propietario', 0, NULL),
(12, 'propietario2', 'propietario2@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 'propietario', 0, NULL),
(13, 'propietario3', 'propietario3@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 'propietario', 0, NULL),
(14, 'propietario4', 'propietario4@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 'propietario', 0, NULL),
(15, 'propietario5', 'propietario5@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', NULL, 'propietario', 0, NULL),
(16, 'gestor1', 'gestor1@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 'gestor', 0, NULL),
(17, 'gestor2', 'gestor2@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 'gestor', 0, NULL),
(18, 'gestor3', 'gestor3@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 'gestor', 0, NULL),
(19, 'gestor4', 'gestor4@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 'gestor', 0, NULL),
(20, 'gestor5', 'gestor5@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', NULL, 'gestor', 0, NULL),
(21, 'moderador1', 'moderador1@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(22, 'moderador2', 'moderador2@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(23, 'moderador3', 'moderador3@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(24, 'moderador4', 'moderador4@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(25, 'moderador5', 'moderador5@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(26, 'moderador6', 'moderador6@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(27, 'moderador7', 'moderador7@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(28, 'moderador8', 'moderador8@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(29, 'moderador9', 'moderador9@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(30, 'moderador10', 'moderador10@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', NULL, 'moderador', 0, NULL),
(31, 'administrador1', 'administrador1@prueba.com', '$2y$13$VcfOxmSbPsYZ0Gy46Vze4.fY3vcd26Q4Fi7.W1eu1oBGqAgNg0QIS', NULL, 'administrador', 0, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `moderadores`
-- --------------------------------------------------------
INSERT INTO `moderadores` (`id_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES
(1, 'Cooperland', 'Georgia', 21, NULL),
(2, 'Turnerport', 'West Virginia', 22, NULL),
(3, 'East Lindsay', 'Oregon', 23, NULL),
(4, 'East Donna', 'Nevada', 24, NULL),
(5, 'Williamsfurt', 'New Mexico', 25, NULL),
(6, 'West Timothyfurt', 'Massachusetts', 26, NULL),
(7, 'Stantonport', 'Louisiana', 27, NULL),
(8, 'Hesterville', 'New Mexico', 28, NULL),
(9, 'Lake Michael', 'Iowa', 29, NULL),
(10, 'Carlosberg', 'New Jersey', 30, NULL);
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
(7, 2, 'Categoria7', NULL),
(8, 2, 'Categoria8', NULL),
(9, 3, 'Categoria9', NULL),
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
(7, 1, 'Tipo7', NULL),
(8, 2, 'Tipo8', NULL),
(9, 1, 'Tipo9', NULL),
(10, 2, 'Tipo10', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `restaurantes`
-- --------------------------------------------------------
INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Brian Roads', NULL, 'Clintonchester', 'Maine', NULL, 14, NULL),
(2, 'Restaurante2', 2, 12, 'Lee Port', NULL, 'East Tinafurt', 'Virginia', 81.73, 13, NULL),
(3, 'Restaurante3', 3, 13, 'Kidd Radial', NULL, 'Christensenfurt', 'Tennessee', NULL, 12, NULL),
(4, 'Restaurante4', 4, 14, 'Desiree Circles', NULL, 'North Gabrielview', 'Kentucky', 16.66, 11, NULL),
(5, 'Restaurante5', 5, 15, 'Brown Roads', NULL, 'Hayesshire', 'Wyoming', NULL, 14, NULL),
(6, 'Restaurante6', 6, 16, 'Chad Lodge', NULL, 'Brownmouth', 'Nebraska', 95.71, 11, NULL),
(7, 'Restaurante7', 7, 17, 'Tyler Spur', NULL, 'Sethton', 'North Carolina', NULL, 14, NULL),
(8, 'Restaurante8', 8, 18, 'Robert Pine', NULL, 'Annehaven', 'Connecticut', 82.36, 13, NULL),
(9, 'Restaurante9', 9, 19, 'Mendoza Corner', NULL, 'South Raymondfort', 'North Carolina', NULL, 15, NULL),
(10, 'Restaurante10', 10, 20, 'Dennis Flat', NULL, 'Camachoville', 'Montana', 74.53, 13, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categoria_restaurante`
-- --------------------------------------------------------
INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES
(9, 2, NULL),
(6, 4, NULL),
(4, 4, NULL),
(1, 7, NULL),
(1, 3, NULL),
(10, 7, NULL),
(1, 4, NULL),
(1, 3, NULL),
(10, 4, NULL),
(8, 1, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `tipo_restaurante`
-- --------------------------------------------------------
INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES
(3, 1, NULL),
(10, 10, NULL),
(7, 3, NULL),
(5, 2, NULL),
(1, 9, NULL),
(5, 8, NULL),
(6, 4, NULL),
(8, 8, NULL),
(8, 10, NULL),
(10, 9, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `eventos`
-- --------------------------------------------------------
INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES
(1, 'Evento 1', 'Free social hard they keep catch. Arm worker term with my rise. Record teacher whole sell truth.
At decade anyone. Throw include feeling win participant.
Result power yard. Security personal call population. Focus I may.
Pattern read give like result baby hundred public. Thank imagine shake station design focus. Dark figure free view everybody.
Mean season piece case attorney often difference. Word why case feeling decade.', '2023-12-22', 21, NULL, 1, NULL),
(2, 'Evento 2', 'Author them yeah test director how wonder hotel. So choose have cause receive fund lawyer.
Fire condition chance. Believe focus door must forget at financial machine. Measure health memory all scene action.
Probably student turn in without. Like onto them animal week detail change why.
Out else evening on pretty maintain. Half next itself throw. Sense term garden gun nice challenge left.
Everything magazine road respond stand message.
Purpose choose company fall. May generation wide skin.', '2024-01-16', 22, 0, 1, NULL),
(3, 'Evento 3', 'Which school close soon week smile. Often situation present magazine as.
When participant listen. Radio politics cause son.
Five although customer view that turn. Our one black from beat several. Soldier town fund today deep.
Recent capital record song. Number interest fear result.
Whole save world approach he cultural. Billion ok chair think.
Around consumer through yet wide option. Capital place consider attorney positive seek positive. When treat public raise southern remember.', '2024-01-15', 23, NULL, 6, NULL),
(4, 'Evento 4', 'Improve prepare bank simply not occur health. Better military our fish treatment page blue.
Number national several thank be shoulder newspaper. Power husband natural letter safe.
Effort nearly east participant early allow. Million process herself eight medical easy.
Particularly bit laugh technology lay put join. Now something certainly resource alone. Sit actually without production.
Medical blood air science. Career pay begin since director. From detail matter already true few attorney.', '2024-01-10', 24, 0, 5, NULL),
(5, 'Evento 5', 'Figure forget know determine. Gun experience camera board order likely film. Baby treatment mention level beat fire.
Plan human owner impact. Executive nor age spend lose under. Chance send choice hour human manage ground.
Coach impact with key moment. East machine often cut data subject control.
Employee recently imagine prepare scientist. Sell wish receive run sea improve less. Far read pick finally ahead whom sign physical. Truth tree skin.', '2024-01-05', 25, NULL, 8, NULL),
(6, 'Evento 6', 'White shoulder adult campaign expert chance.
Base according pay fear who. Amount there concern worker pretty part base him. Subject evening movie help television particularly.
Produce drive ever miss election song. Generation same tree phone city natural. Hospital professor research.
Officer strong two network. Happen technology their both short easy.
At everybody fast especially Congress stuff improve. Chair accept without hospital minute old.', '2023-12-22', 26, 0, 1, NULL),
(7, 'Evento 7', 'Represent kid surface simple three impact myself black. Discover small until treatment customer whose today of. Dream gun stage attorney anyone look travel.
Read move it then class. Beat building fight reflect. Want so western.
Trade heavy year me their second. Late hear adult thing light main. Same everyone force part reveal simply foot.
Green avoid yet stand. Day member describe condition.', '2024-01-14', 27, NULL, 3, NULL),
(8, 'Evento 8', 'Surface fine activity have. Total go student.
Fact season message. Wear own leader here. Detail large change music exist senior.
Identify realize result smile remember small. Them save over international final matter office evening.
Allow police free building old age. Police share mouth whether soldier past.
Mean answer at arm enter threat.
North be thank identify watch cup environment court. History enjoy skin building.', '2023-12-28', 28, 2, 7, NULL),
(9, 'Evento 9', 'Fast wide law high. Matter avoid social. Live without situation call may page.
May central other house majority model. Know both share.
Why notice pull explain. Everybody question unit set way three consumer. Method professional blood experience oil might. Way seat article time travel.
Fire federal half defense. Consumer floor brother take beyond line. Seven new upon vote face.', '2023-12-29', 29, NULL, 1, NULL),
(10, 'Evento 10', 'High season main music person drop. Close recognize improve within room kind.
Prepare gas speak then despite life smile sense. Catch between present affect.
Business wonder few land. Culture material mouth responsibility watch discuss buy. Media tend military provide challenge nearly bring.
Smile Mrs both school run much. Recent society or worry hundred start when.
Green price police discussion another east recent choose. Street ball read tend.', '2024-01-08', 30, 2, 10, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `resenas`
-- --------------------------------------------------------
INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Reseña 1', 'Four reality dark parent two there you. Throughout song join wide himself brother. Shoulder prevent shake three prove special structure.
Test room adult agree beyond offer his.
Certain necessary ok culture itself maintain. Fact born information toward season.
Reveal number true easy deep. Improve anyone interview value. Score not again identify respond center product.
Mouth every significant tough she. Father suffer establish him floor value behavior expert.
Hope only start. Set foot tough.', 3, NULL, NULL, '2023-12-26', 1, 1, NULL),
(2, 'Reseña 2', 'Reach individual candidate want. Cold number family TV later whom. Eat item assume. Pressure choose perform or including home foreign.
End share read reason machine. Agency may through reveal along create what. Cell federal wife.
Eat treatment statement million wide.
Pm night source computer town at share. Avoid current finally its policy choice I.
Control sing tonight player walk even day. Become east oil. Federal language tell trip day head.', 4, 14.68, 1, '2024-01-05', 2, 9, NULL),
(3, 'Reseña 3', 'Process network sometimes. Use opportunity show walk down right compare.
Not similar decide huge you rate family. Improve significant left side country similar cold. If would leader every.
Data today room family official. Fire finish center start. Its recent theory anyone choose could.
Learn high son responsibility industry light bring party. World like long go nature. Memory dinner already other song manager will data.', 1, NULL, NULL, '2024-01-03', 3, 1, NULL),
(4, 'Reseña 4', 'Pattern kind cup. None exactly church side seek. Next leader deep remember country eat cultural her. Marriage out us seven trade black church.
Probably what statement project. Money cost painting what.
Coach study military indeed police. Specific scene dinner dog. Decide Congress beat contain.
Good around south likely American professional skin. Where push part moment Mr. Once forward present write reduce cost. Lead drop run by.', 3, 31.57, 1, '2024-01-11', 4, 6, NULL),
(5, 'Reseña 5', 'Agent evening property him my author board world. Bring player performance should. Day nor know seat really. Bring myself customer respond focus.
Young between anyone certain store turn it. So perhaps gun do north.
Result court back certainly lead grow whose. Meet hotel wrong rather military.
Cell poor protect piece reflect. Full chance accept produce good. Performance heavy effort similar night support.
Ahead ahead better.', 3, NULL, NULL, '2023-12-24', 5, 10, NULL),
(6, 'Reseña 6', 'Site protect game prepare score remember. Land term bit forward side able rise.
Generation once whose yard activity really report I. Including lawyer call your store before.
Recent minute someone though between join visit.
Evidence identify pick court organization Republican manage. Little international believe.
Positive stuff tonight learn picture phone herself. Woman apply else card. Threat section about feeling hospital action car. Weight role wide most trade design he south.', 5, 66.4, 0, '2024-01-17', 6, 8, NULL),
(7, 'Reseña 7', 'Them range hand understand moment. Speak benefit war election.
Lawyer piece stage manage these stage allow. Performance catch player certain whether. Likely material company card.
Address start cost identify. Onto green maybe decade production fill process notice.
Power myself enough side. Hour give give church tough account meeting. On better military rather test. Need benefit test member seat vote.', 2, NULL, NULL, '2024-01-10', 7, 6, NULL),
(8, 'Reseña 8', 'From its claim who break and during. South class candidate. In should key apply realize there. Chair early business idea.
Fill assume song personal success goal. Market on society far door save.
Picture life there record five brother join. Develop interest money assume billion end.
Long turn measure while reason gas foot.
Thousand ball though ready writer establish huge. Human sign include defense beat be sea. Pick activity today enough admit.', 0, 81.8, 1, '2024-01-16', 8, 5, NULL),
(9, 'Reseña 9', 'Lose race actually including. Care old strong goal arm hospital it nor. Let sure sort college two.
Particularly partner point could theory cut. Above democratic society those participant.
Modern law safe. Give student can which safe if.
Cell easy school small. Cup two weight identify education my say. Even single loss field professor simply music.
Apply bar particularly bank popular answer system. Plan imagine song citizen give rest professional less. Hot human protect field successful.', 1, NULL, NULL, '2024-01-18', 9, 2, NULL),
(10, 'Reseña 10', 'Interesting under likely you red. Evidence air thank structure tend loss east identify.
Much list few past. Anything candidate authority easy career task stock. Agreement hair girl project over professional generation.
Society choice pass one possible Mr world pass. News reveal international. Fish certain lead statement better.
Explain add cut pretty woman involve save. Market improve senior.
History event too society. Movie send PM plant.', 5, 76.08, 2, '2024-01-10', 10, 8, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas`
-- --------------------------------------------------------
INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES
(1, NULL, 'Morning hand entire responsibility opportunity white. Notice inside value identify operation nature record degree.
Present describe suggest none simple. Whole structure tree plant sort.', NULL, 10, NULL),
(2, NULL, 'Information coach my toward soon someone doctor. Court almost ten hour long. Manage team shoulder.
Skin into people play study develop. Alone can understand.', 2, 3, NULL),
(3, NULL, 'Project develop standard interest apply. Factor final most alone rock nor letter power.
Especially ever notice want star. Pretty own crime piece financial product.', NULL, 9, NULL),
(4, NULL, 'Any least church body star. Give near western large career usually including.
Media building suffer present later message. Five I others may teach. Part around improve structure.', 2, 10, NULL),
(5, NULL, 'Traditional peace three. Student person simple home together. Little even my station. Those you and southern glass tonight.', NULL, 2, NULL),
(6, NULL, 'Minute accept body.
Toward without probably manage peace suddenly risk. Share however beyond moment. While lawyer concern country something pretty.', 1, 4, NULL),
(7, 2, 'Public lot future again face. Throw management rate car approach although.
Sign walk ever same box list. Tonight relate end forward bank whether.', NULL, 6, NULL),
(8, 2, 'Billion reason age see parent bed. Adult floor science collection have station.
Animal already candidate then. Memory though sport form.', 1, 8, NULL),
(9, 1, 'Spring sure lose trip treatment cell. Over discussion seek check.
Fight color sit its decide indicate rule.
Wall article total practice item. Single turn stuff.', NULL, 2, NULL),
(10, 3, 'Hospital whole soon option program through painting. Knowledge actually watch.
Degree include parent risk wish respond. Turn magazine garden maybe nature force.', 0, 7, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `favoritos`
-- --------------------------------------------------------
INSERT INTO `favoritos` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 6, NULL),
(2, 4, NULL),
(3, 9, NULL),
(4, 1, NULL),
(5, 3, NULL),
(6, 1, NULL),
(7, 5, NULL),
(8, 6, NULL),
(9, 1, NULL),
(10, 10, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `reservas`
-- --------------------------------------------------------
INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 502030733906', 2, '2024-01-19', '21:00', 1, 2, NULL),
(2, 'Tarjeta 343030311814761', 6, '2024-02-15', '21:00', 2, 8, NULL),
(3, 'Tarjeta 4521750392861607', 4, '2024-01-20', '21:00', 3, 7, NULL),
(4, 'Tarjeta 38550649830650', 2, '2024-02-13', '21:00', 4, 2, NULL),
(5, 'Tarjeta 341877916231698', 1, '2024-01-28', '21:00', 5, 5, NULL),
(6, 'Tarjeta 2461887601090978', 9, '2024-02-15', '21:00', 6, 5, NULL),
(7, 'Tarjeta 36803166952205', 2, '2024-02-16', '21:00', 7, 8, NULL),
(8, 'Tarjeta 213190454290463', 9, '2024-02-11', '21:00', 8, 2, NULL),
(9, 'Tarjeta 676195221467', 5, '2024-02-15', '21:00', 9, 8, NULL),
(10, 'Tarjeta 341511082668611', 3, '2024-02-15', '21:00', 10, 1, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `control_restaurantes`
-- --------------------------------------------------------
INSERT INTO `control_restaurantes` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(11, 1, NULL),
(12, 6, NULL),
(13, 8, NULL),
(14, 2, NULL),
(15, 2, NULL),
(16, 7, NULL),
(17, 6, NULL),
(18, 9, NULL),
(19, 2, NULL),
(20, 4, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_restaurantes`
-- --------------------------------------------------------
INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES
(4, 31, NULL),
(2, 32, NULL),
(3, 33, NULL),
(4, 34, NULL),
(4, 35, NULL),
(2, 36, NULL),
(9, 37, NULL),
(4, 38, NULL),
(9, 39, NULL),
(6, 40, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_resenas`
-- --------------------------------------------------------
INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES
(10, 41, NULL),
(8, 42, NULL),
(3, 43, NULL),
(2, 44, NULL),
(3, 45, NULL),
(8, 46, NULL),
(8, 47, NULL),
(9, 48, NULL),
(8, 49, NULL),
(10, 50, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `comentarios`
-- --------------------------------------------------------
INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES
(1, 4, NULL),
(2, 7, NULL),
(3, 4, NULL),
(4, 6, NULL),
(5, 7, NULL),
(6, 1, NULL),
(7, 9, NULL),
(8, 6, NULL),
(9, 5, NULL),
(10, 8, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas_faq`
-- --------------------------------------------------------
INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES
(1, 'About recently simply ground subject cut will possible.', 'Reveal everybody ok move no price source civil amount just American lay up he think oil true toward item investment.', NULL),
(2, 'Common always thus pretty south whose within memory threat anything into southern brother.', 'Thought center maybe laugh lawyer possible floor believe carry market perform short teach protect describe organization role adult surface task believe summer now him step college.', NULL),
(3, 'Such think current require capital concern race sea available look.', 'Seven democratic eye consumer study describe onto song give environmental allow ahead he tend politics political lot single degree include foreign.', NULL),
(4, 'Dog each himself campaign seven social.', 'Clear fill line want certainly hotel trade your anyone image result wear democratic new.', NULL),
(5, 'Fast great each today make knowledge organization radio news.', 'Large season red authority scene or pull growth somebody detail public art perhaps fund detail yes political rather group he.', NULL),
(6, 'Important economic down suddenly public difference include foreign minute themselves already.', 'Control tend do event company culture class stock character enjoy maybe cold various guy likely notice foot four top.', NULL),
(7, 'Rather school other herself pick learn expect.', 'With or themselves care movie artist moment majority to several final eye.', NULL),
(8, 'Sit entire watch pretty safe window plant cell official and notice weight establish.', 'Stage year one compare learn campaign various yes technology chair after must court particular under account.', NULL),
(9, 'Reduce agent conference travel there floor institution threat rate.', 'Particularly size teacher as door reveal against condition science new example list spend group may more budget control wonder crime something daughter remember.', NULL),
(10, 'Health nor me long out up late name view even for fall above.', 'Available though fish your base rise that political thing someone growth decision base language yes institution such bad chance result contain economic person vote.', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `logs`
-- --------------------------------------------------------
INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES
(1, 'LOG_TIPO 1', 'Detail while weight speech some for tough concern know room lose huge image.', '2015-08-27 14:59:04', NULL),
(2, 'LOG_TIPO 2', 'Significant his candidate usually father current one seat worker letter on rest plant above allow the.', '1982-03-11 10:45:27', NULL),
(3, 'LOG_TIPO 3', 'Shoulder change face upon tax we government yourself real wonder important interest book question toward baby dinner ahead theory.', '1987-06-22 23:04:26', NULL),
(4, 'LOG_TIPO 4', 'Mother sure project those painting toward create firm politics somebody lot ahead entire painting discuss TV lose carry nor.', '1982-11-11 23:21:36', NULL),
(5, 'LOG_TIPO 5', 'Center on need friend thousand difficult staff point world this list stuff us performance entire forward know term more.', '1985-03-25 13:09:22', NULL),
(6, 'LOG_TIPO 6', 'Role involve vote size even notice factor make stay opportunity.', '2004-07-09 06:03:03', NULL),
(7, 'LOG_TIPO 7', 'Shoulder catch agent thing on upon vote commercial mouth kind up pretty democratic remain moment religious right.', '2006-06-15 03:26:09', NULL),
(8, 'LOG_TIPO 8', 'After painting country very never west dream create south news difference issue price single treat wrong sense.', '2017-05-12 13:00:22', NULL),
(9, 'LOG_TIPO 9', 'After one fall race international between see back miss anyone already reveal compare bit vote.', '2011-10-08 15:36:51', NULL),
(10, 'LOG_TIPO 10', 'Hear above commercial safe peace plant thousand lose figure practice generation cold station enough beautiful like.', '1971-12-25 09:17:23', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `configuraciones`
-- --------------------------------------------------------
INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES
('traditional', 'all', NULL),
('Mr', 'law', NULL),
('organization', 'understand', NULL),
('without', 'receive', NULL),
('require', 'performance', NULL),
('mind', 'skill', NULL),
('hair', 'two', NULL),
('along', 'firm', NULL),
('another', 'item', NULL),
('project', 'recently', NULL);
