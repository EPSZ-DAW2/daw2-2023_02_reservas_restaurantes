-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes`
-- --------------------------------------------------------
INSERT INTO `imagenes` (`id_imagen`, `descripcion`, `notas`) VALUES
(1, NULL, NULL),
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
INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `id_foto_usuario`, `notas`) VALUES
(1, 'melissa32', 'shawangel@example.org', '_8+CHDbZ@n', NULL, NULL),
(2, 'howarddenise', 'philip11@example.com', 'r5xV@gck+a', NULL, NULL),
(3, 'smithcarlos', 'lydia50@example.net', '_!Y2HFE0_m', NULL, NULL),
(4, 'ricky78', 'dustinwhite@example.org', 'AV$4lQg3aV', NULL, NULL),
(5, 'jamesporter', 'jenniferarmstrong@example.org', 'Z*3EDo!z0R', NULL, NULL),
(6, 'zbird', 'davidsmith@example.org', '@4^CJoNoFh', NULL, NULL),
(7, 'grossjessica', 'adriennecooke@example.org', 'xZ(^5VchO+', NULL, NULL),
(8, 'regina60', 'whitneymoon@example.org', 'jW01RCYx^d', NULL, NULL),
(9, 'martinezmitchell', 'joy90@example.com', '64!9t0Bk_G', NULL, NULL),
(10, 'edwinclarke', 'christine10@example.com', '((xxZxmke3', NULL, NULL),
(11, 'jasongibson', 'howardbarnes@example.com', 'I)Ugh5JoLF', NULL, NULL),
(12, 'nryan', 'mark19@example.org', 'F5MHJuJu!p', NULL, NULL),
(13, 'sanfordlatoya', 'ybell@example.com', 'ygLYiqkd*6', NULL, NULL),
(14, 'jonathan44', 'marvinrobinson@example.org', '@JMQ)JhW+0', NULL, NULL),
(15, 'derrick65', 'ycameron@example.org', '^G5TAetPK)', NULL, NULL),
(16, 'gdavis', 'mcooper@example.net', 'RZp4_ENd^d', NULL, NULL),
(17, 'madisonburton', 'russellharrell@example.com', ')L23Dw8vA^', NULL, NULL),
(18, 'timothy06', 'qmills@example.com', '*sNYzupp8w', NULL, NULL),
(19, 'nicole61', 'cmatthews@example.org', '7*4E%YAr+8', NULL, NULL),
(20, 'oanderson', 'jennifer04@example.net', 'tCrGWFap*0', NULL, NULL),
(21, 'clarkjohn', 'phart@example.org', 'B4n!%9tu(l', NULL, NULL),
(22, 'racheljohnson', 'mcardenas@example.net', '!9_OkRqr53', NULL, NULL),
(23, 'gomezkimberly', 'singletoncynthia@example.org', '$k^g+OXj^4', NULL, NULL),
(24, 'thompsondebra', 'patricia10@example.org', '^H+tFQqb4c', NULL, NULL),
(25, 'jonesjoseph', 'jjones@example.org', '^12WQC9Bvm', NULL, NULL),
(26, 'michellecannon', 'uramsey@example.org', 'db7qImbm#1', NULL, NULL),
(27, 'janetrodriguez', 'markking@example.org', '+1tLh_IwSS', NULL, NULL),
(28, 'austin59', 'michaelgomez@example.net', 'Tr9mCvNl_A', NULL, NULL),
(29, 'esuarez', 'mcmahondiane@example.net', 'mU5!EgJRB%', NULL, NULL),
(30, 'watkinsmichael', 'andersonjoseph@example.com', ')y@9dYAaep', NULL, NULL),
(31, 'william13', 'williamsandrea@example.com', 'y4V!YH7l_h', NULL, NULL),
(32, 'jennifer62', 'vortega@example.org', ')hXDkQtXo8', NULL, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `administradores`
-- --------------------------------------------------------
INSERT INTO `administradores` (`id_administrador`, `id_usuario`, `notas`) VALUES
(1, 1, NULL),
(2, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `gestores`
-- --------------------------------------------------------
INSERT INTO `gestores` (`id_gestor`, `es_propietario`, `id_usuario`, `notas`) VALUES
(1, 1, 3, NULL),
(2, 0, 4, NULL),
(3, 0, 5, NULL),
(4, 0, 6, NULL),
(5, 0, 7, NULL),
(6, 0, 8, NULL),
(7, 1, 9, NULL),
(8, 0, 10, NULL),
(9, 1, 11, NULL),
(10, 0, 12, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `moderadores`
-- --------------------------------------------------------
INSERT INTO `moderadores` (`id_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES
(1, 'Heatherborough', 'North Carolina', 13, NULL),
(2, 'Tamarachester', 'Massachusetts', 14, NULL),
(3, 'Clarkchester', 'Michigan', 15, NULL),
(4, 'South Keithstad', 'Connecticut', 16, NULL),
(5, 'South David', 'New Mexico', 17, NULL),
(6, 'North Steven', 'Wisconsin', 18, NULL),
(7, 'Foxland', 'Illinois', 19, NULL),
(8, 'Port Jacquelineton', 'Vermont', 20, NULL),
(9, 'Christopherside', 'Alabama', 21, NULL),
(10, 'Kevinton', 'Missouri', 22, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `clientes`
-- --------------------------------------------------------
INSERT INTO `clientes` (`id_cliente`, `id_usuario`, `notas`) VALUES
(1, 23, NULL),
(2, 24, NULL),
(3, 25, NULL),
(4, 26, NULL),
(5, 27, NULL),
(6, 28, NULL),
(7, 29, NULL),
(8, 30, NULL),
(9, 31, NULL),
(10, 32, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categorias`
-- --------------------------------------------------------
INSERT INTO `categorias` (`id_categoria`, `id_categoria_padre`, `nombre_categoria`, `notas`) VALUES
(1, NULL, 'Ofertas', NULL),
(2, NULL, 'Selección La Cuchara', NULL),
(3, NULL, 'Categoria3', NULL),
(4, NULL, 'Categoria4', NULL),
(5, NULL, 'Categoria5', NULL),
(6, NULL, 'Categoria6', NULL),
(7, 1, 'Categoria7', NULL),
(8, 1, 'Categoria8', NULL),
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
(7, 3, 'Tipo7', NULL),
(8, 2, 'Tipo8', NULL),
(9, 2, 'Tipo9', NULL),
(10, 3, 'Tipo10', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `restaurantes`
-- --------------------------------------------------------
INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Lewis Keys', NULL, 'Stevenville', 'Oregon', NULL, NULL),
(2, 'Restaurante2', 2, 12, 'Ali Route', NULL, 'Sanchezview', 'Kansas', 14.78, NULL),
(3, 'Restaurante3', 3, 13, 'Benton Inlet', NULL, 'Lake Tracey', 'Maryland', NULL, NULL),
(4, 'Restaurante4', 4, 14, 'Jeffrey Ville', NULL, 'Jameschester', 'North Dakota', 97.59, NULL),
(5, 'Restaurante5', 5, 15, 'Dalton Extensions', NULL, 'Hannahview', 'Arkansas', NULL, NULL),
(6, 'Restaurante6', 6, 16, 'Joshua Cliffs', NULL, 'North Davidland', 'South Dakota', 62.65, NULL),
(7, 'Restaurante7', 7, 17, 'Harris Ramp', NULL, 'Roberttown', 'Idaho', NULL, NULL),
(8, 'Restaurante8', 8, 18, 'Lisa Stravenue', NULL, 'Michelleland', 'Kansas', 71.89, NULL),
(9, 'Restaurante9', 9, 19, 'Hill Drives', NULL, 'North Karenfurt', 'New Jersey', NULL, NULL),
(10, 'Restaurante10', 10, 20, 'Brian Street', NULL, 'Cruzburgh', 'Florida', 48.62, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `categoria_restaurante`
-- --------------------------------------------------------
INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(2, 1, NULL),
(2, 2, NULL),
(2, 3, NULL),
(2, 4, NULL),
(2, 5, NULL),
(2, 6, NULL),
(2, 7, NULL);


-- --------------------------------------------------------
-- Volcado de datos para la tabla `tipo_restaurante`
-- --------------------------------------------------------
INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES
(2, 1, NULL),
(8, 2, NULL),
(5, 5, NULL),
(5, 8, NULL),
(10, 8, NULL),
(4, 4, NULL),
(2, 3, NULL),
(5, 6, NULL),
(2, 2, NULL),
(3, 9, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `eventos`
-- --------------------------------------------------------
INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES
(1, 'Evento 1', 'Responsibility hit police whole. Policy believe fact democratic. Contain newspaper style alone mind degree enter.
Senior different production go book. Represent each reflect other wind.
Writer us political hope available focus. Little get government much. Interest late response reason tell.
Community economy now society. Meet pull themselves issue.
Adult out wife true his drop travel. Learn usually line admit. Buy expert partner that risk opportunity wear push.', '2023-12-26', 21, NULL, 5, NULL),
(2, 'Evento 2', 'Election coach others for religious discover before. Benefit course over key join. Value which find political rate.
Hour so including teacher say.
Perhaps fast evidence down could national clearly. Great no them statement. Kitchen friend product participant hope.
Through voice simply consumer author information. Style pressure day miss. Type feeling newspaper speak performance too network.
Yet idea car owner heart political. Conference feel view single.', '2024-01-05', 22, 0, 1, NULL),
(3, 'Evento 3', 'Just new front out. Next indicate represent visit civil free. Congress garden wear at report several think.
Picture health day item animal necessary family.
Peace practice necessary step. Will compare or worry city. Population among item people.
Little audience popular address. Want happy manage probably.
Late huge know page western Mrs beautiful. I feeling consider against out.', '2023-12-21', 23, NULL, 2, NULL),
(4, 'Evento 4', 'Point happy memory better economic. Different ready similar possible if. Side race glass resource might whole agent. Agency power now eat record first might.
Red include page stuff adult sometimes sure. Red wind force base seat mother. Outside threat heavy quickly.
Control sort explain under meeting several. Would modern north thing age will tonight return. Page participant effort.
Possible data dream. Six trial much purpose. Rock senior purpose tend.', '2024-01-15', 24, 2, 5, NULL),
(5, 'Evento 5', 'House her former region until. Board good current might. Involve mother guy enjoy property thousand point.
Soon dream national central modern. Receive affect stage manage part notice beautiful form. Though pattern international. So kitchen them let.
Color Mrs hotel machine prepare. Successful each put system building big. Always down detail eat newspaper top.
Least entire none message. Response stock big feel idea. Of wonder war step later teacher.
Hot lay across factor myself we.', '2024-01-03', 25, NULL, 6, NULL),
(6, 'Evento 6', 'Forget modern seem since. Order say arm war. Organization house agree next garden indicate he.
Say measure week trouble candidate decade. Drug thing discussion enough serve despite.
Federal sell less degree hard. Eye three yard for wear. Up eat kitchen member.
Everybody allow mean race.
Most yourself heart worry him magazine. Rather must use tell many. Listen free appear term politics behind start.
Science drop president sure arrive or certain. Push need six successful window leg.', '2024-01-10', 26, 0, 10, NULL),
(7, 'Evento 7', 'Better talk beat always heart.
Style sometimes seek. Church care build.
Each personal central strategy staff support question. Determine young today maintain road receive together.
Half camera oil. Realize now property quickly old now. Clearly cover ground thus move a paper skin.
Member watch contain ago contain peace.
Top sign cut. Author develop determine population. Turn fall night citizen.
Major number serious market onto quite. Baby part event station newspaper two country.', '2024-01-06', 27, NULL, 10, NULL),
(8, 'Evento 8', 'Center only sister. Serious how forward up provide school lose.
Expect should available professor much idea operation interesting. Successful PM mention local. Write different part citizen. For fight bring doctor theory use.
Technology radio like artist. Voice machine he reach box compare.
Election line kid business the one. Perform become protect lot guess education investment between. Sort form them least.', '2023-12-28', 28, 2, 10, NULL),
(9, 'Evento 9', 'Long skin also evidence. Kind gas democratic idea marriage your. Member worker we recently wear.
Meeting former box painting soon fall feel. Suffer travel mission. Sister interview attorney agent.
Meeting matter somebody rise. Represent condition crime peace charge.
Goal red movement discuss. Assume painting could hotel world follow.
Five use miss rise get author material.
Player worker color increase public. Write road thing increase meet.', '2024-01-05', 29, NULL, 10, NULL),
(10, 'Evento 10', 'Employee maybe forget model. Natural paper modern according carry about. Stage adult stop late.
Evening white nice condition mind economic us. Newspaper political majority any nor he available. Newspaper paper although class base class why dog.
Doctor town our far until national dark. Continue cup generation world network for deep.
Before especially ability happen manager family. Blue firm commercial. Can research recognize compare collection reach.', '2023-12-18', 30, 1, 2, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `resenas`
-- --------------------------------------------------------
INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_cliente`, `id_restaurante`, `notas`) VALUES
(1, 'Resena 1', 'Four off plant list race manager upon. Paper take remember call with. Body investment born little decade word part.
City speak this difficult. Loss their any.
Lose road member. Threat painting discover.
Hit seem hundred talk though. Policy son explain concern east more. Serious paper federal nice painting series field.
Be school week call. Word main term.
Skill body along. Kitchen key either item daughter.
Writer field executive beat southern cell school. Three street during stop.', 2, NULL, NULL, '2024-01-04', 1, 7, NULL),
(2, 'Resena 2', 'Begin tell bag else month despite. Skin hundred may than skin wide against morning. Play would voice nothing hair.
Say particularly another concern never. Green door believe site be.
Around floor prove manage indicate herself class land. Cut benefit pressure including nice state.
Prevent without doctor onto team. Bring her write manager could decide assume.
Act speech successful debate wife consumer produce. Difference production sure treat into.', 1, 48.32, 2, '2024-01-11', 2, 1, NULL),
(3, 'Resena 3', 'Per walk television. Inside top sometimes manage good even. Enjoy network shoulder concern. Treatment forward well run unit series.
Report without option face market. Probably loss great.
Prove upon check process show. Such ball success owner nothing. It national area seat.
Real along party much money customer.
Interview analysis they husband move. Risk before art dark.
Away draw up class certain practice investment. Indicate hospital century authority.', 4, NULL, NULL, '2024-01-05', 3, 4, NULL),
(4, 'Resena 4', 'Quality final evening according time night watch.
Determine down school feeling ball.
American other try. Relate class degree knowledge idea dark who. Share spring anything room single event fly by.
Customer member strategy cold coach thing. Feeling could whose hundred plan sea fish. Brother find worker few certainly better resource.
Lead less project voice. Better financial such myself. Man large can.
Activity simply cover door. Partner world set bank. Activity night discover the science.', 0, 96.02, 2, '2023-12-19', 4, 8, NULL),
(5, 'Resena 5', 'It find economy feel. Marriage less despite audience win pretty compare. Smile president cost when their realize agree move.
Present feeling hotel attention pull experience us official. Difference side read model activity.
Pm method gun. Ready dinner night understand lay help. Someone rather event in responsibility. Keep that seat.
Speak action since explain story. Test himself spring local player wall society. Leave night dream week number up.', 5, NULL, NULL, '2024-01-01', 5, 5, NULL),
(6, 'Resena 6', 'Unit laugh recognize bed result.
This whose machine impact.
Office safe card so leader card. Rich sit condition tonight understand.
Crime director for to. Impact his picture difficult service dark environment. Play join important plan happen.
Trip than opportunity beautiful lay.
Bank fund buy sort. Style prepare by network item herself.
Cup us certain would agent century. Sometimes most goal college nation list concern. More sea understand figure address radio Congress evidence.', 1, 47.13, 2, '2023-12-26', 6, 8, NULL),
(7, 'Resena 7', 'Return movie story. People main involve every outside. Thought company finish skin nature participant blood.
His down their hand little special.
Wife happy explain agent free. Change maintain until traditional provide hour give.
Wall these their economic tree. Coach ask cut listen. American federal heavy stay part by goal range.
Community personal receive money situation which. Head century drop human nation.', 5, NULL, NULL, '2023-12-18', 7, 3, NULL),
(8, 'Resena 8', 'Phone laugh imagine thank few trade begin. Have next success organization. Young task reason take.
Stage point relationship base during. Once only trial from likely commercial attorney. Field rest staff town.
Letter style their notice blue foreign. Fine four next environment indeed blue hope. Better visit growth. Energy above cover.
Practice door lay happy offer choice. Tough smile address west opportunity job. Current prove now raise.', 5, 88.71, 1, '2023-12-26', 8, 7, NULL),
(9, 'Resena 9', 'Reflect moment apply carry. Task everyone loss nor everybody sense.
From open let the couple offer. Sound fall beat mind seem executive service general. Sit official policy.
Sport once expert plan impact.
Good seem message peace just performance consider. Executive impact agreement scene low. Situation skin region.
Statement because any single state newspaper throw.
Majority defense wait late increase week. You institution wish. Against value available modern technology structure organization.', 3, NULL, NULL, '2023-12-28', 9, 7, NULL),
(10, 'Resena 10', 'Including herself be choose stock. Operation heart program later rise democratic friend article. Game TV food president finish.
Reach day get second his eye wonder. Debate Mrs I security sport.
Improve son senior science us. Make ok able authority teach bag shake. Instead carry while clear notice two.
Despite nearly water institution. Begin long act compare artist trade.
Herself simply add compare. Phone truth trial court. Maintain rock alone.', 1, 70.34, 0, '2024-01-03', 10, 7, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas`
-- --------------------------------------------------------
INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES
(1, NULL, 'Game rule some quickly heavy. Condition leave company those apply return outside. Cold nature stand real.', NULL, 6, NULL),
(2, NULL, 'Them point side popular happy.', 0, 9, NULL),
(3, NULL, 'Citizen represent size wait. Final of your most particularly. Trial technology Democrat sell clear sure reach others. Probably view matter better box.', NULL, 4, NULL),
(4, NULL, 'Although may sort energy. Body coach keep sea grow many five.
Entire near mind. Item protect probably would. Local character direction fill.', 1, 7, NULL),
(5, NULL, 'Structure available full everybody important crime affect. Realize service Democrat yet remain couple heavy.', NULL, 4, NULL),
(6, NULL, 'Tv go discussion rest realize candidate.
Carry market leave fact book enough. Half concern meeting material. Material when capital onto.', 2, 5, NULL),
(7, 3, 'Size else news goal matter nor. Learn mother forget wide. Song behavior unit bank night improve hair.
Month radio take common. Arm property before pressure.', NULL, 6, NULL),
(8, 2, 'Own individual account within. Head sing than boy way. Peace bag wind lead store where finally.', 2, 10, NULL),
(9, 1, 'Above grow from strategy time.
Candidate newspaper like at. Trade various physical appear. Recent drug be write event want help.', NULL, 6, NULL),
(10, 2, 'On science see. Door brother another American go everything.
Travel miss life suddenly after stage the. Mention activity you street chance.', 0, 3, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `favoritos`
-- --------------------------------------------------------
INSERT INTO `favoritos` (`id_cliente`, `id_restaurante`, `notas`) VALUES
(1, 10, NULL),
(2, 7, NULL),
(3, 9, NULL),
(4, 2, NULL),
(5, 4, NULL),
(6, 10, NULL),
(7, 3, NULL),
(8, 2, NULL),
(9, 5, NULL),
(10, 5, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `reservas`
-- --------------------------------------------------------
INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_cliente`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 30447791677732', 2, '2024-01-18', '21:00', 1, 8, NULL),
(2, 'Tarjeta 2314965458065670', 2, '2024-01-29', '21:00', 2, 8, NULL),
(3, 'Tarjeta 213189375331778', 10, '2024-02-05', '21:00', 3, 8, NULL),
(4, 'Tarjeta 3584747648165367', 6, '2024-01-25', '21:00', 4, 9, NULL),
(5, 'Tarjeta 30248279253859', 6, '2024-02-09', '21:00', 5, 4, NULL),
(6, 'Tarjeta 213108040606265', 9, '2024-01-23', '21:00', 6, 8, NULL),
(7, 'Tarjeta 3551622829748258', 6, '2024-01-16', '21:00', 7, 9, NULL),
(8, 'Tarjeta 3539991333738858', 4, '2024-02-09', '21:00', 8, 5, NULL),
(9, 'Tarjeta 30266862362994', 4, '2024-01-23', '21:00', 9, 3, NULL),
(10, 'Tarjeta 4999275973149670', 5, '2024-01-18', '21:00', 10, 7, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `control_restaurantes`
-- --------------------------------------------------------
INSERT INTO `control_restaurantes` (`id_gestor`, `id_restaurante`, `notas`) VALUES
(1, 10, NULL),
(2, 1, NULL),
(3, 6, NULL),
(4, 7, NULL),
(5, 10, NULL),
(6, 7, NULL),
(7, 2, NULL),
(8, 3, NULL),
(9, 4, NULL),
(10, 3, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_restaurantes`
-- --------------------------------------------------------
INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES
(3, 31, NULL),
(10, 32, NULL),
(3, 33, NULL),
(1, 34, NULL),
(1, 35, NULL),
(1, 36, NULL),
(10, 37, NULL),
(10, 38, NULL),
(3, 39, NULL),
(1, 40, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `imagenes_resenas`
-- --------------------------------------------------------
INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES
(1, 41, NULL),
(10, 42, NULL),
(10, 43, NULL),
(10, 44, NULL),
(5, 45, NULL),
(1, 46, NULL),
(2, 47, NULL),
(8, 48, NULL),
(1, 49, NULL),
(3, 50, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `comentarios`
-- --------------------------------------------------------
INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES
(1, 2, NULL),
(2, 1, NULL),
(3, 9, NULL),
(4, 4, NULL),
(5, 2, NULL),
(6, 7, NULL),
(7, 6, NULL),
(8, 7, NULL),
(9, 10, NULL),
(10, 3, NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `respuestas_faq`
-- --------------------------------------------------------
INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES
(1, 'Good leader our fish entire hope start authority.', 'Suggest decision responsibility less under difficult morning myself receive indeed form service be hard economic painting fire ability customer my improve test my national.', NULL),
(2, 'Land level language per Republican before born stage song.', 'Trip simply former today technology choose strong west ball soldier idea artist.', NULL),
(3, 'Entire seem firm condition happy job our keep impact idea.', 'Practice a like party tough current themselves share stay state effort if sea player even would.', NULL),
(4, 'Road debate authority direction air six spring stage election game recently across there.', 'Memory fly investment task make must become build never make read until church certain here couple interview direction eight in newspaper.', NULL),
(5, 'Window condition trial place partner first gas agree.', 'Upon financial social trouble likely well either factor artist yet economic why least read leader ready lay capital thing which into.', NULL),
(6, 'Act network international ground accept find.', 'Degree who develop million positive local dog mention worry else everybody garden its truth campaign water.', NULL),
(7, 'West hard instead scientist education experience forget contain city behavior simple.', 'Consumer executive single gas white stage color can just bill television face nothing second dinner clearly six eye mind PM consider defense traditional assume.', NULL),
(8, 'Type past eye brother room or according best eye second.', 'Group south risk newspaper campaign occur plan loss have home reduce but.', NULL),
(9, 'Certain that keep identify operation large throw care may many that dream phone.', 'Carry under including forget animal history Republican raise morning teach realize this long wish.', NULL),
(10, 'Culture discover trade assume gas coach stage believe space affect court.', 'Early summer somebody make each third she theory media into officer surface thank such.', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `logs`
-- --------------------------------------------------------
INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES
(1, 'LOG_TIPO 1', 'Choice week democratic event hair involve six improve small result next store five however.', '1996-03-05 03:19:19', NULL),
(2, 'LOG_TIPO 2', 'Outside couple war left also total whether base fine live production million range probably.', '1975-08-23 20:55:51', NULL),
(3, 'LOG_TIPO 3', 'Time consider apply debate though include work light this test continue third chance look.', '1989-02-06 04:33:40', NULL),
(4, 'LOG_TIPO 4', 'Present say seat relate against win hundred hundred agency whether not even.', '2006-07-25 11:33:30', NULL),
(5, 'LOG_TIPO 5', 'Drive forget approach society minute analysis protect read head decide bag also.', '1999-09-16 15:26:36', NULL),
(6, 'LOG_TIPO 6', 'Move add play property central goal girl road deal fill truth century.', '1999-03-08 03:57:07', NULL),
(7, 'LOG_TIPO 7', 'Human bed general assume bit send care stage five address dog rock light large something skin box economy poor.', '2001-10-29 01:13:52', NULL),
(8, 'LOG_TIPO 8', 'Newspaper spend trade laugh quite class marriage great matter only charge guess bring.', '1998-10-09 22:12:56', NULL),
(9, 'LOG_TIPO 9', 'Conference gun machine PM cold add behind key mention society away according candidate talk.', '1976-08-20 03:01:45', NULL),
(10, 'LOG_TIPO 10', 'Figure class do heart see white accept people concern really growth food explain reveal now prove.', '2008-08-20 03:12:39', NULL);
-- --------------------------------------------------------
-- Volcado de datos para la tabla `configuraciones`
-- --------------------------------------------------------
INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES
('expect', 'account', NULL),
('Mrs', 'big', NULL),
('enough', 'baby', NULL),
('speech', 'thousand', NULL),
('floor', 'modern', NULL),
('authority', 'reason', NULL),
('fine', 'ask', NULL),
('research', 'woman', NULL),
('trial', 'poor', NULL),
('under', 'water', NULL);

-------------------------------------------------------
