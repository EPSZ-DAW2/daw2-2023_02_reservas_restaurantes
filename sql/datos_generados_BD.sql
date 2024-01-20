-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes`
-- --------------------------------------------------------
INSERT INTO `imagenes` (`id_imagen`, `descripcion`, `notas`) VALUES
(1, 'Foto por defecto', NULL),
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
(1, 'cliente1', 'cliente1@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(2, 'cliente2', 'cliente2@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(3, 'cliente3', 'cliente3@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(4, 'cliente4', 'cliente4@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(5, 'cliente5', 'cliente5@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(6, 'cliente6', 'cliente6@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(7, 'cliente7', 'cliente7@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(8, 'cliente8', 'cliente8@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(9, 'cliente9', 'cliente9@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(10, 'cliente10', 'cliente10@prueba.com', 'cliente', 1, 'cliente', 0, NULL),
(11, 'propietario1', 'propietario1@prueba.com', 'propietario', 1, 'propietario', 0, NULL),
(12, 'propietario2', 'propietario2@prueba.com', 'propietario', 1, 'propietario', 0, NULL),
(13, 'propietario3', 'propietario3@prueba.com', 'propietario', 1, 'propietario', 0, NULL),
(14, 'propietario4', 'propietario4@prueba.com', 'propietario', 1, 'propietario', 0, NULL),
(15, 'propietario5', 'propietario5@prueba.com', 'propietario', 1, 'propietario', 0, NULL),
(16, 'gestor1', 'gestor1@prueba.com', 'gestor', 1, 'gestor', 0, NULL),
(17, 'gestor2', 'gestor2@prueba.com', 'gestor', 1, 'gestor', 0, NULL),
(18, 'gestor3', 'gestor3@prueba.com', 'gestor', 1, 'gestor', 0, NULL),
(19, 'gestor4', 'gestor4@prueba.com', 'gestor', 1, 'gestor', 0, NULL),
(20, 'gestor5', 'gestor5@prueba.com', 'gestor', 1, 'gestor', 0, NULL),
(21, 'moderador1', 'moderador1@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(22, 'moderador2', 'moderador2@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(23, 'moderador3', 'moderador3@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(24, 'moderador4', 'moderador4@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(25, 'moderador5', 'moderador5@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(26, 'moderador6', 'moderador6@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(27, 'moderador7', 'moderador7@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(28, 'moderador8', 'moderador8@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(29, 'moderador9', 'moderador9@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(30, 'moderador10', 'moderador10@prueba.com', 'moderador', 1, 'moderador', 0, NULL),
(31, 'administrador1', 'administrador1@prueba.com', 'administrador', 1, 'administrador', 0, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `moderadores`
-- --------------------------------------------------------
INSERT INTO `moderadores` (`id_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES
(1, 'Alexisland', 'Utah', 21, NULL),
(2, 'Robbinsfurt', 'Alabama', 22, NULL),
(3, 'East Sherryfurt', 'Massachusetts', 23, NULL),
(4, 'South Alexanderstad', 'South Carolina', 24, NULL),
(5, 'Bishophaven', 'Oklahoma', 25, NULL),
(6, 'Lake Alexanderview', 'Missouri', 26, NULL),
(7, 'North Jermaine', 'Mississippi', 27, NULL),
(8, 'Normanburgh', 'Colorado', 28, NULL),
(9, 'New Michael', 'Vermont', 29, NULL),
(10, 'North Kimberlyland', 'Vermont', 30, NULL);
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
(10, 2, 'Categoria10', NULL);
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
(8, 3, 'Tipo8', NULL),
(9, 2, 'Tipo9', NULL),
(10, 3, 'Tipo10', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `restaurantes`
-- --------------------------------------------------------
INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Dyer Garden', NULL, 'South Johnport', 'Alaska', 55.72, 14, NULL),
(2, 'Restaurante2', 2, 12, 'Smith Cliffs', NULL, 'Anthonyville', 'Kansas', 55.72, 12, NULL),
(3, 'Restaurante3', 3, 13, 'Nicholson Curve', NULL, 'Carolineland', 'Rhode Island', 55.72, 13, NULL),
(4, 'Restaurante4', 4, 14, 'Edwards Mission', NULL, 'Dawsonchester', 'Massachusetts', 97.34, 14, NULL),
(5, 'Restaurante5', 5, 15, 'Ruiz Centers', NULL, 'Johnsontown', 'Ohio', 55.72, 12, NULL),
(6, 'Restaurante6', 6, 16, 'Kristi Plains', NULL, 'Hamptonhaven', 'Rhode Island', 66.93, 13, NULL),
(7, 'Restaurante7', 7, 17, 'Adams Springs', NULL, 'North Ashleyland', 'New Hampshire', 55.72, 15, NULL),
(8, 'Restaurante8', 8, 18, 'Taylor Stravenue', NULL, 'West Wendy', 'Iowa', 17.17, 11, NULL),
(9, 'Restaurante9', 9, 19, 'Jennifer Causeway', NULL, 'South Jackie', 'Wyoming', 55.72, 11, NULL),
(10, 'Restaurante10', 10, 20, 'Evans Avenue', NULL, 'Georgehaven', 'Montana', 86.01, 14, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categoria_restaurante`
-- --------------------------------------------------------
INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES
(4, 10, NULL),
(6, 1, NULL),
(10, 5, NULL),
(2, 6, NULL),
(6, 10, NULL),
(7, 9, NULL),
(4, 10, NULL),
(10, 10, NULL),
(3, 5, NULL),
(3, 6, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `tipo_restaurante`
-- --------------------------------------------------------
INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES
(1, 8, NULL),
(9, 4, NULL),
(9, 4, NULL),
(2, 8, NULL),
(6, 9, NULL),
(5, 9, NULL),
(1, 3, NULL),
(3, 1, NULL),
(1, 10, NULL),
(8, 10, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `eventos`
-- --------------------------------------------------------
INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES
(1, 'Evento 1', 'Feel beautiful use can. Specific southern down anything perhaps. Reveal wonder process camera.
Prove child task whom low second final. Third sell interview kind animal. Believe effect drop third explain.
Most employee apply field doctor lot list. Dinner series reality trial.
Discover instead positive create. Never order prevent fly prove. Through source few expect address media.
Television consumer less cold measure. Right offer amount fast hour. Discover say simple book.', '2024-01-07', 21, NULL, 10, NULL),
(2, 'Evento 2', 'Mention mother recent. Once happen can police civil without.
Hear decade eat. Politics which TV true economy. Born entire woman long break.
Might act paper training half anything. Strategy rule major the.
Whether scientist recognize. Main politics apply sure. Smile fish series make huge half vote company.
Coach we try arrive. Change under natural could development learn.
Everyone common doctor hot serve. Site leader step kitchen.', '2024-01-02', 22, 1, 8, NULL),
(3, 'Evento 3', 'Plant street off both wind among. Civil establish believe treat. Prevent language space.
Past family market avoid son often. Key area particularly argue finally.
Manager within source kid. Summer company allow a religious talk.
Beautiful short start production cell particular involve score. Sister girl discuss head adult. Catch avoid all.
Example serve international live section care. Three accept film plant establish stock member show. Must establish action find doctor be yourself.', '2024-01-04', 23, NULL, 5, NULL),
(4, 'Evento 4', 'Reason lead year certainly usually involve continue affect. Despite fly most station keep perform bring. Learn picture successful war. Matter voice available participant.
Establish role throw well I. Enjoy direction board speech.
Region pressure professional scientist but statement yourself. Foot suggest take sea night. Its sometimes important black want.
Sea enter serve agency. Performance sure tough strong why hold. Give region art try they read do age.', '2024-01-06', 24, 2, 10, NULL),
(5, 'Evento 5', 'Population officer these like your in. Benefit fine nearly system senior action.
Campaign particularly southern each ten power able. Turn parent cover sea cover. Thousand until include travel could avoid others. Particular laugh notice compare sort.
Class should ahead among. Product how top realize.
Record evening agree security office marriage apply trial. Political less floor involve. Power work surface mean.', '2024-01-01', 25, NULL, 6, NULL),
(6, 'Evento 6', 'Official area here.
Fight nature house few attack. Kid school right kitchen tell ok. Power certain these behind beyond officer protect.
Ball for thank issue worker. Size beyond interesting allow opportunity.
Level public result for happen. Number on red.
Unit order benefit task perform structure.
Your better story security heart. Worker current stuff certain. Stop herself seem chance explain open along. Range if almost program.
Worker stuff upon. Represent game former.', '2024-01-15', 26, 0, 4, NULL),
(7, 'Evento 7', 'True house challenge money catch then drive. Answer structure lay deep spring something space. Development him believe policy child which.
Body pretty much yeah particularly sort learn. Community film statement act couple stuff. Force compare any another business section.
Standard culture have push. Give person view over.
Throughout fight beat present this far woman. Rate along south interview fish seat.', '2024-01-09', 27, NULL, 3, NULL),
(8, 'Evento 8', 'Certain operation property the physical situation.
Democratic give then step. Wear choose consumer despite method travel outside. Require structure move not.
Over class similar senior but myself another. Onto risk offer under bit factor machine. On my including particular behavior detail certainly along.
Follow move include find decide. Public believe get dark sell available. Way mission them check. Pay this listen tree.', '2024-01-02', 28, 1, 3, NULL),
(9, 'Evento 9', 'Throughout wonder sense student political soon. Various do debate fine bad boy. Give cultural sea station wonder.
Far eye nice or factor. Minute item television central reach give fund. Growth wrong tonight perform thank force. Simply real economy real else health.
Decide four southern student magazine need final. Body leave now.
Trial identify morning owner else coach good.
Term them land believe. Start skin off create Mrs couple.', '2023-12-25', 29, NULL, 1, NULL),
(10, 'Evento 10', 'Somebody office weight however which east contain. Design land without enough thank lose town.
Together a policy seat drop. Star exist everything choose easy. Entire quickly great through which back.
Around moment similar compare. Here eye daughter apply. Drop wide tonight spend design wear.
Protect movement student risk down. Suffer through feeling Democrat company off.
Republican trip institution wall effort simple back. Night section marriage night. Gun couple think minute else cause city.', '2024-01-18', 30, 2, 9, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `resenas`
-- --------------------------------------------------------
INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Reseña 1', 'Production strategy conference newspaper radio something hear artist. Hour finish accept million training. Society whom buy. General finally change establish economy head.
Pm inside now save source affect decide. Possible since buy blue service bank. Believe raise during into us newspaper.
Part keep often book. Main under respond arm.
Suddenly door magazine face morning fear arrive. Movement response radio far notice. Federal three establish role nor successful cover.', 5, NULL, NULL, '2023-12-26', 1, 4, NULL),
(2, 'Reseña 2', 'Region travel ready bit statement. Class who author suffer.
Large minute most learn cause less together. Own product develop.
Season sure reality issue here all Republican. American experience hear doctor change treat statement.
Dinner moment scene receive half since. Fund glass attorney involve decide finally.
Card central up them. Far option majority pattern position check. Writer technology star purpose yourself next walk knowledge.', 1, 78.62, 1, '2024-01-07', 2, 9, NULL),
(3, 'Reseña 3', 'Admit do rule old service thought. Sister history foot thank Mr. Whose thought marriage second good method sea over.
Everybody hope person miss than nearly. Final area film quality fear.
Course risk herself card action. Response election can. Car structure star manage similar imagine guess. Role letter join detail somebody officer example.
By yard by television. Rock pick own throughout professional media buy.
System certainly make mind property. See eat network stay it management not.', 2, NULL, NULL, '2024-01-05', 3, 6, NULL),
(4, 'Reseña 4', 'Follow then gun become plant child enter. Along loss notice.
Deal reveal will particular visit report dinner foot. Pretty stage than.
Lot security similar your such college international.
Some finish its team enter. Safe range eight approach budget those ago.
His doctor right adult option. Sign weight lead perform some money together. Surface grow religious itself cell student result. New case member.', 2, 62.81, 2, '2023-12-28', 4, 4, NULL),
(5, 'Reseña 5', 'Drive paper just performance soldier TV remember. Picture air stage nation. Model audience loss husband.
Sport present watch respond. Big computer operation provide listen capital financial.
Add professional win figure why have relate. Decision wall school up low skill wonder. Education none late little daughter.
Economic film hotel he day contain. Whether gun news police skin trial season. Begin stock although everyone entire.', 1, NULL, NULL, '2023-12-28', 5, 4, NULL),
(6, 'Reseña 6', 'Table whole attack leave half. State shoulder break together identify page air growth. Benefit decade sister local voice.
First sell black may water. Main table bit truth ago.
Personal interesting stock so thank. Through table such travel call.
Many oil west. Policy player break born effort medical response. Order shake training early. Instead manage represent bar.', 3, 90.16, 0, '2023-12-23', 6, 10, NULL),
(7, 'Reseña 7', 'Trial start current professor research board wall. Health person eat party deep. Also man watch decide.
Amount lay act be garden try camera. Staff no candidate. Business catch per produce table tell.
Yes city mother well road pass often. Be include ago.
Pull air either direction field. Box coach maybe. Radio trial responsibility industry source.
Picture environmental huge operation. Shake choose necessary various reach. Strategy away charge head pass exist.', 5, NULL, NULL, '2024-01-05', 7, 1, NULL),
(8, 'Reseña 8', 'Great sit weight sure. Ok answer seem cut miss. Agent personal walk environmental final me. Sport production after together order source.
Pass federal even road left performance bill. Since my hand student. Economic chance night benefit local these.
Economic through from thing second. Avoid watch stop similar.
Weight style later property and table. Again real much worry economy. Somebody growth approach entire cell best.', 5, 91.71, 1, '2023-12-22', 8, 7, NULL),
(9, 'Reseña 9', 'Product enjoy remember. Parent beyond crime professor traditional. Officer free lay.
Way here month suggest moment. Recently item day why.
Nothing green only bar magazine ok message. Instead thus they later turn worker adult loss. Open scene rest near why perhaps admit. Whose eat price church lay group sea think.
Indeed bank bag could. Present section her break meeting.
Member environmental former better weight. Something behind property small. Ten son seem its war issue man political.', 2, NULL, NULL, '2024-01-11', 9, 10, NULL),
(10, 'Reseña 10', 'Trial ask maintain our choice brother chance. Exactly young reduce. Chance me operation sport ago health. Hear quickly happy push use.
Mean probably name better talk. Remain professor during almost build could require. Benefit the century whose. Respond each situation anything.
Impact brother forward game recent they. Ability party high successful economic. But why conference behavior.
Do affect picture door detail its. Eye any wall analysis agree air. Cup culture attack statement pattern.', 5, 89.44, 1, '2024-01-09', 10, 7, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas`
-- --------------------------------------------------------
INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES
(1, NULL, 'Recognize send feel computer hundred specific yard develop. Teacher radio show design. Case business threat western herself our work.', NULL, 6, NULL),
(2, NULL, 'Role risk center least. City benefit TV pressure institution financial war. Memory change such into few.
Culture action rate then long. Community adult possible continue herself.', 2, 1, NULL),
(3, NULL, 'Early give today listen relate dog thus less. Apply field safe goal.
Military finally sense while. Example raise event sit.
Interview history television follow director.', NULL, 3, NULL),
(4, NULL, 'Listen response camera art year into. Agent stop wrong until. Beautiful age protect score traditional from.
Market month week. Seek pass man among.', 2, 4, NULL),
(5, NULL, 'Test long analysis ready yourself election.
Everyone send major story defense under. Great assume hot weight can bed. From over owner source itself it.', NULL, 5, NULL),
(6, NULL, 'Last station former yet she Republican almost.
Situation teacher police concern. Cut town style south attorney you our.', 0, 9, NULL),
(7, 3, 'Though test left beat dinner. About whose behind activity why cell. Become determine sort agent few.
Us wonder music against. Reveal heavy growth politics that make.', NULL, 4, NULL),
(8, 1, 'Care heavy word with something arrive develop. Open open increase building past record mention. Actually investment decide east. Fund prepare alone design cut mother.', 2, 5, NULL),
(9, 2, 'Republican form step behind collection. Risk quickly high want official.
Office or compare avoid feeling sister. View table eye page.', NULL, 9, NULL),
(10, 3, 'Wish stand home serve nearly. Clearly tough among young leave.
Source when customer. Will participant move great. Stay agency unit this defense add.', 2, 5, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `favoritos`
-- --------------------------------------------------------
INSERT INTO `favoritos` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 4, NULL),
(2, 4, NULL),
(3, 7, NULL),
(4, 5, NULL),
(5, 9, NULL),
(6, 7, NULL),
(7, 7, NULL),
(8, 1, NULL),
(9, 2, NULL),
(10, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `reservas`
-- --------------------------------------------------------
INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 6011962023839124', 10, '2024-02-14', '21:00', 1, 9, NULL),
(2, 'Tarjeta 502092057889', 4, '2024-02-01', '21:00', 2, 2, NULL),
(3, 'Tarjeta 6011865855517348', 3, '2024-01-29', '21:00', 3, 10, NULL),
(4, 'Tarjeta 4829225563890395910', 8, '2024-02-02', '21:00', 4, 6, NULL),
(5, 'Tarjeta 676158649787', 7, '2024-02-17', '21:00', 5, 8, NULL),
(6, 'Tarjeta 4121780011025479307', 2, '2024-01-26', '21:00', 6, 3, NULL),
(7, 'Tarjeta 6553292403608160', 9, '2024-02-02', '21:00', 7, 9, NULL),
(8, 'Tarjeta 3558787733892733', 5, '2024-02-17', '21:00', 8, 9, NULL),
(9, 'Tarjeta 372796263776505', 4, '2024-02-08', '21:00', 9, 6, NULL),
(10, 'Tarjeta 180016096490626', 6, '2024-01-29', '21:00', 10, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `control_restaurantes`
-- --------------------------------------------------------
INSERT INTO `control_restaurantes` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(11, 1, NULL),
(12, 3, NULL),
(13, 5, NULL),
(14, 4, NULL),
(15, 9, NULL),
(16, 8, NULL),
(17, 6, NULL),
(18, 4, NULL),
(19, 1, NULL),
(20, 1, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_restaurantes`
-- --------------------------------------------------------
INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES
(7, 31, NULL),
(2, 32, NULL),
(7, 33, NULL),
(3, 34, NULL),
(6, 35, NULL),
(1, 36, NULL),
(8, 37, NULL),
(3, 38, NULL),
(8, 39, NULL),
(3, 40, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_resenas`
-- --------------------------------------------------------
INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES
(2, 41, NULL),
(7, 42, NULL),
(4, 43, NULL),
(10, 44, NULL),
(8, 45, NULL),
(6, 46, NULL),
(7, 47, NULL),
(8, 48, NULL),
(4, 49, NULL),
(1, 50, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `comentarios`
-- --------------------------------------------------------
INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES
(1, 4, NULL),
(2, 5, NULL),
(3, 6, NULL),
(4, 3, NULL),
(5, 2, NULL),
(6, 3, NULL),
(7, 7, NULL),
(8, 1, NULL),
(9, 3, NULL),
(10, 5, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas_faq`
-- --------------------------------------------------------
INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES
(1, 'Senior something break feel pressure will.', 'Season bar worker yourself spring cultural contain yeah me task between everyone black important every particular option source discussion type final give base clear example last describe about.', NULL),
(2, 'Mission travel ball kitchen those red.', 'Wind either role to them summer ability modern other foot make arm everyone fire win consider until whose you poor serious reflect hospital really.', NULL),
(3, 'Good TV race cold kind after nice enough vote.', 'System stand politics create make modern consider start suffer include street buy away figure technology.', NULL),
(4, 'President least challenge officer beautiful according might none director.', 'Drop usually them wait until message drop point instead quality lay girl east detail east his enter.', NULL),
(5, 'Our full gun local head letter nearly short race position.', 'Crime hotel here scientist work her arm entire ten any it happy since much thus out of arrive person middle guess actually television including.', NULL),
(6, 'Word member card with official close child yard time write road field PM.', 'Draw wait forward tree offer surface career suffer rise fear teach leader.', NULL),
(7, 'Perhaps room avoid foot serious every order behind.', 'Alone product wide heart when particularly east song continue Republican exist hope sort.', NULL),
(8, 'Low glass man me knowledge still a improve look entire interview political.', 'House green significant smile official in effort color itself history positive hear article.', NULL),
(9, 'But material like nation network key fear little race face.', 'Relationship actually address home politics every amount if structure cut front party view foot present teach.', NULL),
(10, 'Fire low stock race lot order fly without born TV.', 'Land wind yeah space class fight while music bad our they last watch.', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `logs`
-- --------------------------------------------------------
INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES
(1, 'LOG_TIPO 1', 'Entire war late image unit yard believe paper evening drop push fear even.', '1992-10-19 01:50:44', NULL),
(2, 'LOG_TIPO 2', 'Result under relationship pay huge edge help kitchen company writer pay change later design dark use science.', '1996-05-15 16:51:38', NULL),
(3, 'LOG_TIPO 3', 'Series whatever whether north visit reflect meet later now note itself often head maybe.', '2006-03-18 22:22:23', NULL),
(4, 'LOG_TIPO 4', 'Between paper personal since although piece baby whose pretty actually mention.', '1987-02-26 08:50:22', NULL),
(5, 'LOG_TIPO 5', 'Especially seek house light citizen white indicate as happen key.', '1994-11-13 18:54:08', NULL),
(6, 'LOG_TIPO 6', 'Issue apply walk special similar attorney film career bring hear local key.', '1994-06-16 14:02:19', NULL),
(7, 'LOG_TIPO 7', 'Game personal at join these produce phone management as no effort future memory voice do of single know.', '2021-10-25 19:41:46', NULL),
(8, 'LOG_TIPO 8', 'Tree mission per upon case local option care her teach continue near entire certainly.', '2016-03-04 19:37:09', NULL),
(9, 'LOG_TIPO 9', 'Necessary central certain range project past follow city read month couple share than especially market heart large.', '2015-11-16 20:07:48', NULL),
(10, 'LOG_TIPO 10', 'Second season case little this for pick describe sound catch.', '1971-03-19 23:36:22', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `configuraciones`
-- --------------------------------------------------------
INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES
('five', 'town', NULL),
('arm', 'friend', NULL),
('modern', 'shoulder', NULL),
('free', 'head', NULL),
('reality', 'reflect', NULL),
('hope', 'guess', NULL),
('letter', 'lay', NULL),
('newspaper', 'moment', NULL),
('difference', 'benefit', NULL),
('painting', 'key', NULL);
