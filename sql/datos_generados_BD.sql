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
(1, 'Dawnberg', 'Tennessee', 21, NULL),
(2, 'North Stevenfort', 'Colorado', 22, NULL),
(3, 'Robertsmouth', 'North Carolina', 23, NULL),
(4, 'Port Clintonmouth', 'Nevada', 24, NULL),
(5, 'New Cynthia', 'Maine', 25, NULL),
(6, 'West Stephen', 'Wyoming', 26, NULL),
(7, 'Lake Kathrynshire', 'Georgia', 27, NULL),
(8, 'Port John', 'Michigan', 28, NULL),
(9, 'South Courtneytown', 'Nebraska', 29, NULL),
(10, 'East Jamie', 'Wisconsin', 30, NULL);
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
(8, 3, 'Categoria8', NULL),
(9, 3, 'Categoria9', NULL),
(10, 1, 'Categoria10', NULL);
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
(9, 3, 'Tipo9', NULL),
(10, 2, 'Tipo10', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `restaurantes`
-- --------------------------------------------------------
INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Todd Glen', NULL, 'West Selena', 'Arkansas', NULL, 11, NULL),
(2, 'Restaurante2', 2, 12, 'Vaughan Fall', NULL, 'Carterchester', 'Louisiana', 79.25, 15, NULL),
(3, 'Restaurante3', 3, 13, 'Hughes Burgs', NULL, 'North Isaacburgh', 'Utah', NULL, 14, NULL),
(4, 'Restaurante4', 4, 14, 'Logan Divide', NULL, 'Timothyfurt', 'New Jersey', 95.46, 12, NULL),
(5, 'Restaurante5', 5, 15, 'Conway Port', NULL, 'Pamelaburgh', 'Vermont', NULL, 13, NULL),
(6, 'Restaurante6', 6, 16, 'Beth Street', NULL, 'Royview', 'Hawaii', 83.21, 14, NULL),
(7, 'Restaurante7', 7, 17, 'Elizabeth Island', NULL, 'North Jennifer', 'Kentucky', NULL, 13, NULL),
(8, 'Restaurante8', 8, 18, 'Jacob Plain', NULL, 'North Hollyfurt', 'Hawaii', 23.87, 15, NULL),
(9, 'Restaurante9', 9, 19, 'Taylor Flat', NULL, 'Dudleyhaven', 'Pennsylvania', NULL, 15, NULL),
(10, 'Restaurante10', 10, 20, 'Laurie Key', NULL, 'North Robert', 'West Virginia', 98.45, 13, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categoria_restaurante`
-- --------------------------------------------------------
INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES
(2, 4, NULL),
(10, 10, NULL),
(10, 4, NULL),
(6, 6, NULL),
(10, 8, NULL),
(3, 10, NULL),
(10, 9, NULL),
(3, 1, NULL),
(2, 8, NULL),
(9, 9, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `tipo_restaurante`
-- --------------------------------------------------------
INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES
(10, 1, NULL),
(7, 2, NULL),
(5, 7, NULL),
(10, 7, NULL),
(3, 5, NULL),
(7, 7, NULL),
(4, 10, NULL),
(2, 1, NULL),
(5, 5, NULL),
(1, 6, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `eventos`
-- --------------------------------------------------------
INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES
(1, 'Evento 1', 'Bag quality more government fight dog region. Between approach thing share.
Store finally exist reach. Late provide itself sure today brother section. Simple free spring dinner outside commercial scientist.
Media attack sing choice act. Teach effect reach summer less until.
Lead especially appear require ever. Fear investment include happy.
Glass specific explain situation player positive. Concern into talk offer. Feeling degree charge response.
Thing quite kind work. Their pick window do.', '2023-12-27', 21, NULL, 5, NULL),
(2, 'Evento 2', 'Start defense friend herself might rate. Finally kitchen story sure also also. Record animal really particularly baby institution build.
Where certain worker star goal although. Specific story enter say home miss stop old.
Analysis relationship candidate child bill other. Hotel leader party hotel treatment believe argue. Kind event person involve very.
Others design nation team hit movement. Remain learn son strong situation compare. Thought big author defense raise accept.', '2023-12-26', 22, 0, 5, NULL),
(3, 'Evento 3', 'Develop Mrs during learn hand. Score you million federal.
Task bill enjoy ability attention. Suddenly lot well increase. Data computer cup mother among. Many scene everyone staff day.
Police month information notice whole especially high. Election administration hair. Once become develop draw suffer also final.
Beyond receive establish various theory action. Plant set throughout time structure child similar. House article above half eye.', '2024-01-07', 23, NULL, 6, NULL),
(4, 'Evento 4', 'Usually scientist officer a structure gun. Single throw door exist. Eat open great.
Join behind analysis idea forget. Side rule agent perhaps marriage perform look. Treat prove carry part.
Build land trouble fight poor somebody beautiful. Drop that so. At participant kind before night draw.
Between fear present list media popular. Item instead card place.
Amount present evidence prepare evening whole realize. Door series mention radio matter decade house. Standard sense treatment.', '2023-12-30', 24, 1, 3, NULL),
(5, 'Evento 5', 'Customer get from court tell. Industry impact point care factor still.
Indicate practice offer attention beyond. Discover fear apply accept.
Enter or foot reach item security. Because several need author. If page pretty phone only use be.
Difficult follow without with game ability while within. Range large property himself no city money.
World national window economic pattern strong great voice. Drop around unit professional.', '2023-12-20', 25, NULL, 10, NULL),
(6, 'Evento 6', 'Recent pick outside tough occur majority economy. Create water market or.
Benefit serious know stay teach. East billion woman data. Sea center crime event.
Notice half change perhaps interesting. Teach true blood campaign provide difference game. Although itself allow author number us TV.
About positive position. Television modern respond ability.', '2023-12-30', 26, 0, 9, NULL),
(7, 'Evento 7', 'Include nature unit either again hope later. Should event six hit turn. Be kitchen parent provide PM with.
Building ten environmental among. Turn behavior Republican themselves behavior.
Manage wonder late black woman thought national. Sound education walk prepare. Exist season ago senior my hundred poor.
Property very program commercial simply wrong field. Stand carry soon white. Somebody shake large common physical need worker.', '2024-01-11', 27, NULL, 9, NULL),
(8, 'Evento 8', 'Whom four board nearly traditional around. Old response piece visit.
Loss process find society deal save. Describe choice fund strong present. Consider base real present.
Town blue consider. His huge own movie important type. Red factor affect relationship know work position strategy.
Strategy kid within animal amount speech culture somebody. East defense mean through. Professional responsibility explain institution between attention. Black nice air.', '2023-12-29', 28, 0, 3, NULL),
(9, 'Evento 9', 'Stand move however how. Letter natural wind dream pressure.
Behavior wall every father might. Win boy name project. Later voice new.
Stock at magazine office floor. Certain family consumer take property. Local protect character only you than must.
Mean right capital agreement. Certain bed size various. Player risk cultural enter decide beat.
She exactly sort commercial well cell hundred exist. Several tell town teach remember language. Three yard focus once citizen decide.', '2024-01-11', 29, NULL, 2, NULL),
(10, 'Evento 10', 'National force visit their imagine single whole. Career them but. Assume side such out support fast million.
Yes present writer from article. Certainly decide care.
Land clearly recognize ask mean both.
Enough like chair condition production.
Building field wind address marriage strong. My fly drive movement rate always. Follow trial book sister future imagine attention writer.
Few order human when ok laugh team early. Kind nice exactly life. For history ever religious thought safe.', '2023-12-30', 30, 2, 7, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `resenas`
-- --------------------------------------------------------
INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Reseña 1', 'Power whatever film area right back table. Myself top nice.
The manager perhaps detail measure star. Small edge sometimes wind success in stay.
Happy amount reason buy agree against city. Could determine begin fast. First suffer under forget better glass. Include thought full worry evening thousand will.
Surface report else turn sing argue by. Act describe teach speech some represent. Test whose learn base.
Protect yeah expert may half image. Degree north green two sure throw they four.', 3, NULL, NULL, '2024-01-03', 1, 1, NULL),
(2, 'Reseña 2', 'Mrs station spend song former son establish. Loss song all field trouble. Suddenly lot discuss claim per miss letter song.
Set always traditional discuss. Court us happen treat. Even such director traditional theory easy.
Pay him charge rule despite example. Activity reveal cold write agree choice sister. Country become sense history allow report. Entire perform better capital smile.
Question it letter. Music control again partner.', 5, 34.39, 0, '2024-01-15', 2, 7, NULL),
(3, 'Reseña 3', 'Group line soon heart black radio pull. Rule main sense strong indicate. Difficult everybody recently fine region.
One catch involve wonder mother face. Cultural it without decide west group people page.
West call easy police plant father become. Plant opportunity laugh many fast or.
Raise sister none administration everyone investment represent hair. Wall civil plant with. Save professor several evening grow discover.
Where data partner back lay.', 2, NULL, NULL, '2023-12-29', 3, 10, NULL),
(4, 'Reseña 4', 'Career beautiful night assume prove toward community security. As wear where support style use least see. Remain president hold movement strategy choice soon.
Team senior media perhaps green. Deep specific do best company.
Continue agree kind. Society drive vote must store respond father floor. Light low medical message.
Their price under break. This president later direction.
Game dream company father age whatever since have. Know effect thus look unit name career.', 1, 21.49, 1, '2024-01-02', 4, 9, NULL),
(5, 'Reseña 5', 'Simple according fact movie walk. Eye nothing movement Democrat. Change despite laugh around.
Budget term you sport government me arrive be. Few unit wind.
Analysis rock moment. Sense expect keep lose short material. Open eye score hope voice truth ago. Which decide finish catch.
Information hard give your tonight mean. Third family soldier create billion old those.
Authority beautiful worry the prevent deep machine. Design military mission.', 1, NULL, NULL, '2023-12-29', 5, 3, NULL),
(6, 'Reseña 6', 'Put actually protect military commercial team future. Huge election every beat hotel. Four catch serve energy.
Break whose fine old someone bag. Responsibility movement gun third law condition discover.
Star admit start customer member true field increase. If never station film soon father all. Foreign reduce lot nice away why Congress design.', 1, 11.52, 1, '2023-12-26', 6, 7, NULL),
(7, 'Reseña 7', 'Exactly store subject fast local. They sea else discover world call.
Different give green ability pay dog. Bank bill always near knowledge.
Choose save class represent. Future fine success raise. Now let term music fine exactly.
Position return write answer catch. Bill out glass entire fish left.
Serious PM before. Human forward property anything seven song.
Thus could feel politics receive stage assume. Base blood room read always place hit sing.', 2, NULL, NULL, '2024-01-15', 7, 6, NULL),
(8, 'Reseña 8', 'Strategy nearly think develop can commercial police. Begin certainly billion yeah condition center yard. During other card whom technology major.
Camera blood thank realize son. Never physical camera.
Cup rise production factor. Too last main tree attention cell. Bar rest cultural stock.
Help mouth cup well many add. Measure sign teacher eye.
Ground remember black around. Size nature cut. Some book live threat four public where politics.', 1, 69.63, 2, '2024-01-17', 8, 8, NULL),
(9, 'Reseña 9', 'His beat bring long American station. Specific sing few north school while likely. Ball eat list suffer some sing. Total fund new radio truth.
List plan well benefit realize item. Amount point marriage how tax practice fine.
Write fund back. Beat already wish south according. Environment market main floor. With book although idea.
Current score bar catch until simple. Peace thousand simply soldier return fact. Him none feel trial.', 0, NULL, NULL, '2024-01-11', 9, 7, NULL),
(10, 'Reseña 10', 'Father adult religious style west. Bag off water dog.
Today race less operation population individual. Others we return trial.
Best stock down impact whatever.
Several civil level. Face indicate wish before big consumer cut. Record mission attention my look where everybody.
If section range career year why edge all. Important help second reflect power.
Song staff movie.
Father need so tend. Manager blood series respond hair recognize.', 0, 58.56, 2, '2024-01-05', 10, 9, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas`
-- --------------------------------------------------------
INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES
(1, NULL, 'Character media drug here know draw. Option interview according. Standard more sure.
Success dinner when mean next clear protect message. Almost team voice important.', NULL, 5, NULL),
(2, NULL, 'System conference doctor carry class within through.
Compare you student into. Involve theory remain indicate use together science.', 0, 1, NULL),
(3, NULL, 'Church drive role cell. Us however rather child born even themselves.
Imagine cell hair approach. Level news might have girl. Ok old past whom eat professor concern.', NULL, 8, NULL),
(4, NULL, 'Special truth blue go natural range. Keep site Republican fact class reality.
Response research available beat. Develop very laugh despite.', 2, 1, NULL),
(5, NULL, 'Election blood every answer unit. Herself question type. Almost able nation.
Single without board thus number dark our. Street apply low significant cold.', NULL, 10, NULL),
(6, NULL, 'Key fast hundred book. Ball system political against.
Your from why star man option. Operation kitchen property throw leg trouble.
But chair soldier age chair at. Stay environmental order sure.', 0, 5, NULL),
(7, 2, 'Actually someone picture role door happy. Yet blood man watch. Cause drug worry with back item.', NULL, 10, NULL),
(8, 1, 'Cultural pick husband arrive mention difficult. Recent approach cell sound myself. Development forget good picture speech. Close center decide office bring.', 2, 6, NULL),
(9, 1, 'Professional positive several. Million apply there campaign. Least collection condition for drug.
Soon where next southern.
Education sit card on model. Without manage movie.', NULL, 7, NULL),
(10, 1, 'Close property indeed task heart direction conference.
Our call can call sport most establish. Order certain exist consumer mission others three site. Time such main serve again defense.', 1, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `favoritos`
-- --------------------------------------------------------
INSERT INTO `favoritos` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 8, NULL),
(2, 6, NULL),
(3, 7, NULL),
(4, 10, NULL),
(5, 1, NULL),
(6, 3, NULL),
(7, 3, NULL),
(8, 3, NULL),
(9, 7, NULL),
(10, 4, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `reservas`
-- --------------------------------------------------------
INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 2720654984746122', 4, '2024-02-14', '21:00', 1, 6, NULL),
(2, 'Tarjeta 213132130704731', 7, '2024-02-03', '21:00', 2, 5, NULL),
(3, 'Tarjeta 4948072978704225', 1, '2024-01-27', '21:00', 3, 4, NULL),
(4, 'Tarjeta 676198339811', 2, '2024-02-06', '21:00', 4, 10, NULL),
(5, 'Tarjeta 6011765908145099', 2, '2024-02-05', '21:00', 5, 5, NULL),
(6, 'Tarjeta 4849912897790982906', 4, '2024-01-21', '21:00', 6, 8, NULL),
(7, 'Tarjeta 3564068420642950', 10, '2024-02-11', '21:00', 7, 10, NULL),
(8, 'Tarjeta 342611739396746', 4, '2024-01-31', '21:00', 8, 4, NULL),
(9, 'Tarjeta 6548604661787882', 10, '2024-02-05', '21:00', 9, 1, NULL),
(10, 'Tarjeta 4271209232605439950', 8, '2024-01-28', '21:00', 10, 4, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `control_restaurantes`
-- --------------------------------------------------------
INSERT INTO `control_restaurantes` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(11, 4, NULL),
(12, 6, NULL),
(13, 8, NULL),
(14, 7, NULL),
(15, 5, NULL),
(16, 7, NULL),
(17, 8, NULL),
(18, 1, NULL),
(19, 9, NULL),
(20, 5, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_restaurantes`
-- --------------------------------------------------------
INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES
(1, 31, NULL),
(2, 32, NULL),
(6, 33, NULL),
(2, 34, NULL),
(6, 35, NULL),
(8, 36, NULL),
(6, 37, NULL),
(9, 38, NULL),
(4, 39, NULL),
(10, 40, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_resenas`
-- --------------------------------------------------------
INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES
(1, 41, NULL),
(3, 42, NULL),
(5, 43, NULL),
(3, 44, NULL),
(4, 45, NULL),
(5, 46, NULL),
(10, 47, NULL),
(9, 48, NULL),
(3, 49, NULL),
(7, 50, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `comentarios`
-- --------------------------------------------------------
INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES
(1, 4, NULL),
(2, 9, NULL),
(3, 4, NULL),
(4, 6, NULL),
(5, 10, NULL),
(6, 9, NULL),
(7, 2, NULL),
(8, 10, NULL),
(9, 8, NULL),
(10, 6, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas_faq`
-- --------------------------------------------------------
INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES
(1, 'Plan say expect end cover knowledge professor change claim rise watch bank yet.', 'Finish right international hour assume they hair matter center occur media operation such everyone full among test apply image blue month reach determine fear television model director.', NULL),
(2, 'Civil fine player place question interview interview data year.', 'Board science research up ahead man painting clearly bag keep finally military tend reality election.', NULL),
(3, 'Girl rest wall notice often power character control whole course exactly.', 'Lead better phone business which event article available next economy relate town pressure toward wife great way religious themselves meet involve politics.', NULL),
(4, 'Maybe local history subject dog dream though.', 'Explain price drop clear sound now her add goal tax send father another charge society how he space onto.', NULL),
(5, 'Three involve whatever individual sense animal need present.', 'Employee question truth air indicate character bar strategy available idea area up stock back available type movie claim off shoulder remember history investment north cold shake matter.', NULL),
(6, 'Contain affect security more avoid open third word per control step baby lose.', 'Author sister measure compare free else eye office take PM make decide skill.', NULL),
(7, 'A may offer east Congress bank.', 'Community bit significant still eat force professor open game professional experience writer strategy choice pick center book Mr magazine likely moment business sister travel whole more.', NULL),
(8, 'Above little drug success cultural strong town institution perhaps well nor bag.', 'Stay political indicate party media cultural mother job law beat guy fine amount tree throughout clear provide language million build everything talk with.', NULL),
(9, 'Relationship herself name different early without yourself organization western.', 'Sometimes hair produce task water reason agree lose move not of under quickly itself work food whom.', NULL),
(10, 'Republican together they wife high discussion although billion mother wear change gun safe.', 'Which compare ahead begin floor which campaign lot give fire rather answer hand consider land send then simply human.', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `logs`
-- --------------------------------------------------------
INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES
(1, 'LOG_TIPO 1', 'Yourself focus it choice civil indeed college four sign color across article whose member international become image.', '2006-07-31 05:40:14', NULL),
(2, 'LOG_TIPO 2', 'Probably box how truth training eight meeting price minute marriage.', '1985-10-31 04:11:26', NULL),
(3, 'LOG_TIPO 3', 'Law ball pick age notice among though notice fear impact.', '2001-12-11 11:54:13', NULL),
(4, 'LOG_TIPO 4', 'Shake very attack nearly history hundred across seat glass drop project marriage raise game consider.', '1971-04-01 21:23:52', NULL),
(5, 'LOG_TIPO 5', 'Candidate pass seat situation strong few accept anyone red.', '1972-11-20 19:48:51', NULL),
(6, 'LOG_TIPO 6', 'Week ability stand trip much film but would drug box raise body contain left.', '2019-06-17 10:25:15', NULL),
(7, 'LOG_TIPO 7', 'Blue into weight force ground push month money already many civil natural.', '2013-02-23 21:16:52', NULL),
(8, 'LOG_TIPO 8', 'Determine common might another official win foot when whom fly statement movement cost require charge ability father event.', '1978-12-14 01:01:45', NULL),
(9, 'LOG_TIPO 9', 'Mouth money marriage they investment reduce buy nature choose bar stand mother message theory hold amount style always summer.', '2011-10-04 00:35:01', NULL),
(10, 'LOG_TIPO 10', 'Recent reality step drop yes national wife author describe letter also force.', '2005-09-26 08:16:03', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `configuraciones`
-- --------------------------------------------------------
INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES
('such', 'present', NULL),
('his', 'north', NULL),
('sport', 'daughter', NULL),
('something', 'within', NULL),
('almost', 'vote', NULL),
('base', 'full', NULL),
('become', 'south', NULL),
('beyond', 'best', NULL),
('direction', 'run', NULL),
('about', 'article', NULL);
