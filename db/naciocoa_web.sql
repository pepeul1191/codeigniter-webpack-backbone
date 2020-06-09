-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-06-2020 a las 12:48:40
-- Versión del servidor: 10.3.23-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `naciocoa_web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_config_session`
--

CREATE TABLE `tb_config_session` (
  `idConfigSession` int(11) NOT NULL,
  `sesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_config_session`
--

INSERT INTO `tb_config_session` (`idConfigSession`, `sesion`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_contenido`
--

CREATE TABLE `tb_contenido` (
  `id` int(11) NOT NULL,
  `titulo` varchar(70) NOT NULL,
  `parrafo` text NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_imagen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_contenido`
--

INSERT INTO `tb_contenido` (`id`, `titulo`, `parrafo`, `id_menu`, `id_imagen`) VALUES
(1, 'Cámaras intra-orales', 'La cámara intraoral es una excelente herramienta de comunicación entre el odontólogo y el paciente ayuda a identificar y comunicar claramente las posibles caries durante los exámenes clínicos.', 13, 234),
(2, 'Radiología digital 3D', 'Moderno equipo de Radiografía Digital 3D: Panorámico, Cefalométrico y tomógrafo dental volumétrico de última generación. Que permite un diagnóstico y estudio radiográfico con más precisión y en menor tiempo.', 13, 225),
(3, 'profilaxis con ultrasonido', 'Consiste en un aparato que por medio de su punta de metal emite vibraciones ultrasónicas o de alta frecuencia ayudan a desprenden el sarro, la placa bacteriana y las manchas que penetran las pequeñas fisuras o imperfecciones de nuestros dientes ocasionadas por el consumo de cigarrillo, el café, las bebidas oscuras que son imposible de remover manualmente.</br>\nEste procedimiento es moderno y no produce ningún dolor o molestia, proporcionando un efecto limpiador y pulidor más profundo. De esta manera se eliminan residuos y pigmentación que afectan nuestros dientes. Es importante resaltar, que no todas las manchas pueden ser eliminadas, hay algunas que requieren de otras técnicas como el Blanqueamiento Dental.', 13, 233),
(4, 'blanqueamiento con láser', 'El procedimiento de blanqueamiento dental láser se lleva a cabo empleando un gel de peróxido de hidrógeno sobre la superficie externa de los dientes, la luz láser se aplica sobre el gel que ha sido colocado sobre los dientes del paciente y activa la liberación de moléculas de oxígeno blanqueando los dientes. La ventaja del láser es que minimiza los efectos secundarios como la sensibilidad dental posoperatoria.', 13, 228),
(5, 'endodoncia rotacional', 'La endodoncia con instrumentos rotatorios y limas de níquel-titanio es el cambio más importante producido en los últimos años en el campo de la endodoncia a nivel mundial.</br>\nLa endodoncia rotacional a diferencia de la tradicional nos proporciona un método, sencillo y cómodo para el paciente, reduciendo el tiempo de tratamiento, las posibilidades de dolor post-operatorio y nos asegura una limpieza y preparación de conductos radiculares de forma rápida, segura y eficaz.', 13, 229),
(6, 'Sistema especial de esterilización', 'Todos los centros odontológicos de la red COA cuentan con equipamiento y procesos de esterilización por autoclave Clase B, que nos garantiza una asepsia total e integral, mediante este proceso usted estará 100% seguro en cualquiera de nuestros locales a Nivel Nacional.', 13, 231),
(7, 'TIP 1', 'Al cepillarte los dientes utiliza un cepillo dental de cerdas suaves y cámbialo cada 3 meses.', 1, 235),
(8, 'TIP 2', 'Después de cepillarte recuerda usar el hilo dental para quitar restos de comida.', 1, 236),
(9, 'TIP 3', 'Enjuágate bien de dos a tres veces para combatir la placa y mantener un  fresco aliento.', 1, 237),
(11, 'CAD/CAM', 'En el servicio odontológico a través del CAD/CAM podemos fabricar coronas, carillas, incrustaciones y prótesis fijas en materiales estéticos sin metal, y si antes tenía que esperar varios días para realizarse una corona por pérdida de un diente, ahora lo puede hacer en pocas horas. Todo este proceso al ser realizado de manera computarizada es un proceso altamente preciso, estandarizado y rápido.', 13, 232),
(12, '', '', 1, 238),
(13, '', '', 1, 239);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_contenido_popup`
--

CREATE TABLE `tb_contenido_popup` (
  `id` int(11) NOT NULL,
  `id_popup` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `parrafo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_contenido_popup`
--

INSERT INTO `tb_contenido_popup` (`id`, `id_popup`, `titulo`, `parrafo`) VALUES
(1, 1, 'Tip1: Blanqueamiento Dental', '<div class=\"texto-popUp5\">Es el tratamiento que se realiza con fines estéticos, para eliminar manchas o coloraciones de los dientes, considerando como parte de una rutina de cuidado y belleza, convirtiéndose en requisito para quienes desean lucir una sonrisa bonita y radiante.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cómo funciona?</br></div>\n<div class=\"texto-popUp5\">Ésta técnica no consiste en un “blanqueamiento” del diente propiamente dicho, sino en un aclaramiento, ya que no se altera el color propio del diente.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Es eficaz para todas las personas?</div>\n<div class=\"texto-popUp5\">La eficacia del tratamiento es proporcional al grado de tinción de los dientes, oscurecidos con el tiempo por sustancias colorantes. El tratamiento resultaría ineficaz, en dientes oscurecidos por alteraciones internas, como ingesta de antibióticos durante la infancia, malformación congénita de esmalte (hipoplasia).</div>\n<div class=\"texto-popUp5\">Es el profesional quien debe determinar que paciente es apto para someterse al tratamiento.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Es doloroso el procedimiento?</div>\n<div class=\"texto-popUp5\">No, solamente hay que dejar trabajar al odontólogo.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Queda sensibilidad después del blanqueamiento?</div>\n<div class=\"texto-popUp5\">Generalmente no. La sensibilidad que aparece es totalmente transitoria, cuando el tratamiento termina en pocos días el diente vuelve a la normalidad.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Con qué frecuencia puedo blanquear los dientes?</div>\n<div class=\"texto-popUp5\">Se puede blanquear perfectamente una vez al año dado que no provoca ningún problema.\nSe sugiere realizar un “retoque” cada dos años o cuando el paciente note un retroceso en los resultados.</div>\n\n<div class=\"titulo-popUp5\"><span></span>Técnicas de Blanqueamiento del COA:</div>\n\n<div class=\"subtitulo-popUp5\">Blanqueamiento a domicilio: (bajo supervisión del profesional)</div>\n<div class=\"texto-popUp5\">Es supervisado por el profesional y administrado por el mismo paciente en su domicilio utilizando cubetas plásticas en las cuales se coloca un gel blanqueador a baja concentración, generalmente usado en la noche, el tratamiento es más largo que la técnica en consultorio.</div>\n\n<div class=\"subtitulo-popUp5\">Blanqueamiento en consultorio:</div>\n<div class=\"texto-popUp5\">El mejor resultado se obtiene mediante el buen diagnóstico del tipo de pigmentación, historia clínica, material blanqueador a utilizar, técnica utilizada adecuadamente y práctica profesional. El blanqueamiento puede ser externo o interno.\nLos sistemas de blanqueamiento actuales son activados una fuente de luz que puede ser halógena, LED, láser o arco de plasma.</div>\n\n\n'),
(2, 1, 'Tip2: Estética Dental', '<div class=\"texto-popUp5\">Es una parte de la odontología destinada al embellecimiento de los dientes; es decir, la finalidad es puramente estética, aunque dentro de cada tratamiento puede existir, además, una función correctiva, para tratar de mejorar la salud bucal.</div>\n<div class=\"titulo-popUp5\"><span></span>La estética en la actualidad.</div>\n<div class=\"texto-popUp5\">Por mucho tiempo la odontología utilizó materiales metálicos para la restauración de dientes cariados. Con estos materiales se devolvía solo su funcionalidad, pero no el aspecto.</div>\n<div class=\"texto-popUp5\">La tecnología actual ha desarrollado materiales que satisfacen las exigencias de dentistas y pacientes, por ser resistentes, durables, biocompatibles y de idéntica apariencia a lo natural.</div>\n<div class=\"texto-popUp5\">La estética dental no solo ofrece la posibilidad de restaurar los dientes cariados con materiales de color del diente, sino también la posibilidad de cambiar la sonrisa, el tamaño, forma y color de los dientes con resultado armónico y agradable.</div>\n<div class=\"titulo-popUp5\"><span></span>¿Cualquiera puede cambiar lo que no le gusta de su sonrisa?</div>\n<div class=\"texto-popUp5\">Con un análisis adecuado todos pueden tener una sonrisa perfecta y dientes más blancos.</div>\n<div class=\"titulo-popUp5\"><span></span>¿Qué tratamientos son necesarios para la mejora de la sonrisa?</div>\n<div class=\"texto-popUp5\">Dependiendo del caso podemos requerir de blanqueamiento dental, carillas de resina o porcelana, cirugía plástica de las encías, prótesis libre de metal, implantes, etc.</div>\n<div class=\"titulo-popUp5\"><span></span>¿Cuánto duran estos tratamientos?</div>\n<div class=\"texto-popUp5\">Al igual que los dientes, la duración depende de cuánto los cuidemos, siempre debemos ir a nuestros controles y tener una buena higiene siguiendo las recomendaciones del dentista.</div>\n<div class=\"titulo-popUp5\"><span></span>¿Son costosos estos tratamientos?</div>\n<div class=\"texto-popUp5\">Si tomamos en cuenta la satisfacción que nos dará poder lucirla y el tiempo del tratamiento, no resulta un precio muy elevado, además de contar con varias formas de financiamiento.</div>\n<div class=\"titulo-popUp5\"><span></span>¿Cualquier dentista puede hacer un cambio de sonrisa?</div>\n<div class=\"texto-popUp5\">Existen profesionales especializados en esta área que serian los más indicados para realizar estos tratamientos.</div>'),
(3, 1, 'Tip3: EXTRACCIÓN DE TERCEROS MOLARES', '<div class=\"titulo-popUp5\"><span></span>¿Cuáles son los terceros molares o muelas de juicio?</div>\n<div class=\"texto-popUp5\">Mucho después de que nuestros dientes de leche han sido reemplazados por los dientes permanentes, comienzan a crecer o erupcionar nuestros terceros molares; un grupo de cuatro dientes permanentes que salen detrás de las muelas desde los doce años. Los terceros molares son llamados de juicio porque generalmente erupcionan entre los 17 y 21 años, cuando alcanzamos la madurez.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Por qué las muelas del juicio causan problemas?</div>\n<div class=\"texto-popUp5\">Las muelas que están saludables y posicionadas adecuadamente pueden ser piezas útiles en la boca. Desafortunadamente esto no es común, hay algunas piezas dentarias que desarrollan problemas y por ello requieren su extracción. Cuando el maxilar no es suficientemente grande como para acomodar a estos dientes, pueden crecer inclinados, erupcionar parcialmente en la encía, o quedarse atrapados entre encía y hueso.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Por qué son extraídas las muelas del juicio?</div>\n<div class=\"texto-popUp5\">La extracción de las muelas del juicio puede proteger la salud en general del resto de la boca. Se recomienda la extracción si:</div>\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Erupcionan parcialmente. Permite el ingreso de las bacterias entre el diente y la encía causando caries e infección de las encías. El resultado puede ser dolor, hinchazón, trismus (inmovilidad mandibular) fiebre y malestar general, etc.)</li>\n<li type=\"disc\">Si están impactadas pueden seguir erupcionando sin suficiente espacio dañando dientes adyacentes.</li>\n<li type=\"disc\">Si por su permanencia en la cavidad oral forman quistes o tumores, que destruyen estructuras cercanas como hueso maxilar y las raíces de dientes próximos.</li>\n</ul></div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Por qué extraer las muelas del juicio?</div>\n<div class=\"texto-popUp5\">Las personas de entre 16 y 19 años deberían hacerse evaluar estos dientes. Si deben ser extraídos, se debe considerar hacerlo antes de los 20 años, donde generalmente pocas complicaciones ocurren. A una edad temprana, las raíces dentarias aún no se han desarrollado completamente, el hueso es más blando, y también hay menos riesgo quirúrgico y generalmente el proceso de cicatrización es más rápido.</div>\n\n<div class=\"texto-popUp5\">Las extracciones de terceros molares pueden ser realizadas por odontólogos generales. Si su odontólogo le anticipa que necesitará un cuidado especial, se le referirá un especialista cirujano oral y máxilo facial.</div>\n\n<div class=\"texto-popUp5\">Es importante saber que el procedimiento toma normalmente una hora y de que usted necesitará reposar dos o tres días del trabajo.</div>'),
(4, 1, 'Tip4: Halitosis - Mal Aliento', '<div class=\"titulo-popUp5\"><span></span>¿Qué es la halitosis?</div>\n<div class=\"texto-popUp5\">La halitosis o mal aliento, es un problema común de mal olor que se expele desde la cavidad bucal. Se calcula que afecta a hasta un 50% de la población, con grados variables de intensidad.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué origina la halitosis?</div>\n<div class=\"texto-popUp5\">Es causada por diversos factores intra y extrabucales, como enfermedades sistemáticas y trastornos del tubo digestivo y/o vías respiratorias. Si la halitosis se origina en la boca se habla de halitosis de origen bucal, que suele estar causada por el metabolismo de las bacterias de la lengua, saliva o la placa dental. Comúnmente las caries y una mala higiene bucal es causa principal de mal aliento.</div>\n\n<div class=\"titulo-popUp5\"><span></span>Recomendaciones que ayudarán a esta situación</div>\n<div class=\"texto-popUp5\">Las estrategias de control del mal aliento más eficaces se centran en la correcta limpieza de los dientes y de la lengua y en la prevención de la gingivitis, periodontitis y caries, por ello recomendamos:\n<div class=\"texto-cuerpo2\">\n<ul>\n<li type=\"disc\">Realizar una limpieza bucal exhaustiva después de cada comida.</li>\n<li type=\"disc\">Limpiar la lengua, con cepillo dental.</li>\n<li type=\"disc\">Realizar visitas periódicas al dentista.</li>\n<li type=\"disc\">Evitar el stress y comer despacio, masticar bien los alimentos.</li>\n<li type=\"disc\">Beber abundante agua.</li>\n<li type=\"disc\">Mantener una alimentación adecuada, balanceada.</li>\n</ul></div>\n</div>\n\n<div class=\"titulo-cuerpo\" style=\"width:100%; margin-bottom:10px;\">PERIODONCIA</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué es la periodoncia?</div>\n<div class=\"texto-popUp5\">Es la especialidad de la odontología que estudia la prevención, diagnóstico y tratamiento de las enfermedades y condiciones que afectan el periodonto o que dan soporte a los dientes.\nLas enfermedades más frecuentes relacionadas con la Periodoncia don la gingivitis y la periodontitis.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué es la gingivitis?</div>\n<div class=\"texto-popUp5\">Es la inflamación de los tejidos de la encía de hueso alrededor del diente. Se desarrolla a partir de una gingivitis.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué es la periodontitis?</div>\n<div class=\"texto-popUp5\">Es la infección progresiva y pérdida de hueso alrededor del diente. Se desarrolla a partir de una gingivitis.</div>\n\n<div class=\"titulo-popUp5\"  style=\"width:100%;\"><span></span>¿Cuáles son los signos de la enfermedad periodontal?</div>\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Las encías sangran al cepillarse los dientes.</li>\n<li type=\"disc\">Encías rojas, inflamadas o dolorosas.</li>\n<li type=\"disc\">Crecimiento o alargamiento de sus dientes.</li>\n<li type=\"disc\">Mal aliento persistente.</li>\n<li type=\"disc\">Pus entre los dientes y las encías.</li>\n<li type=\"disc\">Dientes móviles o que se estén separando.</li>\n<li type=\"disc\">Cambios en su mordida.</li>\n<li type=\"disc\">Cambios en la adaptación de las dentaduras parciales.</li>\n</div></ul>\n\n<div class=\"titulo-popUp5\"><span></span>Otros factores que pueden contribuir a la periodontitis</div>\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Hábito de fumar.</li>\n<li type=\"disc\">Diabetes, pues existe mayor predisposición a la infección.</li>\n<li type=\"disc\">Embarazo, debido a los cambios hormonales.</li>\n</div></ul>'),
(5, 1, 'Tip5: Ortodoncia', '<div class=\"titulo-popUp5\"><span></span>¿Por qué es tan importante la posición de los dientes?</div>\n<div class=\"texto-popUp5\">La mala posición de los dientes no permite una buena masticación, ocasionando problemas en la digestión.</br>\nLa correcta posición de los maxilares y dientes permiten tener:\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Una excelente higiene bucal</li>\n<li type=\"disc\">Un perfil armónico</li>\n<li type=\"disc\">Una sonrisa agradable</li>\n</ul></div>\nExhibir dientes bien alineados, evita complejos y permite que la persona gane seguridad en sí misma.</br>\nLucir confiado al sonreír, es un signo importante de salud y de comunicación personal y social.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué es la ortodoncia?</div>\n<div class=\"texto-popUp5\">La ortodoncia es la especialidad de la odontología que se encarga de solucionar los problemas de mal posición de los dientes (maloclusión), mediante el uso de dispositivos especiales cuyo empleo permite ubicar los dientes en la posición correcta.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cómo se originan las maloclusiones?</div>\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Por falta de desarrollo de los maxilares.</li>\n<li type=\"disc\">Por incompatibilidad entre el tamaño tanto de los maxilares como de los dientes.</li>\n<li type=\"disc\">Pérdida temprana de los dientes de leche, que genera la pérdida de espacio necesario para los dientes permanentes.</li>\n<li type=\"disc\">Hábitos nocivos, como la succión de los dedos y la respiración bucal.</li>\n</ul>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cuándo iniciar un tratamiento de ortodoncia?</div>\n<div class=\"texto-popUp5\">Este tratamiento no tiene relación con la edad del paciente. Cuando se inicia el cambio de dentición decidua (leche) a dentición permanente (definitivos), es el momento más apropiado para recibirlo. Los adultos también pueden recibir un tratamiento ortodóntico  adecuado pero con algunas limitaciones propias de la edad.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué busca este tratamiento?</div>\n<div class=\"texto-popUp5\">El propósito de todo tratamiento ortodóntico es corregir las malas posiciones o malformaciones dentarias con el fin de mejorar la función masticatoria, posibilitar una eficiente higiene oral y agregar armonía y belleza a la dentadura.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿El tratamiento es doloroso?</div>\n<div class=\"texto-popUp5\">No, por el contrario; es común ver hoy en día a niños, adolescentes y adultos con brackets o aparatos extraorales.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cuánto tiempo demora el tratamiento?</div>\n<div class=\"texto-popUp5\">Dependiendo de la severidad de cada caso, puede durar uno, dos y tres años.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué se necesita para tratar las maloclusiones?</div>\n<div class=\"texto-popUp5\">Un diagnóstico y un plan de tratamiento realizado por un especialista en ortodoncia.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué ofrece el servicio de ortodoncia del Centro Odontológico Americano COA para este tratamiento?</div>\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Profesionales especialistas post-graduados.</li>\n<li type=\"disc\">Precios especiales y financiamiento que permite pagos en cuotas mensuales al alcance del paciente.</li>\n<li type=\"disc\">Adecuada infraestructura y tecnología.</li>\n</ul></div>\n<div class=\"texto-popUp5\">Alternativas según sus posibilidades.</div>\n<div class=\"texto-cuerpo2\"><ul>\n<li type=\"disc\">Brackets cosméticos o estéticos.</li>\n<li type=\"disc\">Bracktes metálicos.</li>\n</ul></div>'),
(6, 1, 'Tip6: Sellantes - Fluor', '<div class=\"titulo-popUp5\"><span></span>¿Qué son los sellantes?</div>\n<div class=\"texto-popUp5\">Es material preventivo de consistencia fluida que libera flúor y se colocan cubriendo las fosas y fisuras de la pieza dentaria.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cómo actúa el sellante?</div>\n<div class=\"texto-popUp5\">Evita que los restos de comida y las bacterias se instalen en las ranuras de las muelas, permitiendo una mejor higiene en las superficies tratadas.</div>\n<div class=\"texto-popUp5\">Previene la producción de caries, en los dientes de los niños.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cada cuánto tiempo se deben controlar los sellantes?</div>\n<div class=\"texto-popUp5\">Se controlan según el riesgo de caries. Se evalúa el buen estado de ellos, cada caso es único existen indicaciones específicas que el profesional dará a conocer a los padres.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿A qué edad se aplican los sellantes?</div>\n<div class=\"texto-popUp5\">Los sellantes se colocan cuando el niño es lo  suficientemente colaborador como para permitir su colocación, esto es aproximadamente a partir de los tres años.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Quién debe aplicar los sellantes?</div>\n<div class=\"texto-popUp5\">Lo aplica el odontopediatra, si se trata de un adulto lo realiza su odontólogo tratante.</div>\n\n<div class=\"titulo-cuerpo\" style=\"width:100%; margin-bottom:10px;\">FLÚOR</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Qué es flúor?</div>\n<div class=\"texto-popUp5\">Es un gel que ha demostrado ser efectivo en la prevención de caries dental y su utilización en la dosis  adecuada no tiene efectos perjudiciales para la salud.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cómo actúa el flúor?</div>\n<div class=\"texto-popUp5\">Cuando se aplica flúor en los dientes la estructura dentaria se mineraliza y fortalece aumentando la resistencia del diente al ataque de la caries.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Cada cuánto tiempo se aplica y a qué edad?</div>\n<div class=\"texto-popUp5\">La aplicación del flúor depende del riesgo de caries y como mínimo debe hacerse cada seis meses en pacientes de bajo riesgo de caries. Se aplica a partir de los dos años.</div>\n\n<div class=\"titulo-popUp5\"><span></span>¿Quién debe aplicar el flúor?</div>\n<div class=\"texto-popUp5\">Lo determina el odontopediatra, por consiguiente, es importante su recomendación para iniciar su uso.</div>\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_director`
--

CREATE TABLE `tb_director` (
  `id_doctor` int(11) NOT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_director`
--

INSERT INTO `tb_director` (`id_doctor`, `id_sede`) VALUES
(41, 1),
(717, 2),
(198, 3),
(154, 4),
(204, 5),
(216, 6),
(69, 7),
(529, 8),
(118, 9),
(91, 10),
(656, 11),
(156, 12),
(136, 13),
(574, 15),
(701, 16),
(123, 17),
(105, 18),
(178, 19),
(271, 20),
(220, 22),
(230, 24),
(710, 25),
(247, 26),
(744, 27),
(281, 28),
(279, 29),
(293, 30),
(228, 31),
(256, 32),
(253, 33),
(670, 34),
(747, 35),
(240, 36),
(285, 37),
(151, 42),
(762, 43),
(487, 46),
(561, 47),
(682, 48),
(689, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_distrito`
--

CREATE TABLE `tb_distrito` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_distrito`
--

INSERT INTO `tb_distrito` (`id`, `nombre`) VALUES
(1, 'Distrito 1'),
(2, 'Distrito 2'),
(3, 'Distrito 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_doctor`
--

CREATE TABLE `tb_doctor` (
  `id` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `paterno` varchar(30) NOT NULL,
  `materno` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cop` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `id_sexo` int(11) NOT NULL,
  `rne` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_doctor`
--

INSERT INTO `tb_doctor` (`id`, `id_sede`, `paterno`, `materno`, `nombre`, `cop`, `id_especialidad`, `id_sexo`, `rne`) VALUES
(1, 1, 'ALABA', 'CASTAÑEDA', 'WESLEY', 18715, 1, 1, ''),
(2, 1, 'ALFARO', 'SHIGUETO', 'HOWARD', 9108, 1, 1, ''),
(3, 1, 'ANGELES', 'SOTELO', 'MILAGROS ELISA', 17832, 1, 2, ''),
(5, 1, 'ARROYO', 'RONCAL', 'FRANCISCO JAVIER', 8233, 1, 1, '0220'),
(6, 1, 'AZULA', 'WONG', 'ERIKA', 10360, 1, 2, ''),
(7, 1, 'AZULA', 'WONG', 'SHIRLEY', 13872, 1, 2, ''),
(10, 1, 'CORONEL', 'AMADO', 'MANUEL', 5187, 1, 1, ''),
(11, 1, 'CAMPANA', 'MEDINA ', 'LUIS', 11915, 1, 1, ''),
(12, 1, 'CRIBILLERO', 'DE PINHO', 'ROSSANA MARLENE', 10262, 1, 2, ''),
(13, 1, 'DOMINGUEZ', 'ESTRADA', 'MARTIN', 5058, 1, 1, ''),
(15, 1, 'FERNANDEZ ', 'CASTILLO', 'JULIO IVAN', 14162, 1, 1, ''),
(16, 1, 'FERNANDEZ', 'TORRES', 'CAROLA', 10924, 1, 2, ''),
(17, 1, 'FLORES', 'MENA', 'GABRIEL', 5389, 1, 1, ''),
(18, 1, 'GYGLI', 'REINA', 'WALTER', 11325, 1, 1, ''),
(21, 1, 'LANFRANCO', 'LEON', 'ALFREDO', 19510, 1, 1, ''),
(22, 1, 'LLERENA', 'PEREZ', 'LOURDES', 15877, 1, 2, '2232'),
(23, 1, 'MANRIQUE', 'CHAVEZ', 'CAROLINA', 19300, 1, 2, ''),
(25, 1, 'MARQUEZ', 'MENDOZA', 'ALEXIS', 10819, 1, 1, ''),
(26, 1, 'ORTIZ', 'PALOMINO', 'LUIS ALEJANDRO', 16797, 1, 1, ''),
(27, 1, 'OLIVERA', 'MADGE', 'LUIS ENRIQUE', 20232, 1, 1, ''),
(28, 1, 'PIAGGIO', 'BRAVO', 'LUIS', 8250, 9, 1, '0463'),
(30, 1, 'RAGGIO', 'BENAVIDES', 'LUIS', 15456, 1, 1, ''),
(33, 1, 'SALAZAR', 'GARCIA', 'JAVIER FRANCISCO', 1693, 1, 1, ''),
(36, 1, 'SCARAFONE', 'ALVIS', 'GERSON GIANCARLO', 24119, 1, 1, ''),
(38, 1, 'TAFUR', 'JIMENEZ', 'LUIS', 13240, 1, 1, ''),
(41, 1, 'VIVES', 'BARRETO', 'VICTOR HUGO', 5177, 1, 1, ''),
(43, 1, 'ZUIKO', 'FELIX', 'ALFREDO', 15895, 12, 1, '0402'),
(67, 7, 'CASTRO', 'REJAS', 'MARIA CECILIA', 8980, 14, 2, '2446'),
(68, 7, 'ESTRADA', 'SUAREZ', 'DANTE MARTIN', 35581, 1, 1, '2373'),
(69, 7, 'DELGADO', 'AZAÑERO', 'WILSON ALEJANDRO', 418, 16, 1, ''),
(70, 7, 'DELGADO', 'BRAVO', 'IRMA SOFIA', 13422, 1, 2, ''),
(71, 7, 'DELGADO', 'BRAVO', 'MIGUEL SEBASTIAN', 14924, 17, 1, '0608'),
(72, 7, 'FERNANDEZ', 'JACINTO ', 'LEILA MARITZA', 9408, 1, 2, ''),
(73, 7, 'FRANCO', 'ROSADO', 'RODRIGO SANTIAGO', 13302, 1, 1, ''),
(74, 7, 'GONZALES', 'VEGA', 'ERIKA MILUSKA', 14923, 14, 2, '0686'),
(76, 7, 'PIAGGIO', 'BRAVO', 'LUIS', 8250, 9, 1, '0463'),
(77, 7, 'RIOS ', 'DIAZ', 'ROCIO ', 9434, 1, 2, ''),
(78, 7, 'RIVAS', 'URBINA', 'SAMANTHA GISELLA', 12302, 13, 2, '0233'),
(79, 7, 'LUNA', 'HUANAY', 'AUGUSTO', 16776, 22, 1, '0803'),
(80, 7, 'TAFUR', 'TAFUR', 'ALY MICHEL', 10064, 14, 1, '0078'),
(84, 10, 'VALDIVIA', 'APARICIO', 'JUAN CARLOS', 12430, 1, 1, ''),
(85, 10, 'GALLEGOS', 'ALIAGA', 'HELEN', 14525, 7, 2, '2007'),
(87, 10, 'MORALES', 'SABOGAL', 'JOSÉ IGNACIO', 12436, 1, 1, ''),
(88, 10, 'NOVORIKAWA', 'YSHIKAWA', 'ERIKA', 15850, 1, 2, ''),
(89, 10, 'QUINTANA', 'SILVA', 'JANINE', 17260, 1, 2, ''),
(91, 10, 'SERRANO', 'ONTANEDA', 'DANIEL', 9712, 1, 1, ''),
(92, 10, 'RIOS', 'QUIMPER', 'ALBERTO RAFAEL', 14827, 14, 1, '1083'),
(96, 15, 'PAZ', 'MAYURI', 'CARLOS  ALBERTO', 6218, 1, 1, ''),
(98, 15, 'TELLO', 'QUISPE', 'JOEL ANTONIO', 28714, 13, 1, '1964'),
(99, 15, 'YAURI', 'HUILCA', 'CARMEN', 5066, 1, 2, ''),
(100, 18, 'ANCHANTE', 'ORTEGA', 'EDUARDO ANDRES', 25014, 14, 1, '1393'),
(102, 18, 'CUSMA', 'ORTIZ', 'JULIA ARACELY', 25322, 13, 2, '1950'),
(105, 18, 'GRANDA', 'OYARCE', 'GLADYS ROCIO', 12692, 1, 2, ''),
(107, 18, 'LIZARZABURU', 'SALHUANA', 'ARMANDO HUGO', 25632, 1, 1, ''),
(108, 18, 'MALCA', 'MEDRANO', 'KARLHA VANESSA', 25263, 1, 2, ''),
(109, 18, 'MARTINEZ', 'RIOS', 'JACKELINE ELIZABETH', 27810, 1, 2, ''),
(116, 9, 'CORDOVA', 'SOSA', 'FELIX ENRIQUE', 14573, 1, 1, ''),
(118, 9, 'LOPEZ', 'MEDINA', 'JAIME MAXIMO', 9029, 1, 1, ''),
(121, 17, 'ARTEAGA ', 'PALOMARES', 'ELIANA', 23208, 1, 2, ''),
(122, 17, 'ARTEAGA', 'PALOMARES', 'YOVANA', 16372, 1, 2, ''),
(123, 17, 'BRAVO', 'MARTINEZ', 'ERICK ALBERTO', 9495, 1, 1, ''),
(132, 13, 'BARRIGA', 'CORNEJO', 'MARIA ISABEL', 14510, 1, 2, ''),
(133, 13, 'CABRERA', 'MATTA', 'AILIN ROSARIO', 14628, 1, 2, ''),
(134, 13, 'CORREA', 'QUISPILAYA', 'EMILIO', 24519, 1, 1, ''),
(135, 13, 'ESPEJO', 'PASCUAL', 'CARLOS', 18014, 1, 1, ''),
(136, 13, 'ESPEJO', 'PASCUAL', 'FRITZ ARMANDO', 12026, 1, 1, ''),
(138, 13, 'GUTIERREZ', 'PATIÑO-PAUL', 'ALEJANDRO', 7350, 1, 1, '0115'),
(139, 13, 'SAENZ', 'DONAYRE', 'SILVIA GABRIELA', 21355, 1, 2, ''),
(140, 13, 'WILLIAMS ', 'ALBITES', 'FREDDIE DAVID', 16043, 1, 1, ''),
(143, 42, 'CABELLOS', 'AGUILAR', 'ARACELI', 14647, 1, 2, ''),
(147, 42, 'PUENTE ', 'SAAVEDRA', 'SUSY DEL CARMEN', 21742, 1, 2, ''),
(148, 42, 'SALDARRIAGA', 'OLORTIGA', 'CHRISTIAN', 18712, 1, 1, ''),
(149, 42, 'AGUIRRE', 'SILVA', 'PAOLA', 15328, 1, 2, ''),
(150, 42, 'SEMINARIO', 'LINARES', 'PAOLA CARMEN', 8636, 13, 2, '0070'),
(151, 42, 'SEMINARIO', 'LINARES', 'ROBERTO', 12341, 1, 1, ''),
(152, 42, 'SEMINARIO ', 'RAYGADA', 'ANSELMO ROBERTO', 229, 1, 1, ''),
(153, 4, 'ANCHANTE', 'ORTEGA', 'EDUARDO ANDRES', 25014, 14, 1, '1393'),
(154, 4, 'DURAND', 'LAZO', 'STUARDO MILKO', 21822, 1, 1, ''),
(156, 4, 'LOAYZA', 'TELLO', 'VANESSA', 20170, 1, 2, ''),
(160, 4, 'SALVADOR', 'LUJAN', 'MARITA', 16421, 1, 2, ''),
(170, 8, 'RABANAL', 'VALDIVIA', 'PAMELA DEL CARMEN', 25035, 14, 2, '1468'),
(176, 19, 'AREVALO', 'MC CUBBIN', 'LUIS DANIEL', 19642, 7, 1, '1731'),
(178, 19, 'DEL CAMPO', 'GONZÁLEZ', 'WILLY ALBERTO', 7471, 17, 1, '1712'),
(180, 11, 'ELIAS', 'CORNOCK', 'RUDY', 21427, 1, 1, ''),
(182, 11, 'GUTIERREZ', 'PALACIOS', 'RODOLFO', 15322, 1, 1, ''),
(184, 11, 'HUAMAN', 'ESPINOZA', 'RUTH ESTHER', 22009, 1, 2, ''),
(193, 43, 'MELGAR', 'BISETTI', 'RENATO', 19738, 1, 1, ''),
(198, 3, 'FERNANDEZ ', 'CASTILLO', 'JULIO', 14162, 1, 1, ''),
(202, 3, 'FLORES', 'RICARDI', 'GABRIEL PEDRO', 26784, 14, 1, '2188'),
(203, 5, 'CUSMA', 'ORTIZ', 'JULIA ARACELLY', 25322, 13, 2, '1952'),
(204, 5, 'EGUIZABAL', 'AMES', 'MARLY ADITH', 21535, 1, 2, ''),
(206, 5, 'VÁSQUEZ', 'SUICA', 'JUAN MANUEL', 22045, 9, 1, '1750'),
(208, 6, 'AREVALO', 'MC CUBBIN', 'LUIS DANIEL', 19642, 7, 1, '1731'),
(210, 6, 'BERNAL', 'SANTOLALLA', 'GONZALO ABRAHAN', 22256, 1, 1, ''),
(212, 6, 'DEL AGUILA', 'BONDI', 'MANUEL CARLOS', 24464, 4, 1, '2340'),
(216, 6, 'ROCA', 'MATTOS', 'ALEJANDRA ZAIDA', 23568, 1, 2, ''),
(219, 22, 'MENESES', 'LÓPEZ', 'ABRAHAM', 5673, 14, 1, '0014'),
(220, 22, 'PONCE DE LEON', 'MOLINA', 'SANDRA CECILIA', 17145, 1, 2, ''),
(225, 31, 'CLAVO', 'PINEDA', 'SHYRLEY STHEFANY', 28152, 1, 2, ''),
(228, 31, 'LOPEZ', 'MONTOYA', 'HENRY', 10609, 1, 1, ''),
(229, 31, 'RAYMUNDO ', 'CALERO', 'JULIO', 11811, 14, 1, '0079'),
(230, 24, 'ALVAREZ', 'CHUPILLON', 'HUGO ANTONIO', 30466, 1, 1, ''),
(231, 24, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0868'),
(236, 36, 'CABALLERO', 'BURGA', 'KARLA PAMELA', 22521, 1, 2, ''),
(237, 36, 'ASCURRA', 'FRANCIA', 'LILIANA ISABEL', 25465, 22, 2, '1804'),
(239, 36, 'RAYMUNDO', 'CALERO', 'JULIO', 11811, 14, 1, '0079'),
(240, 36, 'UBILLUS', 'OSHIRO', 'CARLOS TOSHIO', 24531, 1, 1, ''),
(241, 27, 'FLORES', 'RICARDI', 'GABRIEL', 26784, 14, 1, '2188'),
(245, 26, 'GUILLEN', 'YACHAS', 'ELMER JHONNY', 14951, 14, 1, '2155'),
(247, 26, 'RODRIGUEZ', 'VEGA', 'GABRIELA PIEDAD', 16475, 1, 2, ''),
(249, 25, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0868'),
(251, 11, 'MOLERO', 'CHENETT', 'FRANCO LUIS', 19284, 1, 1, ''),
(252, 25, 'PACHECO', 'ZELA', 'WILLIAM VICTOR', 22050, 1, 1, ''),
(253, 33, 'CHAVEZ', 'ENRIQUEZ', 'CECILIA ISABEL', 8294, 13, 2, '0067'),
(255, 33, 'RAMIREZ', 'YERBA', 'ROLANDO RUFO', 8293, 1, 1, '2298'),
(256, 32, 'BARDALEZ', 'DAZA', 'EMERSON', 9530, 1, 1, ''),
(257, 32, 'SALINAS', 'CALDAS', 'PEDRO', 16185, 1, 1, '477'),
(262, 20, 'CAMACHO', 'OVIEDO', 'GABRIEL', 18813, 14, 1, '1756'),
(263, 20, 'CASTELLANOS', 'APAZA', 'ANALI MILENE', 18802, 1, 2, ''),
(271, 20, 'ROJAS', 'VALENZUELA', 'CHRISTIAN VICENTE', 7686, 1, 1, ''),
(276, 20, 'ZEGARRA', 'HUERTA', 'GRACIELA', 14799, 13, 2, '1454'),
(277, 29, 'CHAVEZ', 'ENRIQUEZ', 'CECILIA ISABEL', 8294, 13, 2, '0067'),
(279, 29, 'RAMIREZ', 'YERBA', 'ROLANDO RUFO', 8293, 1, 1, '2298'),
(280, 28, 'RABANAL', 'VALDIVIA', 'PAMELA DEL CARMEN', 25035, 14, 2, '1468'),
(281, 28, 'MUÑOZ', 'PEREDA', 'DELIA DEL PILAR', 32688, 1, 2, ''),
(285, 37, 'HIDALGO ', 'OYOLA', 'KATTY CECILIA', 20297, 1, 2, ''),
(292, 30, 'BENAVENTE', 'JIMÉNEZ', 'VANESSA PAMELA', 15556, 14, 2, '0741'),
(293, 30, 'CÁCERES', 'ARRIETA', 'JESÚS ANTONIO', 9778, 1, 1, ''),
(302, 36, 'PONCE DE LEON', 'DIAZ', 'CARLOS MARCELO', 25749, 7, 1, '1349'),
(306, 6, 'RABANAL', 'VALDIVIA', 'PAMELA DEL CARMEN', 25035, 14, 2, '1468'),
(314, 43, 'OQUENDO', 'SOLIS', 'LUCIANA', 32199, 1, 2, ''),
(332, 16, 'RABANAL', 'VALDIVIA', 'PAMELA DEL CARMEN', 25035, 14, 2, '1468'),
(339, 4, 'SILVA', 'ARONI', 'CARLOS ALBERTO', 13287, 17, 1, '2328'),
(340, 42, 'CARRION', 'MAURICIO', 'LIZETH KATHERYN', 18191, 12, 1, '0394'),
(341, 42, 'NAPA', 'RAMOS', 'ROSARIO', 25069, 1, 2, ''),
(343, 42, 'PAREDES', 'GOMEZ', 'THAIS', 19648, 1, 2, ''),
(344, 42, 'SEMINARIO', 'LINARES', 'VICTOR', 7847, 1, 1, ''),
(347, 42, 'TABOADA', 'VILLANUEVA', 'CLAUDIA', 25073, 1, 2, ''),
(361, 10, 'VASQUEZ', 'SUICA', 'JUAN', 22645, 4, 1, '1750'),
(367, 1, 'PIÑA', 'CARDENAS', 'JORGE LUIS', 13806, 1, 1, ''),
(371, 10, 'CAHUANA', 'TORRES', 'MAYDITH', 21209, 1, 2, ''),
(373, 10, 'VIRHUEZ', 'BARREDA', 'CARLA', 16420, 1, 2, ''),
(376, 18, 'PERALES', 'FLORES', 'VICTOR MANUEL', 16440, 1, 1, ''),
(383, 4, 'VASQUEZ', 'SUICA', 'JUAN MANUEL', 22045, 9, 1, '1750'),
(402, 31, 'ADRIANZEN', 'PERALTA', 'JOSE AGUSTIN', 3461, 1, 1, ''),
(406, 36, 'CABRERA', 'CELIS', 'KAREN DENISSE', 26883, 1, 2, ''),
(411, 20, 'CUBA', 'VEGA', 'MELISSA ALEJANDRA', 3236, 1, 2, ''),
(412, 20, 'CHAVEZ', 'ALVAREZ', 'JUAN CARLOS', 29946, 1, 1, ''),
(414, 20, 'ORELLANA', 'RAMIREZ', 'PAMELA DEL CARMEN', 24120, 1, 2, ''),
(416, 28, 'ALVAREZ', 'MAIHUIRE', 'JUAN ENRIQUE', 32579, 1, 1, ''),
(423, 1, 'ALMEIDA', 'RUIZ', 'CLAUDIA', 28049, 1, 2, ''),
(425, 1, 'AYRES', 'TORANZO', 'ANDREA', 28240, 1, 2, ''),
(426, 10, 'RIOS', 'CARPIO', 'ALFONSO ENRIQUE', 15601, 1, 1, ''),
(429, 9, 'MEZA', 'ESTELA', 'MARIELLA DEL CARMEN', 31709, 4, 2, '2374'),
(430, 9, 'SANTOS', 'SALAS', 'CECILIA PIA', 31076, 1, 2, ''),
(445, 43, 'AREVALO', 'MC CUBEN', 'LUIS DANIEL', 19642, 7, 1, '1731'),
(460, 22, 'REVILLA', 'MOGROVEJO', 'EDWIN ALEXANDER', 24932, 1, 1, ''),
(462, 22, 'SALAZAR', 'LUNA', 'GIANCARLO', 19023, 1, 1, ''),
(468, 24, 'MADRID', 'MENDOZA', 'ANA LUCIA', 31795, 1, 2, ''),
(469, 27, 'MAQUICHE', 'YESQUEN', 'JOSE CRISTIAN', 28639, 1, 1, ''),
(470, 26, 'CASTILLO', 'QUINTEROS', 'DIEGO MANUEL', 28955, 1, 1, ''),
(471, 26, 'PALOMINO', 'ESPINOZA', 'ALVARO GONZALO', 28404, 1, 1, ''),
(473, 20, 'EDUARDO', 'ALVAREZ', 'JESSICA VANESA', 31333, 1, 2, ''),
(487, 46, 'CHAU', 'MURGA', 'IVETTE VANESSA', 10592, 1, 2, ''),
(488, 46, 'TANG', 'BUSTAMANTE', 'CHRISTIAM BRUCE', 10690, 1, 1, ''),
(497, 1, 'MARCHANI', 'MARQUEZ', 'MILUZKA', 7224, 1, 2, ''),
(506, 7, 'GUILLEN', 'ASTETE', 'ANTONIO', 12799, 1, 2, ''),
(509, 10, 'MILLA', 'TORRES', 'DANIELA', 33152, 1, 2, ''),
(512, 10, 'SILVA', 'BIZARRETA', 'DALISA LISETH', 37795, 1, 2, ''),
(515, 15, 'ARONE', 'QUISPE', 'VICTOR RAUL', 26783, 1, 1, ''),
(519, 16, 'CERPA', 'SILVA', 'MARCO AURELIO', 11629, 1, 1, ''),
(520, 16, 'GALLEGOS ', 'VILLAVICENCIO', 'DIANA DESIREE', 16604, 1, 2, ''),
(524, 16, 'VILLA', 'SALAMANCA', 'REYNA ROSARIO', 22598, 1, 2, ''),
(528, 8, 'ROBLES', 'APAC', 'RODRIGO EDGARDO', 25036, 12, 1, '1706'),
(529, 8, 'TERRY', 'REYES', 'GABRIELA ALEJANDRA', 28105, 1, 2, ''),
(536, 43, 'MALDONADO', 'NEGRILLO', 'KATHERINE', 28790, 1, 2, ''),
(537, 43, 'VINATEA', 'HUALPA', 'ALFONSO', 24657, 4, 1, '2112'),
(543, 6, 'LOAYZA', 'TELLO', 'VANESSA', 20170, 1, 2, ''),
(544, 46, 'PINTO', 'MIRANDA', 'CARLA GABRIELA', 25677, 1, 2, ''),
(546, 31, 'PORTUGAL', 'ALFARO', 'BRENDA ALEXANDRA', 31243, 1, 2, ''),
(547, 24, 'SANTILLANA', 'CHAVEZ', 'HAROL AARON', 26351, 1, 1, ''),
(548, 24, 'SAMILLAN', 'ARBULU', 'RANDY', 38384, 1, 1, ''),
(553, 25, 'ALEGRIA', 'VALENCIA', 'SANTIAGO CIRO', 20006, 22, 1, '2454'),
(555, 20, 'VALDIVIA', 'VALERO', 'PATRICIA ROXANA', 14943, 1, 2, ''),
(560, 35, 'FLORES', 'RICARDI', 'GABRIEL', 26784, 14, 1, '2188'),
(561, 47, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0868'),
(562, 47, 'CHAVEZ', 'ALVAREZ', 'CLAUDIA', 13444, 1, 2, ''),
(563, 47, 'VALDIVIA', 'CALDERON', 'LUZ GALAXY', 13947, 22, 2, '0733'),
(564, 47, 'MUNGI', 'CASTAÑEDA', 'SABINA', 13677, 1, 2, ''),
(566, 47, 'CORNEJO', 'FLORES', 'HEYDI', 32023, 1, 2, ''),
(568, 32, 'DIESTRE', 'RIOS', 'JONATHAN JAVIER', 30113, 13, 1, ''),
(570, 1, 'ROJAS', 'AMADO', 'MARITZA', 4553, 1, 2, ''),
(571, 1, 'SANTOS', 'SALAS', 'ELENA', 26850, 1, 2, ''),
(574, 15, 'JIMENEZ', 'FLORES', 'VICTOR HUGO', 22503, 1, 1, ''),
(575, 15, 'TORRES', 'QUIJANO', 'CARLOS', 39690, 1, 1, ''),
(576, 18, 'TEJEDA', 'SEMINARIO', 'ALEJANDRA MARIA', 36902, 1, 2, ''),
(577, 18, 'SILVA', 'ARONI', 'CARLOS', 23287, 4, 1, '2328'),
(580, 9, 'SILVA', 'ALBIZURI', 'CESAR', 18550, 14, 1, '0763'),
(581, 9, 'ALARCON', 'CALLE', 'CATHERINE SHARLOT', 34729, 1, 2, ''),
(588, 16, 'ALARCON', 'CALLE', 'CATHERINE SHARLOT', 34729, 1, 2, ''),
(590, 16, 'SILVA', 'ALBIZURU', 'CESAR', 18550, 14, 1, '0763'),
(594, 19, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0868'),
(597, 43, 'SILVA', 'ALBIZURI', 'CESAR', 18550, 14, 1, '0763'),
(598, 43, 'TEJEDA', 'SEMINARIO', 'ALEJANDRA MARIA', 36902, 1, 2, ''),
(601, 3, 'PIAGGIO', 'BRAVO', 'LUIS', 8250, 9, 1, '0463'),
(602, 3, 'VALLADOLID', 'ARRASCUE', 'EVELYN', 28378, 1, 2, ''),
(606, 6, 'CARPIO', 'CONTRERAS', 'ANGELITA', 30470, 14, 2, '2508'),
(607, 6, 'PISCO', 'LLATA', 'RICARDO', 33595, 1, 1, ''),
(608, 22, 'ARROYO', 'RONCAL', 'JAVIER', 8233, 12, 1, '0220'),
(609, 31, 'CARRION', 'SALAZAR', 'SHIRLEY', 34994, 1, 2, ''),
(610, 24, 'MALQUICHAGUA', 'VERAMENDI', 'CYNTHIA', 32327, 1, 2, ''),
(611, 24, 'SERRANO', 'ARRASCO', 'KAREN LIZETH', 31616, 1, 2, ''),
(617, 20, 'CARPIO', 'RODRIGUEZ', 'DEBORAH CHRIS', 25913, 1, 2, ''),
(618, 20, 'ZELADA', 'LADRON DE GUEVARA', 'CINTHYA', 18395, 22, 2, '2379'),
(619, 20, 'ZEA', 'PALMA', 'DAVID', 29510, 1, 1, ''),
(620, 35, 'VALLADOLID', 'ARRASCUE', 'EVELYN', 28378, 1, 2, ''),
(622, 42, 'ECHEVARRIA', 'ARNILLAS', 'EDUARDO', 24526, 1, 1, ''),
(623, 42, 'MAQUICHE', 'YESQUEN', 'JOSE CRISTIAN', 28639, 1, 1, ''),
(624, 42, 'APOLAYA', 'SOTELO', 'JOSE ABRAHAM', 23419, 1, 1, ''),
(625, 42, 'CHENG', 'ABUSABAL', 'LIZBETH', 22215, 1, 2, ''),
(627, 1, 'SANTOS', 'ESCALANTE', 'CLAVER', 6280, 1, 1, ''),
(630, 7, 'MACHADO', 'TORRES', 'SANDRA JULISSA', 22982, 1, 2, ''),
(631, 7, 'QUIROZ', 'TORRES', 'JENNIFER MIRIAM', 26793, 13, 2, '1551'),
(633, 10, 'SERVELLON', 'LIZARBE', 'ALEX SAUL', 12695, 1, 1, ''),
(635, 15, 'CRESPO', 'MARTELLO', 'DANIEL', 35671, 1, 1, ''),
(637, 9, 'FAUSTINO', 'CIPRIANO', 'ELIZABETH', 28345, 1, 2, ''),
(642, 13, 'CHIPANA', 'HERQUIMIO', 'CINTHYA RUTH', 21356, 13, 2, '1180'),
(647, 19, 'PINTO ', 'MIRANDA', 'CARLA GABRIELA', 10690, 1, 2, ''),
(648, 19, 'JIMENEZ', 'SALAS', 'JUAN ALFREDO', 34983, 1, 1, ''),
(650, 19, 'FLORES', 'CASTAÑO', 'MARIA ALEXANDRA', 42182, 1, 2, ''),
(651, 11, 'ESPINOZA', 'PORRAS', 'VERA LIZZETTE', 22420, 7, 2, '1589'),
(652, 11, 'GALVEZ', 'CUBAS', 'GISSELLA', 25379, 13, 2, '1824'),
(659, 43, 'ARONE', 'QUISPE', 'VICTOR RAUL', 26783, 1, 1, ''),
(663, 46, 'CHANCAFE', 'MORGAN', 'JUAN CARLOS', 14950, 1, 1, ''),
(664, 47, 'PRO', 'CAYCHO', 'DANIEL ALONSO', 31415, 1, 1, ''),
(666, 36, 'CERNA', 'SILVA', 'GUSTAVO ALEJANDRO', 38963, 1, 1, ''),
(667, 20, 'HEREDIA', 'CACERES', 'CAROL YANINIA', 12973, 13, 2, '0414'),
(670, 34, 'MINAYA', 'SALVATIERRA', 'SHIRLEY', 33010, 1, 2, ''),
(671, 34, 'LAZO', 'ALIAGA', 'EDGAR', 16794, 14, 2, '0766'),
(672, 17, 'MIRANDA', 'ZARATE', 'ANA MARIA ', 18284, 1, 2, ''),
(675, 17, 'RETUERO', 'PEÑA', 'RUDY', 25013, 1, 1, ''),
(677, 17, 'ZEVALLOS', 'MARIN', 'JULISSA ', 10416, 1, 2, ''),
(678, 17, 'TORO', 'QUISPE', 'BETTY PATRICIA', 11644, 1, 2, ''),
(679, 17, 'MENDOZA', 'ROJAS', 'JESUS', 9679, 1, 1, ''),
(680, 17, 'HIDALGO', 'CHAVEZ', 'JAIME', 24637, 1, 1, ''),
(681, 17, 'DE LA CRUZ', 'ALZAMORA', 'HUGO', 18786, 1, 1, ''),
(682, 48, 'FERNANDEZ', 'ATHO', 'MONICA', 12547, 1, 2, ''),
(683, 48, 'ALABA', 'CASTAÑEDA', 'WESLEY', 18715, 1, 1, ''),
(684, 48, 'ALMEIDA', 'RUIZ', 'CLAUDIA', 28049, 1, 2, ''),
(685, 48, 'RAMIREZ', 'MASIAS', 'NATHALY MILAGROS', 21650, 22, 1, '2602'),
(686, 48, 'SCARAFONE', 'ALVIS', 'GERSON', 24119, 1, 1, ''),
(687, 48, 'CRIBILLERO', 'DE PINHO', 'ROSSANA', 10262, 1, 2, ''),
(688, 49, 'SEMINARIO', 'LINARES', 'PAOLA CARMEN', 8636, 13, 2, '0070'),
(689, 49, 'SEMINARIO', 'LINARES', 'ROBERTO', 12341, 1, 1, ''),
(690, 49, 'PAREDES', 'GOMEZ', 'THAIS', 19648, 1, 2, ''),
(691, 49, 'SEMINARIO', 'LINARES', 'VICTOR', 7847, 1, 1, ''),
(692, 49, 'SEMINARIO', 'RAYGADA', 'ANSELMO ROBERTO', 229, 1, 1, ''),
(693, 10, 'GUTIERREZ', 'PALACIOS', 'RODOLFO', 15322, 1, 1, ''),
(696, 10, 'VERGARA', 'DIAZ', 'ELIZABETH', 35315, 1, 2, ''),
(697, 18, 'PRO ', 'CAYCHO', 'DANIEL ALONSO', 31415, 1, 1, ''),
(698, 18, 'VINATEA', 'HUALPA', 'ALFONSO', 34657, 4, 1, '2112'),
(699, 17, 'ESTRADA', 'SUAREZ', 'DANTE', 35558, 1, 1, ''),
(700, 17, 'PAREDES', 'QUIROZ', 'CLAUDIA', 32332, 1, 2, ''),
(701, 16, 'HERRERA', 'CUADROS', 'SILVANA', 26005, 1, 2, ''),
(704, 11, 'GUILLEN', 'YACHAS', 'ELMER JHONNY', 14951, 14, 1, '2155'),
(705, 43, 'BUSTIOS', 'MUÑOZ', 'CARLA', 22359, 1, 2, ''),
(706, 5, 'HUMPIRE', 'HERRERA', 'CARLA', 24391, 13, 2, '1642'),
(708, 26, 'CALLE', 'VILLANUEVA', 'LUIS OCTAVIO', 17352, 17, 1, '2560'),
(709, 26, 'BASTIDAS', 'OCHOA', 'MARIA DEL CARMEN', 23615, 22, 2, '2604'),
(710, 25, 'FLORES', 'MENENDEZ', 'YELDI', 17657, 1, 2, ''),
(713, 1, 'ARCE', 'SILVA', 'HUBERTO GONZALO', 43088, 1, 1, ''),
(714, 1, 'PAUCCA', 'MONTOYA', 'CINTHYA', 28153, 1, 2, ''),
(715, 1, 'VADILLO', 'PALACIOS', 'GRISEL YULIANA', 23825, 12, 2, '1380'),
(718, 10, 'CUBAS', 'SERRANO', 'DIANA', 43972, 1, 2, ''),
(719, 10, 'GUTIERREZ', 'CORNEJO', 'DAVID TOMAS', 38334, 1, 1, ''),
(722, 15, 'YARINGAÑO', 'MEDINA', 'ROSARIO DALMA', 34622, 7, 2, '2463'),
(723, 17, 'ALVAREZ', 'PAICO', 'SANDRA LISET', 30254, 13, 2, '2424'),
(724, 4, 'TABOADA', 'CORDERO', 'KATTY', 36165, 1, 1, ''),
(725, 16, 'VIDAL', 'MARTEL', 'ALI PAMELA', 26006, 1, 2, ''),
(728, 43, 'PONCE', 'DULANTO', 'ROXANA MILAGROS', 20107, 1, 2, ''),
(730, 3, 'TINTA', 'CUSI', 'CARLA', 26309, 1, 2, ''),
(731, 3, 'TRUJILLO', 'CANCHANYA', 'JUAN JOSE', 11323, 1, 1, ''),
(732, 5, 'CHUMBES', 'PAZ', 'JORDAN KENNY', 39795, 1, 1, ''),
(734, 46, 'ESPICHAN', 'CARDENAS', 'MARÍA DEL CARMEN', 31241, 1, 2, ''),
(735, 47, 'CAHUANA', 'TORRES', 'MAYDITH', 21209, 1, 2, ''),
(736, 47, 'MELGAR', 'BISETTI', 'RENATO', 19738, 1, 1, ''),
(737, 47, 'LEON', 'SANCHEZ', 'ENRIQUE ALBERTO', 20991, 1, 1, ''),
(738, 47, 'MONDRAGON', 'VEGA', 'LEANDRO ANTONIO', 24636, 1, 1, ''),
(739, 47, 'VILLA', 'SALAMANCA', 'REYNA ROSARIO', 22598, 1, 2, ''),
(741, 24, 'ESCALANTE', 'QUISPE', 'ABELITO', 31782, 1, 1, ''),
(742, 36, 'QUEZADA', 'BECERRA', 'ALEXANDRA YAHAIRA', 38132, 1, 2, ''),
(743, 27, 'ESPINO', 'CAMARENA', 'YENIFER NORA', 31982, 1, 2, ''),
(744, 27, 'SEGURA', 'GALINDO', 'CESAR AUGUSTO', 29590, 1, 1, ''),
(747, 35, 'PAZ', 'VIZARRETA', 'BRENDA', 28142, 1, 2, ''),
(748, 34, 'VEGA', 'RUIZ', 'MALU INGRID', 34856, 1, 2, ''),
(752, 10, 'CHUQUIANO', 'BRINGAS', 'SAMANTA  YSABEL', 31238, 1, 1, ''),
(753, 10, 'MORALES', 'SABOGAL', 'CHRISTIAN ANDRES', 30529, 1, 1, ''),
(754, 15, 'CARPIO', 'QUISPE', 'ANGELITA', 30470, 14, 2, '2508'),
(755, 18, 'CARPIO', 'CONTRERAS', 'ANGELITA', 25014, 14, 2, '2508'),
(756, 13, 'LOLI', 'RODRIGUEZ', 'MARIE', 18827, 1, 2, ''),
(757, 13, 'ORTIZ', 'NARANJO', 'LORENA CECILIA', 25135, 1, 2, ''),
(758, 16, 'BOLAÑOS', 'PALACIOS', 'JESUS', 34729, 1, 1, ''),
(759, 16, 'LINARES', 'DE LA GUARDA', 'JOSE LUIS ROBERTO', 25436, 1, 1, ''),
(761, 11, 'VILLA', 'SALAMANCA', 'REYNA ROSARIO', 22598, 1, 2, ''),
(762, 43, 'MOSAYHUATE', 'RIVAS', 'ROSSMERY', 28103, 1, 2, ''),
(763, 6, 'TORRES', 'VARGAS', 'LIZETH YOVANKA', 28951, 13, 2, '1807'),
(766, 20, 'RONDON', 'MOSCOSO', 'OSCAR BRUNO', 26334, 1, 1, ''),
(768, 28, 'VALLADOLID', 'ARRASCUE', 'EVELYN', 28379, 1, 2, ''),
(769, 37, 'SANTILLANA', 'CHAVEZ', 'HAROL AARON', 26351, 1, 1, ''),
(770, 34, 'VALDIVIA', 'BARBA', 'LISSETT MARJORIE', 22979, 13, 2, '0555'),
(771, 5, 'FLORES', 'RICARDI', 'GABRIEL', 26784, 14, 1, '2188'),
(772, 18, 'FALCON', 'AGUILAR', 'MILAGROS', 43462, 1, 2, ''),
(773, 9, 'NIZAMA', 'LEON', 'MARIA CATHERINE', 10366, 1, 2, ''),
(775, 5, 'CHUQUIANO', 'BRINGAS', 'SAMANTHA YSABEL', 31238, 1, 2, ''),
(776, 37, 'CARPIO', 'CONTRERAS', 'ANGELITA', 30470, 14, 2, '2508'),
(779, 10, 'CASTAÑEDA', 'MORENO', 'MADELAINE VILMA', 14560, 1, 2, ''),
(780, 10, 'DAVILA', 'ESTRADA', 'GISELLA', 10897, 1, 2, ''),
(781, 10, 'TABOADA', 'CORDERO', 'KATTY', 36165, 1, 2, ''),
(782, 10, 'TELLO', 'QUISPE', 'JOEL ANTONIO', 28714, 13, 1, '1964'),
(783, 18, 'FAUSTINO', 'CIPRIANO', 'ELIZABETH JESSICA', 28345, 1, 2, ''),
(784, 18, 'PAJARES', 'MUÑOZ', 'CLAUDIA MAGALY', 30542, 1, 2, ''),
(785, 4, 'CONTRERAS', 'CALDERON', 'LUIS ABEL', 41415, 1, 1, ''),
(787, 16, 'FAUSTINO', 'CIPRIANO', 'JESSICA', 28345, 1, 2, ''),
(788, 16, 'TRUJILLO', 'CANCHANYA', 'JUAN JOSE', 11323, 1, 1, ''),
(789, 8, 'GAVIDIA', 'LLANOS', 'JUAN CARLOS', 28384, 1, 1, ''),
(790, 8, 'SOTOMAYOR', 'ZENTENO', 'ZHENIA JESSICA', 23343, 1, 2, ''),
(791, 8, 'TALAVERANO', 'ALANYA', 'BRIDGET', 28022, 1, 2, ''),
(792, 19, 'PONCE', 'CACERES', 'CAROL CARMEN', 25360, 13, 2, '2251'),
(793, 3, 'GUERRERO', 'SANCHEZ', 'KAREN PRICILA', 41053, 1, 2, ''),
(794, 3, 'PONCE', 'CACERES', 'CAROL', 25360, 13, 2, '2251'),
(796, 5, 'ESPINOZA', 'QUISPE', 'JORGE  OMAR', 41414, 1, 1, ''),
(797, 6, 'MONTOYA', 'MINIZA', 'JORGE LUIS', 13623, 1, 1, ''),
(798, 22, 'LICLA', 'QUEVEDO', 'KARINA', 28293, 13, 2, '1757'),
(799, 31, 'LEIVA', 'REQUEJO', 'DAVID', 38560, 1, 1, ''),
(800, 31, 'YZARRA', 'DURAND', 'CESAR ANTONIO', 28384, 1, 1, ''),
(801, 20, 'MAYORGA', 'PEÑA', 'MARITZA VILMA', 20415, 1, 2, ''),
(802, 28, 'AGUIRRE', 'MASSON', 'FRANCISCO RICARDO', 24722, 13, 2, '1575'),
(803, 37, 'CRUZ', 'OLGUIN', 'FANY MIRIAM', 38161, 1, 2, ''),
(804, 34, 'ARIAS', 'MENACHO', 'GUADALUPE MARTINA', 15494, 1, 2, ''),
(806, 30, 'CUBA', 'MAMANI', 'SANDRA SUZZETH', 18393, 17, 2, '2327'),
(808, 1, 'VELEZMORO', 'PEÑA', 'ELVIRA VANESSA', 22288, 13, 2, '1559'),
(809, 1, 'TAFUR', 'TAFUR', 'ALY MICHEL', 10064, 14, 1, '0078'),
(810, 1, 'SILVA ', 'ALBIZURI', 'CESAR CHRISTIAN', 18550, 14, 1, '0763'),
(811, 1, 'SANTOS', 'SALAS', 'CECILIA PIA', 31076, 1, 2, ''),
(812, 1, 'RIVERA', 'ALIAGA', 'ALVARO', 17703, 1, 1, ''),
(813, 1, 'RAYMUNDO', 'CALERO', 'JULIO', 11811, 14, 1, '0079'),
(814, 1, 'RAMIREZ', 'MASIAS', 'NATHALY MILAGROS', 21650, 22, 2, '2602'),
(815, 1, 'PAZ', 'MAYURI', 'CARLOS ALBERTO', 6218, 1, 1, ''),
(816, 1, 'PAJARES', 'MUÑOZ', 'CLAUDIA MAGALI', 30542, 1, 2, ''),
(817, 1, 'OTAZU', 'ALDANA', 'CLAUDIA', 14519, 13, 2, '0626'),
(818, 1, 'MOSCOL', 'GALLARDO', 'FERNANDO JAVIER', 9072, 1, 1, ''),
(819, 1, 'MENESES', 'LOPEZ', 'ABRAHAM', 573, 14, 1, '0014'),
(820, 1, 'GUILLEN', 'ASTETE', 'CELSO ANTONIO', 12799, 1, 1, ''),
(821, 1, 'GALVEZ ', 'CUBAS', 'GISELA ELIZABETH', 25379, 13, 2, '1824'),
(822, 1, 'FLORES', 'RICARDI', 'GABRIEL PEDRO', 26784, 14, 1, '2188'),
(823, 1, 'FLORES', 'MORENO', 'MARTHA', 6833, 13, 2, '0010'),
(824, 1, 'CARDENAS', 'MARINO', 'ESTHER', 6834, 1, 1, ''),
(825, 1, 'CALDERON', 'VALENCIA', 'MARIELA ZUNILDA', 33621, 1, 2, ''),
(826, 1, 'CALDERON', 'VALENCIA', 'MARIELA ZUNILDA', 33621, 1, 2, ''),
(827, 1, 'CALDERON', 'VALENCIA', 'MARIELA ZUNILDA', 33621, 1, 2, ''),
(828, 1, 'CALDERON', 'VALENCIA', 'MARIELA ZUNILDA', 33621, 1, 2, ''),
(829, 1, 'BAMONDE', 'SEGURA', 'LEYLA', 12732, 1, 2, ''),
(830, 1, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0855'),
(831, 1, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0855'),
(832, 1, 'ARRIOLA', 'GUILLEN', 'LUIS ERNESTO', 16945, 14, 1, '0855'),
(833, 1, 'ARMAS', 'GALVEZ', 'NELSON MURICIO', 45592, 1, 1, ''),
(834, 1, 'AMARO', 'RIVERA', 'MARIA YESENIA', 14480, 13, 2, '0455'),
(835, 1, 'ALVITEZ', 'CABALLERO', 'PAMELA', 24563, 13, 2, '1627'),
(836, 7, 'CAMPANA', 'MEDINA', 'LUIS', 11915, 1, 1, ''),
(837, 10, 'YARINGAÑO', 'MEDINA', 'ROSARIO DALMA', 34622, 7, 2, '2463');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_doctor_turno`
--

CREATE TABLE `tb_doctor_turno` (
  `id` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_doctor_turno`
--

INSERT INTO `tb_doctor_turno` (`id`, `id_doctor`, `telefono`, `id_sede`) VALUES
(11, 296, '01-993557445', 21),
(16, 296, '01-989121601', 23),
(17, 253, '01-989121597', 33),
(19, 220, '01-989121588', 22),
(23, 279, '01-989121309', 29),
(30, 488, ' 636-1105', 46),
(31, 561, ' 636-1105', 47),
(34, 230, '01-923432646', 24),
(35, 710, '01-923432743', 25),
(36, 247, '01-989121592', 26),
(37, 744, '01-989207994', 27),
(38, 281, '01-923432718', 28),
(39, 271, '01-923432723', 20),
(40, 293, '01-923432726', 30),
(42, 228, '01-923432644', 31),
(43, 256, '01-923432753', 32),
(44, 670, '01-923432739', 34),
(45, 419, '01-989022909', 35),
(46, 240, '01-923432670', 36),
(47, 285, '01-989254893', 37),
(48, 762, '014751717', 43),
(49, 682, '014216323', 48),
(51, 529, '014713998', 8),
(52, 689, '014475190', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_especialidad`
--

CREATE TABLE `tb_especialidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_especialidad`
--

INSERT INTO `tb_especialidad` (`id`, `nombre`) VALUES
(16, 'CIRUGIA  BUCAL Y MAXILO FACIAL, PATOLOGI'),
(12, 'CIRUGÍA BUCAL  Y MAXILO FACIAL'),
(1, 'CIRUJANO DENTISTA'),
(8, 'CIRUJANO DENTISTA/ REHABILITACIÓN ORAL'),
(7, 'ENDODONCIA'),
(32, 'ESTETICA DENTAL'),
(28, 'IMPLANTOLOGIA'),
(31, 'IMPLANTOLOGIA / REHABILITACION ORAL'),
(9, 'IMPLANTOLOGIA ORAL INTEGRAL'),
(13, 'ODONTOPEDIATRÍA'),
(33, 'ODONTOPEDIATRÍA / ORTODONCIA'),
(14, 'ORTODONCIA'),
(21, 'ORTODONCIA E IMPLANTES'),
(2, 'PACIENTES ESPECIALES'),
(6, 'PATOLOGIA ORAL'),
(4, 'PERIODONCIA'),
(17, 'PERIODONCIA E IMPLANTES'),
(22, 'REHABILITACIÓN ORAL ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_especialidad_web`
--

CREATE TABLE `tb_especialidad_web` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `parrafo` text NOT NULL,
  `id_tipo_especialidad_web` int(11) NOT NULL,
  `id_imagen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_especialidad_web`
--

INSERT INTO `tb_especialidad_web` (`id`, `nombre`, `parrafo`, `id_tipo_especialidad_web`, `id_imagen`) VALUES
(1, 'CONSULTAS Y OPERATORIA', 'Falta texo XD', 1, 157),
(2, 'ODONTOPEDIATRÍA', 'Tratamiento para niños y adolescentes.', 2, 157),
(3, 'REHABILITACIÓN ORAL', 'Recuperación de dientes perdidos colocación de prótesis.', 2, 157),
(4, 'ENDODONCIA', 'Tratamiento de conducto radicular.', 2, 157),
(5, 'CIRUGÍA BUCAL Y MAXILOFACIAL E IMPLANTES', 'Extracción de terceras molares quistes y tumores.', 2, 157),
(6, 'PERIODONCIA E IMPLANTES', 'Tratamiento de encías.', 2, 157),
(7, 'PATOLOGÍA ORAL', 'Manejo de enfermedades poco prevalentes.', 2, 157),
(8, 'RADIOLOGÍA BUCAL Y MAXILOFACIAL', 'Diagnóstico radiográfico.', 2, 157),
(9, 'ORTODONCIA', 'Tratamiento de la mal posición dentaria.', 2, 157),
(10, 'ESTÉTICA DENTAL', 'Rehabilitación cosmética de los dientes.', 2, 157),
(11, 'SERVICIO ODONTOLÓGICO PARA PACIENTES ESPECIALES', 'Tratamiento para pacientes con discapacidad enfermedades crónicas síndrome de down u otros???', 3, 211);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_grupo_lista`
--

CREATE TABLE `tb_grupo_lista` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_grupo_lista`
--

INSERT INTO `tb_grupo_lista` (`id`, `nombre`) VALUES
(1, 'Lista 1 PCoorporativ'),
(2, 'Lista 2 PCoorporativ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_lista`
--

CREATE TABLE `tb_lista` (
  `id` int(11) NOT NULL,
  `contenido` text CHARACTER SET utf8mb4 NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_grupo_lista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `id_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_menu`
--

INSERT INTO `tb_menu` (`id`, `titulo`, `id_padre`) VALUES
(1, 'HOME', NULL),
(2, 'NOSOTROS', NULL),
(3, 'SERVICIOS', NULL),
(4, 'TECNOLOGÍA', NULL),
(5, 'CONTACTO', NULL),
(6, 'LO QUE SOMOS', 2),
(7, 'ODONTOLOGOS ASOCIADOS', 2),
(8, 'RED NACIONAL', 2),
(10, 'ESPECIALIDADES', 3),
(12, 'CONVENIOS', 3),
(13, 'EQUIPOS', 4),
(14, 'BIOSEGURIDAD', 4),
(16, 'PROVINCIA', 5),
(18, 'LIMA', 5),
(19, 'SERVICIOS ADICIONALES', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_perfiles`
--

CREATE TABLE `tb_perfiles` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_perfiles`
--

INSERT INTO `tb_perfiles` (`id`, `nombre`) VALUES
(1, 'Admin'),
(2, 'awerq'),
(3, 'Gest');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_permisos`
--

CREATE TABLE `tb_permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `keyes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_permisos`
--

INSERT INTO `tb_permisos` (`id`, `nombre`, `keyes`) VALUES
(1, 'LEER', 'per_read'),
(2, 'MODIFICAR', 'per_update'),
(3, 'ELIMINAR', 'per_delete'),
(4, 'CREAR', 'per_create');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_personal`
--

CREATE TABLE `tb_personal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_personal`
--

INSERT INTO `tb_personal` (`id`, `nombre`, `apellidos`, `dni`, `estado`) VALUES
(1, 'Admin', 'Sistema', '99999999', 0),
(2, 'David', 'Isla', '12345678', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_popup`
--

CREATE TABLE `tb_popup` (
  `id` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_popup`
--

INSERT INTO `tb_popup` (`id`, `nombre`) VALUES
(1, 'Consejos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_privilegios`
--

CREATE TABLE `tb_privilegios` (
  `idProceso` int(11) NOT NULL,
  `idPermiso` int(11) NOT NULL,
  `idPerfil` int(10) NOT NULL,
  `valor` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_privilegios`
--

INSERT INTO `tb_privilegios` (`idProceso`, `idPermiso`, `idPerfil`, `valor`) VALUES
(2, 1, 1, 1),
(2, 2, 1, 1),
(2, 3, 1, 1),
(2, 4, 1, 1),
(18, 1, 1, 1),
(18, 2, 1, 1),
(18, 3, 1, 1),
(18, 4, 1, 1),
(19, 1, 1, 1),
(19, 2, 1, 1),
(19, 3, 1, 1),
(19, 4, 1, 1),
(20, 1, 1, 1),
(20, 1, 3, 0),
(20, 2, 1, 1),
(20, 2, 3, 0),
(20, 3, 1, 1),
(20, 3, 3, 0),
(20, 4, 1, 1),
(20, 4, 3, 0),
(26, 1, 1, 1),
(26, 1, 3, 1),
(26, 2, 1, 1),
(26, 2, 3, 1),
(26, 3, 1, 1),
(26, 3, 3, 1),
(26, 4, 1, 1),
(26, 4, 3, 1),
(27, 1, 1, 1),
(27, 1, 3, 1),
(27, 2, 1, 1),
(27, 2, 3, 1),
(27, 3, 1, 1),
(27, 3, 3, 1),
(27, 4, 1, 1),
(27, 4, 3, 1),
(28, 1, 1, 1),
(28, 1, 3, 1),
(28, 2, 1, 1),
(28, 2, 3, 1),
(28, 3, 1, 1),
(28, 3, 3, 1),
(28, 4, 1, 1),
(28, 4, 3, 1),
(29, 1, 1, 1),
(29, 1, 3, 1),
(29, 2, 1, 1),
(29, 2, 3, 1),
(29, 3, 1, 1),
(29, 3, 3, 1),
(29, 4, 1, 1),
(29, 4, 3, 1),
(30, 1, 1, 1),
(30, 1, 3, 1),
(30, 2, 1, 1),
(30, 2, 3, 1),
(30, 3, 1, 1),
(30, 3, 3, 1),
(30, 4, 1, 1),
(30, 4, 3, 1),
(32, 1, 1, 1),
(32, 1, 3, 1),
(32, 2, 1, 1),
(32, 2, 3, 1),
(32, 3, 1, 1),
(32, 3, 3, 1),
(32, 4, 1, 1),
(32, 4, 3, 1),
(33, 1, 1, 1),
(33, 1, 3, 1),
(33, 2, 1, 1),
(33, 2, 3, 1),
(33, 3, 1, 1),
(33, 3, 3, 1),
(33, 4, 1, 1),
(33, 4, 3, 1),
(34, 1, 1, 1),
(34, 1, 3, 1),
(34, 2, 1, 1),
(34, 2, 3, 1),
(34, 3, 1, 1),
(34, 3, 3, 1),
(34, 4, 1, 1),
(34, 4, 3, 1),
(35, 1, 1, 1),
(35, 1, 3, 1),
(35, 2, 1, 1),
(35, 2, 3, 1),
(35, 3, 1, 1),
(35, 3, 3, 1),
(35, 4, 1, 1),
(35, 4, 3, 1),
(36, 1, 1, 1),
(36, 1, 3, 1),
(36, 2, 1, 1),
(36, 2, 3, 1),
(36, 3, 1, 1),
(36, 3, 3, 1),
(36, 4, 1, 1),
(36, 4, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_privilegio_usuario`
--

CREATE TABLE `tb_privilegio_usuario` (
  `idUsuario` int(10) NOT NULL,
  `idPermiso` int(11) NOT NULL,
  `idProceso` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_privilegio_usuario`
--

INSERT INTO `tb_privilegio_usuario` (`idUsuario`, `idPermiso`, `idProceso`, `valor`) VALUES
(1, 1, 2, 1),
(1, 1, 18, 1),
(1, 1, 19, 1),
(1, 1, 20, 1),
(1, 2, 2, 0),
(1, 2, 18, 0),
(1, 2, 19, 0),
(1, 2, 20, 0),
(1, 3, 2, 0),
(1, 3, 18, 0),
(1, 3, 19, 0),
(1, 3, 20, 0),
(1, 4, 2, 0),
(1, 4, 18, 0),
(1, 4, 19, 0),
(1, 4, 20, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proceso`
--

CREATE TABLE `tb_proceso` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `idProceso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_proceso`
--

INSERT INTO `tb_proceso` (`id`, `titulo`, `idProceso`) VALUES
(2, 'Empleado', 12),
(12, 'Recursos Humanos', NULL),
(16, 'Configuración', NULL),
(18, 'Proceso', 16),
(19, 'Perfiles', 16),
(20, 'Permisos', 16),
(25, 'Mantenimiento', NULL),
(26, 'Doctor', 25),
(27, 'Sede', 25),
(28, 'Especialidad', 25),
(29, 'Responsable Lima', 25),
(30, 'Responsable Provincia', 25),
(31, 'CONTENT', NULL),
(32, 'Contenido', 31),
(33, 'Contenido pop up', 31),
(34, 'Galeria', 31),
(35, 'Lista', 31),
(36, 'Especialidad Web', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_provincia`
--

CREATE TABLE `tb_provincia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_provincia`
--

INSERT INTO `tb_provincia` (`id`, `nombre`) VALUES
(1, 'Provincia 1'),
(2, 'Provincia 2'),
(3, 'Provincia 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_registrolog`
--

CREATE TABLE `tb_registrolog` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `registroNew` varchar(100) DEFAULT NULL,
  `registroOld` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `tipTransaccion` varchar(100) NOT NULL,
  `tabla` varchar(100) NOT NULL,
  `campo` varchar(100) NOT NULL,
  `idCampo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_registrolog`
--

INSERT INTO `tb_registrolog` (`id`, `idUsuario`, `registroNew`, `registroOld`, `fecha`, `tipTransaccion`, `tabla`, `campo`, `idCampo`) VALUES
(1, 1, '', '', '2013-11-13 12:00:54', 'DELETE', 'tb_proceso', '|-|-|', 24),
(2, 1, 'Mantenimiento|-|-|', '', '2013-11-13 12:01:18', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 21),
(3, 1, 'Doctor|-|-|', '', '2013-11-13 12:02:43', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 26),
(4, 1, 'Sede|-|-|', '', '2013-11-13 17:26:47', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 27),
(5, 1, 'Especialidad|-|-|', '', '2013-11-13 17:26:47', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 28),
(6, 1, 'Responsable|-|-|', '', '2013-11-13 18:02:02', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 29),
(7, 1, 'Responsable Lima|-|-|25|-|-|', 'Responsable|-|-|25|-|-|', '2013-11-13 18:06:46', 'UPDATE', 'tb_proceso', '|-|-|titulo|-|-|idProceso|-|-|', 29),
(8, 1, 'Responsable Provincia|-|-|', '', '2013-11-14 10:09:37', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 30),
(9, 1, 'CONTENT|-|-|', '', '2013-11-22 14:41:11', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 31),
(10, 1, 'Contenido|-|-|', '', '2013-11-22 14:41:17', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 32),
(11, 1, 'Lista|-|-|', '', '2013-12-06 11:30:18', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 35),
(12, 1, 'Especialidad Web|-|-|', '', '2013-12-09 12:14:13', 'INSERT', 'tb_proceso', '|-|-|titulo|-|-|', 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_registrologin`
--

CREATE TABLE `tb_registrologin` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaIn` datetime NOT NULL,
  `fechaOut` datetime DEFAULT NULL,
  `timeIn` int(11) NOT NULL,
  `timeOut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_registrologin`
--

INSERT INTO `tb_registrologin` (`id`, `idUsuario`, `fechaIn`, `fechaOut`, `timeIn`, `timeOut`) VALUES
(307, 1, '2013-04-05 18:19:04', '2013-04-05 18:28:15', 1365185944, 1365186495),
(308, 1, '2013-04-05 18:28:15', '2013-04-05 18:29:28', 1365186495, 1365186568),
(309, 1, '2013-04-05 18:29:28', '2013-11-13 11:22:09', 1365186568, 1384359729),
(310, 1, '2013-11-13 11:22:09', '2013-11-13 12:31:50', 1384359729, 1384363910),
(311, 1, '2013-11-13 12:31:50', NULL, 1384363910, NULL),
(312, 1, '2013-11-13 12:34:25', NULL, 1384364065, NULL),
(313, 1, '2013-11-13 12:39:13', '2013-11-13 14:07:49', 1384364353, 1384369669),
(314, 1, '2013-11-13 14:07:49', NULL, 1384369669, NULL),
(315, 1, '2013-11-13 14:20:52', '2013-11-13 14:22:08', 1384370452, 1384370528),
(316, 1, '2013-11-13 14:22:14', '2013-11-13 14:22:50', 1384370534, 1384370570),
(317, 1, '2013-11-13 14:22:59', NULL, 1384370579, NULL),
(318, 1, '2013-11-13 14:56:52', NULL, 1384372612, NULL),
(319, 1, '2013-11-13 15:07:38', NULL, 1384373258, NULL),
(320, 1, '2013-11-13 15:11:44', '2013-11-13 16:13:59', 1384373504, 1384377239),
(321, 1, '2013-11-13 16:14:05', NULL, 1384377245, NULL),
(322, 1, '2013-11-13 17:24:55', '2013-11-13 17:58:43', 1384381495, 1384383523),
(323, 1, '2013-11-13 17:58:48', '2013-11-13 18:00:09', 1384383528, 1384383609),
(324, 1, '2013-11-13 18:00:14', NULL, 1384383614, NULL),
(325, 1, '2013-11-14 10:06:44', NULL, 1384441604, NULL),
(326, 1, '2013-11-14 10:34:53', '2013-11-14 16:12:22', 1384443293, 1384463542),
(327, 1, '2013-11-14 16:12:23', NULL, 1384463543, NULL),
(328, 1, '2013-11-14 16:23:58', NULL, 1384464238, NULL),
(329, 1, '2013-11-14 16:25:02', '2013-11-14 16:35:43', 1384464302, 1384464943),
(330, 1, '2013-11-14 16:35:49', NULL, 1384464949, NULL),
(331, 1, '2013-11-14 16:57:01', '2013-11-14 17:16:58', 1384466221, 1384467418),
(332, 1, '2013-11-14 17:17:05', '2013-11-15 12:17:14', 1384467425, 1384535834),
(333, 1, '2013-11-15 12:17:14', NULL, 1384535834, NULL),
(334, 1, '2013-11-15 12:21:05', '2013-11-15 12:27:47', 1384536065, 1384536467),
(335, 1, '2013-11-15 12:27:53', '2013-11-15 12:30:07', 1384536473, 1384536607),
(336, 1, '2013-11-15 12:30:13', '2013-11-15 12:31:18', 1384536613, 1384536678),
(337, 1, '2013-11-15 12:31:24', '2013-11-15 13:01:55', 1384536684, 1384538515),
(338, 1, '2013-11-15 13:02:06', '2013-11-15 14:08:53', 1384538526, 1384542533),
(339, 1, '2013-11-15 14:08:53', NULL, 1384542533, NULL),
(340, 1, '2013-11-15 14:09:10', '2013-11-15 14:26:53', 1384542550, 1384543613),
(341, 1, '2013-11-15 14:26:58', '2013-11-21 12:22:52', 1384543618, 1385054572),
(342, 1, '2013-11-21 12:22:52', '2013-11-21 12:27:44', 1385054572, 1385054864),
(343, 1, '2013-11-21 12:28:25', '2013-11-21 12:29:47', 1385054905, 1385054987),
(344, 1, '2013-11-21 12:29:52', '2013-11-21 12:30:54', 1385054992, 1385055054),
(345, 1, '2013-11-21 12:30:58', '2013-11-21 12:32:59', 1385055058, 1385055179),
(346, 1, '2013-11-21 12:33:04', NULL, 1385055184, NULL),
(347, 1, '2013-11-21 12:34:20', '2013-11-21 12:35:23', 1385055260, 1385055323),
(348, 1, '2013-11-21 12:35:42', '2013-11-21 12:37:13', 1385055342, 1385055433),
(349, 1, '2013-11-21 12:37:35', '2013-11-21 12:39:35', 1385055455, 1385055575),
(350, 1, '2013-11-21 12:39:56', '2013-11-21 12:41:13', 1385055596, 1385055673),
(351, 1, '2013-11-21 12:43:46', '2013-11-21 14:13:42', 1385055940, 1385061222),
(352, 1, '2013-11-21 14:13:49', '2013-11-21 14:57:31', 1385061229, 1385063851),
(353, 1, '2013-11-21 14:57:37', '2013-11-21 14:59:13', 1385063867, 1385063953),
(354, 1, '2013-11-21 14:59:17', '2013-11-21 15:01:01', 1385063965, 1385064061),
(355, 1, '2013-11-22 14:12:52', '2013-11-22 14:15:51', 1385147586, 1385147751),
(356, 1, '2013-11-22 14:40:47', '2013-11-22 15:29:24', 1385149318, 1385152164),
(357, 1, '2013-11-22 15:29:31', '2013-11-22 17:46:52', 1385152171, 1385160412),
(358, 1, '2013-11-22 17:46:59', '2013-11-25 10:56:49', 1385160419, 1385395009),
(359, 1, '2013-11-25 10:56:50', '2013-11-25 11:13:25', 1385395010, 1385396005),
(360, 1, '2013-11-25 11:13:32', '2013-11-25 11:14:00', 1385396034, 1385396040),
(361, 1, '2013-11-25 11:16:50', '2013-11-25 12:18:10', 1385396211, 1385399890),
(362, 1, '2013-11-25 12:18:16', '2013-11-25 12:18:40', 1385399917, 1385399920),
(363, 1, '2013-11-25 12:20:13', '2013-11-25 13:03:41', 1385400013, 1385402621),
(364, 1, '2013-11-25 13:03:45', '2013-11-25 16:11:28', 1385402626, 1385413888),
(365, 1, '2013-11-25 16:11:44', '2013-11-25 16:36:24', 1385413904, 1385415384),
(366, 1, '2013-11-25 16:36:24', '2013-11-25 17:51:07', 1385415384, 1385419867),
(367, 1, '2013-11-25 17:51:07', '2013-11-25 17:59:57', 1385419867, 1385420397),
(368, 1, '2013-11-25 18:00:22', '2013-11-25 18:03:58', 1385420438, 1385420638),
(369, 1, '2013-11-25 18:04:08', '2013-11-25 18:07:56', 1385420657, 1385420876),
(370, 1, '2013-11-25 18:08:24', '2013-11-25 18:12:54', 1385420924, 1385421174),
(371, 1, '2013-11-25 18:13:01', '2013-11-25 18:21:31', 1385421198, 1385421691),
(372, 1, '2013-11-25 18:21:31', '2013-11-25 18:25:30', 1385421711, 1385421930),
(373, 1, '2013-11-25 18:25:39', '2013-11-25 18:27:20', 1385421960, 1385422040),
(374, 1, '2013-11-25 18:27:28', '2013-11-25 18:30:34', 1385422119, 1385422234),
(375, 1, '2013-11-25 18:30:38', '2013-11-25 18:31:55', 1385422284, 1385422315),
(376, 1, '2013-11-26 10:32:35', '2013-11-26 10:33:38', 1385479956, 1385480018),
(377, 1, '2013-11-26 10:33:47', '2013-11-26 10:40:12', 1385480124, 1385480412),
(378, 1, '2013-11-26 10:40:54', '2013-11-26 10:49:31', 1385480454, 1385480971),
(379, 1, '2013-11-26 16:32:45', '2013-12-01 22:09:54', 1385501565, 1385953794),
(380, 1, '2013-12-01 22:09:54', '2013-12-01 22:10:43', 1385953794, 1385953843),
(381, 1, '2013-12-01 22:13:44', '2013-12-01 22:15:56', 1385954024, 1385954156),
(382, 1, '2013-12-01 22:16:04', '2013-12-01 22:32:22', 1385954164, 1385955142),
(383, 1, '2013-12-01 22:32:28', '2013-12-01 22:35:27', 1385955148, 1385955327),
(384, 1, '2013-12-01 22:35:38', '2013-12-01 22:37:03', 1385955338, 1385955423),
(385, 1, '2013-12-01 22:37:11', '2013-12-01 22:37:46', 1385955431, 1385955466),
(386, 1, '2013-12-01 22:38:20', '2013-12-01 22:39:25', 1385955500, 1385955565),
(387, 1, '2013-12-01 22:39:35', '2013-12-01 22:40:42', 1385955575, 1385955642),
(388, 1, '2013-12-01 22:40:46', '2013-12-01 22:42:02', 1385955646, 1385955722),
(389, 1, '2013-12-01 22:42:09', '2013-12-01 22:48:36', 1385955729, 1385956116),
(390, 1, '2013-12-01 22:48:41', '2013-12-01 22:49:46', 1385956121, 1385956186),
(391, 1, '2013-12-01 22:49:57', '2013-12-01 22:52:09', 1385956197, 1385956329),
(392, 1, '2013-12-01 22:52:13', '2013-12-01 22:53:14', 1385956333, 1385956394),
(393, 1, '2013-12-01 22:53:18', '2013-12-01 22:54:26', 1385956398, 1385956466),
(394, 1, '2013-12-01 22:54:30', '2013-12-01 22:55:31', 1385956470, 1385956531),
(395, 1, '2013-12-01 22:55:35', '2013-12-01 22:57:43', 1385956535, 1385956663),
(396, 1, '2013-12-01 22:57:47', '2013-12-01 22:58:57', 1385956667, 1385956737),
(397, 1, '2013-12-01 22:59:02', '2013-12-01 23:00:14', 1385956742, 1385956814),
(398, 1, '2013-12-01 23:00:18', '2013-12-01 23:01:21', 1385956818, 1385956881),
(399, 1, '2013-12-01 23:01:40', '2013-12-01 23:02:49', 1385956900, 1385956969),
(400, 1, '2013-12-01 23:02:59', '2013-12-02 07:46:58', 1385956979, 1385988418),
(401, 1, '2013-12-02 07:46:58', '2013-12-02 07:48:07', 1385988418, 1385988487),
(402, 1, '2013-12-02 07:48:12', '2013-12-02 07:49:23', 1385988492, 1385988563),
(403, 1, '2013-12-02 07:49:48', '2013-12-02 09:55:27', 1385988588, 1385996127),
(404, 1, '2013-12-02 09:55:27', '2013-12-02 10:04:32', 1385996127, 1385996672),
(405, 1, '2013-12-02 10:04:41', '2013-12-02 10:11:20', 1385996681, 1385997080),
(406, 1, '2013-12-02 10:11:31', '2013-12-02 10:13:04', 1385997091, 1385997184),
(407, 1, '2013-12-02 10:13:10', '2013-12-02 10:13:30', 1385997190, 1385997210),
(408, 1, '2013-12-02 10:14:13', '2013-12-02 10:20:51', 1385997253, 1385997651),
(409, 1, '2013-12-02 10:20:56', '2013-12-02 10:22:11', 1385997656, 1385997731),
(410, 1, '2013-12-02 10:22:22', '2013-12-02 10:23:28', 1385997742, 1385997808),
(411, 1, '2013-12-02 10:23:41', '2013-12-02 11:53:03', 1385997821, 1386003183),
(412, 1, '2013-12-02 11:53:03', '2013-12-02 12:11:27', 1386003183, 1386004287),
(413, 1, '2013-12-02 12:11:33', '2013-12-02 12:11:36', 1386004293, 1386004296),
(414, 1, '2013-12-02 16:44:50', '2013-12-02 16:46:53', 1386020690, 1386020813),
(415, 1, '2013-12-03 11:38:41', '2013-12-03 12:01:46', 1386088721, 1386090106),
(416, 1, '2013-12-03 12:01:51', '2013-12-03 12:05:11', 1386090111, 1386090311),
(417, 2, '2013-12-03 12:05:21', '2013-12-03 12:06:36', 1386090321, 1386090396),
(418, 2, '2013-12-03 12:06:57', '2013-12-03 12:12:56', 1386090417, 1386090776),
(419, 2, '2013-12-03 12:13:05', '2013-12-03 12:13:31', 1386090785, 1386090811),
(420, 1, '2013-12-03 12:13:39', '2013-12-03 12:16:15', 1386090819, 1386090975),
(421, 2, '2013-12-03 12:16:33', '2013-12-03 12:23:32', 1386090993, 1386091412),
(422, 1, '2013-12-03 12:23:38', '2013-12-03 12:23:42', 1386091418, 1386091422),
(423, 2, '2013-12-03 12:23:51', '2013-12-03 12:28:52', 1386091431, 1386091732),
(424, 2, '2013-12-03 12:29:09', '2013-12-03 12:34:18', 1386091749, 1386092058),
(425, 2, '2013-12-03 12:34:27', '2014-01-09 12:26:26', 1386092067, 1389288386),
(426, 1, '2013-12-05 15:15:47', '2013-12-06 11:29:46', 1386274547, 1386347386),
(427, 1, '2013-12-06 11:29:46', '2013-12-06 11:38:34', 1386347386, 1386347914),
(428, 1, '2013-12-06 11:38:38', '2013-12-06 12:20:53', 1386347918, 1386350453),
(429, 1, '2013-12-06 12:20:57', '2013-12-06 12:29:22', 1386350457, 1386350962),
(430, 1, '2013-12-06 12:29:26', '2013-12-06 13:34:16', 1386350966, 1386354856),
(431, 1, '2013-12-06 13:34:16', '2013-12-06 15:23:51', 1386354856, 1386361431),
(432, 1, '2013-12-06 15:23:51', '2013-12-06 15:47:56', 1386361431, 1386362876),
(433, 1, '2013-12-06 15:48:00', '2013-12-06 15:58:14', 1386362880, 1386363494),
(434, 1, '2013-12-06 15:58:21', '2013-12-06 16:04:38', 1386363501, 1386363878),
(435, 1, '2013-12-06 16:04:42', '2013-12-06 17:21:35', 1386363882, 1386368495),
(436, 1, '2013-12-06 17:21:35', '2013-12-06 17:25:14', 1386368495, 1386368714),
(437, 1, '2013-12-06 17:25:24', '2013-12-06 17:54:29', 1386368724, 1386370469),
(438, 1, '2013-12-06 18:01:40', '2013-12-06 18:56:43', 1386370900, 1386374203),
(439, 1, '2013-12-06 18:56:43', '2013-12-06 19:54:56', 1386374203, 1386377696),
(440, 1, '2013-12-06 19:55:02', '2013-12-06 20:06:40', 1386377702, 1386378400),
(441, 1, '2013-12-06 20:40:45', '2013-12-06 22:49:32', 1386380445, 1386388172),
(442, 1, '2013-12-06 22:49:32', '2013-12-06 23:06:34', 1386388172, 1386389194),
(443, 1, '2013-12-06 23:06:49', '2013-12-07 11:32:50', 1386389209, 1386433970),
(444, 1, '2013-12-07 11:32:50', '2013-12-07 11:49:53', 1386433970, 1386434993),
(445, 1, '2013-12-07 11:50:05', '2013-12-07 12:24:55', 1386435005, 1386437095),
(446, 1, '2013-12-07 12:25:09', '2013-12-07 13:03:25', 1386437109, 1386439405),
(447, 1, '2013-12-08 17:13:27', '2013-12-09 11:04:17', 1386540807, 1386605057),
(448, 1, '2013-12-09 11:04:17', '2013-12-09 11:10:42', 1386605057, 1386605442),
(449, 1, '2013-12-09 11:21:50', '2013-12-09 12:13:48', 1386606110, 1386609228),
(450, 1, '2013-12-09 12:13:48', '2013-12-09 12:28:24', 1386609228, 1386610104),
(451, 1, '2013-12-09 12:28:29', '2013-12-09 12:40:24', 1386610109, 1386610824),
(452, 1, '2013-12-09 12:40:29', '2013-12-09 15:15:28', 1386610829, 1386620128),
(453, 1, '2013-12-09 15:15:28', '2013-12-09 15:31:13', 1386620128, 1386621073),
(454, 1, '2013-12-09 15:31:17', '2013-12-09 16:35:46', 1386621077, 1386624946),
(455, 1, '2013-12-09 16:35:51', '2013-12-09 17:01:36', 1386624951, 1386626496),
(456, 1, '2013-12-09 17:01:51', '2013-12-09 17:18:28', 1386626511, 1386627508),
(457, 1, '2013-12-09 17:19:47', '2013-12-09 18:06:27', 1386627587, 1386630387),
(458, 1, '2013-12-09 18:06:31', '2013-12-09 23:39:58', 1386630391, 1386650398),
(459, 1, '2013-12-09 23:39:58', '2013-12-10 00:18:02', 1386650398, 1386652682),
(460, 1, '2013-12-10 00:18:12', '2013-12-10 00:29:52', 1386652692, 1386653392),
(461, 1, '2013-12-10 00:30:05', '2013-12-10 00:53:52', 1386653405, 1386654832),
(462, 1, '2013-12-10 00:54:01', '2013-12-10 01:04:06', 1386654841, 1386655446),
(463, 1, '2013-12-10 01:04:11', '2013-12-10 01:12:24', 1386655451, 1386655944),
(464, 1, '2013-12-10 01:12:33', '2013-12-10 01:33:05', 1386655953, 1386657185),
(465, 1, '2013-12-10 01:33:16', '2013-12-10 01:36:23', 1386657196, 1386657383),
(466, 1, '2013-12-10 01:36:36', '2013-12-10 11:36:25', 1386657396, 1386693385),
(467, 1, '2013-12-10 11:36:26', '2013-12-10 11:41:38', 1386693386, 1386693698),
(468, 1, '2013-12-10 11:41:50', '2013-12-10 12:19:18', 1386693710, 1386695958),
(469, 1, '2013-12-10 12:19:21', '2013-12-10 14:51:55', 1386695961, 1386705115),
(470, 1, '2013-12-10 14:51:55', '2013-12-10 15:02:01', 1386705115, 1386705721),
(471, 1, '2013-12-10 15:02:05', '2013-12-11 10:48:57', 1386705725, 1386776937),
(472, 1, '2013-12-11 10:48:57', '2013-12-11 10:55:23', 1386776937, 1386777323),
(473, 1, '2013-12-11 10:55:55', '2013-12-11 11:11:26', 1386777355, 1386778286),
(474, 1, '2013-12-11 11:11:39', '2013-12-11 11:15:00', 1386778299, 1386778500),
(475, 1, '2013-12-11 11:15:10', '2013-12-11 11:21:29', 1386778510, 1386778889),
(476, 1, '2013-12-11 11:21:40', '2013-12-11 11:34:27', 1386778900, 1386779667),
(477, 1, '2013-12-11 11:34:31', '2013-12-11 14:16:58', 1386779671, 1386789418),
(478, 1, '2013-12-11 14:16:58', '2013-12-11 14:22:55', 1386789418, 1386789775),
(479, 1, '2013-12-11 14:23:11', '2013-12-11 14:44:30', 1386789791, 1386791070),
(480, 1, '2013-12-11 14:44:37', '2013-12-11 16:18:54', 1386791077, 1386796734),
(481, 1, '2013-12-11 16:18:54', '2013-12-11 16:26:29', 1386796734, 1386797189),
(482, 1, '2013-12-11 16:26:33', '2013-12-11 16:36:07', 1386797193, 1386797767),
(483, 1, '2013-12-11 16:36:10', '2013-12-11 17:26:48', 1386797770, 1386800808),
(484, 1, '2013-12-11 20:27:54', '2013-12-11 20:36:50', 1386811674, 1386812210),
(485, 1, '2013-12-11 20:36:54', '2013-12-13 18:31:47', 1386812214, 1386977507),
(486, 1, '2013-12-13 18:31:47', '2013-12-13 21:14:05', 1386977507, 1386987245),
(487, 1, '2013-12-13 21:14:06', '2013-12-13 21:18:53', 1386987246, 1386987533),
(488, 1, '2013-12-13 21:19:01', '2013-12-13 21:25:24', 1386987541, 1386987924),
(489, 1, '2013-12-13 21:25:41', '2013-12-13 21:30:44', 1386987941, 1386988244),
(490, 1, '2013-12-13 21:30:48', '2013-12-13 21:35:53', 1386988248, 1386988553),
(491, 1, '2013-12-13 21:36:03', '2013-12-17 12:15:41', 1386988563, 1387300541),
(492, 1, '2013-12-17 12:15:41', '2013-12-30 20:18:02', 1387300541, 1388452682),
(493, 1, '2013-12-30 20:18:02', '2014-01-06 12:29:15', 1388452682, 1389029355),
(494, 1, '2014-01-06 12:29:15', '2014-01-06 12:34:55', 1389029355, 1389029695),
(495, 1, '2014-01-06 12:35:26', '2014-01-06 12:42:49', 1389029726, 1389030169),
(496, 1, '2014-01-06 12:43:14', '2014-01-08 19:49:23', 1389030194, 1389228563),
(497, 1, '2014-01-08 19:49:23', '2014-01-08 19:55:26', 1389228563, 1389228926),
(498, 1, '2014-01-08 19:55:35', '2014-01-09 12:25:48', 1389228935, 1389288348),
(499, 1, '2014-01-09 12:25:48', '2014-01-09 12:26:21', 1389288348, 1389288381),
(500, 2, '2014-01-09 12:26:26', '2014-01-09 12:26:33', 1389288386, 1389288393),
(501, 1, '2014-01-10 21:47:30', '2014-01-10 21:54:33', 1389408450, 1389408873),
(502, 1, '2014-01-10 21:54:44', '2014-01-10 22:50:38', 1389408884, 1389412238),
(503, 1, '2014-01-10 22:50:43', '2014-01-10 22:57:05', 1389412243, 1389412625),
(504, 1, '2014-01-10 22:57:14', '2014-01-10 23:04:54', 1389412634, 1389413094),
(505, 1, '2014-01-10 23:05:00', '2014-01-11 07:26:01', 1389413100, 1389443161),
(506, 1, '2014-01-11 07:26:01', '2014-01-11 07:34:26', 1389443161, 1389443666),
(507, 1, '2014-01-11 07:36:59', '2014-01-11 08:01:33', 1389443819, 1389445293),
(508, 1, '2014-01-11 08:01:38', '2014-02-14 16:50:44', 1389445298, 1392414644),
(509, 2, '2014-01-24 13:20:01', '2014-01-24 13:24:16', 1390587601, 1390587856),
(510, 2, '2014-01-24 13:24:33', '2014-02-12 15:06:25', 1390587873, 1392235585),
(511, 2, '2014-02-12 15:06:25', '2014-02-17 10:25:48', 1392235585, 1392650748),
(512, 1, '2014-02-14 16:50:44', '2014-02-14 18:07:57', 1392414644, 1392419277),
(513, 2, '2014-02-17 10:25:48', '2014-02-17 10:31:11', 1392650748, 1392651071),
(514, 2, '2014-02-17 10:31:22', '2014-02-17 11:01:27', 1392651082, 1392652887),
(515, 2, '2014-02-17 17:17:21', NULL, 1392675441, NULL),
(516, 1, '2014-03-27 15:44:03', '2014-03-27 15:44:29', 1395953043, 1395953069),
(517, 1, '2014-05-28 15:39:59', '2014-05-28 15:45:03', 1401309599, 1401309903),
(518, 1, '2014-05-28 15:46:03', '2014-05-28 15:52:29', 1401309963, 1401310349),
(519, 1, '2014-05-28 15:52:43', '2014-05-28 15:57:08', 1401310363, 1401310628),
(520, 1, '2014-05-28 15:57:15', '2014-05-29 13:04:23', 1401310635, 1401386663),
(521, 1, '2014-05-29 13:04:23', '2014-05-29 13:17:55', 1401386663, 1401387475),
(522, 1, '2014-05-29 13:17:55', '2014-05-29 13:23:19', 1401387475, 1401387799),
(523, 1, '2014-05-29 13:23:24', '2014-05-29 13:27:44', 1401387804, 1401388064),
(524, 1, '2014-05-29 13:28:27', '2014-05-29 13:33:53', 1401388107, 1401388433),
(525, 1, '2014-05-29 13:33:59', '2014-05-29 13:39:13', 1401388439, 1401388753),
(526, 1, '2014-05-29 13:39:24', '2014-05-29 13:46:21', 1401388764, 1401389181),
(527, 1, '2014-05-29 13:46:31', '2014-05-29 13:51:41', 1401389191, 1401389501),
(528, 1, '2014-05-29 13:53:56', '2014-05-29 14:00:53', 1401389636, 1401390053),
(529, 1, '2014-05-29 14:03:02', '2014-05-29 15:02:05', 1401390182, 1401393725),
(530, 1, '2014-06-02 20:13:58', '2014-06-02 20:25:48', 1401758038, 1401758748),
(531, 1, '2014-06-02 21:34:18', '2014-06-02 21:39:27', 1401762858, 1401763167),
(532, 1, '2014-06-02 21:39:47', '2014-06-02 21:44:58', 1401763187, 1401763498),
(533, 1, '2014-06-02 21:45:04', '2014-06-02 21:51:11', 1401763504, 1401763871),
(534, 1, '2014-06-02 21:51:29', '2014-06-02 21:58:34', 1401763889, 1401764314),
(535, 1, '2014-06-02 21:58:39', '2014-06-02 22:03:45', 1401764319, 1401764625),
(536, 1, '2014-06-02 22:03:57', '2014-06-02 22:09:22', 1401764637, 1401764962),
(537, 1, '2014-06-02 22:10:22', '2014-06-02 22:16:53', 1401765022, 1401765413),
(538, 1, '2014-06-02 22:17:08', '2014-06-03 13:12:16', 1401765428, 1401819136),
(539, 1, '2014-06-03 13:12:16', '2014-06-03 13:36:29', 1401819136, 1401820589),
(540, 1, '2014-06-03 13:36:36', '2014-06-05 10:07:44', 1401820596, 1401980864),
(541, 1, '2014-06-05 10:07:44', '2014-06-05 12:48:25', 1401980864, 1401990505),
(542, 1, '2014-06-05 12:48:31', '2014-06-05 12:53:46', 1401990511, 1401990826),
(543, 1, '2014-06-05 12:53:58', '2014-06-05 12:59:01', 1401990838, 1401991141),
(544, 1, '2014-06-05 12:59:18', '2014-06-05 13:04:25', 1401991158, 1401991465),
(545, 1, '2014-06-05 13:04:32', '2014-06-05 13:12:57', 1401991472, 1401991977),
(546, 1, '2014-06-05 13:15:05', '2014-06-05 13:37:48', 1401992105, 1401993468),
(547, 1, '2014-06-05 13:37:58', '2014-06-05 13:43:25', 1401993478, 1401993805),
(548, 1, '2014-06-05 13:43:33', '2014-06-05 13:48:39', 1401993813, 1401994119),
(549, 1, '2014-06-05 13:48:50', '2014-06-05 13:53:54', 1401994130, 1401994434),
(550, 1, '2014-06-05 13:54:01', '2014-06-05 14:02:00', 1401994441, 1401994920),
(551, 1, '2014-06-05 14:02:08', '2014-06-05 14:07:10', 1401994928, 1401995230),
(552, 1, '2014-06-05 18:22:34', '2014-06-05 18:28:01', 1402010554, 1402010881),
(553, 1, '2014-06-05 18:28:09', '2014-06-05 19:11:28', 1402010889, 1402013488),
(554, 1, '2014-06-05 20:46:34', '2014-06-05 20:51:41', 1402019194, 1402019501),
(555, 1, '2014-06-05 20:51:58', '2014-06-05 20:57:11', 1402019518, 1402019831),
(556, 1, '2014-06-05 20:57:18', '2014-06-05 21:02:21', 1402019838, 1402020141),
(557, 1, '2014-06-05 21:02:31', '2014-07-22 23:11:09', 1402020151, 1406088669),
(558, 1, '2014-07-22 23:11:09', '2014-10-17 19:40:34', 1406088669, 1413592834),
(559, 1, '2014-10-17 19:40:34', '2014-10-17 19:40:41', 1413592834, 1413592841),
(560, 1, '2014-10-17 19:41:04', '2014-10-17 19:42:18', 1413592864, 1413592938),
(561, 1, '2014-11-12 14:04:22', '2014-11-12 14:09:56', 1415819062, 1415819396),
(562, 1, '2014-11-12 14:10:06', '2014-11-12 14:43:40', 1415819406, 1415821420),
(563, 1, '2014-11-12 14:43:57', '2014-11-12 15:15:58', 1415821437, 1415823358),
(564, 1, '2014-11-12 15:16:08', '2015-09-14 12:23:37', 1415823368, 1442251417),
(565, 1, '2015-09-14 12:23:37', '2015-09-14 15:07:49', 1442251417, 1442261269),
(566, 1, '2015-09-14 15:07:50', '2015-09-14 15:15:20', 1442261270, 1442261720),
(567, 1, '2015-09-14 15:15:29', '2015-09-14 15:57:04', 1442261729, 1442264224),
(568, 1, '2015-09-14 15:57:04', '2015-09-14 16:00:43', 1442264224, 1442264443),
(569, 1, '2015-09-14 16:02:42', '2015-09-21 11:56:37', 1442264562, 1442854597),
(570, 1, '2015-09-21 11:56:37', '2015-09-21 12:03:38', 1442854597, 1442855018),
(571, 1, '2015-09-21 12:09:58', '2015-09-21 12:15:40', 1442855398, 1442855740),
(572, 1, '2015-09-21 12:16:43', '2015-09-21 12:22:55', 1442855803, 1442856175),
(573, 1, '2015-09-21 12:25:55', '2015-09-21 12:37:06', 1442856355, 1442857026),
(574, 1, '2015-09-21 12:37:50', '2015-09-21 12:52:54', 1442857070, 1442857974),
(575, 1, '2015-09-21 12:53:11', '2015-09-21 12:58:29', 1442857991, 1442858309),
(576, 1, '2015-09-21 12:58:44', '2015-09-21 13:03:46', 1442858324, 1442858626),
(577, 1, '2015-09-21 13:04:07', '2015-09-21 13:07:29', 1442858647, 1442858849),
(578, 1, '2015-09-21 13:08:01', '2015-09-21 13:13:24', 1442858881, 1442859204),
(579, 1, '2015-09-21 13:13:42', '2015-09-21 13:19:32', 1442859222, 1442859572),
(580, 1, '2015-09-21 13:19:45', '2015-09-21 13:25:26', 1442859585, 1442859926),
(581, 1, '2015-09-21 13:25:48', '2015-09-21 13:31:59', 1442859948, 1442860319),
(582, 1, '2015-09-21 13:32:08', '2015-09-21 13:35:15', 1442860328, 1442860515),
(583, 1, '2015-09-21 13:35:24', '2015-09-21 13:40:46', 1442860524, 1442860846),
(584, 1, '2015-09-21 13:41:05', '2015-09-21 13:47:38', 1442860865, 1442861258),
(585, 1, '2015-09-21 13:47:38', '2015-09-21 13:52:50', 1442861258, 1442861570),
(586, 1, '2015-09-21 13:55:13', '2015-09-21 13:58:33', 1442861713, 1442861913),
(587, 1, '2015-09-21 13:59:23', '2015-09-21 14:04:53', 1442861963, 1442862293),
(588, 1, '2015-09-21 14:05:04', '2015-09-21 14:07:13', 1442862304, 1442862433),
(589, 1, '2015-09-21 14:07:22', '2015-09-21 15:25:49', 1442862442, 1442867149),
(590, 1, '2015-09-21 15:26:47', '2015-09-21 15:32:46', 1442867207, 1442867566),
(591, 1, '2015-09-21 15:32:56', '2015-09-21 15:37:47', 1442867576, 1442867867),
(592, 1, '2015-09-21 15:37:55', '2015-09-21 15:41:39', 1442867875, 1442868099),
(593, 1, '2015-09-21 15:42:02', '2015-09-21 15:47:12', 1442868122, 1442868432),
(594, 1, '2015-09-21 15:47:24', '2015-09-21 15:49:38', 1442868444, 1442868578),
(595, 1, '2015-09-21 15:49:46', '2015-09-21 15:52:10', 1442868586, 1442868730),
(596, 1, '2015-09-21 15:54:38', '2015-09-21 15:59:37', 1442868878, 1442869177),
(597, 1, '2015-09-21 15:59:42', '2015-09-21 16:04:44', 1442869182, 1442869484),
(598, 1, '2015-09-21 16:04:51', '2015-09-21 16:09:59', 1442869491, 1442869799),
(599, 1, '2015-09-21 16:10:30', '2015-09-21 16:15:34', 1442869830, 1442870134),
(600, 1, '2015-09-21 16:15:47', '2015-09-21 16:47:56', 1442870147, 1442872076),
(601, 1, '2015-09-21 16:47:56', '2015-09-21 16:53:30', 1442872076, 1442872410),
(602, 1, '2015-09-21 16:53:37', '2015-09-21 17:04:05', 1442872417, 1442873045),
(603, 1, '2015-09-21 17:04:13', '2015-09-21 17:34:14', 1442873053, 1442874854),
(604, 1, '2015-09-21 17:34:15', '2015-09-21 18:27:39', 1442874855, 1442878059),
(605, 1, '2015-09-21 18:27:40', '2015-09-21 18:31:58', 1442878060, 1442878318),
(606, 1, '2015-09-21 18:32:06', '2015-09-21 18:37:13', 1442878326, 1442878633),
(607, 1, '2015-09-21 18:39:09', '2015-09-21 18:44:10', 1442878749, 1442879050),
(608, 1, '2015-09-21 18:44:23', '2015-09-21 18:49:10', 1442879063, 1442879350),
(609, 1, '2015-09-22 10:33:55', '2015-11-19 19:27:46', 1442936035, 1447979266),
(610, 1, '2015-11-19 19:27:46', '2015-11-19 19:28:57', 1447979266, 1447979337),
(611, 1, '2016-04-05 12:29:40', '2016-04-05 12:43:02', 1459877380, 1459878182),
(612, 1, '2016-04-05 12:44:24', '2016-04-05 12:49:30', 1459878264, 1459878570),
(613, 1, '2016-04-05 12:55:19', '2016-04-05 13:00:33', 1459878919, 1459879233),
(614, 1, '2016-04-05 13:00:52', '2016-04-05 13:06:05', 1459879252, 1459879565),
(615, 1, '2016-04-05 15:31:18', '2016-04-05 15:36:27', 1459888278, 1459888587),
(616, 1, '2016-04-05 15:37:08', '2016-04-06 15:26:48', 1459888628, 1459974408),
(617, 1, '2016-04-06 15:26:48', '2016-04-07 15:48:04', 1459974408, 1460062084),
(618, 1, '2016-04-07 15:48:04', '2016-09-29 17:53:49', 1460062084, 1475189629),
(619, 1, '2016-09-29 17:53:50', '2016-10-12 12:39:48', 1475189630, 1476293988),
(620, 1, '2016-10-12 12:39:49', '2016-10-13 11:55:51', 1476293989, 1476377751),
(621, 1, '2016-10-13 11:55:51', '2016-10-13 14:41:45', 1476377751, 1476387705),
(622, 1, '2016-10-13 16:21:10', '2016-10-14 10:12:20', 1476393670, 1476457940),
(623, 1, '2016-10-14 10:12:21', '2016-10-14 18:32:43', 1476457941, 1476487963),
(624, 1, '2016-10-14 18:32:52', '2016-10-14 18:41:56', 1476487972, 1476488516),
(625, 1, '2016-10-17 11:38:17', '2016-10-18 14:49:27', 1476722297, 1476820167),
(626, 1, '2016-10-18 14:49:28', '2016-10-19 10:13:07', 1476820168, 1476889987),
(627, 1, '2016-10-19 10:13:07', '2016-10-20 10:51:36', 1476889987, 1476978696),
(628, 1, '2016-10-20 10:51:36', '2016-11-02 17:31:01', 1476978696, 1478125861),
(629, 1, '2016-11-02 17:31:02', '2016-11-07 17:20:12', 1478125862, 1478557212),
(630, 1, '2016-11-07 17:20:13', '2016-11-12 09:16:52', 1478557213, 1478960212),
(631, 1, '2016-11-12 09:16:52', '2016-11-12 09:22:13', 1478960212, 1478960533),
(632, 1, '2016-11-14 11:13:58', '2016-11-14 11:26:22', 1479140038, 1479140782),
(633, 1, '2017-02-06 11:28:27', '2017-04-21 08:55:16', 1486398507, 1492782916),
(634, 1, '2017-04-21 08:55:16', NULL, 1492782916, NULL),
(635, 1, '2017-04-21 11:55:42', NULL, 1492793742, NULL),
(636, 1, '2017-04-21 11:56:09', NULL, 1492793769, NULL),
(637, 1, '2017-04-24 11:20:37', NULL, 1493050837, NULL),
(638, 1, '2017-05-18 17:50:09', NULL, 1495147809, NULL),
(639, 1, '2017-07-10 15:35:27', NULL, 1499718927, NULL),
(640, 1, '2017-07-10 15:52:16', NULL, 1499719936, NULL),
(641, 1, '2017-07-14 16:39:15', NULL, 1500068355, NULL),
(642, 1, '2017-07-25 17:30:11', '2017-07-25 18:53:36', 1501021811, 1501026816),
(643, 1, '2017-07-26 17:27:50', '2017-07-26 18:04:36', 1501108070, 1501110276),
(644, 1, '2017-11-06 10:13:43', NULL, 1509981223, NULL),
(645, 1, '2018-01-12 16:40:22', '2018-01-15 17:46:36', 1515793222, 1516056396),
(646, 1, '2018-01-15 17:46:36', '2018-01-16 10:01:44', 1516056396, 1516114904),
(647, 1, '2018-01-16 10:01:46', '2018-01-16 11:38:27', 1516114906, 1516120707),
(648, 1, '2018-01-22 17:48:09', '2018-05-17 09:38:43', 1516661289, 1526567923),
(649, 1, '2018-05-17 09:38:44', NULL, 1526567924, NULL),
(650, 1, '2018-05-17 17:45:10', NULL, 1526597110, NULL),
(651, 1, '2018-05-18 10:44:18', NULL, 1526658258, NULL),
(652, 1, '2018-05-18 12:37:03', NULL, 1526665023, NULL),
(653, 1, '2018-05-18 16:00:47', NULL, 1526677247, NULL),
(654, 1, '2018-05-18 16:15:23', '2018-05-18 16:19:43', 1526678123, 1526678383),
(655, 1, '2018-05-18 16:20:20', NULL, 1526678420, NULL),
(656, 1, '2018-05-18 17:10:24', NULL, 1526681424, NULL),
(657, 1, '2018-05-18 17:38:32', '2018-05-18 17:42:12', 1526683112, 1526683332),
(658, 1, '2018-05-21 15:06:06', NULL, 1526933166, NULL),
(659, 1, '2018-05-21 16:07:20', NULL, 1526936840, NULL),
(660, 1, '2018-05-21 16:12:12', '2018-05-21 17:37:51', 1526937132, 1526942271),
(661, 1, '2018-05-21 17:38:22', '2018-05-21 18:16:04', 1526942302, 1526944564),
(662, 1, '2018-05-21 18:16:40', '2018-05-21 18:27:23', 1526944600, 1526945243),
(663, 1, '2018-05-21 18:28:40', '2018-05-21 19:02:23', 1526945320, 1526947343),
(664, 1, '2018-05-22 15:19:14', NULL, 1527020354, NULL),
(665, 1, '2018-05-26 07:17:32', NULL, 1527337052, NULL),
(666, 1, '2018-08-22 09:49:37', NULL, 1534949377, NULL),
(667, 1, '2018-10-25 09:40:21', NULL, 1540478421, NULL),
(668, 1, '2018-10-25 12:36:27', NULL, 1540488987, NULL),
(669, 1, '2018-11-26 11:57:05', NULL, 1543251425, NULL),
(670, 1, '2019-01-05 09:04:17', '2019-01-05 09:07:20', 1546697057, 1546697240),
(671, 1, '2019-01-05 09:08:53', NULL, 1546697333, NULL),
(672, 1, '2019-02-21 13:10:36', '2019-02-21 13:11:09', 1550772636, 1550772669),
(673, 1, '2019-02-26 09:02:37', NULL, 1551189757, NULL),
(674, 1, '2019-02-26 11:54:36', '2019-02-26 12:18:35', 1551200076, 1551201515),
(675, 1, '2019-02-26 14:33:53', NULL, 1551209633, NULL),
(676, 1, '2019-02-26 14:59:26', NULL, 1551211166, NULL),
(677, 1, '2019-02-26 15:24:24', NULL, 1551212664, NULL),
(678, 1, '2019-02-26 15:31:44', NULL, 1551213104, NULL),
(679, 1, '2019-02-26 16:24:20', NULL, 1551216260, NULL),
(680, 1, '2019-03-07 17:49:16', '2019-03-07 17:55:32', 1551998956, 1551999332),
(681, 1, '2019-03-13 09:49:41', NULL, 1552488581, NULL),
(682, 1, '2019-05-09 12:52:38', NULL, 1557424358, NULL),
(683, 1, '2019-05-15 12:23:18', NULL, 1557940998, NULL),
(684, 1, '2019-05-16 08:34:40', NULL, 1558013680, NULL),
(685, 1, '2019-05-16 10:17:12', '2019-05-16 10:26:44', 1558019832, 1558020404),
(686, 1, '2019-05-29 10:50:54', '2019-05-29 10:52:16', 1559145054, 1559145136),
(687, 1, '2019-05-29 16:44:26', '2019-05-29 16:56:06', 1559166266, 1559166966),
(688, 1, '2019-06-06 17:27:04', '2019-06-06 17:27:34', 1559860024, 1559860054),
(689, 1, '2019-06-06 17:29:03', NULL, 1559860143, NULL),
(690, 1, '2019-06-13 10:12:35', '2019-06-13 11:23:32', 1560438755, 1560443012),
(691, 1, '2019-06-18 12:58:47', NULL, 1560880727, NULL),
(692, 1, '2019-06-19 18:54:30', NULL, 1560988470, NULL),
(693, 1, '2019-07-08 15:21:21', NULL, 1562617281, NULL),
(694, 1, '2019-09-04 10:35:23', NULL, 1567611323, NULL),
(695, 1, '2019-09-04 17:31:52', '2019-09-04 18:49:12', 1567636312, 1567640952),
(696, 1, '2019-09-30 18:12:55', NULL, 1569885175, NULL),
(697, 1, '2019-10-17 11:08:51', NULL, 1571328531, NULL),
(698, 1, '2019-10-17 15:00:38', '2019-10-17 16:18:41', 1571342438, 1571347121);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sede`
--

CREATE TABLE `tb_sede` (
  `id` int(11) NOT NULL,
  `id_tipo_sede` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `google` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_sede`
--

INSERT INTO `tb_sede` (`id`, `id_tipo_sede`, `nombre`, `direccion`, `telefono`, `google`) VALUES
(1, 1, 'SEDE CENTRAL', 'AV. PETIT THOUARS 3470 - SAN ISIDRO', '421-6323', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1gZtGDrutOH7H3QGVn0ORotrVFQE\" width=\"960\" height=\"357\"></iframe>'),
(3, 1, 'BARRANCO', 'JR. ALFONSO UGARTE 250', '247-6892', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1aRuSCxEkbKUl8_AmvvRk46gi_1Y\" width=\"960\" height=\"357\"></iframe>'),
(4, 1, 'CALLAO', 'AV. GUARDIA CHALACA 1362', '453-3276', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1I1D3LX84ZijnCVfdIJN5slffgKQ\" width=\"960\" height=\"357\"></iframe>'),
(5, 1, 'COMAS', 'AV. EL MAESTRO PERUANO 430', '535-8144', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1UHBwJKIlBNI7ZsUbrmUPkficouo\" width=\"960\" height=\"357\"></iframe>'),
(6, 1, 'JESUS MARIA', 'JR. HUIRACOCHA 1486', '424-1443', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1Al2Tdfw83xChHivdDN8GKk0UYEg\" width=\"960\" height=\"357\"></iframe>'),
(7, 1, 'LA MOLINA', 'CALLE SANTA MAGDALENA SOFIA 109', '436-2883', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1Ra2i5b6H4Xz3hrTPMcA_Oih7Svc\" width=\"960\" height=\"357\"></iframe>\n'),
(8, 1, 'LA VICTORIA', 'JR. JUAN VOTO BERNALES 399 - SANTA CATALINA', '471-3998', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1qbcdNjSV4hwGLu1jKaB0EmzZWLE\" width=\"960\" height=\"357\"></iframe>'),
(9, 1, 'LIMA CENTRO', 'JR. CAMANA 780 PISO 5', '427-0158', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1WtzlrsS9njWTN_55rDk7luWKJSQ\" width=\"960\" height=\"357\"></iframe>'),
(10, 1, 'LOS OLIVOS', 'AV. CARLOS IZAGUIRRE 1268', '232 0420', '<iframe src=\"https://www.google.com/maps/d/u/0/embed?mid=1S5nPLandNX0z6fir3nV_KdZQZ2Q\" width=\"640\" height=\"480\"></iframe>'),
(11, 1, 'PUEBLO LIBRE', 'AV. PABLO FERNANDINI 1573', '330-7492', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1VtF_AFSAr_xsr33h88UD4pw0aEQ\" width=\"960\" height=\"357\"></iframe>'),
(13, 1, 'SAN BORJA 1', 'AV. JOAQUIN MADRID 235', '225-0809', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1chspEBYIbY-IyXNIxyHpo-Yreow\" width=\"960\" height=\"357\"></iframe>'),
(15, 1, 'SAN JUAN DE LURIGANCHO', 'CALLE LAS CHULPAS 296 OFIC. 201-202 - ZÁRATE', '458-6472', '<iframe src=\"https://www.google.com/maps/d/embed?mid=17SkSCq3ye9fx9JVWwn2cLFaru38\" width=\"960\" height=\"357\"></iframe>'),
(16, 1, 'SAN JUAN DE MIRAFLORES', 'AV. GUILLERMO BILLINGHURST 619', '466-1128', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1RV86gC6IBP3siXY-OokwySn66Tw\" width=\"960\" height=\"357\"></iframe>'),
(17, 1, 'SAN MIGUEL 1', 'CALLE MONSEÑOR JORGE DINTILHAC 717 ', '451-5553', '<iframe src=\"https://www.google.com/maps/d/embed?mid=14mTaeVnlp_ZIBYx9nADv7mOffVA\" width=\"960\" height=\"357\"></iframe>'),
(18, 1, 'SURCO', 'Av. Caminos del Inca 1554', '688-8529', ''),
(19, 1, 'SURQUILLO', 'CALLE LAS TIENDAS 331 DPTO. 101', '440-1021', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1WRnlxttON-ObNC8nck0JmUXj0Pc\" width=\"960\" height=\"357\"></iframe>'),
(20, 2, 'AREQUIPA', 'CALLE SEVILLA Nº 107 URB. LOS SAUCES - CAYMA', '(054) 272716', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1fONBPYtyt7ctQcx0ihXC6Pn69i8\" width=\"960\" height=\"357\"></iframe>'),
(22, 2, 'CAJAMARCA', 'AV. DOS DE MAYO N°360', '(076) 369456', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1H-Qzy4uNOhYcqKx4VtIBx5KRc-I\" width=\"960\" height=\"357\"></iframe>'),
(24, 2, 'CHICLAYO', 'AV. JOSÉ BALTA 039', '(074) 259527', ''),
(25, 2, 'CUSCO', 'CALLE ABRAHAM VALDELOMAR  A-17 - WANCHAQ', '(084) 262020', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1BJAktB70fcUw6r7CVvFOtDJfP2U\" width=\"960\" height=\"357\"></iframe>'),
(26, 2, 'HUANCAYO', 'JR. ANCASH N°231', '(064) 211004', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1ijNBLLs0s_uzCPrG0EGg_p50KHE\" width=\"960\" height=\"357\"></iframe>'),
(27, 2, 'HUARAZ', 'JR. JUAN BAUTISTA MEJÍA N°858', '(043) 425135', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1eM51Uk0zq7zM-LgbLdUpmme3uVg\" width=\"960\" height=\"357\"></iframe>'),
(28, 2, 'ICA', 'CALLE DOMINGO ELIAS 129 URB. LUREN', '(056) 216345', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1y0f-V9Sk6uRcwk6AxR0eBVn8kdQ\" width=\"960\" height=\"357\"></iframe>'),
(29, 2, 'JULIACA', 'JR. PIURA N°482 PARQUE GRAU', '(051) 325462', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1cyOBVhMx4uBZxQt9VFzmLgh-0ZM\" width=\"960\" height=\"357\"></iframe>'),
(30, 2, 'MOQUEGUA', 'URB. EL HUAYCO MZ. D - LOTE 1, MARISCAL NIETO', '(053) 463446', '<iframe src=\"https://www.google.com/maps/d/embed?mid=12HfqC1yNRrOTAChGw4qR4TYAQxk\" width=\"960\" height=\"357\"></iframe>'),
(31, 2, 'PIURA', 'AV. GRAU N°1050 URB. CLUB GRAU', '(073) 305820', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1hEUmip5k4zoxBOfQC26FYRL8Ybs\" width=\"690\" height=\"357\"></iframe>'),
(32, 2, 'PUCALLPA\n', 'JR. ATAHUALPA 139. CALLERIA - CORONEL PORTILLO', '(061) 573075', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1nsAOunW7UvJTszXBOb0CNCQ9Wy8\" width=\"960\" height=\"357\"></iframe>'),
(33, 2, 'PUNO', 'JR. DEUSTUA N°754', '(051) 366390', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1T0xWorp3j0JDqxa5jLTypAw0vZA\" width=\"960\" height=\"357\"></iframe>'),
(34, 2, 'TACNA', 'AV. BILLINGHURST  N°358', '(052) 413136', ' <iframe src=\"https://www.google.com/maps/d/embed?mid=180S7bE0Ixx4-T_PfbIBklV1TIPg\" width=\"960\" height=\"357\"></iframe>'),
(35, 2, 'TARAPOTO', 'JR. RICARDO PALMA N°262', '(042) 520016', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1UY3tBjdkZTW7_Xadg9qcVziY2Tk\" width=\"960\" height=\"357\"></iframe>'),
(36, 2, 'TRUJILLO', 'CALLE SANTA URSULA N°109 URB. LA MERCED', '(044) 286921', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1uNL_iAFI-s13i05uQ4M3FgLCt7E\" width=\"960\" height=\"357\"></iframe>'),
(37, 2, 'TUMBES', 'CALLE LOS ANDES N°121', '(072) 522771', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1tpKr-rY9sEWF1cdd6htrXwRDbkI\" width=\"960\" height=\"357\"></iframe>'),
(40, 3, 'Sede Artificio', 'Direccion Artificio', 'Artificio', 'Artificio'),
(42, 1, 'MIRAFLORES', 'AV. REP DE PANAMA Nº 5806 URB. SAN ANTONIO', '447-5190', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1fCW5bquoxnO_i5wj7fWAgoG7Iuo\" width=\"960\" height=\"357\"></iframe>'),
(43, 1, 'JAVIER PRADO', 'AV. JAVIER PRADO ESTE  1692 - SAN ISIDRO', '475-1719', '<iframe src=\"https://www.google.com/maps/d/embed?mid=1mXilpj9Be2oui4fPr1FM2vbYig4\" width=\"960\" height=\"357\"></iframe>'),
(44, 3, 'Sede Extra', 'Dirección Extra', '12312312', ''),
(46, 1, 'SAN MIGUEL 2', 'CALLE AYARSA DE MORALES 237, URB. EL CAMPILLO', '636-1105', ''),
(47, 1, 'SAN BORJA 2', 'AV. PRIMAVERA 643 OF. 503 URB. CHACARILLA DEL ESTANQUE ', '648-0253', ''),
(48, 1, 'ESPECIALIDADES', 'AV. JUAN DE ARONA 402', '421-6323', ''),
(49, 1, 'MIRAFLORES ESPECIALIDADES', 'AV. REPUBLICA DE PANAMA 5790 OF. 301', '447-5190', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sexo`
--

CREATE TABLE `tb_sexo` (
  `id` int(11) NOT NULL,
  `nombre1` varchar(10) NOT NULL,
  `nombre2` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_sexo`
--

INSERT INTO `tb_sexo` (`id`, `nombre1`, `nombre2`, `sexo`) VALUES
(1, 'Dr.', 'Director Odontológico', 'M'),
(2, 'Dra.', 'Directora Odontológica', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_especialidad_web`
--

CREATE TABLE `tb_tipo_especialidad_web` (
  `id` int(11) NOT NULL,
  `nombre` varchar(27) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_especialidad_web`
--

INSERT INTO `tb_tipo_especialidad_web` (`id`, `nombre`) VALUES
(1, 'ODONTOLOGÍA GENERAL'),
(2, 'ODONTOLOGÍA ESPECIALIZADA'),
(3, 'NUEVAS ESPECIALIDADES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_sede`
--

CREATE TABLE `tb_tipo_sede` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_sede`
--

INSERT INTO `tb_tipo_sede` (`id`, `nombre`) VALUES
(1, 'Lima'),
(2, 'Provicia'),
(3, 'Extra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_upload`
--

CREATE TABLE `tb_upload` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nomgen` text NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_upload`
--

INSERT INTO `tb_upload` (`id`, `nombre`, `nomgen`, `tipo`) VALUES
(126, 'Equipos_01.png', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_01.png', 'png'),
(127, 'Equipos_02.png', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_02.png', 'png'),
(128, 'Equipos_03.png', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_03.png', 'png'),
(129, 'Equipos_04.png', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_04.png', 'png'),
(130, 'Equipos_05.png', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_05.png', 'png'),
(131, 'Equipos_06.png', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_06.png', 'png'),
(132, 'ecera-2.png', 'http://softweb.pe/ImagenesPrueba/COA/Home/cabecera-2.png', 'png'),
(133, 'ecera-1.png', 'http://softweb.pe/ImagenesPrueba/COA/Home/cabecera-1.png', 'png'),
(134, 'ecera-3.png', 'http://softweb.pe/ImagenesPrueba/COA/Home/cabecera-3.png', 'png'),
(135, 'Hydrangeas', '460d65_Hydrangeas.jpg', 'jpg'),
(136, 'Jellyfish', 'ab5920_Jellyfish.jpg', 'jpg'),
(137, 'Jellyfish', 'c20e8e_Jellyfish.jpg', 'jpg'),
(138, 'Jellyfish', '087db2_Jellyfish.jpg', 'jpg'),
(139, 'Jellyfish', '5a6395_Jellyfish.jpg', 'jpg'),
(140, 'Jellyfish', '899769_Jellyfish.jpg', 'jpg'),
(141, 'Jellyfish', '0d12dc_Jellyfish.jpg', 'jpg'),
(142, 'Jellyfish', 'bda85a_Jellyfish.jpg', 'jpg'),
(143, 'Jellyfish', 'ca7da6_Jellyfish.jpg', 'jpg'),
(144, 'Jellyfish', '66e5a0_Jellyfish.jpg', 'jpg'),
(145, 'Jellyfish', '067108_Jellyfish.jpg', 'jpg'),
(146, 'Jellyfish', 'dc0204_Jellyfish.jpg', 'jpg'),
(147, 'Jellyfish', '5fb604_Jellyfish.jpg', 'jpg'),
(148, 'Chrysanthemum', '5af63b_Chrysanthemum.jpg', 'jpg'),
(149, 'Jellyfish', '287f89_Jellyfish.jpg', 'jpg'),
(150, 'Jellyfish', '8cdf1d_Jellyfish.jpg', 'jpg'),
(151, 'Jellyfish', '5a78f0_Jellyfish.jpg', 'jpg'),
(152, 'Jellyfish', '5e6986_Jellyfish.jpg', 'jpg'),
(153, 'Hydrangeas', '983f5b_Hydrangeas.jpg', 'jpg'),
(154, 'Jellyfish', 'f147f2_Jellyfish.jpg', 'jpg'),
(155, 'Jellyfish', '6e34c2_Jellyfish.jpg', 'jpg'),
(156, 'Equipos_01', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_01.png', 'png'),
(157, 'Equipos_02', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_02.png', 'png'),
(158, 'Equipos_03', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_03.png', 'png'),
(159, 'Equipos_04', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_04.png', 'png'),
(160, 'Equipos_05', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_05.png', 'png'),
(161, 'Equipos_06', 'http://softweb.pe/ImagenesPrueba/COA/Equipos/Equipos_06.png', 'png'),
(162, 'cabecera-2', 'http://softweb.pe/ImagenesPrueba/COA/Home/cabecera-2.png', 'png'),
(163, 'cabecera-1', 'http://softweb.pe/ImagenesPrueba/COA/Home/cabecera-1.png', 'png'),
(164, 'cabecera-3', 'http://softweb.pe/ImagenesPrueba/COA/Home/cabecera-3.png', 'png'),
(165, '3d-wallpapers-11', 'http://localhost/coa-setup/upload/files/8c0661_3d-wallpapers-11.jpg', 'jpg'),
(166, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/48f2d2_366604-1366x768-[DesktopNexus.com]', 'com]'),
(167, 'A_day_at_the_savannah_wide', 'http://localhost/coa-setup/upload/files/69953c_A_day_at_the_savannah_wide.jpg', 'jpg'),
(168, '1014057_10151820710376095_240037306_n', 'http://localhost/coa-setup/upload/files/bb63fe_1014057_10151820710376095_240037306_n.jpg', 'jpg'),
(169, 'Begonia_by_fatpoint21', 'http://localhost/coa-setup/upload/files/ec8755_Begonia_by_fatpoint21.jpg', 'jpg'),
(170, 'Begonia_by_fatpoint21', 'http://localhost/coa-setup/upload/files/27fc7f_Begonia_by_fatpoint21.jpg', 'jpg'),
(171, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/8aac18_419940-1680x1050.jpg', 'jpg'),
(172, 'A_day_at_the_savannah_wide', 'http://localhost/coa-setup/upload/files/530908_A_day_at_the_savannah_wide.jpg', 'jpg'),
(173, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/a6d43f_366604-1366x768-[DesktopNexus.com]', 'com]'),
(174, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/ab52a3_419940-1680x1050.jpg', 'jpg'),
(175, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/41c78e_419940-1680x1050.jpg', 'jpg'),
(176, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/50c111_419940-1680x1050.jpg', 'jpg'),
(177, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/4ed90c_419940-1680x1050.jpg', 'jpg'),
(178, '3d-wallpapers-11', 'http://localhost/coa-setup/upload/files/b5b759_3d-wallpapers-11.jpg', 'jpg'),
(179, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/768f9e_419940-1680x1050.jpg', 'jpg'),
(180, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/1af4e9_419940-1680x1050.jpg', 'jpg'),
(181, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/53c927_366604-1366x768-[DesktopNexus.com]', 'com]'),
(182, 'Aeg_by_Tauno_Erik', 'http://localhost/coa-setup/upload/files/490d17_Aeg_by_Tauno_Erik.jpg', 'jpg'),
(183, 'Aeg_by_Tauno_Erik', 'http://localhost/coa-setup/upload/files/158c99_Aeg_by_Tauno_Erik.jpg', 'jpg'),
(184, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/5404bb_366604-1366x768-[DesktopNexus.com]', 'com]'),
(185, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/47a7a3_419940-1680x1050.jpg', 'jpg'),
(186, '1014057_10151820710376095_240037306_n', 'http://localhost/coa-setup/upload/files/a568aa_1014057_10151820710376095_240037306_n.jpg', 'jpg'),
(187, '3d-wallpapers-11', 'http://localhost/coa-setup/upload/files/b380eb_3d-wallpapers-11.jpg', 'jpg'),
(188, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/5963cd_366604-1366x768-[DesktopNexus.com]', 'com]'),
(189, '3d-wallpapers-11', 'http://localhost/coa-setup/upload/files/2c18b1_3d-wallpapers-11.jpg', 'jpg'),
(190, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/e97065_366604-1366x768-[DesktopNexus.com]', 'com]'),
(191, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/c9f260_419940-1680x1050.jpg', 'jpg'),
(192, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/b0e4af_419940-1680x1050.jpg', 'jpg'),
(193, '419940-1680x1050', 'http://localhost/coa-setup/upload/files/3324a5_419940-1680x1050.jpg', 'jpg'),
(194, '1014057_10151820710376095_240037306_n', 'http://localhost/coa-setup/upload/files/fc75e0_1014057_10151820710376095_240037306_n.jpg', 'jpg'),
(195, 'A_Little_Quetzal_by_vgerasimov', 'http://localhost/coa-setup/upload/files/6c3770_A_Little_Quetzal_by_vgerasimov.jpg', 'jpg'),
(196, 'Aeg_by_Tauno_Erik', 'http://localhost/coa-setup/upload/files/2826ac_Aeg_by_Tauno_Erik.jpg', 'jpg'),
(197, 'A_day_at_the_savannah_wide', 'http://localhost/coa-setup/upload/files/596ce6_A_day_at_the_savannah_wide.jpg', 'jpg'),
(198, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/c9fb79_366604-1366x768-[DesktopNexus.com]', 'com]'),
(199, 'A_Little_Quetzal_by_vgerasimov', 'http://localhost/coa-setup/upload/files/5aef41_A_Little_Quetzal_by_vgerasimov.jpg', 'jpg'),
(200, '1014057_10151820710376095_240037306_n', 'http://localhost/coa-setup/upload/files/bb5b6e_1014057_10151820710376095_240037306_n.jpg', 'jpg'),
(201, '3d-wallpapers-11', 'http://localhost/coa-setup/upload/files/2d2e25_3d-wallpapers-11.jpg', 'jpg'),
(202, '1014057_10151820710376095_240037306_n', 'http://localhost/coa-setup/upload/files/67c876_1014057_10151820710376095_240037306_n.jpg', 'jpg'),
(203, 'WildWheat_by_Brian_Burt', 'http://localhost/coa-setup/upload/files/e77dd6_WildWheat_by_Brian_Burt.jpg', 'jpg'),
(204, 'A_day_at_the_savannah_wide', 'http://localhost/coa-setup/upload/files/b2000f_A_day_at_the_savannah_wide.jpg', 'jpg'),
(205, 'A_day_at_the_savannah_wide', 'http://localhost/coa-setup/upload/files/e84b64_A_day_at_the_savannah_wide.jpg', 'jpg'),
(206, '38589731', 'http://localhost/coa-setup/upload/files/e4c677_38589731.jpg', 'jpg'),
(207, '38589731', 'http://localhost/coa-setup/upload/files/e62966_38589731.jpg', 'jpg'),
(208, '38589731', 'http://localhost/coa-setup/upload/files/aa8b94_38589731.jpg', 'jpg'),
(209, '38589731', 'http://localhost/coa-setup/upload/files/9599c1_38589731.jpg', 'jpg'),
(210, '38589731', 'http://localhost/coa-setup/upload/files/a12e7d_38589731.jpg', 'jpg'),
(211, '366604-1366x768-[DesktopNexus', 'http://localhost/coa-setup/upload/files/0002e8_366604-1366x768-[DesktopNexus.com]', 'com]'),
(212, 'Green_by_Alan_Mattila', 'http://localhost/coa-setup/upload/files/8bd3fe_Green_by_Alan_Mattila.jpg', 'jpg'),
(213, 'foto01', 'http://softweb.pe/coa-setup/upload/files/0d39ca_foto01.jpg', 'jpg'),
(214, 'foto02', 'http://softweb.pe/coa-setup/upload/files/ccc35b_foto02.jpg', 'jpg'),
(215, 'foto03', 'http://softweb.pe/coa-setup/upload/files/767ac2_foto03.jpg', 'jpg'),
(216, 'foto01', 'http://softweb.pe/coa-setup/upload/files/350ee6_foto01.jpg', 'jpg'),
(217, 'camara_intraoral', 'http://softweb.pe/coa-setup/upload/files/4e3f4b_camara_intraoral.png', 'png'),
(218, 'radiologia_digital', 'http://softweb.pe/coa-setup/upload/files/b37c22_radiologia_digital.png', 'png'),
(219, 'ultrasonido', 'http://softweb.pe/coa-setup/upload/files/f522b1_ultrasonido.png', 'png'),
(220, 'blanqueamiento-laser', 'http://softweb.pe/coa-setup/upload/files/585e20_blanqueamiento-laser.png', 'png'),
(221, 'endodoncia', 'http://softweb.pe/coa-setup/upload/files/49d9b7_endodoncia.png', 'png'),
(222, 'esterilizacion', 'http://softweb.pe/coa-setup/upload/files/0b1851_esterilizacion.png', 'png'),
(223, 'cadcam', 'http://softweb.pe/coa-setup/upload/files/36148a_cadcam.png', 'png'),
(224, 'camara_intraoral', 'http://softweb.pe/coa-setup/upload/files/9d3610_camara_intraoral.png', 'png'),
(225, 'radiologia_digital', 'http://softweb.pe/coa-setup/upload/files/0ad131_radiologia_digital.png', 'png'),
(226, 'ultrasonido', 'http://softweb.pe/coa-setup/upload/files/53854e_ultrasonido.png', 'png'),
(227, 'blanqueamiento-laser', 'http://softweb.pe/coa-setup/upload/files/2911e5_blanqueamiento-laser.png', 'png'),
(228, 'blanqueamiento-laser', 'http://softweb.pe/coa-setup/upload/files/663cd7_blanqueamiento-laser.png', 'png'),
(229, 'endodoncia', 'http://softweb.pe/coa-setup/upload/files/f37564_endodoncia.png', 'png'),
(230, 'esterilizacion', 'http://softweb.pe/coa-setup/upload/files/c6481c_esterilizacion.png', 'png'),
(231, 'esterilizacion', 'http://softweb.pe/coa-setup/upload/files/a155d1_esterilizacion.png', 'png'),
(232, 'cadcam', 'http://softweb.pe/coa-setup/upload/files/44e7c9_cadcam.png', 'png'),
(233, 'ultrasonido', 'http://softweb.pe/coa-setup/upload/files/74a22b_ultrasonido.png', 'png'),
(234, 'camara_intraoral', 'http://softweb.pe/coa-setup/upload/files/852137_camara_intraoral.png', 'png'),
(235, 'carta01', 'http://coa.pe/antigua/views/layout/COA/img/carta/1.jpeg', 'jpeg'),
(236, 'carta02', 'http://coa.pe/antigua/views/layout/COA/img/carta/2.jpeg', 'jpeg'),
(237, 'carta03', 'http://coa.pe/antigua/views/layout/COA/img/carta/3.jpeg', 'jpeg'),
(238, 'carta04', 'http://coa.pe/antigua/views/layout/COA/img/carta/4.jpeg', 'jpeg'),
(239, 'carta05', 'http://coa.pe/antigua/views/layout/COA/img/carta/5.jpeg', 'jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id` int(11) NOT NULL,
  `idPersonal` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `idPerfil` int(10) DEFAULT NULL,
  `sesion` int(11) NOT NULL,
  `sesionMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_usuario`
--

INSERT INTO `tb_usuario` (`id`, `idPersonal`, `nombre`, `contrasena`, `fecha`, `idPerfil`, `sesion`, `sesionMax`) VALUES
(1, 1, 'admin', 'fa032ae5b8c573a04f93379d03e851f8', '0000-00-00 00:00:00', 1, 42, 100000),
(2, 2, 'disla', '040aa214a9d36cc5d209104026dea591', '2013-12-03 00:00:00', 3, 1, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_config_session`
--
ALTER TABLE `tb_config_session`
  ADD PRIMARY KEY (`idConfigSession`);

--
-- Indices de la tabla `tb_contenido`
--
ALTER TABLE `tb_contenido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_menu_tb_contenido` (`id_menu`);

--
-- Indices de la tabla `tb_contenido_popup`
--
ALTER TABLE `tb_contenido_popup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_popup_tb_popup` (`id_popup`);

--
-- Indices de la tabla `tb_director`
--
ALTER TABLE `tb_director`
  ADD PRIMARY KEY (`id_doctor`) USING BTREE,
  ADD UNIQUE KEY `id_sede` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `tb_distrito`
--
ALTER TABLE `tb_distrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_doctor`
--
ALTER TABLE `tb_doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_doctor_tb_sede1_idx` (`id_sede`),
  ADD KEY `fk_especialidad` (`id_especialidad`),
  ADD KEY `new_fk_constraint3` (`id_sexo`);

--
-- Indices de la tabla `tb_doctor_turno`
--
ALTER TABLE `tb_doctor_turno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sede` (`id_sede`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `tb_especialidad`
--
ALTER TABLE `tb_especialidad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `tb_especialidad_web`
--
ALTER TABLE `tb_especialidad_web`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_especialidad_web` (`id_tipo_especialidad_web`),
  ADD KEY `fk_imagen` (`id_imagen`);

--
-- Indices de la tabla `tb_grupo_lista`
--
ALTER TABLE `tb_grupo_lista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_lista`
--
ALTER TABLE `tb_lista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_grupo_lista` (`id_grupo_lista`) USING BTREE;

--
-- Indices de la tabla `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_padre` (`id_padre`);

--
-- Indices de la tabla `tb_perfiles`
--
ALTER TABLE `tb_perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_permisos`
--
ALTER TABLE `tb_permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_personal`
--
ALTER TABLE `tb_personal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_popup`
--
ALTER TABLE `tb_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_privilegios`
--
ALTER TABLE `tb_privilegios`
  ADD UNIQUE KEY `idProceso` (`idProceso`,`idPermiso`,`idPerfil`),
  ADD KEY `fk_tb_privilegios_tb_proceso1_idx` (`idProceso`),
  ADD KEY `fk_tb_privilegios_tb_permisos1_idx` (`idPermiso`),
  ADD KEY `fk_tb_privilegios_tb_usuario1_idx` (`idPerfil`);

--
-- Indices de la tabla `tb_privilegio_usuario`
--
ALTER TABLE `tb_privilegio_usuario`
  ADD UNIQUE KEY `idUsuario_2` (`idUsuario`,`idPermiso`,`idProceso`),
  ADD UNIQUE KEY `idUsuario_3` (`idUsuario`,`idPermiso`,`idProceso`),
  ADD KEY `idUsuario` (`idUsuario`,`idPermiso`),
  ADD KEY `idProceso` (`idProceso`),
  ADD KEY `idPermiso` (`idPermiso`);

--
-- Indices de la tabla `tb_proceso`
--
ALTER TABLE `tb_proceso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_titulo` (`titulo`),
  ADD KEY `FK_tb_proceso_padreProceso` (`idProceso`);

--
-- Indices de la tabla `tb_provincia`
--
ALTER TABLE `tb_provincia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_registrolog`
--
ALTER TABLE `tb_registrolog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tb_registrolog_usuario` (`idUsuario`);

--
-- Indices de la tabla `tb_registrologin`
--
ALTER TABLE `tb_registrologin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tb_registroLogin_usuario` (`idUsuario`);

--
-- Indices de la tabla `tb_sede`
--
ALTER TABLE `tb_sede`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_sede_tb_tipo_sede_idx` (`id_tipo_sede`);

--
-- Indices de la tabla `tb_sexo`
--
ALTER TABLE `tb_sexo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_tipo_especialidad_web`
--
ALTER TABLE `tb_tipo_especialidad_web`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_tipo_sede`
--
ALTER TABLE `tb_tipo_sede`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_upload`
--
ALTER TABLE `tb_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario` (`nombre`),
  ADD KEY `fk_tb_usuario_tb_personal_idx` (`idPersonal`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_config_session`
--
ALTER TABLE `tb_config_session`
  MODIFY `idConfigSession` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_contenido`
--
ALTER TABLE `tb_contenido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tb_contenido_popup`
--
ALTER TABLE `tb_contenido_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_distrito`
--
ALTER TABLE `tb_distrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_doctor`
--
ALTER TABLE `tb_doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=839;

--
-- AUTO_INCREMENT de la tabla `tb_doctor_turno`
--
ALTER TABLE `tb_doctor_turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tb_especialidad`
--
ALTER TABLE `tb_especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tb_especialidad_web`
--
ALTER TABLE `tb_especialidad_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tb_grupo_lista`
--
ALTER TABLE `tb_grupo_lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_lista`
--
ALTER TABLE `tb_lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tb_perfiles`
--
ALTER TABLE `tb_perfiles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_permisos`
--
ALTER TABLE `tb_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_personal`
--
ALTER TABLE `tb_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_popup`
--
ALTER TABLE `tb_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_proceso`
--
ALTER TABLE `tb_proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tb_provincia`
--
ALTER TABLE `tb_provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_registrolog`
--
ALTER TABLE `tb_registrolog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tb_registrologin`
--
ALTER TABLE `tb_registrologin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=699;

--
-- AUTO_INCREMENT de la tabla `tb_sede`
--
ALTER TABLE `tb_sede`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `tb_sexo`
--
ALTER TABLE `tb_sexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_tipo_sede`
--
ALTER TABLE `tb_tipo_sede`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_upload`
--
ALTER TABLE `tb_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_contenido`
--
ALTER TABLE `tb_contenido`
  ADD CONSTRAINT `fk_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_contenido_popup`
--
ALTER TABLE `tb_contenido_popup`
  ADD CONSTRAINT `fk_id_popup_tb_popup` FOREIGN KEY (`id_popup`) REFERENCES `tb_popup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_doctor`
--
ALTER TABLE `tb_doctor`
  ADD CONSTRAINT `fk_tb_doctor_tb_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `tb_especialidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_doctor_tb_sede` FOREIGN KEY (`id_sede`) REFERENCES `tb_sede` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_doctor_tb_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `tb_sexo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_especialidad_web`
--
ALTER TABLE `tb_especialidad_web`
  ADD CONSTRAINT `fk_tb_especialidad_web_tb_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `tb_upload` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_especialidad_web_tb_tipo_especialidad_web` FOREIGN KEY (`id_tipo_especialidad_web`) REFERENCES `tb_tipo_especialidad_web` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_lista`
--
ALTER TABLE `tb_lista`
  ADD CONSTRAINT `fk_tb_lista_tb_grupo_lista` FOREIGN KEY (`id_grupo_lista`) REFERENCES `tb_grupo_lista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_lista_tb_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD CONSTRAINT `fk_padre` FOREIGN KEY (`id_padre`) REFERENCES `tb_menu` (`id`);

--
-- Filtros para la tabla `tb_privilegios`
--
ALTER TABLE `tb_privilegios`
  ADD CONSTRAINT `tb_privilegios_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `tb_proceso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_privilegios_ibfk_2` FOREIGN KEY (`idPermiso`) REFERENCES `tb_permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_privilegios_ibfk_3` FOREIGN KEY (`idPerfil`) REFERENCES `tb_perfiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_privilegio_usuario`
--
ALTER TABLE `tb_privilegio_usuario`
  ADD CONSTRAINT `tb_privilegio_usuario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_privilegio_usuario_ibfk_2` FOREIGN KEY (`idPermiso`) REFERENCES `tb_permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_privilegio_usuario_ibfk_3` FOREIGN KEY (`idProceso`) REFERENCES `tb_proceso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_proceso`
--
ALTER TABLE `tb_proceso`
  ADD CONSTRAINT `FK_tb_proceso_padreProceso` FOREIGN KEY (`idProceso`) REFERENCES `tb_proceso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_registrolog`
--
ALTER TABLE `tb_registrolog`
  ADD CONSTRAINT `FK_tb_registrolog_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`id`);

--
-- Filtros para la tabla `tb_registrologin`
--
ALTER TABLE `tb_registrologin`
  ADD CONSTRAINT `tb_registrologin_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_sede`
--
ALTER TABLE `tb_sede`
  ADD CONSTRAINT `fk_tb_sed_tb_tipo_sede` FOREIGN KEY (`id_tipo_sede`) REFERENCES `tb_tipo_sede` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`idPersonal`) REFERENCES `tb_personal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_usuario_ibfk_2` FOREIGN KEY (`idPerfil`) REFERENCES `tb_perfiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
