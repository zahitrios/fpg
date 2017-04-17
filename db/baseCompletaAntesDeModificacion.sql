-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-04-2017 a las 10:02:37
-- Versión del servidor: 5.5.54-cll
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fipago_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `idactividades` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`idactividades`, `nombre`) VALUES
(1, 'Login'),
(2, 'Revisión de base de datos inicial'),
(3, 'Alta de documento'),
(4, 'Edición de documento'),
(5, 'Alta de status de convenio'),
(6, 'Edición de status de convenio'),
(7, 'Alta de proyecto de convenio'),
(8, 'Alta de sociedad'),
(9, 'Inicio del proceso del convenio'),
(10, 'Alta modificación a la base de datos'),
(11, 'Revisión de solicitud de ministración');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorrador`
--

CREATE TABLE `ahorrador` (
  `idahorrador` int(11) NOT NULL,
  `folioIdentificador` varchar(20) NOT NULL,
  `nombre` text NOT NULL,
  `direccion` text,
  `montoAl100` double NOT NULL,
  `montoAl70` double NOT NULL,
  `montoMaximo` double NOT NULL,
  `sca` double DEFAULT NULL,
  `sci` double DEFAULT NULL,
  `sps` double DEFAULT NULL,
  `sdg` double DEFAULT NULL,
  `scnc` double NOT NULL,
  `spc` double DEFAULT NULL,
  `sod` double DEFAULT NULL,
  `baja` int(11) DEFAULT '0',
  `folioBaseDatos` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ahorrador`
--

INSERT INTO `ahorrador` (`idahorrador`, `folioIdentificador`, `nombre`, `direccion`, `montoAl100`, `montoAl70`, `montoMaximo`, `sca`, `sci`, `sps`, `sdg`, `scnc`, `spc`, `sod`, `baja`, `folioBaseDatos`) VALUES
(1, '28058100000001', 'ADAUTA CAMACHO SERGIO', 'S/D-S/D-S/D', 146000, 102200, 102200, 146000, 0, 0, 0, 0, 0, 0, 0, NULL),
(2, '28058100000002', 'ALVAREZ AGUILAR FRANCISCO', 'Tonalapa s/n-Tonalapa-Ixtacamaxtitlan', 19600, 13720, 13720, 0, 19600, 0, 0, 0, 0, 0, 0, NULL),
(3, '28058100000003', 'ARROLLO SUAREZ GUADALUPE', 'Reforma num7-Allende-Cuyoaco', 10101, 7070.7, 7070.7, 100, 10001, 0, 0, 0, 0, 0, 0, NULL),
(4, '28058100000004', 'BAEZ ESPINOSA FERNANDO', 'Emilio Carranza num 24-Grajales-Rafael Lara Grajales', 53300, 37310, 37310, 0, 53000, 300, 0, 0, 0, 0, 0, NULL),
(5, '28058100000005', 'BAEZ HERNANDEZ GUILLERMINA', '7 Norte num 42-Centro-Rafael Lara Grajales', 8639.38, 6047.57, 6047.57, 8639.38, 0, 0, 0, 0, 0, 0, 0, NULL),
(6, '28058100000006', 'BAEZ HERNANDEZ NORMA LIDIA', 'Av Emiliano Carranza num 13-Centro-Rafael Lara Grajales', 152627.67, 106839.37, 106839.37, 152627.67, 0, 0, 0, 0, 0, 0, 0, NULL),
(7, '28058100000007', 'BAEZ REYES MARIA LUISA GUADALUPE', '10 Sur num 1502-Centro-San Jose Chiapa', 93203.01, 65242.11, 65242.11, 93203.01, 0, 0, 0, 0, 0, 0, 0, NULL),
(8, '28058100000008', 'BARRALEZ GONZALEZ MARGARITA', 'Av Ignacio Zaragoza num 18-Cruz del Bosque-Nopalucan', 7939.11, 5557.38, 5557.38, 7939.11, 0, 0, 0, 0, 0, 0, 0, NULL),
(9, '28058100000009', 'BARRANCO LOPEZ MARTIN', 'S/D-S/D-S/D', 400001, 280000.7, 167930, 400001, 0, 0, 0, 0, 0, 0, 0, NULL),
(10, '28058100000010', 'BECERRIL VILCHIS HILDA', '5 Oriente Edif D-5 Depto 4-Unid Hab Grajales-Rafael Lara Grajales', 11163.43, 7814.4, 7814.4, 10863.43, 0, 300, 0, 0, 0, 0, 0, NULL),
(11, '28058100000011', 'BRAVO LOPEZ ARNULFO', 'Guanajuato num 6-Centro-Rafael Lara Grajales', 50899, 35629.3, 35629.3, 50599, 0, 300, 0, 0, 0, 0, 0, NULL),
(12, '28058100000012', 'CABALLERO RODRIGUEZ MINERVA', '2 de abril num385-Barrio de Tetela-Libres', 41845.89, 29292.12, 29292.12, 40000, 1545.89, 300, 0, 0, 0, 0, 0, NULL),
(13, '28058100000013', 'CABRERA MUÑOZ JUAN GUSTAVO', '16 de Septiembre no 3-Centro-Rafael Lara Grajales', 860000, 602000, 167930, 0, 860000, 0, 0, 0, 0, 0, 0, NULL),
(14, '28058100000014', 'CANDELARIO LOPEZ CLAUDIA', '11 Poniente num 26-Centro-Rafael Lara Grajales', 18927.71, 13249.4, 13249.4, 18927.71, 0, 0, 0, 0, 0, 0, 0, NULL),
(15, '28058100000015', 'CARREON SANCHEZ LEONEL', '3 Poniente num 13-Centro-Rafael Lara Grajales', 221558.42, 155090.89, 155090.89, 0, 221558.42, 0, 0, 0, 0, 0, 0, NULL),
(16, '28058100000016', 'CASTILLO CERON JOSE ANDRES', '6 Poniente num 8-Maria Ixtiyucan-Nopalucan', 16705, 11693.5, 11693.5, 16705, 0, 0, 0, 0, 0, 0, 0, NULL),
(17, '28058100000017', 'CASTILLO ROMERO JOSE GERONIMO AURELIO', 'Hermanos Serdan num 305-Maria Ixtiyucan-Nopalucan', 60705.29, 42493.7, 42493.7, 60405.29, 0, 300, 0, 0, 0, 0, 0, NULL),
(18, '28058100000018', 'CASTILLO SANCHEZ MARICELA AURORA', '7 Oriente num 2-Grajales-Rafael Lara Grajales', 61984.31, 43389.02, 43389.02, 61984.31, 0, 0, 0, 0, 0, 0, 0, NULL),
(19, '28058100000019', 'CAYETANO PAULINO ENEDINA', 'Del Monte s/n-Benito Juarez-Soltepec', 30028, 21019.6, 21019.6, 29428, 0, 600, 0, 0, 0, 0, 0, NULL),
(20, '28058100000020', 'CERVANTES MONTES JUAN', '5 Sur num 3-Centro-Rafael Lara Grajales', 4113.5, 2879.45, 2879.45, 3813.5, 0, 300, 0, 0, 0, 0, 0, NULL),
(21, '28058100000021', 'CRUZ DE LOS ANGELES MA GUADALUPE', 'Juan Sarabia num 7-Obrera-Rafael Lara Grajales', 12551.93, 8786.35, 8786.35, 12551.93, 0, 0, 0, 0, 0, 0, 0, NULL),
(22, '28058100000022', 'CRUZ DOMINGUEZ MICAELA', '4 Sur num6-Allende-Cuyoaco', 50000, 35000, 35000, 100, 49600, 300, 0, 0, 0, 0, 0, NULL),
(23, '28058100000023', 'CRUZ TORRES CELSO VICTOR', 'Priv Los Naranjos num 18-San Miguel-Amozoc de Mota', 46321.96, 32425.37, 32425.37, 46321.96, 0, 0, 0, 0, 0, 0, 0, NULL),
(24, '28058100000024', 'CUELLAR MUÑOZ MARIA GUADALUPE', 'Av Progreso num 10-Centro-Rafael Lara Grajales', 47333.93, 33133.75, 33133.75, 47333.93, 0, 0, 0, 0, 0, 0, 0, NULL),
(25, '28058100000025', 'DE LA CRUZ HERNANDEZ JUANA', '2 Norte num 38-Centro-Rafael Lara Grajales', 73365, 51355.5, 51355.5, 0, 73365, 0, 0, 0, 0, 0, 0, NULL),
(26, '28058100000026', 'DEL CARMEN LOPEZ GUADALUPE', 'Salto del agua num 37-Salto del Agua-Rafael Lara Grajales', 154762.67, 108333.87, 108333.87, 154762.67, 0, 0, 0, 0, 0, 0, 0, NULL),
(27, '28058100000027', 'DIAZ BAUTISTA VICTORIA', '8 Oriente num 28-Barrio San Juan-Acajete', 7482, 5237.4, 5237.4, 7482, 0, 0, 0, 0, 0, 0, 0, NULL),
(28, '28058100000028', 'DIAZ HERNANDEZ MARCELINA', 'Camino a Obregon num 7-La Ermita-Soltepec', 29500, 20650, 20650, 29500, 0, 0, 0, 0, 0, 0, 0, NULL),
(29, '28058100000029', 'DIAZ VAZQUEZ MIGUEL', 'Principal 1-La Cañada-Libres', 16374.57, 11462.2, 11462.2, 16096.61, 277.96, 0, 0, 0, 0, 0, 0, NULL),
(30, '28058100000030', 'DURAN HERNANDEZ FABIOLA', '4 Norte s/n-Centro-San Jose Chiapa', 213619.84, 149533.89, 149533.89, 213619.84, 0, 0, 0, 0, 0, 0, 0, NULL),
(31, '28058100000031', 'DURAN LOPEZ ERASMO', '16 de Septiembre num 30-Centro-Rafael Lara Grajales', 17081.21, 11956.85, 11956.85, 16781.21, 0, 300, 0, 0, 0, 0, 0, NULL),
(32, '28058100000032', 'DURAN MARTINEZ SEBASTIAN EVELINA', '4 Norte num 12-Centro-San Jose Chiapa', 300, 210, 210, 0, 0, 300, 0, 0, 0, 0, 0, NULL),
(33, '28058100000033', 'FERNANDEZ HERNANDEZ SOLIRENE', 'Rubi num 8-La Joya-Rafael Lara Grajales', 85088.71, 59562.1, 59562.1, 85088.71, 0, 0, 0, 0, 0, 0, 0, NULL),
(34, '28058100000034', 'FLORES DIAZ MARGARITO', '12 Norte num 8-Barrio San Juan-Acajete', 20466, 14326.2, 14326.2, 20466, 0, 0, 0, 0, 0, 0, 0, NULL),
(35, '28058100000035', 'FLORES MOZO RODE', '11 Sur num 25-Centro-Rafael Lara Grajales', 11704.59, 8193.21, 8193.21, 11704.59, 0, 0, 0, 0, 0, 0, 0, NULL),
(36, '28058100000036', 'GARCIA MONTES VICENTA', '7 Sur num 12-Centro-Rafael Lara Grajales', 19376.85, 13563.8, 13563.8, 19376.85, 0, 0, 0, 0, 0, 0, 0, NULL),
(37, '28058100000037', 'GONZALEZ HERNANDEZ ALEJANDRO', '5 Oriente num 9-Centro-Rafael Lara Grajales', 144330.9, 101031.63, 101031.63, 144030.9, 0, 300, 0, 0, 0, 0, 0, NULL),
(38, '28058100000038', 'GONZALEZ LOPEZ HILARIA', 'Plaza de la Gardenia Edif 19A DPTO 2-U Hab Lara Grajales-Nopalucan', 6003, 4202.1, 4202.1, 5703, 0, 300, 0, 0, 0, 0, 0, NULL),
(39, '28058100000039', 'GUEVARA LOPEZ ELIGIO', 'Avenida 16 de septiembre s/n-Tonalapa-Ixtacamaxtitlan', 195400, 136780, 136780, 100, 195000, 300, 0, 0, 0, 0, 0, NULL),
(40, '28058100000040', 'HERNANDEZ CERON MARTHA', '3 Sur num 14-Grajales-Rafael Lara Grajales', 74815, 52370.5, 52370.5, 74815, 0, 0, 0, 0, 0, 0, 0, NULL),
(41, '28058100000041', 'HERNANDEZ LOPEZ ROSA', 'Hidalgo 404-La Granja-Nopalucan', 142897, 100027.9, 100027.9, 142597, 0, 300, 0, 0, 0, 0, 0, NULL),
(42, '28058100000042', 'HERNANDEZ PLATINI MARIA LUCINA', 'Av Del Trabajo num 20 Col Obrera-Grajales-S/D', 52998, 37098.6, 37098.6, 52698, 0, 300, 0, 0, 0, 0, 0, NULL),
(43, '28058100000043', 'HERNANDEZ RAMIREZ JOSE PORFIRIO PASCUAL', '7 Sur num 16-Centro-Rafael Lara Grajales', 10243.63, 7170.54, 7170.54, 10243.63, 0, 0, 0, 0, 0, 0, 0, NULL),
(44, '28058100000044', 'HERRERA HERNANDEZ JOSE ARMANDO', 'Iturbide num21-Barrio de San Miguel-Libres', 54043.62, 37830.53, 37830.53, 53743.62, 0, 300, 0, 0, 0, 0, 0, NULL),
(45, '28058100000045', 'HUERTA VEGA ESPERANZA', '2 dos norte num 51-Centro-Rafael Lara Grajales', 12000.77, 8400.54, 8400.54, 11700.77, 0, 300, 0, 0, 0, 0, 0, NULL),
(46, '28058100000046', 'JIMENEZ SANCHEZ SIXTA', '2 norte num 50-Barrio Sto Entierro-Acajete', 9726.56, 6808.59, 6808.59, 0, 9726.56, 0, 0, 0, 0, 0, 0, NULL),
(47, '28058100000047', 'JUAREZ DURAN JUAN', '4 Poniente num 12-Centro-Rafael Lara Grajales', 39389.6, 27572.72, 27572.72, 0, 39089.6, 300, 0, 0, 0, 0, 0, NULL),
(48, '28058100000048', 'JUAREZ JIMENEZ MARIA DE LOURDES', '3 Sur num 715-Barrio la Virgen-Acajete', 23408.15, 16385.71, 16385.71, 23408.15, 0, 0, 0, 0, 0, 0, 0, NULL),
(49, '28058100000049', 'JUAREZ JIMENEZ MARIA LAURA', '3 Sur num 715-Barrio la Virgen-Acajete', 23081.29, 16156.9, 16156.9, 23081.29, 0, 0, 0, 0, 0, 0, 0, NULL),
(50, '28058100000050', 'JUAREZ NERI MARIA DEL CARMEN', '6 Poniente num 310-Centro-Rafael Lara Grajales', 20000, 14000, 14000, 20000, 0, 0, 0, 0, 0, 0, 0, NULL),
(51, '28058100000051', 'LOBATO BAEZ MARIANA', '5 Poniente num 500-Loc Oriental-Oriental', 5100, 3570, 3570, 5100, 0, 0, 0, 0, 0, 0, 0, NULL),
(52, '28058100000052', 'LOPEZ MAZAPILA DALILA', 'Av Benito Juarez num 13-Ignacio Zaragoza-Rafael Lara Grajales', 18967.9, 13277.53, 13277.53, 18967.9, 0, 0, 0, 0, 0, 0, 0, NULL),
(53, '28058100000053', 'LOPEZ MORALES MARGARITA', 'Cale 2 Pte num 13-Nopalucan-Nopalucan', 150006, 105004.2, 105004.2, 150006, 0, 0, 0, 0, 0, 0, 0, NULL),
(54, '28058100000054', 'LOZANO SALAZAR GUILLERMINA', 'S/D-S/D-S/D', 20096.73, 14067.71, 14067.71, 0, 20096.73, 0, 0, 0, 0, 0, 0, NULL),
(55, '28058100000055', 'MARQUEZ DURAN PEDRO ELOY', 'Av Anastacio Torre Blanca S/N-Centro-San Jose Chiapa', 290000, 203000, 167930, 0, 290000, 0, 0, 0, 0, 0, 0, NULL),
(56, '28058100000056', 'MARQUEZ PEREZ ERICK', '4 Norte num 12-Centro-San Jose Chiapa', 289000, 202300, 167930, 0, 289000, 0, 0, 0, 0, 0, 0, NULL),
(57, '28058100000057', 'MARTINEZ GONZALEZ MARIBEL', 'Enrique Flores Magon num 7-Obrera-Rafael Lara Grajales', 3491.77, 2444.24, 2444.24, 3191.77, 0, 300, 0, 0, 0, 0, 0, NULL),
(58, '28058100000058', 'MARTINEZ LOPEZ JOSE EZEQUIEL', 'Allende num 14-Ignacio Zaragoza-Rafael Lara Grajales', 63192.05, 44234.44, 44234.44, 63192.05, 0, 0, 0, 0, 0, 0, 0, NULL),
(59, '28058100000059', 'MARTINEZ MARTINEZ ALEJANDRO', 'Colosio num 6-San Jose Ozumba-San Jose Chiapa', 24494.18, 17145.93, 17145.93, 24494.18, 0, 0, 0, 0, 0, 0, 0, NULL),
(60, '28058100000060', 'MARTINEZ TORRES ANGEL', 'S/D-S/D-S/D', 26541.68, 18579.18, 18579.18, 1635.02, 24906.66, 0, 0, 0, 0, 0, 0, NULL),
(61, '28058100000061', 'MAURICIO RODRIGUEZ FAUSTINO', '6 Sur num 705-B Virgen de la Luz-Acajete', 1456.94, 1019.86, 1019.86, 1456.94, 0, 0, 0, 0, 0, 0, 0, NULL),
(62, '28058100000062', 'MENDEZ ALCANTARA AURORA', '3 poniente num 1-Centro-Rafael Lara Grajales', 7476.43, 5233.5, 5233.5, 7476.43, 0, 0, 0, 0, 0, 0, 0, NULL),
(63, '28058100000063', 'MENDEZ ARMAS MARIA DE LOURDES', '3 Oriente s/n-San Jose Morelos-Libres', 10101, 7070.7, 7070.7, 100, 10001, 0, 0, 0, 0, 0, 0, NULL),
(64, '28058100000064', 'MENDEZ LOZANO EZEQUIEL', '20 de Noviembre num 47-Centro-Rafael Lara Grajales', 231326.3, 161928.41, 161928.41, 231326.3, 0, 0, 0, 0, 0, 0, 0, NULL),
(65, '28058100000065', 'MENDEZ LOZANO MARGARITA', '20 de Noviembre num 47-Centro-Rafael Lara Grajales', 19592.91, 13715.04, 13715.04, 0, 19292.91, 300, 0, 0, 0, 0, 0, NULL),
(66, '28058100000066', 'MENDEZ ROQUE AURELIO IGNACIO', '5 Norte num 203-Centro-Rafael Lara Grajales', 164751, 115325.7, 115325.7, 164751, 0, 0, 0, 0, 0, 0, 0, NULL),
(67, '28058100000067', 'MONTES MARTINEZ JESUS', 'Adolfo Lopez Mateos num915-San Juan Negrete-Tepeaca', 50500, 35350, 35350, 0, 50000, 500, 0, 0, 0, 0, 0, NULL),
(68, '28058100000068', 'MORALES BONILLA FLORINA', '7 poniente s/n-B Virgen de la Luz-Acajete', 24336.38, 17035.47, 17035.47, 24336.38, 0, 0, 0, 0, 0, 0, 0, NULL),
(69, '28058100000069', 'MORALES HERNANDEZ AMBROCIO', 'Av Matamoros num 310-Juan de la Granja-Nopalucan', 54980, 38486, 38486, 54980, 0, 0, 0, 0, 0, 0, 0, NULL),
(70, '28058100000070', 'MORALES MENDOZA JOSE ROSENDO', '9 Pte num 45-Centro-Rafael Lara Grajales', 69213.58, 48449.51, 48449.51, 69213.58, 0, 0, 0, 0, 0, 0, 0, NULL),
(71, '28058100000071', 'NERI NICANOR RAUL JAVIER', 'Av Emiliano Carranza num 26-Centro-Rafael Lara Grajales', 292201.14, 204540.8, 167930, 292201.14, 0, 0, 0, 0, 0, 0, 0, NULL),
(72, '28058100000072', 'OCHOA SALAS JUAN', 'Ayuntamiento num S/N-La Virgen de la Luz-Acajete', 157042.94, 109930.06, 109930.06, 47042.94, 110000, 0, 0, 0, 0, 0, 0, NULL),
(73, '28058100000073', 'ORTEGA BECERRIL RAFAEL', '5 Oriente Edif D-5 Depto 4-Unid Hab Grajales-Rafael Lara Grajales', 2872.53, 2010.77, 2010.77, 2872.53, 0, 0, 0, 0, 0, 0, 0, NULL),
(74, '28058100000074', 'ORTEGA ROJAS ANGELA', 'Av Del Sol num 15-Fracc Los Olivos-Tijuana BC', 8825.21, 6177.65, 6177.65, 8825.21, 0, 0, 0, 0, 0, 0, 0, NULL),
(75, '28058100000075', 'ORTIZ PEREZ GABINO', '2 Norte num 73-Centro-Rafael Lara Grajales', 28577.56, 20004.29, 20004.29, 28577.56, 0, 0, 0, 0, 0, 0, 0, NULL),
(76, '28058100000076', 'OSORIO HUERTA ARTURO', '5 Sur num 8-Centro-Rafael Lara Grajales', 288524.83, 201967.38, 167930, 288524.83, 0, 0, 0, 0, 0, 0, 0, NULL),
(77, '28058100000077', 'OSORIO SANTAMARIA EDUARDO', '5 Sur num 8-Centro-Rafael Lara Grajales', 322648.46, 225853.92, 167930, 322648.46, 0, 0, 0, 0, 0, 0, 0, NULL),
(78, '28058100000078', 'PEREZ DE LAZARO ISABEL', '6 Pte no 21-Centro-Rafael Lara Grajales', 51337.4, 35936.18, 35936.18, 51337.4, 0, 0, 0, 0, 0, 0, 0, NULL),
(79, '28058100000079', 'PEREZ LOZANO LUCRECIA', 'Av Lazaro Cardenas num 226-Maria Ixtiyucan-Nopalucan', 1330.1, 931.07, 931.07, 1330.1, 0, 0, 0, 0, 0, 0, 0, NULL),
(80, '28058100000080', 'PEREZ PARRA ENCARNACION', '11 Sur num 31-Centro-Rafael Lara Grajales', 258064.3, 180645.01, 167930, 258064.3, 0, 0, 0, 0, 0, 0, 0, NULL),
(81, '28058100000081', 'PEREZ VARGAS GABRIELA', 'Av Anastacio Torre Blanca S/N-Centro-San Jose Chiapa', 1064957.21, 745470.05, 167930, 148175, 916782.21, 0, 0, 0, 0, 0, 0, NULL),
(82, '28058100000082', 'PEREZ VARGAS ROMAN', '4 Norte no 1203-Centro-San Jose Chiapa', 290000, 203000, 167930, 0, 290000, 0, 0, 0, 0, 0, 0, NULL),
(83, '28058100000083', 'PROYLAN BAEZ ALEJANDRO', 'Av Emiliano Carranza num 12-Centro-Rafael Lara Grajales', 150704.28, 105493, 105493, 150704.28, 0, 0, 0, 0, 0, 0, 0, NULL),
(84, '28058100000084', 'RAMIREZ BARRALES MARICELA', 'Zacatecas num 9-Centro-Rafael Lara Grajales', 29858, 20900.6, 20900.6, 29858, 0, 0, 0, 0, 0, 0, 0, NULL),
(85, '28058100000085', 'RAMIREZ HERNANDEZ UBALDO', 'Cabo Franco num1299-Barrio Guadalupe-Libres', 100000, 70000, 70000, 0, 100000, 0, 0, 0, 0, 0, 0, NULL),
(86, '28058100000086', 'RAMIREZ MELENDEZ JAVIER', '2 norte num 28-Barrio Sto Entierro-Acajete', 17806.61, 12464.63, 12464.63, 17806.61, 0, 0, 0, 0, 0, 0, 0, NULL),
(87, '28058100000087', 'RAMIREZ TAPIA FERNANDO', 'Zacatecas num 9-Centro-Rafael Lara Grajales', 78368.63, 54858.04, 54858.04, 78368.63, 0, 0, 0, 0, 0, 0, 0, NULL),
(88, '28058100000088', 'REYES GONZALEZ GUADALUPE', '14 Poniente s/n-Centro-Nopalucan', 32391.38, 22673.97, 22673.97, 32391.38, 0, 0, 0, 0, 0, 0, 0, NULL),
(89, '28058100000089', 'ROCHA LOPEZ MOISES', '2 Norte num 48-Centro-Rafael Lara Grajales', 13651.77, 9556.24, 9556.24, 13651.77, 0, 0, 0, 0, 0, 0, 0, NULL),
(90, '28058100000090', 'RODRIGUEZ MENDOZA SILVIA', '2 Oriente num 213-Centro-Nopalucan', 141704, 99192.8, 99192.8, 141704, 0, 0, 0, 0, 0, 0, 0, NULL),
(91, '28058100000091', 'ROMERO AVILA TERESA', 'Av 20 de Noviembre num 45-Grajales-Rafael Lara Grajales', 26405.31, 18483.72, 18483.72, 26405.31, 0, 0, 0, 0, 0, 0, 0, NULL),
(92, '28058100000092', 'ROMERO MORALES MIGUEL', '7 Sur num 43 Col Centro-Grajales-Rafael Lara Grajales', 51769.04, 36238.33, 36238.33, 51769.04, 0, 0, 0, 0, 0, 0, 0, NULL),
(93, '28058100000093', 'ROMERO MORALES SOLEDAD', '9 Poniente num 28-Centro-Rafael Lara Grajales', 40000, 28000, 28000, 40000, 0, 0, 0, 0, 0, 0, 0, NULL),
(94, '28058100000094', 'ROMERO PEREZ VICTORIA', 'Av Francisco I Madero num 410-Maria Ixtiyucan-Nopalucan', 20368.5, 14257.95, 14257.95, 250, 19818.5, 300, 0, 0, 0, 0, 0, NULL),
(95, '28058100000095', 'ROMERO SOSA MIGUEL', 'Francisco I Madero num 720-Maria Ixtiyucan-Nopalucan', 17067.96, 11947.57, 11947.57, 17067.96, 0, 0, 0, 0, 0, 0, 0, NULL),
(96, '28058100000096', 'SALAZAR VALENCIA MARIA OCOTLAN ENRIQUETA', '2 Pte no 52-Centro-Rafael Lara Grajales', 94600, 66220, 66220, 94600, 0, 0, 0, 0, 0, 0, 0, NULL),
(97, '28058100000097', 'SANCHEZ HERNANDEZ IRENE', 'San Francisco s/n-Benito Juarez-Soltepec', 84703.57, 59292.5, 59292.5, 84703.57, 0, 0, 0, 0, 0, 0, 0, NULL),
(98, '28058100000098', 'SANCHEZ HERNANDEZ RICARDA', '20 de Noviembre num 47-Centro-Rafael Lara Grajales', 409845.52, 286891.86, 167930, 4245.52, 405300, 300, 0, 0, 0, 0, 0, NULL),
(99, '28058100000099', 'SANCHEZ LEONARDO JOSE RODOLFO', 'Enrique Flores Magon num 7-Obrera-Rafael Lara Grajales', 8855.56, 6198.89, 6198.89, 8855.56, 0, 0, 0, 0, 0, 0, 0, NULL),
(100, '28058100000100', 'SANCHEZ LOMELI VENTURA', 'Miguel Hidalgo num 12-Isabel Tepetzala-Acajete', 20200, 14140, 14140, 200, 20000, 0, 0, 0, 0, 0, 0, NULL),
(101, '28058100000101', 'SANCHEZ PEREZ JOSE ANDRES', 'Cabo Franco num699-Barrio Guadalupe-Libres', 100001, 70000.7, 70000.7, 0, 100001, 0, 0, 0, 0, 0, 0, NULL),
(102, '28058100000102', 'SARMIENTO HUERTA EVELIA', '5 norte num 17-Centro-Rafael Lara Grajales', 25000, 17500, 17500, 24700, 0, 300, 0, 0, 0, 0, 0, NULL),
(103, '28058100000103', 'SARMIENTOS FERNANDEZ IRMA', 'Tonalapa s/n-Tonalapa-Ixtacamaxtitlan', 20000, 14000, 14000, 100, 19600, 300, 0, 0, 0, 0, 0, NULL),
(104, '28058100000104', 'SARMIENTOS LOPEZ OTILIO', 'Calle sin nombre s/n-Tonalapa-Ixtacamaxtitlan', 10284.48, 7199.14, 7199.14, 0, 10284.48, 0, 0, 0, 0, 0, 0, NULL),
(105, '28058100000105', 'SILVA BAUTISTA SEGIO', '3 Oriente no 30-Centro-Rafael Lara Grajales', 430000, 301000, 167930, 0, 430000, 0, 0, 0, 0, 0, 0, NULL),
(106, '28058100000106', 'TORRES CRUZ MARIBEL', '7 Sur num 33-Centro-Rafael Lara Grajales', 300914.66, 210640.26, 167930, 300914.66, 0, 0, 0, 0, 0, 0, 0, NULL),
(107, '28058100000107', 'UGARTE LOZANO JOSE LUIS', '9 Poniente num 9-Centro-Rafael Lara Grajales', 6168.3, 4317.81, 4317.81, 5868.3, 0, 300, 0, 0, 0, 0, 0, NULL),
(108, '28058100000108', 'VALDIVIA BARRALES CAROLINA', '7 poniente s/n-Barrio de Jesus-Acajete', 5068.62, 3548.03, 3548.03, 5068.62, 0, 0, 0, 0, 0, 0, 0, NULL),
(109, '28058100000109', 'VALENCIA BAEZ OSCAR', 'Emiliano Carranza num 12-Centro-Rafael Lara Grajales', 11768, 8237.6, 8237.6, 11768, 0, 0, 0, 0, 0, 0, 0, NULL),
(110, '28058100000110', 'VARGAS VELEZ MARIA DEL ROSARIO SOLEDAD', '5 norte num s/n-San Jose Chiapa-San Jose Chiapa', 200000, 140000, 140000, 0, 200000, 0, 0, 0, 0, 0, 0, NULL),
(111, '28058100000111', 'VAZQUEZ PEREZ ROSA', '2 Oriente num 213-Centro-Nopalucan', 69385.85, 48570.1, 48570.1, 69385.85, 0, 0, 0, 0, 0, 0, 0, NULL),
(112, '28058100000112', 'VEDE PEREZ JOSE FERNANDO TRINIDAD', '14 Oriente s/n-Centro-San Jose Chiapa', 49640.14, 34748.1, 34748.1, 0, 49640.14, 0, 0, 0, 0, 0, 0, NULL),
(113, '28058100000113', 'VILLEGAS BONILLA CLEMENCIA', 'S/D-San Bartolo Pinal-Acajete', 2228.21, 1559.75, 1559.75, 1928.21, 0, 300, 0, 0, 0, 0, 0, NULL),
(114, '28059100000114', 'ABUNDIO SANCHEZ ESTELA ROSA', 'Cuautilica s/n-Seccion tercera-Zoquitlan', 12500, 8750, 8750, 0, 12000, 500, 0, 0, 0, 0, 0, NULL),
(115, '28059100000115', 'ALTAMIRANO LOPEZ MARIO', '2 Poniente num 201-Centro-Tehuacan', 4336000, 3035200, 167930, 0, 4336000, 0, 0, 0, 0, 0, 0, NULL),
(116, '28059100000116', 'ALVAREZ ATILANO MARIA CATALINA', 'Xicotencatl num219-Cuauhtemoc-Tehuacan', 56125, 39287.5, 39287.5, 5625, 50000, 500, 0, 0, 0, 0, 0, NULL),
(117, '28059100000117', 'ANSELMO RAMOS JULIAN', 'Benito Juarez Sur s/n-Cuautotolapa-Ajalpan', 51212.5, 35848.75, 35848.75, 0, 50712.5, 500, 0, 0, 0, 0, 0, NULL),
(118, '28059100000118', 'ANSELMO RIVERA EVA', 'Zoquitlan s/n-Segunda Seccion-Tecpanzcoalco', 30300, 21210, 21210, 0, 29800, 500, 0, 0, 0, 0, 0, NULL),
(119, '28059100000119', 'ANSELMO RIVERA TERESA', 'Zoquitlan s/n-Segunda Seccion-Zoquitlan', 152200, 106540, 106540, 0, 151700, 500, 0, 0, 0, 0, 0, NULL),
(120, '28059100000120', 'ARELLANO SANTIAGO MARGARITA', '26 Sur num 535-Venustiano Carranza-Tehuacan', 50500, 35350, 35350, 50000, 0, 500, 0, 0, 0, 0, 0, NULL),
(121, '28059100000121', 'ARIAS HERNANDEZ JESUS DELFINO', 'Camelia Oriente num 120-Francisco Sarabia-Tehuacan', 8914.57, 6240.2, 6240.2, 0, 8414.57, 500, 0, 0, 0, 0, 0, NULL),
(122, '28059100000122', 'ARJONA PAVIA FANNY MARIA DE JESUS', '14 Oriente num 111-Buenos Aires-Tehuacan', 556297.26, 389408.08, 167930, 0, 555797.26, 500, 0, 0, 0, 0, 0, NULL),
(123, '28059100000123', 'BACA LOPEZ FRANCISCO', 'Ramon Corona num315-Reforma-Tehuacan', 501000, 350700, 167930, 0, 500500, 500, 0, 0, 0, 0, 0, NULL),
(124, '28059100000124', 'BAGLIETO MORA JUAN MANUEL', 'Privada 4 Norte 1825-Buenos Aires-Tehuacan', 50500, 35350, 35350, 0, 0, 50500, 0, 0, 0, 0, 0, NULL),
(125, '28059100000125', 'BARRIGUETE RAMIREZ CECILIO', 'Agustin Lara mza 132 Lote 1045-San Jose Tlahuac-Tehuacan', 80840, 56588, 56588, 0, 80340, 500, 0, 0, 0, 0, 0, NULL),
(126, '28059100000126', 'BARTOLO VALERIO BERTHA INES', 'Avenida Nacional s/n-San Miguel-Santiago Miahuatlan', 18380.85, 12866.6, 12866.6, 0, 18380.85, 0, 0, 0, 0, 0, 0, NULL),
(127, '28059100000127', 'BARTOLO VALERIO CONCEPCION ROSARIO', '7 poniente num 303-Cristo Rey-Santiago Miahuatlan', 78584.92, 55009.44, 55009.44, 0, 78584.92, 0, 0, 0, 0, 0, 0, NULL),
(128, '28059100000128', 'BAUTISTA SERRANO JOSE JOEL', 'Juarez num221-Seccion primera-Zinacatepec', 31500, 22050, 22050, 0, 31000, 500, 0, 0, 0, 0, 0, NULL),
(129, '28059100000129', 'BECERRA MACHADO FERNANDO Y/O HERNANDEZ HERNANDEZ VIRGINIA', '22 Norte num 619-San Rafael-Tehuacan', 160000, 112000, 112000, 0, 160000, 0, 0, 0, 0, 0, 0, NULL),
(130, '28059100000130', 'BELLO MARTINEZ CELESTINO', 'Av 22 de Feb 423 Sauce 205-San Marcos-Azcapotzalco', 193756.44, 135629.51, 135629.51, 0, 193256.44, 500, 0, 0, 0, 0, 0, NULL),
(131, '28059100000131', 'BENITEZ SAID JESUS', '16 Oriente num 109-Sarabia-Tehuacan', 10000, 7000, 7000, 0, 10000, 0, 0, 0, 0, 0, 0, NULL),
(132, '28059100000132', 'BIBIANO JERONIMO ARTEMIO', 'Avenida Portes Gil num1022-San Nicolas-Tetitzintla', 100500, 70350, 70350, 0, 100000, 500, 0, 0, 0, 0, 0, NULL),
(133, '28059100000133', 'BOLAÑOS MOGUEL ALFREDO DAMIAN', '20 Poniente 110-El Eden-Tehuacan', 920000, 644000, 167930, 0, 919500, 500, 0, 0, 0, 0, 0, NULL),
(134, '28059100000134', 'BOLAÑOS MOGUEL FLOR VERONICA', 'Lazaro Cardenas num2418-Francisco Villa-Tehuacan', 97000, 67900, 67900, 0, 97000, 0, 0, 0, 0, 0, 0, NULL),
(135, '28059100000135', 'BONFIL MARTINEZ ROBERTA HERACLIA', 'Zoquitlan s/n-Barrio 2-Zoquitlan', 1332.87, 933.01, 933.01, 832.87, 0, 500, 0, 0, 0, 0, 0, NULL),
(136, '28059100000136', 'BUENABAD CASTILLA JOSEFA', 'San Sebastian Frontera S/N-Sebastian Frontera-Santiago Chazumba', 40419.23, 28293.46, 28293.46, 0, 39919.23, 500, 0, 0, 0, 0, 0, NULL),
(137, '28059100000137', 'CABRERA HERNANDEZ ELVIRA', 'Av Vicente Guerrero num 307-Santa Maria Monte-Vicente Guerrero', 20748.38, 14523.87, 14523.87, 0, 20248.38, 500, 0, 0, 0, 0, 0, NULL),
(138, '28059100000138', 'CACHO GARCIA BEATRIZ', 'Reforma num 6-Centro-San Jose Miahuatlan', 9000, 6300, 6300, 0, 8500, 500, 0, 0, 0, 0, 0, NULL),
(139, '28059100000139', 'CALDERON SOLIS REGINO', 'Venustiano Carranza num 24-Centro-Zinacatepec', 10000, 7000, 7000, 0, 10000, 0, 0, 0, 0, 0, 0, NULL),
(140, '28059100000140', 'CAMACHO ALONSO JOSE JUAN', '12 Sur num 1930-16 de Marzo-Tehuacan', 37095.02, 25966.51, 25966.51, 36595.02, 0, 500, 0, 0, 0, 0, 0, NULL),
(141, '28059100000141', 'CARRANZA MARIN PABLO', 'Barrio Peña Blanca s/n-Peña Blanca-San Lucas Zoquiampan', 50833.33, 35583.33, 35583.33, 0, 50333.33, 500, 0, 0, 0, 0, 0, NULL),
(142, '28059100000142', 'CARRERA CARRERA CATARINA AMPARO', 'Josefa Ortiz de Dominguez num 547-Nicolas Bravo-Tehuacan', 187863.1, 131504.17, 131504.17, 0, 187863.1, 0, 0, 0, 0, 0, 0, NULL),
(143, '28059100000143', 'CARRERA LEZAMA FERNANDO MANUEL', '13 Poniente num 434-Benito Juarez-Tehuacan', 36728.61, 25710.03, 25710.03, 0, 36228.61, 500, 0, 0, 0, 0, 0, NULL),
(144, '28059100000144', 'CASTILLO ARCOS MODESTA', '2 norte num139-Zaragoza-Tehuacan', 1300000, 910000, 167930, 0, 1300000, 0, 0, 0, 0, 0, 0, NULL),
(145, '28059100000145', 'CASTILLO GOMEZ DANIEL', 'Priv 5 num Edif 2012-Los Pinos-Tehuacan', 2900500, 2030350, 167930, 0, 2900000, 500, 0, 0, 0, 0, 0, NULL),
(146, '28059100000146', 'CASTRO PANTZI ABEL ANDRES', '5 de febrero sur num 532-Coculco-Ajalpan', 83000, 58100, 58100, 0, 0, 83000, 0, 0, 0, 0, 0, NULL),
(147, '28059100000147', 'CERQUERA DE LA CRUZ CRISPIN', '5 sur num917-Nicolas Bravo-Tehuacan', 12066.16, 8446.31, 8446.31, 0, 11566.16, 500, 0, 0, 0, 0, 0, NULL),
(148, '28059100000148', 'CHAVEZ MARTINEZ MARIA LORENA', '9 Oriente num 905-La Purisima-Tehuacan', 93000, 65100, 65100, 0, 93000, 0, 0, 0, 0, 0, 0, NULL),
(149, '28059100000149', 'CORREA REYES LORENA', 'Jesus Carranza num140 4-Santa Maria Coapa-Tehuacan', 12518.16, 8762.71, 8762.71, 0, 12018.16, 500, 0, 0, 0, 0, 0, NULL),
(150, '28059100000150', 'CORREA REYES MATILDE', 'Jesus Carranza num140 4-Santa Maria Coapa-Tehuacan', 70500, 49350, 49350, 0, 70000, 500, 0, 0, 0, 0, 0, NULL),
(151, '28059100000151', 'CORREO JUAREZ EDUARDO', 'Mariano Matamoros no 177-Centro-San Gabriel Chilac', 8000, 5600, 5600, 0, 8000, 0, 0, 0, 0, 0, 0, NULL),
(152, '28059100000152', 'CORTES REYES ISRAEL', 'Independencia num 6-San Juan Atzingo-San Gabriel Chilac', 50500, 35350, 35350, 0, 50000, 500, 0, 0, 0, 0, 0, NULL),
(153, '28059100000153', 'CORTES REYES PEDRO PASCUAL', 'Priv 15 norte num 22-Obreros Peñafiel-Teotitlan Flores', 20700, 14490, 14490, 0, 20700, 0, 0, 0, 0, 0, 0, NULL),
(154, '28059100000154', 'CORTES LOPEZ JOSE', '6 Poniente num 511-Santiago Miahuatlan-Tehuacan', 100000, 70000, 70000, 0, 100000, 0, 0, 0, 0, 0, 0, NULL),
(155, '28059100000155', 'CORTEZ COELLO CIRENIA', 'Priv Maestro Aaron Joaquin num 2312-Mexico Sur-Coyomeapan', 20500, 14350, 14350, 0, 20000, 500, 0, 0, 0, 0, 0, NULL),
(156, '28059100000156', 'CRUZ AVENDAÑO GONZALO', '8 Norte 416-Serdan-Serdan', 12500, 8750, 8750, 0, 12000, 500, 0, 0, 0, 0, 0, NULL),
(157, '28059100000157', 'CRUZ PARRA PAULINA', '13 Oriente Oriente num 106-Hidalgo-Tehuacan', 150500, 105350, 105350, 0, 150000, 500, 0, 0, 0, 0, 0, NULL),
(158, '28059100000158', 'CUELLO MONTAL DIONISIA', 'Ocotlamanic s/n-Ocotlomanic-Coxcatlan', 131900.66, 92330.46, 92330.46, 0, 131400.66, 500, 0, 0, 0, 0, 0, NULL),
(159, '28059100000159', 'DE JESUS HERNANDEZ JUANA', 'Telpatlan s/n-Telpatlan-Vicente Guerrero', 20500, 14350, 14350, 0, 20000, 500, 0, 0, 0, 0, 0, NULL),
(160, '28059100000160', 'DE JESUS MACEDONIO FRANCISCO', 'Real num 203-Jose Maria Morelos-Tlachichuca', 300000, 210000, 167930, 0, 300000, 0, 0, 0, 0, 0, 0, NULL),
(161, '28059100000161', 'DE LOS SANTOS SALINAS JOSE', '3 oriente num12-Centro-Atexcal', 99000, 69300, 69300, 4000, 95000, 0, 0, 0, 0, 0, 0, NULL),
(162, '28059100000162', 'DIAZ OSORIO JUAN', 'Buena Vista s/n-Santa Maria Teopoxco-Santa Maria Teopoxco', 110265.77, 77186.04, 77186.04, 0, 109765.77, 500, 0, 0, 0, 0, 0, NULL),
(163, '28059100000163', 'DIEGO GAYTAN ALEJANDRO', 'Aeromexico num Lote 36-Aeropuerto-Tehuacan', 117500, 82250, 82250, 0, 117500, 0, 0, 0, 0, 0, 0, NULL),
(164, '28059100000164', 'DUARTE HUITZITL AGRIPINA ALICIA', 'Zoquitlan s/n-Zoquitlan-Zoquitlan', 100000, 70000, 70000, 0, 100000, 0, 0, 0, 0, 0, 0, NULL),
(165, '28059100000165', 'DUARTE OLMOS FIDENCIO', 'Xaltepec s/n-Xaltepec-Zoquitlan', 50000, 35000, 35000, 0, 50000, 0, 0, 0, 0, 0, 0, NULL),
(166, '28059100000166', 'DURAN AVENDAÑO LEOVIGILDA', 'Republica Brazil num 2512-America-Tehuacan', 100500, 70350, 70350, 0, 100000, 500, 0, 0, 0, 0, 0, NULL),
(167, '28059100000167', 'DURAN LOPEZ FLORENCIO LAZARO', 'Guerrero num 13-Cuauhtemoc-San Juan B Cuicatlan', 42008.73, 29406.11, 29406.11, 41508.73, 0, 500, 0, 0, 0, 0, 0, NULL),
(168, '28059100000168', 'FERMIN HERNANDEZ ESTEBAN', '1RA Priv 9 nte 7-Observatorio-Tehuacan', 9133.67, 6393.57, 6393.57, 8633.67, 0, 500, 0, 0, 0, 0, 0, NULL),
(169, '28059100000169', 'FLORES ARCOS DOLORES', 'Reforma Sur 700-Centro-Tehuacan', 175800, 123060, 123060, 0, 175800, 0, 0, 0, 0, 0, 0, NULL),
(170, '28059100000170', 'FLORIAN COLMENARES DELIA', '3 era Privada de la 3 Oriente num10-El Mirador-Tehuacan', 1825343.19, 1277740.23, 167930, 224843.19, 1600000, 500, 0, 0, 0, 0, 0, NULL),
(171, '28059100000171', 'FLORIUK GONZALEZ MARIA EUGENIA', '3 Sur 313 y 3 oriente-Centro-Tehuacan', 900000, 630000, 167930, 0, 0, 900000, 0, 0, 0, 0, 0, NULL),
(172, '28059100000172', 'GALVAN RODRIGUEZ ADELA', 'Pipila num2027-Aeropuerto-Tehuacan', 23500, 16450, 16450, 7000, 16000, 500, 0, 0, 0, 0, 0, NULL),
(173, '28059100000173', 'GALVEZ GONZALEZ ELIA TRINIDAD', '4 Oriente num 717 4-San Pedro Acoquiaco-Tehuacan', 19500, 13650, 13650, 0, 19000, 500, 0, 0, 0, 0, 0, NULL),
(174, '28059100000174', 'GALVEZ GONZALEZ MARIA DEL CARMEN', '3 Norte num 211-Centro-Tehuacan', 90000, 63000, 63000, 0, 90000, 0, 0, 0, 0, 0, 0, NULL),
(175, '28059100000175', 'GALVEZ GONZALEZ SOLEDAD', '3 norte num 211-Centro-Tehuacan', 15424.16, 10796.91, 10796.91, 15424.16, 0, 0, 0, 0, 0, 0, 0, NULL),
(176, '28059100000176', 'GARCIA BRETON MARIA JOSEFINA EVARISTA', 's/nombre s/n-Temaxcalapa-Cañada Morelos', 10892.55, 7624.79, 7624.79, 0, 10892.55, 0, 0, 0, 0, 0, 0, NULL),
(177, '28059100000177', 'GARCIA GARCIA MARCELINA', '13 Mza 103 LT 19-Valle de los Reyes-La Paz Mexico', 37133.15, 25993.21, 25993.21, 0, 36633.15, 500, 0, 0, 0, 0, 0, NULL),
(178, '28059100000178', 'GARCIA LOPEZ CONSUELO', '11 oriente num 741-Nicolas Bravo-Tehuacan', 108030.38, 75621.27, 75621.27, 3030.38, 0, 105000, 0, 0, 0, 0, 0, NULL),
(179, '28059100000179', 'GARCIA MARTINEZ JUANA', 'Lerdo de Tejada num 924 Galeana Y 11 Poniente-Benito Juarez-Tehuacan', 10500, 7350, 7350, 0, 10000, 500, 0, 0, 0, 0, 0, NULL),
(180, '28059100000180', 'GARCIA MARTINEZ RAYMUNDO', '26 Sur num 1936-Puebla-Tehuacan', 15986.28, 11190.4, 11190.4, 0, 15486.28, 500, 0, 0, 0, 0, 0, NULL),
(181, '28059100000181', 'GASPAR GONZALEZ GORGONIO', 'Puerto de angel s/n-Puerto san Angel-Ajalpan', 25500, 17850, 17850, 0, 25000, 500, 0, 0, 0, 0, 0, NULL),
(182, '28059100000182', 'GASPAR MONTALVO MAURA', 'Puerto de Angel s/n-Barrio Atempa-Ajalpan', 3500, 2450, 2450, 0, 3000, 500, 0, 0, 0, 0, 0, NULL),
(183, '28059100000183', 'GINEZ GINEZ ADRIAN', 'sin nombre s/n-Santa Maria Monte-Vicente Guerrero', 123576.13, 86503.29, 86503.29, 0, 123076.13, 500, 0, 0, 0, 0, 0, NULL),
(184, '28059100000184', 'GONZALEZ GARCIA CONRADO AUSENCIO', 'Xaltepec s/n-Xaltepec-Zoquitlan', 51900, 36330, 36330, 0, 51900, 0, 0, 0, 0, 0, 0, NULL),
(185, '28059100000185', 'GONZALEZ GIL MARIANO', 'Morelos num17-Barrio Gonzalisco-Ajalpan', 21369.24, 14958.47, 14958.47, 0, 20869.24, 500, 0, 0, 0, 0, 0, NULL),
(186, '28059100000186', 'GONZALEZ MONTALVO RIGOBERTO', '4 Oriente 117-Centro-Tehuacan', 9000, 6300, 6300, 0, 8500, 500, 0, 0, 0, 0, 0, NULL),
(187, '28059100000187', 'GORDILLO JIMENEZ VELINO', '16 de septiembre num913-Hidalgo-Tehuacan', 500500, 350350, 167930, 0, 500000, 500, 0, 0, 0, 0, 0, NULL),
(188, '28059100000188', 'HERNANDEZ ANASTACIO SERAFINA', 'Callejon Jacarandas num 12-Aeropuerto-Tehuacan', 66817.38, 46772.17, 46772.17, 0, 66817.38, 0, 0, 0, 0, 0, 0, NULL),
(189, '28059100000189', 'HERNANDEZ BENITEZ HERON REMIGIO', 'Avenida 5 de mayo num11-Centro-Cañada Morelos', 50500, 35350, 35350, 0, 50000, 500, 0, 0, 0, 0, 0, NULL),
(190, '28059100000190', 'HERNANDEZ ESPINOZA ALBERTA', 'Cerrada de Amdo Nervo num8-La Purisima-Tehuacan', 27280, 19096, 19096, 0, 26780, 500, 0, 0, 0, 0, 0, NULL),
(191, '28059100000191', 'HERNANDEZ GONZALEZ JUANA', 'Vicente Guerrero s/n-Villa Nueva-Santa Maria Teopoxco', 90600, 63420, 63420, 0, 90600, 0, 0, 0, 0, 0, 0, NULL),
(192, '28059100000192', 'HERNANDEZ HERNANDEZ ARACELI', '5 norte num110-Centro-Tehuacan', 18673.99, 13071.79, 13071.79, 0, 18173.99, 500, 0, 0, 0, 0, 0, NULL),
(193, '28059100000193', 'HERNANDEZ HERNANDEZ MARIA MARGARITA', 'Priv Atlixco num 1913-San Juan Bautista-Cuicatlan', 4976.52, 3483.56, 3483.56, 0, 4476.52, 500, 0, 0, 0, 0, 0, NULL),
(194, '28059100000194', 'HERNANDEZ OLAYA GUADALUPE DELFINA', 'Benito Juarez 513-Centro-Zinacatepec', 100500, 70350, 70350, 0, 100000, 500, 0, 0, 0, 0, 0, NULL),
(195, '28059100000195', 'HERNANDEZ REYES MARIA AGUSTINA', 'Priv Miguel Hidalgo num 623 Int 1-San Lorenzo Teopilco-Tehuacan', 36870, 25809, 25809, 36370, 0, 500, 0, 0, 0, 0, 0, NULL),
(196, '28059100000196', 'HUERTA ALVAREZ ROSA', '2 Oriente num 712-Centro-Tehuacan', 260000, 182000, 167930, 0, 0, 260000, 0, 0, 0, 0, 0, NULL),
(197, '28059100000197', 'HUERTA ROMUALDO ISAAC', 'Pino Suarez num 327-Jesus Carranza-Zinacatepec', 50500, 35350, 35350, 0, 0, 50500, 0, 0, 0, 0, 0, NULL),
(198, '28059100000198', 'JIMENEZ RIVERA SIBILINA', 'Privada Nacional Lote 49-Vista hermosa-Teotipilco', 159055.13, 111338.59, 111338.59, 0, 158555.13, 500, 0, 0, 0, 0, 0, NULL),
(199, '28059100000199', 'JUANA GASPAR MONTALVO', 'El mirador s/n-El mirado-Ajalpan', 33600, 23520, 23520, 0, 33100, 500, 0, 0, 0, 0, 0, NULL),
(200, '28059100000200', 'JUAREZ SANCHEZ CLEMENCIA', 'Quinta Privada 6 Oriente num619-Quinta Guadalupe-Tehuacan', 216500, 151550, 151550, 0, 216500, 0, 0, 0, 0, 0, 0, NULL),
(201, '28059100000201', 'JULITA HERNANDEZ MAGDALENA', '16 de Septiembre num 101-Zentlapatl-Zinacatepec', 20300, 14210, 14210, 0, 20300, 0, 0, 0, 0, 0, 0, NULL),
(202, '28059100000202', 'LADINO GARCIA PATRICIA', 'Lazaro Cardenas num 904 B-El Riego-Tehuacan', 18815.97, 13171.18, 13171.18, 0, 0, 18815.97, 0, 0, 0, 0, 0, NULL),
(203, '28059100000203', 'LARA MARTINEZ GERMAN', 'Sor Juana Ines de la Cruz num 3512-Fracc Cultural-Tehuacan', 250047.79, 175033.45, 167930, 0, 249547.79, 500, 0, 0, 0, 0, 0, NULL),
(204, '28059100000204', 'LEYVA OLMOS CARMELA', 'Porfirio Diaz num1201-Centro-Zinacatepec', 6520.32, 4564.22, 4564.22, 6020.32, 0, 500, 0, 0, 0, 0, 0, NULL),
(205, '28059100000205', 'LEYVA PACHECO GREGORIO', 'Privada Guerrero 806 int5-Centro-Zinacatepec', 100500, 70350, 70350, 0, 100000, 500, 0, 0, 0, 0, 0, NULL),
(206, '28059100000206', 'LEZAMA FERNANDEZ JUDITH SULLY', 'Privada de la 6 oriente num 19 int 6-Centro-Tehuacan', 150087.93, 105061.55, 105061.55, 0, 149587.93, 500, 0, 0, 0, 0, 0, NULL),
(207, '28059100000207', 'LEZAMA TOBON JOSE', 'Callejon Hidalgo no 520-La Pedrera-Tehuacan', 150000, 105000, 105000, 0, 150000, 0, 0, 0, 0, 0, 0, NULL),
(208, '28059100000208', 'LIMA LEON TEODORO', 'Priv 7 sur andador 3 56-La purisima-Tehuacan', 652500, 456750, 167930, 0, 652000, 500, 0, 0, 0, 0, 0, NULL),
(209, '28059100000209', 'LOPEZ GARCIA ROBERTO', '4 Sur num 1120-Benito Juarez-Tehuacan', 60500, 42350, 42350, 0, 0, 60500, 0, 0, 0, 0, 0, NULL),
(210, '28059100000210', 'LOPEZ GAYOSSO EZEQUIEL', 'Justo Sierra num3708-Cultural-Tehuacan', 5957.46, 4170.22, 4170.22, 5457.46, 0, 500, 0, 0, 0, 0, 0, NULL),
(211, '28059100000211', 'LOPEZ HERNANDEZ GERARDO', 'Gardenia num 4115-Villa Vista-Tehuacan', 56583.32, 39608.32, 39608.32, 0, 56083.32, 500, 0, 0, 0, 0, 0, NULL),
(212, '28059100000212', 'LOPEZ SANCHEZ PETRA', 'Puerto de Veracruz 2128-Revolucion-Tehuacan', 50000, 35000, 35000, 0, 0, 50000, 0, 0, 0, 0, 0, NULL),
(213, '28059100000213', 'LUCAS MORALES LEONARDO', 'Privada 19 sur num 1913-Las Flores-Tehuacan', 11590.23, 8113.16, 8113.16, 2683.06, 8407.17, 500, 0, 0, 0, 0, 0, NULL),
(214, '28059100000214', 'LUNA CARRETO SILVIA', 'Privada Amado Nervo num 331-La Purisima-Tehuacan', 100500, 70350, 70350, 0, 100000, 500, 0, 0, 0, 0, 0, NULL),
(215, '28059100000215', 'MALCON OROZCO GUADALUPE', 'Privada la Paz num119-Centro-Tehuacan', 194386.26, 136070.38, 136070.38, 0, 193886.26, 500, 0, 0, 0, 0, 0, NULL),
(216, '28059100000216', 'MALDONADO QUINTANA RAMON', 'De la 6 Oriente num 602-Francisco Sarabia-Tehuacan', 350000, 245000, 167930, 0, 350000, 0, 0, 0, 0, 0, 0, NULL),
(217, '28059100000217', 'MARCELINO HERNANDEZ CARMELITA JOAQUINA', 'Venustiano Carranza num 714-Sentlalpal-Zinacatepec', 14500, 10150, 10150, 0, 14500, 0, 0, 0, 0, 0, 0, NULL),
(218, '28059100000218', 'MARCELINO HERNANDEZ GORGONIO FELIPE', '16 de Septiembre num 504-Barr Zentlapatl-Zincatepec', 12500, 8750, 8750, 0, 12000, 500, 0, 0, 0, 0, 0, NULL),
(219, '28059100000219', 'MARTINEZ GARCIA CAROLINA', 'Hector Lezama Sur Roca 337-La Purisima-Tehuacan', 150000, 105000, 105000, 0, 0, 150000, 0, 0, 0, 0, 0, NULL),
(220, '28059100000220', 'MARTINEZ JIMENEZ DANIELA', 'Biarritz num 116-Arcadia-Tehuacan', 1500000, 1050000, 167930, 0, 1500000, 0, 0, 0, 0, 0, 0, NULL),
(221, '28059100000221', 'MARTINEZ MORFINEZ MARIA ANGELICA', 'C Matamoros num 10-Centro-San Gabriel Chilac', 11507, 8054.9, 8054.9, 0, 11007, 500, 0, 0, 0, 0, 0, NULL),
(222, '28059100000222', 'MARTINEZ VALERIO MIGUEL ANGEL GERMAN', 'Priv Biarritz num 116-Fracc Arcadia-Tehuacan', 1000000, 700000, 167930, 0, 1000000, 0, 0, 0, 0, 0, 0, NULL),
(223, '28059100000223', 'MENDOZA DIEGO MAGARITA INES', 'Venustiano Carranza num 1908-16 de Marzo-Tehuacan', 10000, 7000, 7000, 0, 9500, 500, 0, 0, 0, 0, 0, NULL),
(224, '28059100000224', 'MIGUEL SANTIAGO OMEGA', 'Macario Gaxiola edif 27 202-U Hab las Armas-Azcapotzalco', 900000, 630000, 167930, 0, 900000, 0, 0, 0, 0, 0, 0, NULL),
(225, '28059100000225', 'MOLINA GOMEZ LUCIO', '5 sur esq con 11 oriente num 500-Nicolas Bravo-Tehuacan', 442443.53, 309710.47, 167930, 0, 0, 442443.53, 0, 0, 0, 0, 0, NULL),
(226, '28059100000226', 'MOLINA LOPEZ JULIA AMALIA', '11 oriente num 500-Nicolas Bravo-Tehuacan', 306928.88, 214850.22, 167930, 0, 0, 306928.88, 0, 0, 0, 0, 0, NULL),
(227, '28059100000227', 'MONTALVO ANSELMO AMBROCIO', 'Tepexilotla s/n-Seccion Tercera-Zoquitlan', 325500, 227850, 167930, 0, 325500, 0, 0, 0, 0, 0, 0, NULL),
(228, '28059100000228', 'MORAL CANO GONZALO', 'Primera Seccion-Barrio Zacapechco-Zoquitlan', 36600, 25620, 25620, 0, 36600, 0, 0, 0, 0, 0, 0, NULL),
(229, '28059100000229', 'MORALES JIMENEZ HERMINIA', 'Guadalupe Victoria num1640-Aeropuerto-Tehuacan', 20500, 14350, 14350, 0, 20000, 500, 0, 0, 0, 0, 0, NULL),
(230, '28059100000230', 'MORALES ROJAS ALFREDO VICTOR', '12 poniente num617-Lazaro Cardena Norte-Tehuacan', 238800.12, 167160.08, 167160.08, 238300.12, 0, 500, 0, 0, 0, 0, 0, NULL),
(231, '28059100000231', 'MORENO ANGELA', 'Privada Nacional LT 49A-Vista Hermosa-Tehuacan', 179617.63, 125732.34, 125732.34, 20000, 159117.63, 500, 0, 0, 0, 0, 0, NULL),
(232, '28059100000232', 'OLAYA ROMERO SOCORRO', 'Benito Juarez num513-Centro-Zinacatepec', 163400, 114380, 114380, 0, 162900, 500, 0, 0, 0, 0, 0, NULL),
(233, '28059100000233', 'OLMOS DORANTES DULCE MARIA', 'Juquilita Lote 5-Maldonado Colosio-Tehuacan', 50500, 35350, 35350, 0, 50000, 500, 0, 0, 0, 0, 0, NULL),
(234, '28059100000234', 'OLMOS VALENCIA LEONARDO', 'Ocotlamanic s/n-Ocotla-Coxcatlan', 150500, 105350, 105350, 0, 150000, 500, 0, 0, 0, 0, 0, NULL),
(235, '28059100000235', 'ORTIZ JIMENEZ VIRGINIA ORTENCIA', 'Av 5 de mayo num 5-Seccion cuarta-Zoquitlan', 35900, 25130, 25130, 0, 35400, 500, 0, 0, 0, 0, 0, NULL),
(236, '28059100000236', 'OSORIO GUZMAN HERLINDA', 'Del panteon s/n-San Juan Atzingo-San Gabriel Chilac', 350000, 245000, 167930, 0, 350000, 0, 0, 0, 0, 0, 0, NULL),
(237, '28059100000237', 'PARRA GARRERA MARTHA', '13 Oriente num 106-Hidalgo-Tehuacan', 60500, 42350, 42350, 0, 60000, 500, 0, 0, 0, 0, 0, NULL),
(238, '28059100000238', 'PASTRANA SOLIS FROYLAN', '18 Poniente num 818-Tetizintla-Tehuacan', 3506.44, 2454.51, 2454.51, 3006.44, 0, 500, 0, 0, 0, 0, 0, NULL),
(239, '28059100000239', 'PEREZ MENDEZ MATEO', 'Reforma norte num 127-Centro-Tehuacan', 10557652, 7390356.4, 167930, 0, 10557652, 0, 0, 0, 0, 0, 0, NULL),
(240, '28059100000240', 'PEREZ NAVA ADRIANA', 'Corregidora num2-San Jose Tilapa-Coxcatlan', 32000, 22400, 22400, 0, 31500, 500, 0, 0, 0, 0, 0, NULL),
(241, '28059100000241', 'QUIXTIANO COGQUE MIGUEL', 'Revolucion num 415-Guadalupe-Ajalpan', 410989, 287692.3, 167930, 0, 410989, 0, 0, 0, 0, 0, 0, NULL),
(242, '28059100000242', 'QUIXTIANO TEMAXTE SOFIA', 'Revolucion Poniente num17-Centro-Ajalpan', 69001, 48300.7, 48300.7, 0, 68501, 500, 0, 0, 0, 0, 0, NULL),
(243, '28059100000243', 'RABAGO BALBUENA MARIA CONCEPCION JOSEFINA', 'Av Reforma Sur num 317-Centro-Tehuacan', 3650262.43, 2555183.7, 167930, 0, 3650262.43, 0, 0, 0, 0, 0, 0, NULL),
(244, '28059100000244', 'RAMIREZ BAUTISTA OLGA', 'Manuel Hernandez num 804-Xaltepec-Altepexi', 26550, 18585, 18585, 0, 26050, 500, 0, 0, 0, 0, 0, NULL),
(245, '28059100000245', 'RAMIREZ CABRERA CONCEPCION', '10 Poniente num 405-Cerritos-Tehuacan', 100000, 70000, 70000, 0, 100000, 0, 0, 0, 0, 0, 0, NULL),
(246, '28059100000246', 'RAMIREZ CARRERA MARIA DEL SOCORRO', '10 Poniente num407-Cerritos-Tehuacan', 115500, 80850, 80850, 0, 115000, 500, 0, 0, 0, 0, 0, NULL),
(247, '28059100000247', 'RAMIREZ CORDOVA EULALIA', 'Zoquitlan s/n-Tercera Seccion-Tecpanzcoalco', 9000, 6300, 6300, 0, 8500, 500, 0, 0, 0, 0, 0, NULL),
(248, '28059100000248', 'RAMIREZ DOMINGUEZ GRECIA CAROLINA', 'Avenida Ramon Caballero num641-San Rafael-Tehuacan', 220000, 154000, 154000, 0, 220000, 0, 0, 0, 0, 0, 0, NULL),
(249, '28059100000249', 'RAMIREZ GARCIA NORBERTO', 'Seccion seguda num-Loma Ixmicapa-Zoquitlan', 100500, 70350, 70350, 0, 100000, 500, 0, 0, 0, 0, 0, NULL),
(250, '28059100000250', 'RAMIREZ PAZOS JORGE', 'Prol 1 poniente 3000-Fracc Reforma-Tehuacan', 889835.31, 622884.72, 167930, 689335.31, 200000, 500, 0, 0, 0, 0, 0, NULL),
(251, '28059100000251', 'RAMIREZ VAQUERO ROMUALDO', 'Ramon Caballero num 611-San Rafael-Tehuacan', 160000, 112000, 112000, 0, 160000, 0, 0, 0, 0, 0, 0, NULL),
(252, '28059100000252', 'RCHING RAMIREZ SOCORRO SOLEDAD', 'Avenida Reforma Sur sn-Guadalupe Hidalgo-Tehuacan', 421723.78, 295206.65, 167930, 0, 421223.78, 500, 0, 0, 0, 0, 0, NULL),
(253, '28059100000253', 'REYES VENTURA ANGELICA', 'Independencia num 32-Centro-Tehuacan', 36622.21, 25635.55, 25635.55, 0, 36122.21, 500, 0, 0, 0, 0, 0, NULL),
(254, '28059100000254', 'RODRIGUEZ ARCE RICARDA', 'Ocotlamanic s/n-Ocotlamanic-Coxcatlan', 15761.4, 11032.98, 11032.98, 0, 15261.4, 500, 0, 0, 0, 0, 0, NULL),
(255, '28059100000255', 'RODRIGUEZ ARCE TAURINO ANGELES', 'Ocotlamanic s/n-Ocotlomanic-Coxcatlan', 116420.65, 81494.46, 81494.46, 0, 116420.65, 0, 0, 0, 0, 0, 0, NULL),
(256, '28059100000256', 'RODRIGUEZ CUELLO ROLANDO', 'Ocotlamanic s/n-Ocotlomanic-Coxcatlan', 147000, 102900, 102900, 0, 147000, 0, 0, 0, 0, 0, 0, NULL),
(257, '28059100000257', 'RODRIGUEZ MOLINA ROSA', '11 Ote num 500 Esquina con 5 Sur-Nicolas Bravo-Tehuacan', 1084966.56, 759476.59, 167930, 0, 542483.28, 542483.28, 0, 0, 0, 0, 0, NULL),
(258, '28059100000258', 'ROMERO CID MARIA', 'Nacional num 83 1A Secc-Nicolas Bravo-Tehuacan', 12700, 8890, 8890, 0, 12200, 500, 0, 0, 0, 0, 0, NULL),
(259, '28059100000259', 'ROMERO DUARTE TAURINO CARLOS', 'Av Rafael Avila Camacho num 227-Centro-San Gabriel Chilac', 73651.32, 51555.92, 51555.92, 0, 73651.32, 0, 0, 0, 0, 0, 0, NULL),
(260, '28059100000260', 'ROSALES VILLANUEVA ROSARIO', 'Heroes de Nacozari Norte num 124 Int 1-Ignacio Zaragoza-Tehuacan', 370500, 259350, 167930, 0, 370000, 500, 0, 0, 0, 0, 0, NULL),
(261, '28059100000261', 'RUIZ FLORES MARTHA NANCY Y/O FLORES GARCIA PAULINA', 'Av Nicolas Bravo num 702-Nicolas Bravo-Tehuacan', 68500, 47950, 47950, 30000, 38000, 500, 0, 0, 0, 0, 0, NULL),
(262, '28059100000262', 'SAENZ ESCALANTE GUSTAVO', 'Bould Ingeniero Pastor Rouaix num 700-Benito Juarez-Tehuacan', 14270000, 9989000, 167930, 0, 1500000, 12770000, 0, 0, 0, 0, 0, NULL),
(263, '28059100000263', 'SALINAS FLORES HERIBERTO CARLOS', '5 norte num642-Cerritos-Tehuacan', 115810.56, 81067.39, 81067.39, 61310.56, 54000, 500, 0, 0, 0, 0, 0, NULL),
(264, '28059100000264', 'SANCHEZ COELLO CATALINA JAQUELINA', 'Zoquitlan s/n-Tecpantzacualco-Zoquitlan', 18400, 12880, 12880, 0, 17900, 500, 0, 0, 0, 0, 0, NULL),
(265, '28059100000265', 'SANCHEZ HERNANDEZ CARLOS', 'Republica de Panama num 2325-America-Cuicatlan', 5641.7, 3949.19, 3949.19, 5141.7, 0, 500, 0, 0, 0, 0, 0, NULL),
(266, '28059100000266', 'SANCHEZ MENDEZ FAUSTINO', 'Ocotlamanic s/n-Ocotlomanic-Coxcatlan', 51000, 35700, 35700, 0, 50500, 500, 0, 0, 0, 0, 0, NULL),
(267, '28059100000267', 'SANCHEZ MONTALVO CATALINA', 'Salinas num 28-Chalma-Tehuacan', 12506.58, 8754.61, 8754.61, 12006.58, 0, 500, 0, 0, 0, 0, 0, NULL),
(268, '28059100000268', 'SANCHEZ MONTALVO FLORENCIO', '7 Sur 1106 Santa Maria 1106-Centro-Tehuacan', 26040.41, 18228.29, 18228.29, 0, 25540.41, 500, 0, 0, 0, 0, 0, NULL),
(269, '28059100000269', 'SANCHEZ RAMOS LETICIA', 'Callejon Pachuca num 5-Hidalgo Tehuantepec-Tehuacan', 31500, 22050, 22050, 0, 31000, 500, 0, 0, 0, 0, 0, NULL),
(270, '28059100000270', 'SANCHEZ ROMERO ARCENIO IGNACIO', 'Vicente Guerrero lt-6-21 de Marzo-Tehuacan', 15975, 11182.5, 11182.5, 0, 15975, 0, 0, 0, 0, 0, 0, NULL),
(271, '28059100000271', 'SANCHEZ SANCHEZ LEOPOLDO', 'Nicolas Bravo num 19 A-Loc San Jose Ixtapa-Cañada Morelos', 500000, 350000, 167930, 0, 0, 500000, 0, 0, 0, 0, 0, NULL),
(272, '28059100000272', 'SANDOVAL ATILANO GILBERTO', 'Tepeaca de Zaragoza s/n-Tepeaca de Zaragoza-Ajalpan', 35500, 24850, 24850, 0, 35000, 500, 0, 0, 0, 0, 0, NULL),
(273, '28059100000273', 'SANDOVAL GONZALEZ EMILIANO', 'Domicilio conocido s/n-Tepeaca de Zaragoza-Ajalpan', 36500, 25550, 25550, 0, 36000, 500, 0, 0, 0, 0, 0, NULL),
(274, '28059100000274', 'SANDOVAL QUIAHUA LEONARDO', 'San Bartolo s/n-Telpatlan-Vicente Guerrero', 90500, 63350, 63350, 0, 0, 90500, 0, 0, 0, 0, 0, NULL),
(275, '28059100000275', 'SANTIAGO LOPEZ EMMA MARIA', 'Andador 3/1-La Purisima-Tehuacan', 643500, 450450, 167930, 0, 643500, 0, 0, 0, 0, 0, 0, NULL),
(276, '28059100000276', 'SERAFIN MONTALVO EMMA', 'Playa Vicente s/n-Playa Vicente-Ajalpan', 35500, 24850, 24850, 0, 35000, 500, 0, 0, 0, 0, 0, NULL),
(277, '28059100000277', 'TAPIA HERNANDEZ FILADELFIA', 'Reforma num 89-San Jose del Chilar-Cuicatlan', 22753.42, 15927.39, 15927.39, 0, 22253.42, 500, 0, 0, 0, 0, 0, NULL),
(278, '28059100000278', 'TEMOXTLE GARCIA EUFEMIA', 'Av Morelos num 2-Zacapanga-Vicente Guerrero', 15503.28, 10852.3, 10852.3, 15003.28, 0, 500, 0, 0, 0, 0, 0, NULL),
(279, '28059100000279', 'TENORIO CARRILLO LUZ MARIA', 'Av Miguel Hidalgo num 209-Lorenzo Teotipilco-Tehuacan', 94490, 66143, 66143, 0, 93990, 500, 0, 0, 0, 0, 0, NULL),
(280, '28059100000280', 'TENORIO GARCIA SANDRA LUCY', 'Av Miguel Hidalgo num 209-Lorenzo Teotipilco-Tehuacan', 21645, 15151.5, 15151.5, 0, 21145, 500, 0, 0, 0, 0, 0, NULL),
(281, '28059100000281', 'TORRES ALVA GUILLERMO', 'Dom Conocido s/n-Seccion Cuarta-Zoquitlan', 26622.21, 18635.55, 18635.55, 0, 26122.21, 500, 0, 0, 0, 0, 0, NULL),
(282, '28059100000282', 'TRUJILLO MORENO RAFAELA', '2 Poniente num 1617-Aquiles Serdan-Tehuacan', 43812.4, 30668.68, 30668.68, 0, 43812.4, 0, 0, 0, 0, 0, 0, NULL),
(283, '28059100000283', 'VALENCIA PEREZ ANGELA', 'Centenario num 42-Centro-San Jeronimo Teocatl', 15091, 10563.7, 10563.7, 0, 14591, 500, 0, 0, 0, 0, 0, NULL),
(284, '28059100000284', 'VALERIO FUENTES CAMILA MARINA', 'Av 7 sur num 205-Cristo Rey-Santiago Miahuatlan', 159000, 111300, 111300, 0, 159000, 0, 0, 0, 0, 0, 0, NULL),
(285, '28059100000285', 'VARELA ROMAN MARCO ANTONIO', '8 Pte num Edficio 404 Int DTO 303-Fovisst Garci Crespo-Tehuacan', 162500, 113750, 113750, 0, 162000, 500, 0, 0, 0, 0, 0, NULL),
(286, '28059100000286', 'VARELA ROMAN MARIA TERESA', '3 oriente-Centro-Tehuacan', 1101500, 771050, 167930, 0, 1101000, 500, 0, 0, 0, 0, 0, NULL),
(287, '28059100000287', 'VARELA ROMAN SERAFINA ENCARNACION', '3 Norte num 1612-Francisco Sarabia-Tehuacan', 696759.46, 487731.62, 167930, 350188.4, 346071.06, 500, 0, 0, 0, 0, 0, NULL),
(288, '28059100000288', 'VARILLAS CASTRO JOSE EDUARDO FAUSTO', 'Independencia num 4-San Jose Buena Vista-Tlacotepec', 230994.82, 161696.37, 161696.37, 0, 230994.82, 0, 0, 0, 0, 0, 0, NULL),
(289, '28059100000289', 'VEGA COELLO ANDRES ELEAZAR', 'Obregon s/n-Segunda Seccion-Zoquitlan', 30500, 21350, 21350, 0, 30000, 500, 0, 0, 0, 0, 0, NULL),
(290, '28059100000290', 'VIVEROS MONTALVO JORGIN ALICIA', 'Av Nacional num 12-Segunda Seccion-Zoquitlan', 5500, 3850, 3850, 0, 5000, 500, 0, 0, 0, 0, 0, NULL),
(291, '28059100000291', 'ZAQUEROS COELLO ERASTO', 'Cacaloc s/n-Xala-Zoquitlan', 15000, 10500, 10500, 0, 15000, 0, 0, 0, 0, 0, 0, NULL),
(292, '28059100000292', 'ZARATE BARRAGAN EPIGMENIO', '7 Oriente num112-Francisco I Madero-Tepanco de Lopez', 330767.75, 231537.43, 167930, 0, 330767.75, 0, 0, 0, 0, 0, 0, NULL),
(293, '28059100000293', 'ZARATE RAMOS MARGARITA', 'Nuevo Leon Sur num1914-Mexico-Tehuacan', 53374, 37361.8, 37361.8, 15000, 37874, 500, 0, 0, 0, 0, 0, NULL),
(294, '28060100000294', 'AGUIRRE MORALES ERIKA', '5 de Mayo 91-Monte Chiquito-Santiago Miahuatlan', 2439.79, 1707.85, 1707.85, 1939.79, 0, 500, 0, 0, 0, 0, 0, NULL),
(295, '28060100000295', 'ALTA ARANDIA LEONOR', '28 Oriente 534-Santiago Tula-Tehuacan', 3500, 2450, 2450, 0, 3000, 500, 0, 0, 0, 0, 0, NULL),
(296, '28060100000296', 'ALTA MARTINEZ TERESA', 'Agua Axoxopan 2100 B-Villas Agua Blanca-Tehuacan', 16326.12, 11428.28, 11428.28, 0, 15826.12, 500, 0, 0, 0, 0, 0, NULL),
(297, '28060100000297', 'ALVARADO SOLANO MANUELA HORTENCIA', '3 Sur 1301-Guadalupe Hidalgo-Tehuacan', 222500, 155750, 155750, 0, 222000, 500, 0, 0, 0, 0, 0, NULL),
(298, '28060100000298', 'ANASTACIO ALFONSO HERMELINDO', '17 de Septiembre 28-Hidalgo-Teotitlan', 351886.26, 246320.38, 167930, 0, 351386.26, 500, 0, 0, 0, 0, 0, NULL),
(299, '28060100000299', 'ANDRADE JUSTINIANO MINERVA', '4 Sur 702-Centro-Tecamachalco', 10883.63, 7618.54, 7618.54, 10383.63, 0, 500, 0, 0, 0, 0, 0, NULL),
(300, '28060100000300', 'APOLINAR PACHECO PABLO', 'Vicente Guerrero 1108-San Pedro Acoquiaco-Tehuacan', 98000, 68600, 68600, 0, 97500, 500, 0, 0, 0, 0, 0, NULL),
(301, '28060100000301', 'ARISTA HERNANDEZ CRISTINA', 'Nahoas 17-Ancon-La Paz Mexico', 187324.73, 131127.31, 131127.31, 0, 186824.73, 500, 0, 0, 0, 0, 0, NULL),
(302, '28060100000302', 'ARISTA HERNANDEZ HERLINDA', 'Buena Vista 2512-El Humilladero-Tehuacan', 180213.06, 126149.14, 126149.14, 0, 179713.06, 500, 0, 0, 0, 0, 0, NULL),
(303, '28060100000303', 'ATENOGENEZ GUERRERO MICAELA', 'Casa Blanca 1-San Pedro Acoquiaco-Tehuacan', 9296.31, 6507.42, 6507.42, 0, 8796.31, 500, 0, 0, 0, 0, 0, NULL),
(304, '28060100000304', 'BARRAGAN GERALDO HIPOLITO', '6 Sur-Marcos Necoxtla-Tehuacan', 11964.94, 8375.46, 8375.46, 11464.94, 0, 500, 0, 0, 0, 0, 0, NULL),
(305, '28060100000305', 'BARRAGAN RIVERA CELIA CONCEPCION', 'Av Nacional Oriente 111-Maria Pinosuarez-Tehuacan', 11237.08, 7865.96, 7865.96, 10737.08, 0, 500, 0, 0, 0, 0, 0, NULL),
(306, '28060100000306', 'BAUTISTA OLIVARES CATALINA AVERTINA', 'San Luis Temalacayuca-Luis Temalacayuca-Tepanco de Lopez', 52500, 36750, 36750, 52000, 0, 500, 0, 0, 0, 0, 0, NULL),
(307, '28060100000307', 'BOLAÑOS CORTES CLAUDIA', 'Miguel Hidalgo 14-Paraiso de Jesus-Tehuacan', 3379.15, 2365.41, 2365.41, 2879.15, 0, 500, 0, 0, 0, 0, 0, NULL),
(308, '28060100000308', 'BRAVO HERNANDEZ RICARDA', '25 Oriente 923-Nicolas Bravo 3ra Se-Tehuacan', 95500, 66850, 66850, 0, 95000, 500, 0, 0, 0, 0, 0, NULL),
(309, '28060100000309', 'CAMACHO TORRES JUAN FRANCISCO', 'Prol 4 Sur 2100-Industrial-Santa Maria Coapan', 70500, 49350, 49350, 0, 70000, 500, 0, 0, 0, 0, 0, NULL);
INSERT INTO `ahorrador` (`idahorrador`, `folioIdentificador`, `nombre`, `direccion`, `montoAl100`, `montoAl70`, `montoMaximo`, `sca`, `sci`, `sps`, `sdg`, `scnc`, `spc`, `sod`, `baja`, `folioBaseDatos`) VALUES
(310, '28060100000310', 'CARPINTEYRO DE JESUS HORTENCIA', 'Av 15 de Septiembre 36-Santa Clara-Santiago Miahuatlan', 11979.4, 8385.58, 8385.58, 0, 11479.4, 500, 0, 0, 0, 0, 0, NULL),
(311, '28060100000311', 'CARRERA JUAREZ IVON', 'Iturbide 124-Tepanco de Lopez-Tlacotepec', 30718.43, 21502.9, 21502.9, 218.43, 30000, 500, 0, 0, 0, 0, 0, NULL),
(312, '28060100000312', 'CASTAÑEDA MENDEZ CATALINA', 'Dalia 4605-Antonio Viveros-Tehuacan', 4294.79, 3006.35, 3006.35, 3794.79, 0, 500, 0, 0, 0, 0, 0, NULL),
(313, '28060100000313', 'CASTAÑEDA VALENCIA GREGORIO', 'Av Hidalgo 45-Cuayucatepec-Tehuacan', 41134, 28793.8, 28793.8, 2134, 38500, 500, 0, 0, 0, 0, 0, NULL),
(314, '28060100000314', 'CASTILLO PEREZ CARLOS', 'Sagrado Corazon de Jesus 7-Zentlapatl-Zinacatepec', 12749.93, 8924.95, 8924.95, 12249.93, 0, 500, 0, 0, 0, 0, 0, NULL),
(315, '28060100000315', 'CECILIO EUSEVIO GENOVEVA', 'Juarez Poniente 138-Maria Coapan-Tehuacan', 25277.18, 17694.03, 17694.03, 24777.18, 0, 500, 0, 0, 0, 0, 0, NULL),
(316, '28060100000316', 'CLEMENTE ROMERO GUADALUPE CARMEN', '7 Oriente 4-San Miguel-Santiago Miahuatlan', 12057.5, 8440.25, 8440.25, 0, 11557.5, 500, 0, 0, 0, 0, 0, NULL),
(317, '28060100000317', 'CONTRERAS PACHECO CATALINA', '25 de Febrero 919-Observatorio-Tepanco de Lopez', 100501, 70350.7, 70350.7, 0, 100001, 500, 0, 0, 0, 0, 0, NULL),
(318, '28060100000318', 'CONTRERAS VAZQUEZ OCOTLAN', 'Leon Guzman 334-Reforma-Tehuacan', 31303.68, 21912.58, 21912.58, 966.51, 29837.17, 500, 0, 0, 0, 0, 0, NULL),
(319, '28060100000319', 'CORTES DOLORES MARCELA RAQUEL', 'Vicente Guerrero Poniente 131-Maria Cuaupan-Tehuacan', 2768.41, 1937.89, 1937.89, 2268.41, 0, 500, 0, 0, 0, 0, 0, NULL),
(320, '28060100000320', 'CORTEZ PEREZ ALBERTINA', 'Viente Guerrero 155-San Lorezno Teopilco-Tehuacan', 6997.61, 4898.33, 4898.33, 6497.61, 0, 500, 0, 0, 0, 0, 0, NULL),
(321, '28060100000321', 'CORTEZ RAMIREZ ROSA', '7 Poniente 230-La Pedrera-Tehuacan', 6530.52, 4571.36, 4571.36, 6030.52, 0, 500, 0, 0, 0, 0, 0, NULL),
(322, '28060100000322', 'CRUZ DE LA CRUZ JOSE ALFREDO', 'Centenario 500-Hidalgo-Tehuacan', 5994.6, 4196.22, 4196.22, 5494.6, 0, 500, 0, 0, 0, 0, 0, NULL),
(323, '28060100000323', 'CRUZ VILLEGAS ERNESTINA LEONOR', 'Privada 25 dur 123-El Rosario-Tehuacan', 46500, 32550, 32550, 0, 46000, 500, 0, 0, 0, 0, 0, NULL),
(324, '28060100000324', 'DE JESUS MENDOZA GENOVEBA MARGARITA', '15 de Septiembre 36-Santa Clara-Santiago Miahuatlan', 100000, 70000, 70000, 0, 99500, 500, 0, 0, 0, 0, 0, NULL),
(325, '28060100000325', 'DE LA CRUZ ZUÑIGA EDITH', '17 Sur 703-San Sebastian-Tecamachalco', 23280.54, 16296.38, 16296.38, 23280.54, 0, 0, 0, 0, 0, 0, 0, NULL),
(326, '28060100000326', 'DOMINGUEZ LUCAS ROSALIA', '22 Poniente 2416-San Rafael-Ahuatempan', 9480.8, 6636.56, 6636.56, 8980.8, 0, 500, 0, 0, 0, 0, 0, NULL),
(327, '28060100000327', 'ENRIQUE BRAVO CECILIA', 'Isabel la catolica 725-Morelos-Tehuacan', 15500, 10850, 10850, 0, 15500, 0, 0, 0, 0, 0, 0, NULL),
(328, '28060100000328', 'ESPINOZA PACHECO FRANCISCO CONSTANTINO', 'Adolfo Lopez Mateos 7-Antonio Texcala-Zapotitlan', 21500, 15050, 15050, 0, 21000, 500, 0, 0, 0, 0, 0, NULL),
(329, '28060100000329', 'FLORES RODRIGUEZ ELIAS', '11 Norte 113-Independencia-Tehuacan', 179184.99, 125429.49, 125429.49, 0, 179184.99, 0, 0, 0, 0, 0, 0, NULL),
(330, '28060100000330', 'FLORES RODRIGUEZ JAVIER', '7 Norte 2000-Emiliano Zapata-Tehuacan', 600000, 420000, 167930, 0, 600000, 0, 0, 0, 0, 0, 0, NULL),
(331, '28060100000331', 'FLORES VERA PATRICIA', 'Av Zacatecas 4-Tlacuitlapan-Tlacotepec', 36257.03, 25379.92, 25379.92, 9096.22, 26660.81, 500, 0, 0, 0, 0, 0, NULL),
(332, '28060100000332', 'FLORES VERA RUFINA', '6 Sur 3-Seccion Tercera-Tlacotepec', 34467.4, 24127.18, 24127.18, 34467.4, 0, 0, 0, 0, 0, 0, 0, NULL),
(333, '28060100000333', 'FUENTES GONZALEZ ABELINO NICOLAS', 'Mariano Matamoros 120-Centro-San Gabriel Chilac', 1400, 980, 980, 500, 400, 500, 0, 0, 0, 0, 0, NULL),
(334, '28060100000334', 'FUENTES NARVAEZ JULIANA', 'Sonora Sur 1504-Mexico Sur-Tehuacan', 2113.51, 1479.46, 1479.46, 1613.51, 0, 500, 0, 0, 0, 0, 0, NULL),
(335, '28060100000335', 'GARCIA CHAVEZ DIANA ASUNCION', 'Priv Las Dalias 8-El Eden-Tehuacan', 11079.71, 7755.8, 7755.8, 10579.71, 0, 500, 0, 0, 0, 0, 0, NULL),
(336, '28060100000336', 'GARCIA CRUZ EUFEMIA', '14 Pte 807 Int A-SanRafael-Tehuacan', 1620.14, 1134.1, 1134.1, 1620.14, 0, 0, 0, 0, 0, 0, 0, NULL),
(337, '28060100000337', 'GARCIA DE LA LUZ XOCHITL', 'Alvaro Obregon 50-Centro-Coxcatlan', 3507.33, 2455.13, 2455.13, 3007.33, 0, 500, 0, 0, 0, 0, 0, NULL),
(338, '28060100000338', 'GARCIA FLORES ANTONINA TEODULA', '15 Norte 108-Obrero Peñafiel-Tehuacan', 25000, 17500, 17500, 25000, 0, 0, 0, 0, 0, 0, 0, NULL),
(339, '28060100000339', 'GARCIA GARCIA CLAUDIA', 'Miguel Hidalgo 2331-America-Tehuacan', 10753.86, 7527.7, 7527.7, 8024.18, 2229.68, 500, 0, 0, 0, 0, 0, NULL),
(340, '28060100000340', 'GARCIA GONZALEZ MARIA ALICIA SOTERA', 'Vicente Guerrero Poniente 131-Maria Cuaupan-Tehuacan', 50920.38, 35644.27, 35644.27, 50420.38, 0, 500, 0, 0, 0, 0, 0, NULL),
(341, '28060100000341', 'GARCIA HERNANDEZ MARIO', '11 Sur 511-La Purisima-Tehuacan', 157057.48, 109940.24, 109940.24, 0, 156557.48, 500, 0, 0, 0, 0, 0, NULL),
(342, '28060100000342', 'GARCIA MARTINEZ FELICITAS', '15 Sur 318-La Purisima-Tehuacan', 5500, 3850, 3850, 0, 5000, 500, 0, 0, 0, 0, 0, NULL),
(343, '28060100000343', 'GARCIA REYES ELENA', '26 Sur 2526-3 de Mayo-Tehuacan', 2367.84, 1657.49, 1657.49, 0, 1867.84, 500, 0, 0, 0, 0, 0, NULL),
(344, '28060100000344', 'GARCIA REYES ZEFERINO', '3A priv De la 26 sur 2604-3 de Mayo-Tehuacan', 7815, 5470.5, 5470.5, 0, 7315, 500, 0, 0, 0, 0, 0, NULL),
(345, '28060100000345', 'GARCIA RODRIGUEZ IGNACIO FRANCISCO', 'Oriente-Lomas de Romero-Tecamachalco', 61500, 43050, 43050, 0, 61000, 500, 0, 0, 0, 0, 0, NULL),
(346, '28060100000346', 'GARCIA SORCIA ENRIQUETA', 'Alvaro Obregon 817-Francisco Sarabia-Tehuacan', 17632.71, 12342.9, 12342.9, 0, 17132.71, 500, 0, 0, 0, 0, 0, NULL),
(347, '28060100000347', 'GIL ALVARADO MERCEDES', 'Adolfo Lopez Mateos 804-16 de Marzo-Tehuacan', 17924.63, 12547.24, 12547.24, 7424.63, 10000, 500, 0, 0, 0, 0, 0, NULL),
(348, '28060100000348', 'GOMEZ RODRIGUEZ SERGIO', '23 Sur 2314-Granjas de Oriente-Tehuacan', 50001, 35000.7, 35000.7, 0, 50001, 0, 0, 0, 0, 0, 0, NULL),
(349, '28060100000349', 'GONZALES MORALES MOISES LUIS', 'Allende Poniente 104-Maria Coapan-Tehuacan', 15500, 10850, 10850, 0, 15000, 500, 0, 0, 0, 0, 0, NULL),
(350, '28060100000350', 'GONZALEZ BAUTISTA FRANCISCO', 'Priv 2 sur 5-Nativitas Cuautempan-Coyotepec', 11462.28, 8023.6, 8023.6, 10962.28, 0, 500, 0, 0, 0, 0, 0, NULL),
(351, '28060100000351', 'GONZALEZ VAZQUEZ MARIA YOLANDA', '3 Oriente 506 Int 6-Centro-Tehuacan', 87092.13, 60964.49, 60964.49, 0, 86592.13, 500, 0, 0, 0, 0, 0, NULL),
(352, '28060100000352', 'GUZMAN MENDEZ FLOR DE MARIA', 'San Luis Potosi 4-Tlacotepec-Tlacotepec', 21606.66, 15124.66, 15124.66, 21106.66, 0, 500, 0, 0, 0, 0, 0, NULL),
(353, '28060100000353', 'HERNANDEZ ANGEL LETICIA', 'Guerrero 700-Francisco I Madero-Chapulco', 5500, 3850, 3850, 5000, 0, 500, 0, 0, 0, 0, 0, NULL),
(354, '28060100000354', 'HERNANDEZ CRUZ JUAN', 'Lerdo de Tejada 3-Tilapa-Coxcatlan', 1345000, 941500, 167930, 0, 1345000, 0, 0, 0, 0, 0, 0, NULL),
(355, '28060100000355', 'HERNANDEZ GARCI CATALINA', 'Guadalupe Victoria 1902-16 de Marzo-Tehuacan', 13902.91, 9732.04, 9732.04, 13402.91, 0, 500, 0, 0, 0, 0, 0, NULL),
(356, '28060100000356', 'HERNANDEZ MARISCAL GLORIA', '21 Poniente 1410-Esmeralda-Tehuacan', 3084.99, 2159.49, 2159.49, 2584.99, 0, 500, 0, 0, 0, 0, 0, NULL),
(357, '28060100000357', 'HERNANDEZ MARISCAL GUADALUPE', '21 Poniente 1410-Esmeralda-Tehuacan', 24673.06, 17271.14, 17271.14, 0, 24173.06, 500, 0, 0, 0, 0, 0, NULL),
(358, '28060100000358', 'HERNANDEZ MARISCAL JUAN MANUEL', '21 Poniente 1410-Esmeralda-Tehuacan', 3568.32, 2497.82, 2497.82, 632.63, 2435.69, 500, 0, 0, 0, 0, 0, NULL),
(359, '28060100000359', 'IBAÑEZ DURAN RUPERTO', 'Conocido -Catarina Otzolotepec-Tehuacan', 18200, 12740, 12740, 17700, 0, 500, 0, 0, 0, 0, 0, NULL),
(360, '28060100000360', 'INIESTRA HERRERA AMELIA', '16 Poniente 2809-San Rafael-Tehuacan', 60500, 42350, 42350, 0, 60000, 500, 0, 0, 0, 0, 0, NULL),
(361, '28060100000361', 'JIMENEZ HUERTA NORBERTA', 'Venustiano Carranza no 1316-Libertad-Tehuacan', 8335.87, 5835.11, 5835.11, 7835.87, 0, 500, 0, 0, 0, 0, 0, NULL),
(362, '28060100000362', 'JIMENEZ PEREZ MELITON', '15 de Mayo 52-San Isidro-Santiago Miahuatlan', 41554.1, 29087.87, 29087.87, 41054.1, 0, 500, 0, 0, 0, 0, 0, NULL),
(363, '28060100000363', 'JUAREZ MARTINEZ ROSA MARIA', 'Juan Ruiz Alarcon 3908-Cultural-Tehuacan', 50764.83, 35535.38, 35535.38, 50264.83, 0, 500, 0, 0, 0, 0, 0, NULL),
(364, '28060100000364', 'LEINES ANDRADE CRISTINA', 'Melchor Ocampo-Cuayucatepec-Tehuacan', 30576.26, 21403.38, 21403.38, 5840.36, 24735.9, 0, 0, 0, 0, 0, 0, NULL),
(365, '28060100000365', 'LEYNES HERNANDEZ FRANCISCA', 'Melchor Ocampo-Cuayucatepec-Tehuacan', 6922.72, 4845.9, 4845.9, 0, 6922.72, 0, 0, 0, 0, 0, 0, NULL),
(366, '28060100000366', 'LEYVA ROMERO RUTILD ANGELES', 'Av Guerrero 806 Int 7-Centro-Zinacatepec', 30500, 21350, 21350, 0, 30000, 500, 0, 0, 0, 0, 0, NULL),
(367, '28060100000367', 'LOPEZ GIL MARIO MIGUEL', 'Centenario 902-Guadalupe Hidalgo-Tehuacan', 750000, 525000, 167930, 0, 750000, 0, 0, 0, 0, 0, 0, NULL),
(368, '28060100000368', 'LOPEZ LOPEZ GENARO', 'La paz 1913-La Paz-S/D', 11043.42, 7730.39, 7730.39, 10543.42, 0, 500, 0, 0, 0, 0, 0, NULL),
(369, '28060100000369', 'LOPEZ MENDEZ GUADALUPE', '4 Poniente 1614 Int 4A-Aquiles Serdan-Tehuacan', 14846.14, 10392.3, 10392.3, 14346.14, 0, 500, 0, 0, 0, 0, 0, NULL),
(370, '28060100000370', 'LOPEZ VALERIO DOLORES AUREA TERESA', '8 Oriente 1307-Paseo de San Pedro-Tehuacan', 24458.05, 17120.64, 17120.64, 13958.05, 10000, 500, 0, 0, 0, 0, 0, NULL),
(371, '28060100000371', 'LOPEZ VALERIO SOCORRO AIDA', '4 Poniente 415-Ignacio Zaragoza-Tehuacan', 15869.57, 11108.7, 11108.7, 0, 15369.57, 500, 0, 0, 0, 0, 0, NULL),
(372, '28060100000372', 'LORENZINI JUAREZ MARIA TERESA', 'Vicente Guerrero y 33 Sur-San Sebastian-Tecamachalco', 165000, 115500, 115500, 0, 165000, 0, 0, 0, 0, 0, 0, NULL),
(373, '28060100000373', 'LOZANO TRUJILLO SABINA', 'Vicente Guerrero Poniente 131-Maria Cuaupan-Tehuacan', 8181.71, 5727.2, 5727.2, 7681.71, 0, 500, 0, 0, 0, 0, 0, NULL),
(374, '28060100000374', 'MARIA RODRIGUEZ ROSA', '2 Oriente 928-Moctezuma-Tehuacan', 10331, 7231.7, 7231.7, 0, 9831, 500, 0, 0, 0, 0, 0, NULL),
(375, '28060100000375', 'MARIN MORENO MAXIMINO', 'Ignacio Allende LT 54-Aviacion-Tehuacan', 2500, 1750, 1750, 2000, 0, 500, 0, 0, 0, 0, 0, NULL),
(376, '28060100000376', 'MARISCAL SANDOVAL ANTONIA', '21 Poniente 1410-Esmeralda-Tehuacan', 2691.68, 1884.18, 1884.18, 2191.68, 0, 500, 0, 0, 0, 0, 0, NULL),
(377, '28060100000377', 'MARTINEZ ALTA GERMAN', 'Zoquitlan s/n-Seccion I Xicala-Zoquitlan', 20500, 14350, 14350, 0, 20000, 500, 0, 0, 0, 0, 0, NULL),
(378, '28060100000378', 'MARTINEZ ANTONIO JUAN', '24 de Diciembre 26-Paraiso de Jesus-Tehuacan', 13859.27, 9701.49, 9701.49, 13359.27, 0, 500, 0, 0, 0, 0, 0, NULL),
(379, '28060100000379', 'MARTINEZ CORTEZ HERMELINDA', 'Buena Vista 2-El Progreso-Tehuacan', 40568.94, 28398.26, 28398.26, 727.58, 39841.36, 0, 0, 0, 0, 0, 0, NULL),
(380, '28060100000380', 'MARTINEZ ESPIDIO LETICIA', 'Independencia 5-Cristobal Tepeteopan-Tehuacan', 93373.25, 65361.28, 65361.28, 8873.25, 84000, 500, 0, 0, 0, 0, 0, NULL),
(381, '28060100000381', 'MARTINEZ LOPEZ UBALDA LETICIA', '13 Oriente 334-Nicolas Bravo-Tehuacan', 591578.09, 414104.66, 167930, 0, 591078.09, 500, 0, 0, 0, 0, 0, NULL),
(382, '28060100000382', 'MARTINEZ NUÑEZ ANTONIETA', 'Juan Ruiz Alarcon 3908-Cultural-Tehuacan', 10467.31, 7327.12, 7327.12, 9967.31, 0, 500, 0, 0, 0, 0, 0, NULL),
(383, '28060100000383', 'MARTINEZ RIVERA PAULINA INOCENCIA', 'Av Nacional 69-Olleras Bustamante-Tehuacan', 224000, 156800, 156800, 0, 224000, 0, 0, 0, 0, 0, 0, NULL),
(384, '28060100000384', 'MENDEZ CATALINA', 'Insurgentes 3406-La Soledad-Tehuacan', 5000, 3500, 3500, 0, 5000, 0, 0, 0, 0, 0, 0, NULL),
(385, '28060100000385', 'MENDOZA CRUZ ELIZABETH', 'Miguel Hidalgo-Guadalupe-Zapotitlan', 100090.64, 70063.45, 70063.45, 3450.16, 96140.48, 500, 0, 0, 0, 0, 0, NULL),
(386, '28060100000386', 'MERINO MERINO SUSANA', '19 sur 709-La Purisima-Tehuacan', 18500, 12950, 12950, 18000, 0, 500, 0, 0, 0, 0, 0, NULL),
(387, '28060100000387', 'MEXICANO ORTIZ ESPERANZA', 'Republica de Nicaragua 803-America-Tehuacan', 17966.71, 12576.7, 12576.7, 275.78, 17190.93, 500, 0, 0, 0, 0, 0, NULL),
(388, '28060100000388', 'MIRAMON OLMOS MARTHA', 'Morelos sn-San Jose Miahuatlan-San Jose Miahuatlan', 12396.07, 8677.25, 8677.25, 0, 12396.07, 0, 0, 0, 0, 0, 0, NULL),
(389, '28060100000389', 'MIRAMON SEBASTIAN JUAN', 'Heroes de Chapultepec 18-Centro-San Jose Miahuatlan', 2997.71, 2098.4, 2098.4, 0, 2997.71, 0, 0, 0, 0, 0, 0, NULL),
(390, '28060100000390', 'MONTALVO ROQUE CIRILA', '11 Oriente 1117-La Purisima-Tehuacan', 193320.55, 135324.39, 135324.39, 0, 192820.55, 500, 0, 0, 0, 0, 0, NULL),
(391, '28060100000391', 'MONTAÑO HUERTA SILDIA HAYDEE', 'Fresno 2316 A-Rancho Grande-Tehuacan', 4007.39, 2805.17, 2805.17, 3507.39, 0, 500, 0, 0, 0, 0, 0, NULL),
(392, '28060100000392', 'MORALES VAZQUEZ FRANCISCO', 'San Agustin 106-7-Maria Coapan-Tehuacan', 15050, 10535, 10535, 14550, 0, 500, 0, 0, 0, 0, 0, NULL),
(393, '28060100000393', 'MORAN CORTES CECILIA MICAELA', '25 Norte 203-El Rosario-Tehuacan', 40501.6, 28351.12, 28351.12, 0, 40501.6, 0, 0, 0, 0, 0, 0, NULL),
(394, '28060100000394', 'MORENO MORALES ABRAHAM', 'Granada LT 124-Los Olivos-Tehuacan', 250000, 175000, 167930, 0, 250000, 0, 0, 0, 0, 0, 0, NULL),
(395, '28060100000395', 'MORENO MORALES JOSUE', '2 Sur 128-Centro-Tehuacan', 885166.89, 619616.82, 167930, 135166.89, 750000, 0, 0, 0, 0, 0, 0, NULL),
(396, '28060100000396', 'MOSQUEDA MARTINEZ MARIA ISABEL', '2da Privada de Ahuehuetes 49-Ahuehuetes-Gustavo AMadero', 27500, 19250, 19250, 0, 27500, 0, 0, 0, 0, 0, 0, NULL),
(397, '28060100000397', 'OLMOS CAMPOS ANDREA', 'Heroes de Chapultepec 18-Centro-San Jose Miahuatlan', 9000, 6300, 6300, 0, 9000, 0, 0, 0, 0, 0, 0, NULL),
(398, '28060100000398', 'OROZCO GARCIA JOSE', 'Privada de Chalma 4-12-San Diego Chalma-Tehuacan', 6908.36, 4835.85, 4835.85, 1408.36, 5000, 500, 0, 0, 0, 0, 0, NULL),
(399, '28060100000399', 'ORTIZ MENDEZ ALVARO', '31 norte -San Sebastian-Tecamachalco', 101196.72, 70837.7, 70837.7, 101196.72, 0, 0, 0, 0, 0, 0, 0, NULL),
(400, '28060100000400', 'OSORIO REYES AMALIA', 'Av Libertad 11-Bartolo Teontepec-Tepanco de Lopez', 16058.84, 11241.19, 11241.19, 0, 15558.84, 500, 0, 0, 0, 0, 0, NULL),
(401, '28060100000401', 'PACHECO RODRIGUEZ TOMAS', 'Sedesol lt 7-Dr Miguel Romero-Teotihuacan', 2311.64, 1618.15, 1618.15, 61.14, 1750.5, 500, 0, 0, 0, 0, 0, NULL),
(402, '28060100000402', 'PAQUE PEREZ ALFREDO', '23 Sur 152-La Concepcion-Tehuacan', 21269.23, 14888.46, 14888.46, 21269.23, 0, 0, 0, 0, 0, 0, 0, NULL),
(403, '28060100000403', 'PEREDA HERNANDEZ BONIFACIO', 'Guadalupe Victoria 1902-16 de Marzo-Tehuacan', 500, 350, 350, 0, 0, 500, 0, 0, 0, 0, 0, NULL),
(404, '28060100000404', 'PEREZ BAUTISTA ERNESTINA', 'Adolfo Lopez Mateos 7-Antonio Texcala-Zapotitlan', 21500, 15050, 15050, 0, 21000, 500, 0, 0, 0, 0, 0, NULL),
(405, '28060100000405', 'PEREZ JIMENEZ MARGARITO BALENTIN', '4 Poniente 68-Santa Mariala Alta-Tlacotepec', 17582.06, 12307.44, 12307.44, 17082.06, 0, 500, 0, 0, 0, 0, 0, NULL),
(406, '28060100000406', 'PIEDRA GONZALEZ NORMA', 'Allende Oriente 126-Maria Coapan-Tehuacan', 8500, 5950, 5950, 0, 8000, 500, 0, 0, 0, 0, 0, NULL),
(407, '28060100000407', 'PORRAS CHAVEZ SERVANDO PEDRO LAZARO', 'Carmen Serdan 106-Centro-Tehuacan', 1247244.92, 873071.44, 167930, 46744.92, 1200000, 500, 0, 0, 0, 0, 0, NULL),
(408, '28060100000408', 'QUIÑONES HERNANDEZ EFREN', 'San Bernardino Lagunas-Bernardino Lagunas-Vicente Guerrero', 25.19, 17.63, 17.63, 25.19, 0, 0, 0, 0, 0, 0, 0, NULL),
(409, '28060100000409', 'RAMIREZ SANCHEZ MARCELA', '6 Poniente 602 A-Constituyentes-Tehuacan', 8545.58, 5981.91, 5981.91, 7545.58, 0, 1000, 0, 0, 0, 0, 0, NULL),
(410, '28060100000410', 'REYES JIMENEZ MARICELA', '17 poniente 2007-El Riego-Tehuacan', 2519.45, 1763.62, 1763.62, 2019.45, 0, 500, 0, 0, 0, 0, 0, NULL),
(411, '28060100000411', 'REYES MERINO EDITH', '5 de Mayo-Jose Buena Vista-Ajalpan', 20612.9, 14429.03, 14429.03, 5112.9, 15000, 500, 0, 0, 0, 0, 0, NULL),
(412, '28060100000412', 'RIOS DIAZ PASCUALA', 'Benito Juarez 405-Lorenzo Teotipilco-Tehuacan', 11072.31, 7750.62, 7750.62, 11072.31, 0, 0, 0, 0, 0, 0, 0, NULL),
(413, '28060100000413', 'ROJAS CHAVEZ PRAXEDES', 'Guadalupe Victoria 1425-El Riego-Tehuacan', 10500, 7350, 7350, 0, 10000, 500, 0, 0, 0, 0, 0, NULL),
(414, '28060100000414', 'ROSALES ROJAS IGNACIA', '17 Oriente 1123 B-Los Pinos-Zoquitlan', 26730.67, 18711.47, 18711.47, 26230.67, 0, 500, 0, 0, 0, 0, 0, NULL),
(415, '28060100000415', 'SALVADOR FLORES SERAPIO', 'Av Nacional-El Molino-Chapulco', 8500, 5950, 5950, 0, 8000, 500, 0, 0, 0, 0, 0, NULL),
(416, '28060100000416', 'SANCHEZ ADAME GREGORIO', 'Juan Diego Lote 41-Paraiso de Jesus-Tehuacan', 8500, 5950, 5950, 0, 8000, 500, 0, 0, 0, 0, 0, NULL),
(417, '28060100000417', 'SANCHEZ ELEJO LAURANEO', 'Conocido-Tlaxitla-Ajalpan', 174000, 121800, 121800, 0, 174000, 0, 0, 0, 0, 0, 0, NULL),
(418, '28060100000418', 'SANCHEZ GARCIA ARMANDO', '12 Sur 2128-16 de Marzo-Tehuacan', 5899.87, 4129.91, 4129.91, 5399.87, 0, 500, 0, 0, 0, 0, 0, NULL),
(419, '28060100000419', 'SORIANO FIGUEROA SILVINO LEONCIO', '21 Oriente 919-Nias Bravo-Tehuacan', 21800, 15260, 15260, 21300, 0, 500, 0, 0, 0, 0, 0, NULL),
(420, '28060100000420', 'TEHUACANERO JIMENEZ JOSEFINA MARTHA', 'Boulevard Ing Pastor Rouaix 713-Hidalgo-Tehuacan', 10625.47, 7437.83, 7437.83, 10125.47, 0, 500, 0, 0, 0, 0, 0, NULL),
(421, '28060100000421', 'TEHUINTLE CALIHUA EUSEBIO', 'Coxcatepachapa-Coxcatepachapa-Vicente Guerrero', 27990.84, 19593.59, 19593.59, 11590.84, 15900, 500, 0, 0, 0, 0, 0, NULL),
(422, '28060100000422', 'TENORIO HERNANDEZ MARTHA AMELIA', 'Alamo 716-Morelos-Tehuacan', 60178.99, 42125.29, 42125.29, 5678.99, 54000, 500, 0, 0, 0, 0, 0, NULL),
(423, '28060100000423', 'TOMAS VENTURA DOLORES GUADALUPE', 'Alvarez 700-Centro-Zinacatepec', 13272.27, 9290.59, 9290.59, 12772.27, 0, 500, 0, 0, 0, 0, 0, NULL),
(424, '28060100000424', 'VAZQUEZ MARTINEZ FRANCISCO JAVIER', '26 Oriente 300-Lomas de la Soledad-Tehuacan', 5271.91, 3690.34, 3690.34, 4771.91, 0, 500, 0, 0, 0, 0, 0, NULL),
(425, '28060100000425', 'VEGA HERNANDEZ RUFINO', 'Jose Maria Morelos 5408-San Angel-Tehuacan', 4698.6, 3289.02, 3289.02, 4198.6, 0, 500, 0, 0, 0, 0, 0, NULL),
(426, '28060100000426', 'VELEZ GONZALEZ ISABEL PATRICIA', 'Sedesol 16-Mig Romero Sanchez-Tehuacan', 93934.17, 65753.92, 65753.92, 13434.17, 80000, 500, 0, 0, 0, 0, 0, NULL),
(427, '28060100000427', 'VIVEROS JUAREZ CLETO JOEL', 'Colombia 308 A-El Riego-Tehuacan', 21887.03, 15320.92, 15320.92, 1000, 20387.03, 500, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorChequesNoCobrados`
--

CREATE TABLE `ahorradorChequesNoCobrados` (
  `idahorradorChequesNoCobrados` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorCuentasAhorro`
--

CREATE TABLE `ahorradorCuentasAhorro` (
  `idahorradorCuentasAhorro` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ahorradorCuentasAhorro`
--

INSERT INTO `ahorradorCuentasAhorro` (`idahorradorCuentasAhorro`, `tipoDocumento`, `folio`, `importe`, `ahorrador_idahorrador`) VALUES
(1, 'Certificado de ahorro', 'S/F', 146000, 1),
(2, 'Certificado de ahorro', 'S/F', 100, 3),
(3, 'Certificado de ahorro', '45517', 8639.38, 5),
(4, 'Ficha de depósito', 'S/F', 152627.67, 6),
(5, 'Certificado de ahorro', '46815', 93203.01, 7),
(6, 'Certificado de ahorro', '46382', 7939.11, 8),
(7, 'Recibo de depósito', '415', 400001, 9),
(8, 'Ficha universal', '546352', 10863.43, 10),
(9, 'Depósito a plazo fijo', '43758', 50599, 11),
(10, 'Recibo de depósito', 'S/F', 40000, 12),
(11, 'Certificado de ahorro', '45471', 18927.71, 14),
(12, 'Certificado de ahorro', '7325', 16705, 16),
(13, 'Certificado de ahorro', '47126', 60405.29, 17),
(14, 'Certificado de ahorro', '46045', 61984.31, 18),
(15, 'Certificado de ahorro', '46412', 23753.51, 19),
(16, 'Certificado de ahorro', '46414', 5674.49, 19),
(17, 'Certificado de ahorro', '46414', 3813.5, 20),
(18, 'Ficha de depósito', 'S/F', 12551.93, 21),
(19, 'Certificado de ahorro', 'S/F', 100, 22),
(20, 'Certificado de ahorro', 'S/F', 46321.96, 23),
(21, 'Certificado de ahorro', '46371', 47333.93, 24),
(22, 'Certificado de ahorro', '46123', 154762.67, 26),
(23, 'Certificado de ahorro', '47308', 7482, 27),
(24, 'Depósito a plazo fijo', '42471', 29500, 28),
(25, 'Certificado de ahorro', 'S/F', 16096.61, 29),
(26, 'Certificado de ahorro', '46824', 213619.84, 30),
(27, 'Certificado de ahorro', '44092', 16781.21, 31),
(28, 'Certificado de ahorro', '547715', 85088.71, 33),
(29, 'Certificado de ahorro', '47307', 20466, 34),
(30, 'Ficha de depósito', 'S/F', 11704.59, 35),
(31, 'Certificado de ahorro', '45290', 19376.85, 36),
(32, 'Ficha de depósito', 'S/F', 144030.9, 37),
(33, 'Certificado de ahorro', '43819', 5703, 38),
(34, 'Ficha de depósito', '195227', 100, 39),
(35, 'Ficha de depósito', 'S/F', 74815, 40),
(36, 'Ficha de depósito', 'S/F', 142597, 41),
(37, 'Certificado de ahorro', '47422', 52698, 42),
(38, 'Certificado de ahorro', '46176', 10243.63, 43),
(39, 'Certificado de ahorro', 'S/F', 53743.62, 44),
(40, 'Certificado de ahorro', 'S/F', 100, 45),
(41, 'Certificado de ahorro', '544864', 11600.77, 45),
(42, 'Certificado de ahorro', 'S/F', 23408.15, 48),
(43, 'Certificado de ahorro', 'S/F', 23081.29, 49),
(44, 'S/D', 'S/F', 20000, 50),
(45, 'Certificado de ahorro', 'S/F', 100, 51),
(46, 'Ficha de depósito', 'S/F', 3000, 51),
(47, 'Ficha de depósito', 'S/F', 2000, 51),
(48, 'Certificado de ahorro', '46809', 18967.9, 52),
(49, 'Certificado de ahorro', '47426', 150006, 53),
(50, 'Certificado de ahorro', 'S/F', 3191.77, 57),
(51, 'Ficha de depósito', 'S/F', 63192.05, 58),
(52, 'Ficha de depósito', 'S/F', 24494.18, 59),
(53, 'Certificado de ahorro', '1029', 1635.02, 60),
(54, 'Certificado de ahorro', '46888', 1456.94, 61),
(55, 'Certificado de ahorro', '547713', 7476.43, 62),
(56, 'S/D', 'S/F', 100, 63),
(57, 'Certificado de ahorro', '47163', 231326.3, 64),
(58, 'Certificado de ahorro', '47425', 164751, 66),
(59, 'Certificado de ahorro', '66947', 24236.38, 68),
(60, 'Certificado de ahorro', '64247', 100, 68),
(61, 'Recibo de depósito', '417', 54980, 69),
(62, 'Certificado de ahorro', 'S/F', 69213.58, 70),
(63, 'Certificado de ahorro', '47303', 292201.14, 71),
(64, 'Certificado de ahorro', 'S/F', 47042.94, 72),
(65, 'Ficha universal', '545840', 2872.53, 73),
(66, 'Certificado de ahorro', '46345', 8825.21, 74),
(67, 'Certificado de ahorro', 'S/F', 28577.56, 75),
(68, 'Ficha de depósito', 'S/F', 288524.83, 76),
(69, 'Ficha de depósito', 'S/F', 322648.46, 77),
(70, 'Ficha de depósito', 'S/F', 51337.4, 78),
(71, 'Certificado de ahorro', 'S/F', 1330.1, 79),
(72, 'Certificado de ahorro', 'S/F', 258064.3, 80),
(73, 'Certificado de ahorro', '47388', 148175, 81),
(74, 'Ficha de depósito', 'S/F', 150704.28, 83),
(75, 'Ficha de depósito', 'S/F', 29858, 84),
(76, 'Certificado de ahorro', '545633', 17806.61, 86),
(77, 'Ficha de depósito', 'S/F', 78368.63, 87),
(78, 'Ficha de depósito', 'S/F', 32391.38, 88),
(79, 'S/D', 'S/F', 13651.77, 89),
(80, 'Certificado de ahorro', 'S/F', 141704, 90),
(81, 'Certificado de ahorro', 'S/F', 26405.31, 91),
(82, 'Ficha de depósito', 'S/F', 51769.04, 92),
(83, 'Certificado de ahorro', '46264', 40000, 93),
(84, 'Certificado de ahorro', 'S/F', 100, 94),
(85, 'Certificado de ahorro', 'S/F', 150, 94),
(86, 'Ficha de depósito', 'S/F', 17067.96, 95),
(87, 'Certificado de ahorro', 'S/F', 94600, 96),
(88, 'Ficha de depósito', 'S/F', 84703.57, 97),
(89, 'Certificado de ahorro', 'S/F', 4245.52, 98),
(90, 'Certificado de ahorro', '45929', 8855.56, 99),
(91, 'Certificado de ahorro', '64904', 200, 100),
(92, 'Certificado de ahorro', '516087', 24700, 102),
(93, 'Ficha de depósito', '188216', 100, 103),
(94, 'Ficha de depósito', 'S/F', 300914.66, 106),
(95, 'Ficha de depósito', 'S/F', 5868.3, 107),
(96, 'Certificado de ahorro', 'S/F', 5068.62, 108),
(97, 'Certificado de ahorro', '43597', 11768, 109),
(98, 'Ficha de depósito', 'S/F', 69385.85, 111),
(99, 'Certificado de ahorro', '39418', 1928.21, 113),
(100, 'Certificado de ahorro', '2605', 5625, 116),
(101, 'Ficha de depósito', 'W5-171', 50000, 120),
(102, 'Certificado de ahorro', 'S/F', 630.96, 135),
(103, 'Certificado de ahorro', 'S/F', 201.91, 135),
(104, 'Ficha de depósito', 'S/F', 36595.02, 140),
(105, 'Ficha de depósito', 'W514244', 4000, 161),
(106, 'Ficha de depósito', 'U142576', 41508.73, 167),
(107, 'Ficha de depósito', '701646', 8633.67, 168),
(108, 'Certificado de ahorro', 'S/F', 224843.19, 170),
(109, 'Certificado de ahorro', 'S/F', 7000, 172),
(110, 'Certificado de ahorro', 'S/F', 15424.16, 175),
(111, 'Ficha de depósito', 'F11130', 3030.38, 178),
(112, 'Certificado de ahorro', 'S/F', 36370, 195),
(113, 'Ficha de depósito', 'S/F', 6020.32, 204),
(114, 'Ficha de depósito', 'W515774', 5457.46, 210),
(115, 'Certificado de ahorro', 'S/F', 2683.06, 213),
(116, 'Ficha de depósito', 'S/F', 238300.12, 230),
(117, 'S/D', 'S/F', 20000, 231),
(118, 'Certificado de ahorro', 'S/F', 3006.44, 238),
(119, 'Certificado de ahorro', 'S/F', 689335.31, 250),
(120, 'Certificado de ahorro', 'S/F', 30000, 261),
(121, 'Certificado de ahorro', 'S/F', 61310.56, 263),
(122, 'Certificado de ahorro', 'S/F', 5141.7, 265),
(123, 'Ficha de depósito', 'W515535', 12006.58, 267),
(124, 'Ficha de depósito', '90-1865', 15003.28, 278),
(125, 'Certificado de ahorro', 'S/F', 350188.4, 287),
(126, 'Ficha de depósito', 'S/F', 15000, 293),
(127, 'Certificado de ahorro', 'S/F', 1939.79, 294),
(128, 'Recibo de depósito', '5913', 10383.63, 299),
(129, 'Recibo de depósito', '11517', 11464.94, 304),
(130, 'Recibo de depósito', '115123', 10737.08, 305),
(131, 'Certificado de ahorro', '004017', 52000, 306),
(132, 'Certificado de ahorro', '11516', 2879.15, 307),
(133, 'Recibo de depósito', '11514', 218.43, 311),
(134, 'Recibo de depósito', '115-1-15', 3794.79, 312),
(135, 'Certificado de ahorro', 'S/F', 2134, 313),
(136, 'Recibo de depósito', '115-1-8', 12249.93, 314),
(137, 'Recibo de depósito', '11519', 24777.18, 315),
(138, 'Certificado de ahorro', 'S/F', 966.51, 318),
(139, 'Recibo de depósito', '11518', 2268.41, 319),
(140, 'Recibo de depósito', '115-1-10', 6497.61, 320),
(141, 'Recibo de depósito', '115-1-18', 6030.52, 321),
(142, 'Recibo de depósito', '115-1-4', 5494.6, 322),
(143, 'Recibo de depósito', '5872', 23280.54, 325),
(144, 'Recibo de depósito', '115119', 8980.8, 326),
(145, 'Certificado de ahorro', 'S/F', 9096.22, 331),
(146, 'Certificado de ahorro', '115137', 34467.4, 332),
(147, 'Recibo de depósito', '115-1-19', 500, 333),
(148, 'Recibo de depósito', '115125', 1613.51, 334),
(149, 'Recibo de depósito', '64552', 10579.71, 335),
(150, 'Certificado de ahorro', 'S/F', 1620.14, 336),
(151, 'Recibo de depósito', '115126', 3007.33, 337),
(152, 'Recibo de depósito', '115121', 25000, 338),
(153, 'Certificado de ahorro', 'S/F', 8024.18, 339),
(154, 'Recibo de depósito', '115113', 40950, 340),
(155, 'Recibo de depósito', '115114', 9470.38, 340),
(156, 'Certificado de ahorro', 'S/F', 7424.63, 347),
(157, 'Certificado de ahorro', 'S/F', 10962.28, 350),
(158, 'Recibo de depósito', '115-1-30', 21106.66, 352),
(159, 'Recibo de depósito', '115-1-17', 5000, 353),
(160, 'Recibo de depósito', '115117', 13402.91, 355),
(161, 'Certificado de ahorro', 'S/F', 2584.99, 356),
(162, 'Certificado de ahorro', 'S/F', 632.63, 358),
(163, 'Recibo de depósito', '115-1-8', 7700, 359),
(164, 'Recibo de depósito', '115-1-8', 10000, 359),
(165, 'Certificado de ahorro', 'S/F', 7835.87, 361),
(166, 'Recibo de depósito', '115114', 41054.1, 362),
(167, 'Recibo de depósito', '115111', 50264.83, 363),
(168, 'Certificado de ahorro', 'S/F', 5840.36, 364),
(169, 'Certificado de ahorro', 'S/F', 10543.42, 368),
(170, 'Certificado de ahorro', '115117', 14346.14, 369),
(171, 'Certificado de ahorro', 'S/F', 10754.34, 370),
(172, 'Certificado de ahorro', 'S/F', 3203.71, 370),
(173, 'Recibo de depósito', '115111', 7681.71, 373),
(174, 'Recibo de depósito', '115-1-13', 2000, 375),
(175, 'Certificado de ahorro', 'S/F', 2191.68, 376),
(176, 'Certificado de ahorro', 'S/F', 13359.27, 378),
(177, 'Recibo de depósito', '116-1-11', 727.58, 379),
(178, 'Certificado de ahorro', 'S/F', 8873.25, 380),
(179, 'Certificado de ahorro', 'S/F', 9967.31, 382),
(180, 'Certificado de ahorro', 'S/F', 3450.16, 385),
(181, 'Certificado de ahorro', '061203', 18000, 386),
(182, 'Certificado de ahorro', 'S/F', 275.78, 387),
(183, 'Certificado de ahorro', 'S/F', 1849.64, 391),
(184, 'Recibo de depósito', '115123', 1657.75, 391),
(185, 'Recibo de depósito', '11512', 14550, 392),
(186, 'Recibo de depósito', '115-1-33', 135166.89, 395),
(187, 'Certificado de ahorro', 'S/F', 1408.36, 398),
(188, 'Certificado de ahorro', '5837', 101196.72, 399),
(189, 'Recibo de depósito', 'S/F', 61.14, 401),
(190, 'Certificado de ahorro', 'S/F', 21269.23, 402),
(191, 'Recibo de depósito', '11517', 17082.06, 405),
(192, 'Recibo de depósito', '11515', 46744.92, 407),
(193, 'Certificado de ahorro', 'S/F', 25.19, 408),
(194, 'Certificado de ahorro', 'S/F', 1221.2, 409),
(195, 'Certificado de ahorro', 'S/F', 6324.38, 409),
(196, 'Certificado de ahorro', 'S/F', 2019.45, 410),
(197, 'Certificado de ahorro', 'S/F', 5112.9, 411),
(198, 'Recibo de depósito', '115112', 2331.01, 412),
(199, 'Recibo de depósito', '115110', 8741.3, 412),
(200, 'Certificado de ahorro', 'S/F', 26230.67, 414),
(201, 'Certificado de ahorro', 'S/F', 5399.87, 418),
(202, 'Recibo de depósito', '115-1-12', 300, 419),
(203, 'Recibo de depósito', '115-1-13', 2000, 419),
(204, 'Recibo de depósito', '115-1-15', 5000, 419),
(205, 'Recibo de depósito', '115-1-30', 4000, 419),
(206, 'Ficha de depósito', 'S/F', 5000, 419),
(207, 'Recibo de depósito', '115-1-17', 5000, 419),
(208, 'Certificado de ahorro', '64302', 10125.47, 420),
(209, 'Certificado de ahorro', 'S/F', 11590.84, 421),
(210, 'Recibo de depósito', '115-1-16', 5678.99, 422),
(211, 'Certificado de ahorro', 'S/F', 2264.27, 423),
(212, 'Certificado de ahorro', 'S/F', 10508, 423),
(213, 'Recibo de depósito', '115129', 4771.91, 424),
(214, 'Certificado de ahorro', 'S/F', 4198.6, 425),
(215, 'Certificado de ahorro', 'S/F', 13434.17, 426),
(216, 'Certificado de ahorro', 'S/F', 1000, 427);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorCuentasInversion`
--

CREATE TABLE `ahorradorCuentasInversion` (
  `idahorradorCuentasInversion` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ahorradorCuentasInversion`
--

INSERT INTO `ahorradorCuentasInversion` (`idahorradorCuentasInversion`, `tipoDocumento`, `folio`, `importe`, `ahorrador_idahorrador`) VALUES
(1, 'Depósito a plazo fijo', '11', 19600, 2),
(2, 'Depósito a plazo fijo', '9', 10001, 3),
(3, 'Depósito a plazo fijo', '44667', 53000, 4),
(4, 'Ficha de depósito', 'S/F', 1545.89, 12),
(5, 'Depósito a plazo fijo', '44206', 260000, 13),
(6, 'Depósito a plazo fijo', '42543', 600000, 13),
(7, 'Depósito a plazo fijo', '46424', 221558.42, 15),
(8, 'Depósito a plazo fijo', '14', 49600, 22),
(9, 'Depósito a plazo fijo', '44307', 73365, 25),
(10, 'S/D', 'S/F', 277.96, 29),
(11, 'Depósito a plazo fijo', '16', 195000, 39),
(12, 'Depósito a plazo fijo', '545708', 9726.56, 46),
(13, 'Depósito a plazo fijo', '42467', 39089.6, 47),
(14, 'Depósito a plazo fijo', '42361', 20096.73, 54),
(15, 'Depósito a plazo fijo', 'S/F', 290000, 55),
(16, 'Depósito a plazo fijo', '46567', 289000, 56),
(17, 'Depósito a plazo fijo', '545462', 24906.66, 60),
(18, 'Depósito a plazo fijo', '10', 10001, 63),
(19, 'Depósito a plazo fijo', '47336', 19292.91, 65),
(20, 'Ficha de depósito', '0136000363', 50000, 67),
(21, 'Depósito a plazo fijo', '505', 40000, 72),
(22, 'Depósito a plazo fijo', '506', 40000, 72),
(23, 'Depósito a plazo fijo', '507', 20000, 72),
(24, 'Depósito a plazo fijo', '510', 10000, 72),
(25, 'Depósito a plazo fijo', '46479', 916782.21, 81),
(26, 'Depósito a plazo fijo', '46740', 290000, 82),
(27, 'Ficha de depósito', '164-188', 100000, 85),
(28, 'Depósito a plazo fijo', 'S/F', 6818.5, 94),
(29, 'Depósito a plazo fijo', 'S/F', 2000, 94),
(30, 'Depósito a plazo fijo', 'S/F', 11000, 94),
(31, 'Depósito a plazo fijo', '47159', 405300, 98),
(32, 'Depósito a plazo fijo', '65497', 20000, 100),
(33, 'Depósito a plazo fijo', '18', 100001, 101),
(34, 'Ficha de depósito', '189-217', 19600, 103),
(35, 'Ficha de depósito', '184-212', 10284.48, 104),
(36, 'Depósito a plazo fijo', '45315', 430000, 105),
(37, 'Depósito a plazo fijo', '46827', 200000, 110),
(38, 'Depósito a plazo fijo', '40571', 49640.14, 112),
(39, 'Ficha de depósito', 'S/F', 12000, 114),
(40, 'Depósito a plazo fijo', '2566', 2884000, 115),
(41, 'Depósito a plazo fijo', '2181', 1452000, 115),
(42, 'Depósito a plazo fijo', '2605', 50000, 116),
(43, 'Depósito a plazo fijo', '2632', 50712.5, 117),
(44, 'Depósito a plazo fijo', '73820', 17800, 118),
(45, 'Depósito a plazo fijo', '73817', 12000, 118),
(46, 'Depósito a plazo fijo', '120', 103700, 119),
(47, 'Depósito a plazo fijo', '113', 48000, 119),
(48, 'Depósito a plazo fijo', '2779', 8414.57, 121),
(49, 'Depósito a plazo fijo', '2374', 468000, 122),
(50, 'Depósito a plazo fijo', '2374', 34697.26, 122),
(51, 'Depósito a plazo fijo', '2657', 40000, 122),
(52, 'Depósito a plazo fijo', '2674', 13100, 122),
(53, 'Depósito a plazo fijo', '1323', 500500, 123),
(54, 'Depósito a plazo fijo', '1823', 80340, 125),
(55, 'Depósito a plazo fijo', '4619', 18380.85, 126),
(56, 'Depósito a plazo fijo', '4633B', 78584.92, 127),
(57, 'Depósito a plazo fijo', '158', 31000, 128),
(58, 'Depósito a plazo fijo', '6285', 160000, 129),
(59, 'Depósito a plazo fijo', '2491', 193256.44, 130),
(60, 'Ficha de depósito', 'S/F', 10000, 131),
(61, 'Depósito a plazo fijo', '2727', 100000, 132),
(62, 'Depósito a plazo fijo', '8970', 576500, 133),
(63, 'Depósito a plazo fijo', '8965', 343000, 133),
(64, 'Depósito a plazo fijo', '715', 97000, 134),
(65, 'Depósito a plazo fijo', '73877', 39919.23, 136),
(66, 'Depósito a plazo fijo', '73220', 20248.38, 137),
(67, 'Depósito a plazo fijo', '159', 8500, 138),
(68, 'Depósito a plazo fijo', '60116', 10000, 139),
(69, 'Depósito a plazo fijo', '74027', 50333.33, 141),
(70, 'Depósito a plazo fijo', '8993', 177500, 142),
(71, 'Depósito a plazo fijo', '72805', 10363.1, 142),
(72, 'Depósito a plazo fijo', '69828', 36228.61, 143),
(73, 'Depósito a plazo fijo', '2419', 1300000, 144),
(74, 'Depósito a plazo fijo', '167', 2900000, 145),
(75, 'Depósito a plazo fijo', '2405', 11566.16, 147),
(76, 'Depósito a plazo fijo', '2499', 93000, 148),
(77, 'Depósito a plazo fijo', '2673', 12018.16, 149),
(78, 'Depósito a plazo fijo', '2730', 70000, 150),
(79, 'Depósito a plazo fijo', '72537', 8000, 151),
(80, 'Depósito a plazo fijo', '6267', 50000, 152),
(81, 'Depósito a plazo fijo', '71832', 13200, 153),
(82, 'Depósito a plazo fijo', '2451', 7500, 153),
(83, 'Depósito a plazo fijo', '2421', 100000, 154),
(84, 'Depósito a plazo fijo', '70451', 20000, 155),
(85, 'Depósito a plazo fijo', '74061', 12000, 156),
(86, 'Depósito a plazo fijo', '2648', 150000, 157),
(87, 'Depósito a plazo fijo', '75044', 131400.66, 158),
(88, 'Depósito a plazo fijo', '83', 20000, 159),
(89, 'Depósito a plazo fijo', '4630B', 300000, 160),
(90, 'Depósito a plazo fijo', '2590', 95000, 161),
(91, 'Depósito a plazo fijo', '74043', 109765.77, 162),
(92, 'Depósito a plazo fijo', '1693', 117500, 163),
(93, 'Depósito a plazo fijo', '1636', 100000, 164),
(94, 'Depósito a plazo fijo', '1554', 50000, 165),
(95, 'Depósito a plazo fijo', '1713', 100000, 166),
(96, 'Depósito a plazo fijo', '1415', 175800, 169),
(97, 'Depósito a plazo fijo', '1107', 1400000, 170),
(98, 'Depósito a plazo fijo', '1525', 200000, 170),
(99, 'Depósito a plazo fijo', '2626', 16000, 172),
(100, 'Depósito a plazo fijo', '2377', 19000, 173),
(101, 'Depósito a plazo fijo', '6274', 90000, 174),
(102, 'Depósito a plazo fijo', '2330', 10892.55, 176),
(103, 'Depósito a plazo fijo', '16518', 36633.15, 177),
(104, 'Depósito a plazo fijo', '74076', 10000, 179),
(105, 'Depósito a plazo fijo', '73890', 15486.28, 180),
(106, 'Depósito a plazo fijo', '73809', 10000, 181),
(107, 'Depósito a plazo fijo', '73816', 15000, 181),
(108, 'Depósito a plazo fijo', '124', 3000, 182),
(109, 'Depósito a plazo fijo', '84', 25305.35, 183),
(110, 'Depósito a plazo fijo', '85', 97770.78, 183),
(111, 'Depósito a plazo fijo', '1703', 51900, 184),
(112, 'Depósito a plazo fijo', '1674', 20869.24, 185),
(113, 'Depósito a plazo fijo', '32681', 8500, 186),
(114, 'Depósito a plazo fijo', '1544', 500000, 187),
(115, 'Depósito a plazo fijo', '74049', 30000, 188),
(116, 'Depósito a plazo fijo', '74092', 36817.38, 188),
(117, 'Depósito a plazo fijo', '2736', 50000, 189),
(118, 'Depósito a plazo fijo', '1542', 26780, 190),
(119, 'Depósito a plazo fijo', '1602', 61300, 191),
(120, 'Depósito a plazo fijo', '1541', 29300, 191),
(121, 'Depósito a plazo fijo', '1551', 18173.99, 192),
(122, 'Depósito a plazo fijo', '43748', 4476.52, 193),
(123, 'Depósito a plazo fijo', '10139', 100000, 194),
(124, 'Depósito a plazo fijo', 'S/F', 158555.13, 198),
(125, 'Depósito a plazo fijo', '73815', 33100, 199),
(126, 'Depósito a plazo fijo', '2670', 216500, 200),
(127, 'Depósito a plazo fijo', 'S/F', 20300, 201),
(128, 'Depósito a plazo fijo', 'S/F', 249547.79, 203),
(129, 'Depósito a plazo fijo', '151', 100000, 205),
(130, 'Depósito a plazo fijo', 'S/F', 149587.93, 206),
(131, 'Depósito a plazo fijo', '2705', 150000, 207),
(132, 'Depósito a plazo fijo', '8978', 600000, 208),
(133, 'Ficha de depósito', '901481', 52000, 208),
(134, 'Ficha de depósito', 'W6-15548', 56083.32, 211),
(135, 'Depósito a plazo fijo', '53473', 8407.17, 213),
(136, 'Ficha de depósito', 'W5-15646', 100000, 214),
(137, 'Depósito a plazo fijo', '1681', 193886.26, 215),
(138, 'Depósito a plazo fijo', '1649', 350000, 216),
(139, 'Depósito a plazo fijo', '2464', 14500, 217),
(140, 'Ficha de depósito', 'S/F', 12000, 218),
(141, 'Depósito a plazo fijo', '1732', 1500000, 220),
(142, 'Depósito a plazo fijo', '62404', 11007, 221),
(143, 'Depósito a plazo fijo', '1695', 1000000, 222),
(144, 'Ficha de depósito', 'W56258', 9500, 223),
(145, 'Depósito a plazo fijo', '8997', 900000, 224),
(146, 'Depósito a plazo fijo', '2250', 325500, 227),
(147, 'Depósito a plazo fijo', '73819', 36600, 228),
(148, 'Depósito a plazo fijo', '2728', 20000, 229),
(149, 'Depósito a plazo fijo', '2761', 159117.63, 231),
(150, 'Depósito a plazo fijo', '154', 112900, 232),
(151, 'Depósito a plazo fijo', '155', 50000, 232),
(152, 'Depósito a plazo fijo', '2589', 50000, 233),
(153, 'Depósito a plazo fijo', '2597', 50000, 234),
(154, 'Depósito a plazo fijo', '2598', 100000, 234),
(155, 'Depósito a plazo fijo', '72771', 35400, 235),
(156, 'Depósito a plazo fijo', '6288', 350000, 236),
(157, 'Depósito a plazo fijo', '2490', 60000, 237),
(158, 'Depósito a plazo fijo', '1784', 4247652, 239),
(159, 'Depósito a plazo fijo', '3806', 2310000, 239),
(160, 'Depósito a plazo fijo', '65566', 2000000, 239),
(161, 'Depósito a plazo fijo', '1110', 2000000, 239),
(162, 'Depósito a plazo fijo', '420', 31500, 240),
(163, 'Depósito a plazo fijo', '1684', 410989, 241),
(164, 'Depósito a plazo fijo', '1675', 68501, 242),
(165, 'Depósito a plazo fijo', '4627-B', 2841262.43, 243),
(166, 'Depósito a plazo fijo', '1692', 309000, 243),
(167, 'Depósito a plazo fijo', '170', 500000, 243),
(168, 'Depósito a plazo fijo', '65682', 26050, 244),
(169, 'Depósito a plazo fijo', '2748', 100000, 245),
(170, 'Depósito a plazo fijo', '2622', 115000, 246),
(171, 'Depósito a plazo fijo', '60248', 8500, 247),
(172, 'Depósito a plazo fijo', '2409', 220000, 248),
(173, 'Depósito a plazo fijo', '110', 100000, 249),
(174, 'Depósito a plazo fijo', '1702', 200000, 250),
(175, 'Depósito a plazo fijo', '2079', 160000, 251),
(176, 'Depósito a plazo fijo', '1352', 421223.78, 252),
(177, 'Ficha de depósito', 'MH-15629', 36122.21, 253),
(178, 'Depósito a plazo fijo', '2338', 4359.18, 254),
(179, 'Depósito a plazo fijo', '2688', 10902.22, 254),
(180, 'Depósito a plazo fijo', '74083', 116420.65, 255),
(181, 'Depósito a plazo fijo', '6279', 147000, 256),
(182, 'S/D', 'S/F', 542483.28, 257),
(183, 'Depósito a plazo fijo', '64952', 12200, 258),
(184, 'Depósito a plazo fijo', '73854', 73651.32, 259),
(185, 'Depósito a plazo fijo', '1700', 370000, 260),
(186, 'Depósito a plazo fijo', '2775', 38000, 261),
(187, 'Depósito a plazo fijo', '74078', 1500000, 262),
(188, 'Depósito a plazo fijo', '2472', 54000, 263),
(189, 'Depósito a plazo fijo', '121', 17900, 264),
(190, 'Depósito a plazo fijo', '6276', 50500, 266),
(191, 'Depósito a plazo fijo', '73896', 25540.41, 268),
(192, 'Depósito a plazo fijo', '74047', 31000, 269),
(193, 'Depósito a plazo fijo', '1753', 15000, 270),
(194, 'Depósito a plazo fijo', '530', 975, 270),
(195, 'Depósito a plazo fijo', '125', 35000, 272),
(196, 'Depósito a plazo fijo', '118', 36000, 273),
(197, 'Depósito a plazo fijo', '1767', 643500, 275),
(198, 'Depósito a plazo fijo', '96', 35000, 276),
(199, 'Depósito a plazo fijo', '75289', 22253.42, 277),
(200, 'Depósito a plazo fijo', '72793', 73573.43, 279),
(201, 'Depósito a plazo fijo', '73869', 20416.57, 279),
(202, 'Depósito a plazo fijo', '1716', 21145, 280),
(203, 'Depósito a plazo fijo', '2707', 26122.21, 281),
(204, 'Depósito a plazo fijo', '1615', 43812.4, 282),
(205, 'Depósito a plazo fijo', '1482', 14591, 283),
(206, 'Depósito a plazo fijo', '4636', 159000, 284),
(207, 'Depósito a plazo fijo', '1738', 162000, 285),
(208, 'Depósito a plazo fijo', '1664', 1101000, 286),
(209, 'Depósito a plazo fijo', '1724', 346071.06, 287),
(210, 'Depósito a plazo fijo', '6257', 195500, 288),
(211, 'Depósito a plazo fijo', '74097', 30277.52, 288),
(212, 'Ficha de depósito', 'S/F', 5217.3, 288),
(213, 'Depósito a plazo fijo', '128', 30000, 289),
(214, 'Depósito a plazo fijo', '73802', 5000, 290),
(215, 'Depósito a plazo fijo', '1393', 15000, 291),
(216, 'Depósito a plazo fijo', '72784', 330767.75, 292),
(217, 'Depósito a plazo fijo', '2533', 37874, 293),
(218, 'Recibo de depósito', '004-001', 3000, 295),
(219, 'Recibo de depósito', '004-002', 15826.12, 296),
(220, 'Recibo de depósito', '007008', 222000, 297),
(221, 'Recibo de depósito', '004001', 351386.26, 298),
(222, 'Recibo de depósito', '60474', 97500, 300),
(223, 'Recibo de depósito', '009-006', 186824.73, 301),
(224, 'Recibo de depósito', '006002', 26200, 302),
(225, 'Recibo de depósito', '007001', 33400, 302),
(226, 'Recibo de depósito', '008001', 26924, 302),
(227, 'Recibo de depósito', '006005', 30050, 302),
(228, 'Recibo de depósito', '007003', 34990.06, 302),
(229, 'Recibo de depósito', '008002', 28149, 302),
(230, 'Recibo de depósito', '006006', 8796.31, 303),
(231, 'Recibo de depósito', '004001', 70000, 308),
(232, 'Recibo de depósito', '005001', 25000, 308),
(233, 'Recibo de depósito', '004001', 70000, 309),
(234, 'Recibo de depósito', '004002', 11479.4, 310),
(235, 'Recibo de depósito', '004001', 30000, 311),
(236, 'Recibo de depósito', '005-001', 38500, 313),
(237, 'Recibo de depósito', '005001', 11557.5, 316),
(238, 'Recibo de depósito', '005003', 100001, 317),
(239, 'Recibo de depósito', '004006', 29837.17, 318),
(240, 'Recibo de depósito', '005001', 21000, 323),
(241, 'Recibo de depósito', '005009', 25000, 323),
(242, 'Recibo de depósito', '004001', 99500, 324),
(243, 'Recibo de depósito', '005002', 10000, 327),
(244, 'Recibo de depósito', '004017', 5500, 327),
(245, 'Recibo de depósito', '006001', 21000, 328),
(246, 'Recibo de depósito', '005005', 179184.99, 329),
(247, 'Recibo de depósito', '010006', 600000, 330),
(248, 'Recibo de depósito', '004012', 26660.81, 331),
(249, 'Recibo de depósito', '115-1-36', 400, 333),
(250, 'Depósito a plazo fijo', 'S/F', 2229.68, 339),
(251, 'Recibo de depósito', '005006', 156557.48, 341),
(252, 'Recibo de depósito', '004001', 5000, 342),
(253, 'Recibo de depósito', '005002', 825.1, 343),
(254, 'Recibo de depósito', '004002', 1042.74, 343),
(255, 'Recibo de depósito', '004007', 7315, 344),
(256, 'Recibo de depósito', '6002', 36000, 345),
(257, 'Recibo de depósito', '4004', 25000, 345),
(258, 'Recibo de depósito', '006-001', 17132.71, 346),
(259, 'Recibo de depósito', '007001', 10000, 347),
(260, 'Recibo de depósito', '004-001', 50001, 348),
(261, 'Recibo de depósito', '004010', 15000, 349),
(262, 'Recibo de depósito', '004-010', 40502.41, 351),
(263, 'Recibo de depósito', '005-004', 5305.56, 351),
(264, 'Recibo de depósito', '005-005', 35372.65, 351),
(265, 'Recibo de depósito', '005-006', 5411.51, 351),
(266, 'Recibo de depósito', '004008', 110000, 354),
(267, 'Recibo de depósito', '004006', 1235000, 354),
(268, 'Recibo de depósito', '004005', 8721.88, 357),
(269, 'Recibo de depósito', '004004', 10000, 357),
(270, 'Recibo de depósito', '004003', 5451.18, 357),
(271, 'Depósito a plazo fijo', 'S/F', 2435.69, 358),
(272, 'Recibo de depósito', '006001', 60000, 360),
(273, 'Recibo de depósito', '004006', 12619.31, 364),
(274, 'Recibo de depósito', '004005', 12116.59, 364),
(275, 'Recibo de depósito', '004005', 5832.73, 365),
(276, 'Recibo de depósito', '004006', 1089.99, 365),
(277, 'Ficha de depósito', '108137', 30000, 366),
(278, 'Recibo de depósito', '004010', 750000, 367),
(279, 'Recibo de depósito', '004007', 10000, 370),
(280, 'Recibo de depósito', '008005', 15369.57, 371),
(281, 'Recibo de depósito', '004001', 165000, 372),
(282, 'Recibo de depósito', '004014', 2331, 374),
(283, 'Recibo de depósito', '005001', 7500, 374),
(284, 'Recibo de depósito', '005-006', 20000, 377),
(285, 'Recibo de depósito', '004-005', 39841.36, 379),
(286, 'Recibo de depósito', '005015', 84000, 380),
(287, 'Recibo de depósito', '062007', 158000, 381),
(288, 'Recibo de depósito', '005017', 163180, 381),
(289, 'Recibo de depósito', '005018', 217948.09, 381),
(290, 'Recibo de depósito', '012003', 15300, 381),
(291, 'Recibo de depósito', '004016', 36650, 381),
(292, 'Recibo de depósito', '005023', 224000, 383),
(293, 'Recibo de depósito', '005001', 5000, 384),
(294, 'Recibo de depósito', '005007', 96140.48, 385),
(295, 'Recibo de depósito', '005-004', 17190.93, 387),
(296, 'Recibo de depósito', '006005', 12396.07, 388),
(297, 'Recibo de depósito', '005010', 2997.71, 389),
(298, 'Recibo de depósito', '005001', 20000, 390),
(299, 'Recibo de depósito', '004002', 71859.63, 390),
(300, 'Recibo de depósito', '005002', 10000, 390),
(301, 'Recibo de depósito', '004001', 15000, 390),
(302, 'Recibo de depósito', '006001', 3000, 390),
(303, 'Recibo de depósito', '005006', 72960.92, 390),
(304, 'Recibo de depósito', '005005', 40501.6, 393),
(305, 'Recibo de depósito', '007-006', 250000, 394),
(306, 'Recibo de depósito', '004-008', 750000, 395),
(307, 'Recibo de depósito', '004002', 10000, 396),
(308, 'Recibo de depósito', '005001', 17500, 396),
(309, 'Recibo de depósito', '004011', 9000, 397),
(310, 'Recibo de depósito', '004002', 5000, 398),
(311, 'Recibo de depósito', '005-002', 15558.84, 400),
(312, 'Recibo de depósito', '004003', 1750.5, 401),
(313, 'Recibo de depósito', '006001', 21000, 404),
(314, 'Recibo de depósito', '004002', 8000, 406),
(315, 'Recibo de depósito', '008009', 1200000, 407),
(316, 'Recibo de depósito', '004-001', 15000, 411),
(317, 'Recibo de depósito', '004004', 10000, 413),
(318, 'Recibo de depósito', '004001', 8000, 415),
(319, 'Recibo de depósito', '004-001', 8000, 416),
(320, 'Recibo de depósito', '005-003', 174000, 417),
(321, 'Recibo de depósito', '006-001', 15900, 421),
(322, 'Recibo de depósito', '006-002', 54000, 422),
(323, 'Recibo de depósito', '004-001', 40000, 426),
(324, 'Recibo de depósito', '004-002', 40000, 426),
(325, 'Recibo de depósito', '004006', 20387.03, 427);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorDepositosGarantia`
--

CREATE TABLE `ahorradorDepositosGarantia` (
  `idahorradorDepositosGarantia` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorOtrosDepositos`
--

CREATE TABLE `ahorradorOtrosDepositos` (
  `idahorradorOtrosDepositos` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorParteSocial`
--

CREATE TABLE `ahorradorParteSocial` (
  `idahorradorParteSocial` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ahorradorParteSocial`
--

INSERT INTO `ahorradorParteSocial` (`idahorradorParteSocial`, `tipoDocumento`, `folio`, `importe`, `ahorrador_idahorrador`) VALUES
(1, 'Partes sociales', '465', 300, 4),
(2, 'Ficha universal', '546352', 300, 10),
(3, 'Partes sociales', '033', 300, 11),
(4, 'Partes sociales', 'S/F', 300, 12),
(5, 'Partes sociales', '350', 300, 17),
(6, 'Partes sociales', '330', 300, 19),
(7, 'Partes sociales', '439', 300, 19),
(8, 'Partes sociales', '440', 300, 20),
(9, 'Partes sociales', 'S/F', 300, 22),
(10, 'Partes sociales', 'S/F', 300, 31),
(11, 'Partes sociales', '0195', 300, 32),
(12, 'Partes sociales', '179', 300, 37),
(13, 'Partes sociales', '398', 300, 38),
(14, 'S/D', 'S/F', 300, 39),
(15, 'Partes sociales ', '529', 300, 41),
(16, 'Partes sociales', '260', 300, 42),
(17, 'Ficha de depósito', '130-150', 300, 44),
(18, 'Partes sociales', '509', 300, 45),
(19, 'Partes sociales', '0160', 300, 47),
(20, 'Partes sociales', '0481', 300, 57),
(21, 'Partes sociales', '0149', 300, 65),
(22, 'S/D', 'S/F', 500, 67),
(23, 'Partes sociales', '603', 300, 94),
(24, 'Partes sociales', '0040', 300, 98),
(25, 'Ficha universal', '547379', 300, 102),
(26, 'Ficha de depósito', '188-216', 300, 103),
(27, 'Partes sociales', '0322', 300, 107),
(28, 'Partes sociales ', '382', 300, 113),
(29, 'Partes sociales', '1923', 500, 114),
(30, 'Partes sociales', '1631', 500, 116),
(31, 'Partes sociales', '1627', 500, 117),
(32, 'Partes sociales', '2015', 500, 118),
(33, 'Partes sociales', '5', 500, 119),
(34, 'Partes sociales', 'S/F', 500, 120),
(35, 'Partes sociales', 'S/F', 500, 121),
(36, 'Ficha de depósito', '434', 500, 122),
(37, 'Partes sociales', 'S/F', 500, 123),
(38, 'Partes sociales', '2229', 500, 124),
(39, 'Partes sociales', '8912', 50000, 124),
(40, 'Partes sociales', '2182', 500, 125),
(41, 'Partes sociales', 'S/F', 500, 128),
(42, 'Partes sociales', '1491', 500, 130),
(43, 'Partes sociales', '1386', 500, 132),
(44, 'Partes sociales', '735', 500, 133),
(45, 'Partes sociales', '2008', 500, 135),
(46, 'Partes sociales', '2250', 500, 136),
(47, 'Partes sociales', '2144', 500, 137),
(48, 'Partes sociales', '733', 500, 138),
(49, 'Partes sociales', '1522', 500, 140),
(50, 'Partes sociales', 'S/F', 500, 141),
(51, 'Partes sociales', 'S/F', 500, 143),
(52, 'Partes sociales', '1800', 500, 145),
(53, 'Partes sociales', '1638', 83000, 146),
(54, 'Partes sociales', '1337', 500, 147),
(55, 'Partes sociales', '1403', 500, 149),
(56, 'Partes sociales', 'S/F', 500, 150),
(57, 'Partes sociales', '1638', 500, 152),
(58, 'Partes sociales', '1407', 500, 155),
(59, 'Partes sociales', 'S/F', 500, 156),
(60, 'Partes sociales', 'S/F', 500, 157),
(61, 'Partes sociales', 'S/F', 500, 158),
(62, 'Partes sociales', '170', 500, 159),
(63, 'Partes sociales', 'S/F', 500, 162),
(64, 'Partes sociales', '1759', 500, 166),
(65, 'Partes sociales', '1600', 500, 167),
(66, 'Partes sociales', '2313', 500, 168),
(67, 'Partes sociales', '1459', 500, 170),
(68, 'Partes sociales', '8963', 900000, 171),
(69, 'Partes sociales', 'S/F', 500, 172),
(70, 'Partes sociales', '827', 500, 173),
(71, 'Partes sociales', '3053', 500, 177),
(72, 'Partes sociales', '4777', 105000, 178),
(73, 'Partes sociales', '1605', 500, 179),
(74, 'Partes sociales', '775', 500, 180),
(75, 'Partes sociales', '1986', 500, 181),
(76, 'Partes sociales', '1956', 500, 182),
(77, 'Partes sociales', '2116', 500, 183),
(78, 'Partes sociales', '2223', 500, 185),
(79, 'Partes sociales', '1501275', 500, 186),
(80, 'Partes sociales', '905', 500, 187),
(81, 'Partes sociales', 'S/F', 500, 189),
(82, 'Partes sociales', '1522', 500, 190),
(83, 'Partes sociales', '2277', 500, 192),
(84, 'Partes sociales', 'S/F', 500, 193),
(85, 'Partes sociales', '732', 500, 194),
(86, 'Ficha de depósito ', 'W5-12258', 500, 195),
(87, 'Partes sociales', 'S/F', 500, 196),
(88, 'Partes sociales', '5352', 50000, 196),
(89, 'Partes sociales', '5327', 134500, 196),
(90, 'Partes sociales', '5328', 75000, 196),
(91, 'Partes sociales', 'S/F', 500, 197),
(92, 'Partes sociales', '10135', 50000, 197),
(93, 'Partes sociales', 'S/F', 500, 198),
(94, 'Partes sociales', '1992', 500, 199),
(95, 'Partes sociales', '11435', 500, 202),
(96, 'Ficha de depósito', '11436', 18315.97, 202),
(97, 'Partes sociales', '1400', 500, 203),
(98, 'Partes sociales', 'S/F', 500, 204),
(99, 'Partes sociales', '731', 500, 205),
(100, 'Partes sociales', '922', 500, 206),
(101, 'Partes sociales', '695', 500, 208),
(102, 'Partes sociales', 'S/F', 500, 209),
(103, 'Partes sociales', '6262', 60000, 209),
(104, 'Partes sociales', 'S/F', 500, 210),
(105, 'Partes sociales', '1524', 500, 211),
(106, 'Partes sociales', '6222', 50000, 212),
(107, 'Partes sociales', 'S/F', 500, 213),
(108, 'Partes sociales', 'S/F', 500, 214),
(109, 'Partes sociales', '1501236', 500, 215),
(110, 'Partes sociales', 'S/F', 500, 218),
(111, 'Partes sociales', '6280', 150000, 219),
(112, 'Partes sociales', '1405', 500, 221),
(113, 'Partes sociales', '1131', 500, 223),
(114, 'Partes sociales', '76', 500, 225),
(115, 'Partes sociales', '4605B', 441943.53, 225),
(116, 'Partes sociales', '75', 500, 226),
(117, 'Pagaré', '4604', 306428.88, 226),
(118, 'Partes sociales', 'S/F', 500, 229),
(119, 'Partes sociales', 'S/F', 500, 230),
(120, 'Partes sociales', 'S/F', 500, 231),
(121, 'Partes sociales', '580', 500, 232),
(122, 'Partes sociales', 'S/F', 500, 233),
(123, 'Partes sociales', '1030', 500, 234),
(124, 'Partes sociales', '1957', 500, 235),
(125, 'Partes sociales', '1419', 500, 237),
(126, 'Partes sociales', '1640', 500, 238),
(127, 'Partes sociales', '12065', 500, 240),
(128, 'Partes sociales', '2224', 500, 242),
(129, 'Partes sociales', 'S/F', 500, 244),
(130, 'Partes sociales', 'S/F', 500, 246),
(131, 'Partes sociales', '40', 500, 247),
(132, 'Partes sociales', '2010', 500, 249),
(133, 'Partes sociales', 'S/F', 500, 250),
(134, 'Partes sociales', '1500891', 500, 252),
(135, 'Partes sociales', '2154', 500, 253),
(136, 'Partes sociales', 'S/F', 500, 254),
(137, 'Pagaré', '4611', 542483.28, 257),
(138, 'Partes sociales', '859', 500, 258),
(139, 'Partes sociales', 'S/F', 500, 260),
(140, 'Partes sociales', 'S/F', 500, 261),
(141, 'Partes sociales', '6292', 2000000, 262),
(142, 'Partes sociales', '6242', 4000000, 262),
(143, 'Partes sociales', '4123', 3000000, 262),
(144, 'Partes sociales', '6255', 1000000, 262),
(145, 'Partes sociales', '74077', 200000, 262),
(146, 'Partes sociales', '74059', 70000, 262),
(147, 'Partes sociales', '74074', 1000000, 262),
(148, 'Partes sociales', '6256', 500000, 262),
(149, 'Partes sociales', '6293', 1000000, 262),
(150, 'Partes sociales', 'S/F', 500, 263),
(151, 'Partes sociales', '63', 500, 264),
(152, 'Partes sociales', '1511', 500, 265),
(153, 'Partes sociales', '1556', 500, 266),
(154, 'Ficha de depósito', '1437', 500, 267),
(155, 'Partes sociales', '2190', 500, 268),
(156, 'Partes sociales', 'S/F', 500, 269),
(157, 'Partes sociales', 'S/F', 500000, 271),
(158, 'Partes sociales', '1911', 500, 272),
(159, 'Partes sociales', '1999', 500, 273),
(160, 'Partes sociales', '2141', 500, 274),
(161, 'Partes sociales', '10006', 90000, 274),
(162, 'Partes sociales', '1983', 500, 276),
(163, 'Partes sociales', '0349', 500, 277),
(164, 'Partes sociales', 'S/F', 500, 278),
(165, 'Partes sociales', '709', 500, 279),
(166, 'Ficha de depósito', '781', 500, 280),
(167, 'Partes sociales', 'S/F', 500, 281),
(168, 'Partes sociales', '1402', 500, 283),
(169, 'Partes sociales', '1010', 500, 285),
(170, 'Partes sociales', '1501164', 500, 286),
(171, 'Partes sociales', '983', 500, 287),
(172, 'Partes sociales', '11', 500, 289),
(173, 'Partes sociales', '1996', 500, 290),
(174, 'Partes sociales', 'S/F', 500, 293),
(175, 'Partes sociales', 'S/F', 500, 294),
(176, 'Recibo de depósito', '115-1-14', 500, 295),
(177, 'Recibo de depósito', '115-1-16', 500, 296),
(178, 'Partes sociales', 'S/F', 500, 297),
(179, 'Recibo de depósito', '11515', 500, 298),
(180, 'Recibo de depósito', '5065', 500, 299),
(181, 'Partes sociales', '60473', 500, 300),
(182, 'Partes sociales', 'S/F', 500, 301),
(183, 'Partes sociales', 'S/F', 500, 302),
(184, 'Partes sociales', 'S/F', 500, 303),
(185, 'Partes sociales', 'S/F', 500, 304),
(186, 'Partes sociales', 'S/F', 500, 305),
(187, 'Partes sociales', 'S/F', 500, 306),
(188, 'Partes sociales', 'S/F', 500, 307),
(189, 'Ficha de depósito', '193005', 500, 308),
(190, 'Recibo de depósito', '11515', 500, 309),
(191, 'Partes sociales', '11516', 500, 310),
(192, 'Recibo de depósito', 'S/F', 500, 311),
(193, 'Partes sociales', 'S/F', 500, 312),
(194, 'Partes sociales', 'S/F', 500, 313),
(195, 'Partes sociales', 'S/F', 500, 314),
(196, 'Partes sociales', 'S/F', 500, 315),
(197, 'Recibo de depósito', '11513', 500, 316),
(198, 'Recibo de depósito', '115130', 500, 317),
(199, 'Partes sociales', 'S/F', 500, 318),
(200, 'Partes sociales', 'S/F', 500, 319),
(201, 'Recibo de depósito', '115-1-35', 500, 320),
(202, 'Recibo de depósito', '115-1-9', 500, 321),
(203, 'Recibo de depósito', '115-1-30', 500, 322),
(204, 'Partes sociales', 'S/F', 500, 323),
(205, 'Partes sociales', 'S/F', 500, 324),
(206, 'Recibo de depósito', '115126', 500, 326),
(207, 'Partes sociales', 'S/F', 500, 328),
(208, 'Partes sociales', 'S/F', 500, 331),
(209, 'Recibo de depósito', '115-1-26', 500, 333),
(210, 'Partes sociales', 'S/F', 500, 334),
(211, 'Partes sociales', 'S/F', 500, 335),
(212, 'Partes sociales', 'S/F', 500, 337),
(213, 'Recibo de depósito', '115-1-13', 500, 339),
(214, 'S/D', 'S/F', 500, 340),
(215, 'Partes sociales', 'S/F', 500, 341),
(216, 'Partes sociales', 'S/F', 500, 342),
(217, 'Partes sociales', 'S/F', 500, 343),
(218, 'Partes sociales', 'S/F', 500, 344),
(219, 'Partes sociales', 'S/F', 500, 345),
(220, 'Partes sociales', 'S/F', 500, 346),
(221, 'Partes sociales', 'S/F', 500, 347),
(222, 'Partes sociales', 'S/F', 500, 349),
(223, 'Partes sociales', 'S/F', 500, 350),
(224, 'Recibo de depósito', '116-1-4', 500, 351),
(225, 'Partes sociales', 'S/F', 500, 352),
(226, 'Partes sociales', 'S/F', 500, 353),
(227, 'Partes sociales', 'S/F', 500, 355),
(228, 'Partes sociales', 'S/F', 500, 356),
(229, 'Ficha de depósito', '58762', 500, 357),
(230, 'Partes sociales', 'S/F', 500, 358),
(231, 'Recibo de depósito', '115-1-7', 500, 359),
(232, 'Partes sociales', 'S/F', 500, 360),
(233, 'Partes sociales', 'S/F', 500, 361),
(234, 'Partes sociales', 'S/F', 500, 362),
(235, 'Partes sociales', 'S/F', 500, 363),
(236, 'Ficha de depósito', '108137', 500, 366),
(237, 'Partes sociales', 'S/F', 500, 368),
(238, 'Partes sociales', 'S/F', 500, 369),
(239, 'Partes sociales', 'S/F', 500, 370),
(240, 'Partes sociales', 'S/F', 500, 371),
(241, 'Partes sociales', 'S/F', 500, 373),
(242, 'Partes sociales', 'S/F', 500, 374),
(243, 'Recibo de depósito', '115-1-12', 500, 375),
(244, 'Recibo de depósito', '115-1-29', 500, 376),
(245, 'Partes sociales', 'S/F', 500, 377),
(246, 'Partes sociales', 'S/F', 500, 378),
(247, 'S/D', 'S/F', 500, 380),
(248, 'Partes sociales', 'S/F', 500, 381),
(249, 'Recibo de depósito', 'S/F', 500, 382),
(250, 'Partes sociales', 'S/F', 500, 385),
(251, 'Partes sociales', 'S/F', 500, 386),
(252, 'Partes sociales', 'S/F', 500, 387),
(253, 'Partes sociales', 'S/F', 500, 390),
(254, 'Partes sociales', 'S/F', 500, 391),
(255, 'Recibo de depósito', '115128', 500, 392),
(256, 'Partes sociales', 'S/F', 500, 398),
(257, 'Recibo de depósito', '115-1-12', 500, 400),
(258, 'Partes sociales', 'S/F', 500, 401),
(259, 'Partes sociales', 'S/F', 500, 403),
(260, 'Partes sociales', 'S/F', 500, 404),
(261, 'Partes sociales', 'S/F', 500, 405),
(262, 'Partes sociales', 'S/F', 500, 406),
(263, 'Partes sociales', 'S/F', 500, 407),
(264, 'Partes sociales', 'S/F', 500, 409),
(265, 'Partes sociales', 'S/F', 500, 409),
(266, 'Partes sociales', 'S/F', 500, 410),
(267, 'Partes sociales', 'S/F', 500, 411),
(268, 'Partes sociales', 'S/F', 500, 413),
(269, 'Partes sociales', 'S/F', 500, 414),
(270, 'Partes sociales', 'S/F', 500, 415),
(271, 'Partes sociales', 'S/F', 500, 416),
(272, 'Partes sociales', 'S/F', 500, 418),
(273, 'Recibo de depósito', '115-1-11', 500, 419),
(274, 'Partes sociales', '62629', 500, 420),
(275, 'Partes sociales', 'S/F', 500, 421),
(276, 'Recibo de depósito', '115-1-25', 500, 422),
(277, 'Partes sociales', 'S/F', 500, 423),
(278, 'Partes sociales', 'S/F', 500, 424),
(279, 'Partes sociales', 'S/F', 500, 425),
(280, 'Partes sociales', 'S/F', 500, 426),
(281, 'Partes sociales', 'S/F', 500, 427);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorradorPrestamosCargo`
--

CREATE TABLE `ahorradorPrestamosCargo` (
  `idahorradorPrestamosCargo` int(11) NOT NULL,
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorrador_has_documentosIdentidad`
--

CREATE TABLE `ahorrador_has_documentosIdentidad` (
  `ahorrador_idahorrador` int(11) NOT NULL,
  `documentosIdentidad_iddocumentosIdentidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analiticasCertificadas`
--

CREATE TABLE `analiticasCertificadas` (
  `idanaliticasCertificadas` int(11) NOT NULL,
  `nuevoFolioIdentificador` char(11) DEFAULT NULL,
  `folioIdentificadorAnterior` char(11) DEFAULT NULL,
  `nombreAhorrador` text,
  `tipoDocumentoPS` text,
  `folioPS` text,
  `importePS` double DEFAULT NULL,
  `tipoDocumentoCA` text,
  `folioCA` text,
  `importeCA` double DEFAULT NULL,
  `tipoDocumentoCI` text,
  `folioCI` text,
  `importeCI` double DEFAULT NULL,
  `tipoDocumentoDG` text,
  `folioDG` text,
  `importeDG` double DEFAULT NULL,
  `tipoDocumentoCNC` text,
  `folioCNC` text,
  `importeCNC` double DEFAULT NULL,
  `tipoDocumentoOtros` text,
  `folioOtros` text,
  `importeOtros` double DEFAULT NULL,
  `tipoDocumentoPrestamos` text,
  `folioPrestamos` text,
  `importePrestamos` double DEFAULT NULL,
  `saldoNeto100` double DEFAULT NULL,
  `saldoNeto70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `calleYNumero` text,
  `delegacionMunicipio` text,
  `colonia` text NOT NULL,
  `telefono` text,
  `filaDocumentoOriginal` int(45) NOT NULL,
  `hojaDocumentoOriginal` varchar(45) NOT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `basesCertificadas_idbasesCertificadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `analiticasCertificadas`
--

INSERT INTO `analiticasCertificadas` (`idanaliticasCertificadas`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `curp`, `basesCertificadas_idbasesCertificadas`) VALUES
(1, '00100001', '', 'ADAUTA CAMACHO SERGIO', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 146000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 146000, 102200, 102200, 'S/D', 'S/D', 'S/D', 'S/D', 15, 'BD Analitica por ahorrador ', '', 1),
(2, '00100002', '', 'ALVAREZ AGUILAR FRANCISCO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '11', 19600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19600, 13720, 13720, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 16, 'BD Analitica por ahorrador ', '', 1),
(3, '00100003', '', 'ARROLLO SUAREZ GUADALUPE', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'Depósito a plazo fijo', '9', 10001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10101, 7070.7, 7070.7, 'Reforma num7', 'Allende', 'Cuyoaco', 'S/D', 17, 'BD Analitica por ahorrador ', '', 1),
(4, '00100004', '', 'BAEZ ESPINOSA FERNANDO', 'Partes sociales', '465', 300, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '44667', 53000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 53300, 37310, 37310, 'Emilio Carranza num 24', 'Grajales', 'Rafael Lara Grajales', 'S/D', 18, 'BD Analitica por ahorrador ', '', 1),
(5, '00100005', '', 'BAEZ HERNANDEZ GUILLERMINA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45517', 8639.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8639.38, 6047.57, 6047.57, '7 Norte num 42', 'Centro', 'Rafael Lara Grajales', 'S/D', 19, 'BD Analitica por ahorrador ', '', 1),
(6, '00100006', '', 'BAEZ HERNANDEZ NORMA LIDIA', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 152627.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 152627.67, 106839.37, 106839.37, 'Av Emiliano Carranza num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 20, 'BD Analitica por ahorrador ', '', 1),
(7, '00100007', '', 'BAEZ REYES MARIA LUISA GUADALUPE', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46815', 93203.01, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93203.01, 65242.11, 65242.11, '10 Sur num 1502', 'Centro', 'San Jose Chiapa', 'S/D', 21, 'BD Analitica por ahorrador ', '', 1),
(8, '00100008', '', 'BARRALEZ GONZALEZ MARGARITA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46382', 7939.11, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7939.11, 5557.38, 5557.38, 'Av Ignacio Zaragoza num 18', 'Cruz del Bosque', 'Nopalucan', 'S/D', 22, 'BD Analitica por ahorrador ', '', 1),
(9, '00100009', '', 'BARRANCO LOPEZ MARTIN', 'S/D', 'S/F', 0, 'Recibo de depósito', '415', 400001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 400001, 280000.7, 167930, 'S/D', 'S/D', 'S/D', 'S/D', 23, 'BD Analitica por ahorrador ', '', 1),
(10, '00100010', '', 'BECERRIL VILCHIS HILDA', 'Ficha universal', '546352', 300, 'Ficha universal', '546352', 10863.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11163.43, 7814.4, 7814.4, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 24, 'BD Analitica por ahorrador ', '', 1),
(11, '00100011', '', 'BRAVO LOPEZ ARNULFO', 'Partes sociales', '033', 300, 'Depósito a plazo fijo', '43758', 50599, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50899, 35629.3, 35629.3, 'Guanajuato num 6', 'Centro', 'Rafael Lara Grajales', 'S/D', 25, 'BD Analitica por ahorrador ', '', 1),
(12, '00100012', '', 'CABALLERO RODRIGUEZ MINERVA', 'Partes sociales', 'S/F', 300, 'Recibo de depósito', 'S/F', 40000, 'Ficha de depósito', 'S/F', 1545.89, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 41845.89, 29292.12, 29292.12, '2 de abril num385', 'Barrio de Tetela', 'Libres', '2764731536', 26, 'BD Analitica por ahorrador ', '', 1),
(13, '00100013', '', 'CABRERA MUÑOZ JUAN GUSTAVO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '44206', 260000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 860000, 602000, 167930, '16 de Septiembre no 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 27, 'BD Analitica por ahorrador ', '', 1),
(14, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42543', 600000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 28, 'BD Analitica por ahorrador ', '', 1),
(15, '00100014', '', 'CANDELARIO LOPEZ CLAUDIA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45471', 18927.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18927.71, 13249.4, 13249.4, '11 Poniente num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 29, 'BD Analitica por ahorrador ', '', 1),
(16, '00100015', '', 'CARREON SANCHEZ LEONEL', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46424', 221558.42, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 221558.42, 155090.89, 155090.89, '3 Poniente num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 30, 'BD Analitica por ahorrador ', '', 1),
(17, '00100016', '', 'CASTILLO CERON JOSE ANDRES', 'S/D', 'S/F', 0, 'Certificado de ahorro', '7325', 16705, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16705, 11693.5, 11693.5, '6 Poniente num 8', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 31, 'BD Analitica por ahorrador ', '', 1),
(18, '00100017', '', 'CASTILLO ROMERO JOSE GERONIMO AURELIO', 'Partes sociales', '350', 300, 'Certificado de ahorro', '47126', 60405.29, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60705.29, 42493.7, 42493.7, 'Hermanos Serdan num 305', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 32, 'BD Analitica por ahorrador ', '', 1),
(19, '00100018', '', 'CASTILLO SANCHEZ MARICELA AURORA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46045', 61984.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 61984.31, 43389.02, 43389.02, '7 Oriente num 2', 'Grajales', 'Rafael Lara Grajales', 'S/D', 33, 'BD Analitica por ahorrador ', '', 1),
(20, '00100019', '', 'CAYETANO PAULINO ENEDINA', 'Partes sociales', '330', 300, 'Certificado de ahorro', '46412', 23753.51, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30028, 21019.6, 21019.6, 'Del Monte s/n', 'Benito Juarez', 'Soltepec', 'S/D', 34, 'BD Analitica por ahorrador ', '', 1),
(21, '', '', '', 'Partes sociales', '439', 300, 'Certificado de ahorro', '46414', 5674.49, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 35, 'BD Analitica por ahorrador ', '', 1),
(22, '00100020', '', 'CERVANTES MONTES JUAN', 'Partes sociales', '440', 300, 'Certificado de ahorro', '46414', 3813.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4113.5, 2879.45, 2879.45, '5 Sur num 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 36, 'BD Analitica por ahorrador ', '1', 1),
(23, '00100021', '', 'CRUZ DE LOS ANGELES MA GUADALUPE', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 12551.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12551.93, 8786.35, 8786.35, 'Juan Sarabia num 7', 'Obrera', 'Rafael Lara Grajales', '4741025', 37, 'BD Analitica por ahorrador ', '', 1),
(24, '00100022', '', 'CRUZ DOMINGUEZ MICAELA', 'Partes sociales', 'S/F', 300, 'Certificado de ahorro', 'S/F', 100, 'Depósito a plazo fijo', '14', 49600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50000, 35000, 35000, '4 Sur num6', 'Allende', 'Cuyoaco', 'S/D', 38, 'BD Analitica por ahorrador ', '', 1),
(25, '00100023', '', 'CRUZ TORRES CELSO VICTOR', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 46321.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 46321.96, 32425.37, 32425.37, 'Priv Los Naranjos num 18', 'San Miguel', 'Amozoc de Mota', 'S/D', 39, 'BD Analitica por ahorrador ', '', 1),
(26, '00100024', '', 'CUELLAR MUÑOZ MARIA GUADALUPE', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46371', 47333.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 47333.93, 33133.75, 33133.75, 'Av Progreso num 10', 'Centro', 'Rafael Lara Grajales', 'S/D', 40, 'BD Analitica por ahorrador ', '', 1),
(27, '00100025', '', 'DE LA CRUZ HERNANDEZ JUANA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '44307', 73365, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 73365, 51355.5, 51355.5, '2 Norte num 38', 'Centro', 'Rafael Lara Grajales', 'S/D', 41, 'BD Analitica por ahorrador ', '', 1),
(28, '00100026', '', 'DEL CARMEN LOPEZ GUADALUPE', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46123', 154762.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 154762.67, 108333.87, 108333.87, 'Salto del agua num 37', 'Salto del Agua', 'Rafael Lara Grajales', 'S/D', 42, 'BD Analitica por ahorrador ', '', 1),
(29, '00100027', '', 'DIAZ BAUTISTA VICTORIA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47308', 7482, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7482, 5237.4, 5237.4, '8 Oriente num 28', 'Barrio San Juan', 'Acajete', 'S/D', 43, 'BD Analitica por ahorrador ', '', 1),
(30, '00100028', '', 'DIAZ HERNANDEZ MARCELINA', 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42471', 29500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 29500, 20650, 20650, 'Camino a Obregon num 7', 'La Ermita', 'Soltepec', 'S/D', 44, 'BD Analitica por ahorrador ', '', 1),
(31, '00100029', '', 'DIAZ VAZQUEZ MIGUEL', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 16096.61, 'S/D', 'S/F', 277.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16374.57, 11462.2, 11462.2, 'Principal 1', 'La Cañada', 'Libres', 'S/D', 45, 'BD Analitica por ahorrador ', '', 1),
(32, '00100030', '', 'DURAN HERNANDEZ FABIOLA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46824', 213619.84, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 213619.84, 149533.89, 149533.89, '4 Norte s/n', 'Centro', 'San Jose Chiapa', 'S/D', 46, 'BD Analitica por ahorrador ', '', 1),
(33, '00100031', '', 'DURAN LOPEZ ERASMO', 'Partes sociales', 'S/F', 300, 'Certificado de ahorro', '44092', 16781.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17081.21, 11956.85, 11956.85, '16 de Septiembre num 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 47, 'BD Analitica por ahorrador ', '', 1),
(34, '00100032', '', 'DURAN MARTINEZ SEBASTIAN EVELINA', 'Partes sociales', '0195', 300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 300, 210, 210, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 48, 'BD Analitica por ahorrador ', '', 1),
(35, '00100033', '', 'FERNANDEZ HERNANDEZ SOLIRENE', 'S/D', 'S/F', 0, 'Certificado de ahorro', '547715', 85088.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 85088.71, 59562.1, 59562.1, 'Rubi num 8', 'La Joya', 'Rafael Lara Grajales', 'S/D', 49, 'BD Analitica por ahorrador ', '', 1),
(36, '00100034', '', 'FLORES DIAZ MARGARITO', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47307', 20466, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20466, 14326.2, 14326.2, '12 Norte num 8', 'Barrio San Juan', 'Acajete', 'S/D', 50, 'BD Analitica por ahorrador ', '', 1),
(37, '00100035', '', 'FLORES MOZO RODE', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 11704.59, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11704.59, 8193.21, 8193.21, '11 Sur num 25', 'Centro', 'Rafael Lara Grajales', 'S/D', 51, 'BD Analitica por ahorrador ', '', 1),
(38, '00100036', '', 'GARCIA MONTES VICENTA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45290', 19376.85, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19376.85, 13563.8, 13563.8, '7 Sur num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 52, 'BD Analitica por ahorrador ', '', 1),
(39, '00100037', '', 'GONZALEZ HERNANDEZ ALEJANDRO', 'Partes sociales', '179', 300, 'Ficha de depósito', 'S/F', 144030.9, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 144330.9, 101031.63, 101031.63, '5 Oriente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 53, 'BD Analitica por ahorrador ', '', 1),
(40, '00100038', '', 'GONZALEZ LOPEZ HILARIA', 'Partes sociales', '398', 300, 'Certificado de ahorro', '43819', 5703, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6003, 4202.1, 4202.1, 'Plaza de la Gardenia Edif 19A DPTO 2', 'U Hab Lara Grajales', 'Nopalucan', 'S/D', 54, 'BD Analitica por ahorrador ', '', 1),
(41, '00100039', '', 'GUEVARA LOPEZ ELIGIO', 'S/D', 'S/F', 300, 'Ficha de depósito', '195227', 100, 'Depósito a plazo fijo', '16', 195000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 195400, 136780, 136780, 'Avenida 16 de septiembre s/n', 'Tonalapa', 'Ixtacamaxtitlan', '4880221', 55, 'BD Analitica por ahorrador ', '', 1),
(42, '00100040', '', 'HERNANDEZ CERON MARTHA', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 74815, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 74815, 52370.5, 52370.5, '3 Sur num 14', 'Grajales', 'Rafael Lara Grajales', 'S/D', 56, 'BD Analitica por ahorrador ', '', 1),
(43, '00100041', '', 'HERNANDEZ LOPEZ ROSA', 'Partes sociales ', '529', 300, 'Ficha de depósito', 'S/F', 142597, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 142897, 100027.9, 100027.9, 'Hidalgo 404', 'La Granja', 'Nopalucan', 'S/D', 57, 'BD Analitica por ahorrador ', '', 1),
(44, '00100042', '', 'HERNANDEZ PLATINI MARIA LUCINA', 'Partes sociales', '260', 300, 'Certificado de ahorro', '47422', 52698, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 52998, 37098.6, 37098.6, 'Av Del Trabajo num 20 Col Obrera', 'Grajales', 'S/D', 'S/D', 58, 'BD Analitica por ahorrador ', '', 1),
(45, '00100043', '', 'HERNANDEZ RAMIREZ JOSE PORFIRIO PASCUAL', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46176', 10243.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10243.63, 7170.54, 7170.54, '7 Sur num 16', 'Centro', 'Rafael Lara Grajales', 'S/D', 59, 'BD Analitica por ahorrador ', '', 1),
(46, '00100044', '', 'HERRERA HERNANDEZ JOSE ARMANDO', 'Ficha de depósito', '130-150', 300, 'Certificado de ahorro', 'S/F', 53743.62, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 54043.62, 37830.53, 37830.53, 'Iturbide num21', 'Barrio de San Miguel', 'Libres', 'S/D', 60, 'BD Analitica por ahorrador ', '', 1),
(47, '00100045', '', 'HUERTA VEGA ESPERANZA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12000.77, 8400.54, 8400.54, '2 dos norte num 51', 'Centro', 'Rafael Lara Grajales', 'S/D', 61, 'BD Analitica por ahorrador ', '', 1),
(48, '', '', '', 'Partes sociales', '509', 300, 'Certificado de ahorro', '544864', 11600.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 62, 'BD Analitica por ahorrador ', '', 1),
(49, '00100046', '', 'JIMENEZ SANCHEZ SIXTA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '545708', 9726.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9726.56, 6808.59, 6808.59, '2 norte num 50', 'Barrio Sto Entierro', 'Acajete', 'S/D', 63, 'BD Analitica por ahorrador ', '', 1),
(50, '00100047', '', 'JUAREZ DURAN JUAN', 'Partes sociales', '0160', 300, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42467', 39089.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 39389.6, 27572.72, 27572.72, '4 Poniente num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 64, 'BD Analitica por ahorrador ', '', 1),
(51, '00100048', '', 'JUAREZ JIMENEZ MARIA DE LOURDES', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 23408.15, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23408.15, 16385.71, 16385.71, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 65, 'BD Analitica por ahorrador ', '', 1),
(52, '00100049', '', 'JUAREZ JIMENEZ MARIA LAURA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 23081.29, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23081.29, 16156.9, 16156.9, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 66, 'BD Analitica por ahorrador ', '', 1),
(53, '00100050', '', 'JUAREZ NERI MARIA DEL CARMEN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20000, 14000, 14000, '6 Poniente num 310', 'Centro', 'Rafael Lara Grajales', 'S/D', 67, 'BD Analitica por ahorrador ', '', 1),
(54, '00100051', '', 'LOBATO BAEZ MARIANA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5100, 3570, 3570, '5 Poniente num 500', 'Loc Oriental', 'Oriental', 'S/D', 68, 'BD Analitica por ahorrador ', '', 1),
(55, '', '', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 69, 'BD Analitica por ahorrador ', '', 1),
(56, '', '', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 70, 'BD Analitica por ahorrador ', '', 1),
(57, '00100052', '', 'LOPEZ MAZAPILA DALILA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46809', 18967.9, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18967.9, 13277.53, 13277.53, 'Av Benito Juarez num 13', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 71, 'BD Analitica por ahorrador ', '', 1),
(58, '00100053', '', 'LOPEZ MORALES MARGARITA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47426', 150006, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150006, 105004.2, 105004.2, 'Cale 2 Pte num 13', 'Nopalucan', 'Nopalucan', 'S/D', 72, 'BD Analitica por ahorrador ', '', 1),
(59, '00100054', '', 'LOZANO SALAZAR GUILLERMINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42361', 20096.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20096.73, 14067.71, 14067.71, 'S/D', 'S/D', 'S/D', 'S/D', 73, 'BD Analitica por ahorrador ', '', 1),
(60, '00100055', '', 'MARQUEZ DURAN PEDRO ELOY', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 290000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 290000, 203000, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 74, 'BD Analitica por ahorrador ', '', 1),
(61, '00100056', '', 'MARQUEZ PEREZ ERICK', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46567', 289000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 289000, 202300, 167930, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 75, 'BD Analitica por ahorrador ', '', 1),
(62, '00100057', '', 'MARTINEZ GONZALEZ MARIBEL', 'Partes sociales', '0481', 300, 'Certificado de ahorro', 'S/F', 3191.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3491.77, 2444.24, 2444.24, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 76, 'BD Analitica por ahorrador ', '', 1),
(63, '00100058', '', 'MARTINEZ LOPEZ JOSE EZEQUIEL', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 63192.05, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 63192.05, 44234.44, 44234.44, 'Allende num 14', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 77, 'BD Analitica por ahorrador ', '', 1),
(64, '00100059', '', 'MARTINEZ MARTINEZ ALEJANDRO', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 24494.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24494.18, 17145.93, 17145.93, 'Colosio num 6', 'San Jose Ozumba', 'San Jose Chiapa', 'S/D', 78, 'BD Analitica por ahorrador ', '', 1),
(65, '00100060', '', 'MARTINEZ TORRES ANGEL', 'S/D', 'S/F', 0, 'Certificado de ahorro', '1029', 1635.02, 'Depósito a plazo fijo', '545462', 24906.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26541.68, 18579.18, 18579.18, 'S/D', 'S/D', 'S/D', 'S/D', 79, 'BD Analitica por ahorrador ', '', 1),
(66, '00100061', '', 'MAURICIO RODRIGUEZ FAUSTINO', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46888', 1456.94, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1456.94, 1019.86, 1019.86, '6 Sur num 705', 'B Virgen de la Luz', 'Acajete', 'S/D', 80, 'BD Analitica por ahorrador ', '', 1),
(67, '00100062', '', 'MENDEZ ALCANTARA AURORA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '547713', 7476.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7476.43, 5233.5, 5233.5, '3 poniente num 1', 'Centro', 'Rafael Lara Grajales', 'S/D', 81, 'BD Analitica por ahorrador ', '', 1),
(68, '00100063', '', 'MENDEZ ARMAS MARIA DE LOURDES', 'S/D', 'S/F', 0, 'S/D', 'S/F', 100, 'Depósito a plazo fijo', '10', 10001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10101, 7070.7, 7070.7, '3 Oriente s/n', 'San Jose Morelos', 'Libres', 'S/D', 82, 'BD Analitica por ahorrador ', '', 1),
(69, '00100064', '', 'MENDEZ LOZANO EZEQUIEL', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47163', 231326.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 231326.3, 161928.41, 161928.41, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 83, 'BD Analitica por ahorrador ', '', 1),
(70, '00100065', '', 'MENDEZ LOZANO MARGARITA', 'Partes sociales', '0149', 300, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '47336', 19292.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19592.91, 13715.04, 13715.04, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 84, 'BD Analitica por ahorrador ', '', 1),
(71, '00100066', '', 'MENDEZ ROQUE AURELIO IGNACIO', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47425', 164751, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 164751, 115325.7, 115325.7, '5 Norte num 203', 'Centro', 'Rafael Lara Grajales', 'S/D', 85, 'BD Analitica por ahorrador ', '', 1),
(72, '00100067', '', 'MONTES MARTINEZ JESUS', 'S/D', 'S/F', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', '0136000363', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Adolfo Lopez Mateos num915', 'San Juan Negrete', 'Tepeaca', '2231031283', 86, 'BD Analitica por ahorrador ', '', 1),
(73, '00100068', '', 'MORALES BONILLA FLORINA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '66947', 24236.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24336.38, 17035.47, 17035.47, '7 poniente s/n', 'B Virgen de la Luz', 'Acajete', 'S/D', 87, 'BD Analitica por ahorrador ', '', 1),
(74, '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '64247', 100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 88, 'BD Analitica por ahorrador ', '', 1),
(75, '00100069', '', 'MORALES HERNANDEZ AMBROCIO', 'S/D', 'S/F', 0, 'Recibo de depósito', '417', 54980, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 54980, 38486, 38486, 'Av Matamoros num 310', 'Juan de la Granja', 'Nopalucan', 'S/D', 89, 'BD Analitica por ahorrador ', '', 1),
(76, '00100070', '', 'MORALES MENDOZA JOSE ROSENDO', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 69213.58, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 69213.58, 48449.51, 48449.51, '9 Pte num 45', 'Centro', 'Rafael Lara Grajales', 'S/D', 90, 'BD Analitica por ahorrador ', '', 1),
(77, '00100071', '', 'NERI NICANOR RAUL JAVIER', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47303', 292201.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 292201.14, 204540.8, 167930, 'Av Emiliano Carranza num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 91, 'BD Analitica por ahorrador ', '', 1),
(78, '00100072', '', 'OCHOA SALAS JUAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '505', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 157042.94, 109930.06, 109930.06, 'Ayuntamiento num S/N', 'La Virgen de la Luz', 'Acajete', 'S/D', 92, 'BD Analitica por ahorrador ', '', 1),
(79, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '506', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 93, 'BD Analitica por ahorrador ', '', 1),
(80, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '507', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 94, 'BD Analitica por ahorrador ', '', 1),
(81, '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 47042.94, 'Depósito a plazo fijo', '510', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 95, 'BD Analitica por ahorrador ', '', 1),
(82, '00100073', '', 'ORTEGA BECERRIL RAFAEL', 'S/D', 'S/F', 0, 'Ficha universal', '545840', 2872.53, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2872.53, 2010.77, 2010.77, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 96, 'BD Analitica por ahorrador ', '', 1),
(83, '00100074', '', 'ORTEGA ROJAS ANGELA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46345', 8825.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8825.21, 6177.65, 6177.65, 'Av Del Sol num 15', 'Fracc Los Olivos', 'Tijuana BC', 'S/D', 97, 'BD Analitica por ahorrador ', '', 1),
(84, '00100075', '', 'ORTIZ PEREZ GABINO', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 28577.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 28577.56, 20004.29, 20004.29, '2 Norte num 73', 'Centro', 'Rafael Lara Grajales', 'S/D', 98, 'BD Analitica por ahorrador ', '', 1),
(85, '00100076', '', 'OSORIO HUERTA ARTURO', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 288524.83, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 288524.83, 201967.38, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 99, 'BD Analitica por ahorrador ', '', 1),
(86, '00100077', '', 'OSORIO SANTAMARIA EDUARDO', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 322648.46, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 322648.46, 225853.92, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 100, 'BD Analitica por ahorrador ', '', 1),
(87, '00100078', '', 'PEREZ DE LAZARO ISABEL', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 51337.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51337.4, 35936.18, 35936.18, '6 Pte no 21', 'Centro', 'Rafael Lara Grajales', 'S/D', 101, 'BD Analitica por ahorrador ', '', 1),
(88, '00100079', '', 'PEREZ LOZANO LUCRECIA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 1330.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1330.1, 931.07, 931.07, 'Av Lazaro Cardenas num 226', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 102, 'BD Analitica por ahorrador ', '', 1),
(89, '00100080', '', 'PEREZ PARRA ENCARNACION', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 258064.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 258064.3, 180645.01, 167930, '11 Sur num 31', 'Centro', 'Rafael Lara Grajales', 'S/D', 103, 'BD Analitica por ahorrador ', '', 1),
(90, '00100081', '', 'PEREZ VARGAS GABRIELA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47388', 148175, 'Depósito a plazo fijo', '46479', 916782.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1064957.21, 745470.05, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 104, 'BD Analitica por ahorrador ', '', 1),
(91, '00100082', '', 'PEREZ VARGAS ROMAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46740', 290000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 290000, 203000, 167930, '4 Norte no 1203', 'Centro', 'San Jose Chiapa', 'S/D', 105, 'BD Analitica por ahorrador ', '', 1),
(92, '00100083', '', 'PROYLAN BAEZ ALEJANDRO', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 150704.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150704.28, 105493, 105493, 'Av Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 106, 'BD Analitica por ahorrador ', '', 1),
(93, '00100084', '', 'RAMIREZ BARRALES MARICELA', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 29858, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 29858, 20900.6, 20900.6, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 107, 'BD Analitica por ahorrador ', '', 1),
(94, '00100085', '', 'RAMIREZ HERNANDEZ UBALDO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', '164-188', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, 'Cabo Franco num1299', 'Barrio Guadalupe', 'Libres', 'S/D', 108, 'BD Analitica por ahorrador ', '', 1),
(95, '00100086', '', 'RAMIREZ MELENDEZ JAVIER', 'S/D', 'S/F', 0, 'Certificado de ahorro', '545633', 17806.61, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17806.61, 12464.63, 12464.63, '2 norte num 28', 'Barrio Sto Entierro', 'Acajete', 'S/D', 109, 'BD Analitica por ahorrador ', '', 1),
(96, '00100087', '', 'RAMIREZ TAPIA FERNANDO', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 78368.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 78368.63, 54858.04, 54858.04, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 110, 'BD Analitica por ahorrador ', '', 1),
(97, '00100088', '', 'REYES GONZALEZ GUADALUPE', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 32391.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 32391.38, 22673.97, 22673.97, '14 Poniente s/n', 'Centro', 'Nopalucan', 'S/D', 111, 'BD Analitica por ahorrador ', '', 1),
(98, '00100089', '', 'ROCHA LOPEZ MOISES', 'S/D', 'S/F', 0, 'S/D', 'S/F', 13651.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13651.77, 9556.24, 9556.24, '2 Norte num 48', 'Centro', 'Rafael Lara Grajales', 'S/D', 112, 'BD Analitica por ahorrador ', '', 1),
(99, '00100090', '', 'RODRIGUEZ MENDOZA SILVIA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 141704, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 141704, 99192.8, 99192.8, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 113, 'BD Analitica por ahorrador ', '', 1),
(100, '00100091', '', 'ROMERO AVILA TERESA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 26405.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26405.31, 18483.72, 18483.72, 'Av 20 de Noviembre num 45', 'Grajales', 'Rafael Lara Grajales', 'S/D', 114, 'BD Analitica por ahorrador ', '', 1),
(101, '00100092', '', 'ROMERO MORALES MIGUEL', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 51769.04, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51769.04, 36238.33, 36238.33, '7 Sur num 43 Col Centro', 'Grajales', 'Rafael Lara Grajales', 'S/D', 115, 'BD Analitica por ahorrador ', '', 1),
(102, '00100093', '', 'ROMERO MORALES SOLEDAD', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46264', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40000, 28000, 28000, '9 Poniente num 28', 'Centro', 'Rafael Lara Grajales', 'S/D', 116, 'BD Analitica por ahorrador ', '', 1),
(103, '00100094', '', 'ROMERO PEREZ VICTORIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 6818.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20368.5, 14257.95, 14257.95, 'Av Francisco I Madero num 410', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 117, 'BD Analitica por ahorrador ', '', 1),
(104, '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'Depósito a plazo fijo', 'S/F', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 118, 'BD Analitica por ahorrador ', '', 1),
(105, '', '', '', 'Partes sociales', '603', 300, 'Certificado de ahorro', 'S/F', 150, 'Depósito a plazo fijo', 'S/F', 11000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 119, 'BD Analitica por ahorrador ', '', 1),
(106, '00100095', '', 'ROMERO SOSA MIGUEL', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 17067.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17067.96, 11947.57, 11947.57, 'Francisco I Madero num 720', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 120, 'BD Analitica por ahorrador ', '', 1),
(107, '00100096', '', 'SALAZAR VALENCIA MARIA OCOTLAN ENRIQUETA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 94600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 94600, 66220, 66220, '2 Pte no 52', 'Centro', 'Rafael Lara Grajales', 'S/D', 121, 'BD Analitica por ahorrador ', '', 1),
(108, '00100097', '', 'SANCHEZ HERNANDEZ IRENE', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 84703.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 84703.57, 59292.5, 59292.5, 'San Francisco s/n', 'Benito Juarez', 'Soltepec', 'S/D', 122, 'BD Analitica por ahorrador ', '', 1),
(109, '00100098', '', 'SANCHEZ HERNANDEZ RICARDA', 'Partes sociales', '0040', 300, 'Certificado de ahorro', 'S/F', 4245.52, 'Depósito a plazo fijo', '47159', 405300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 409845.52, 286891.86, 167930, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 123, 'BD Analitica por ahorrador ', '', 1),
(110, '00100099', '', 'SANCHEZ LEONARDO JOSE RODOLFO', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45929', 8855.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8855.56, 6198.89, 6198.89, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 124, 'BD Analitica por ahorrador ', '', 1),
(111, '00100100', '', 'SANCHEZ LOMELI VENTURA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '64904', 200, 'Depósito a plazo fijo', '65497', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20200, 14140, 14140, 'Miguel Hidalgo num 12', 'Isabel Tepetzala', 'Acajete', 'S/D', 125, 'BD Analitica por ahorrador ', '', 1),
(112, '00100101', '', 'SANCHEZ PEREZ JOSE ANDRES', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '18', 100001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100001, 70000.7, 70000.7, 'Cabo Franco num699', 'Barrio Guadalupe', 'Libres', '2764730574', 126, 'BD Analitica por ahorrador ', '', 1),
(113, '00100102', '', 'SARMIENTO HUERTA EVELIA', 'Ficha universal', '547379', 300, 'Certificado de ahorro', '516087', 24700, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25000, 17500, 17500, '5 norte num 17', 'Centro', 'Rafael Lara Grajales', 'S/D', 127, 'BD Analitica por ahorrador ', '', 1),
(114, '00100103', '', 'SARMIENTOS FERNANDEZ IRMA', 'Ficha de depósito', '188-216', 300, 'Ficha de depósito', '188216', 100, 'Ficha de depósito', '189-217', 19600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20000, 14000, 14000, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 128, 'BD Analitica por ahorrador ', '', 1),
(115, '00100104', '', 'SARMIENTOS LOPEZ OTILIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', '184-212', 10284.48, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10284.48, 7199.14, 7199.14, 'Calle sin nombre s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 129, 'BD Analitica por ahorrador ', '', 1),
(116, '00100105', '', 'SILVA BAUTISTA SEGIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '45315', 430000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 430000, 301000, 167930, '3 Oriente no 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 130, 'BD Analitica por ahorrador ', '', 1),
(117, '00100106', '', 'TORRES CRUZ MARIBEL', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 300914.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 300914.66, 210640.26, 167930, '7 Sur num 33', 'Centro', 'Rafael Lara Grajales', 'S/D', 131, 'BD Analitica por ahorrador ', '', 1),
(118, '00100107', '', 'UGARTE LOZANO JOSE LUIS', 'Partes sociales', '0322', 300, 'Ficha de depósito', 'S/F', 5868.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6168.3, 4317.81, 4317.81, '9 Poniente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 132, 'BD Analitica por ahorrador ', '', 1),
(119, '00100108', '', 'VALDIVIA BARRALES CAROLINA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 5068.62, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5068.62, 3548.03, 3548.03, '7 poniente s/n', 'Barrio de Jesus', 'Acajete', 'S/D', 133, 'BD Analitica por ahorrador ', '', 1),
(120, '00100109', '', 'VALENCIA BAEZ OSCAR', 'S/D', 'S/F', 0, 'Certificado de ahorro', '43597', 11768, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11768, 8237.6, 8237.6, 'Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 134, 'BD Analitica por ahorrador ', '', 1),
(121, '00100110', '', 'VARGAS VELEZ MARIA DEL ROSARIO SOLEDAD', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46827', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 200000, 140000, 140000, '5 norte num s/n', 'San Jose Chiapa', 'San Jose Chiapa', 'S/D', 135, 'BD Analitica por ahorrador ', '', 1),
(122, '00100111', '', 'VAZQUEZ PEREZ ROSA', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 69385.85, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 69385.85, 48570.1, 48570.1, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 136, 'BD Analitica por ahorrador ', '', 1),
(123, '00100112', '', 'VEDE PEREZ JOSE FERNANDO TRINIDAD', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '40571', 49640.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 49640.14, 34748.1, 34748.1, '14 Oriente s/n', 'Centro', 'San Jose Chiapa', 'S/D', 137, 'BD Analitica por ahorrador ', '', 1),
(124, '00100113', '', 'VILLEGAS BONILLA CLEMENCIA', 'Partes sociales ', '382', 300, 'Certificado de ahorro', '39418', 1928.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2228.21, 1559.75, 1559.75, 'S/D', 'San Bartolo Pinal', 'Acajete', 'S/D', 138, 'BD Analitica por ahorrador ', '', 1),
(125, '00200001', '', 'ABUNDIO SANCHEZ ESTELA ROSA', 'Partes sociales', '1923', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12500, 8750, 8750, 'Cuautilica s/n', 'Seccion tercera', 'Zoquitlan', '012383922524', 139, 'BD Analitica por ahorrador ', '', 1),
(126, '00200002', '', 'ALTAMIRANO LOPEZ MARIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2566', 2884000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4336000, 3035200, 167930, '2 Poniente num 201', 'Centro', 'Tehuacan', 'S/D', 140, 'BD Analitica por ahorrador ', '', 1),
(127, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2181', 1452000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 141, 'BD Analitica por ahorrador ', '', 1),
(128, '00200003', '', 'ALVAREZ ATILANO MARIA CATALINA', 'Partes sociales', '1631', 500, 'Certificado de ahorro', '2605', 5625, 'Depósito a plazo fijo', '2605', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 56125, 39287.5, 39287.5, 'Xicotencatl num219', 'Cuauhtemoc', 'Tehuacan', 'S/D', 142, 'BD Analitica por ahorrador ', '', 1),
(129, '00200004', '', 'ANSELMO RAMOS JULIAN', 'Partes sociales', '1627', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2632', 50712.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51212.5, 35848.75, 35848.75, 'Benito Juarez Sur s/n', 'Cuautotolapa', 'Ajalpan', 'S/D', 143, 'BD Analitica por ahorrador ', '', 1),
(130, '00200005', '', 'ANSELMO RIVERA EVA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73820', 17800, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30300, 21210, 21210, 'Zoquitlan s/n', 'Segunda Seccion', 'Tecpanzcoalco', 'S/D', 144, 'BD Analitica por ahorrador ', '', 1),
(131, '', '', '', 'Partes sociales', '2015', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73817', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 145, 'BD Analitica por ahorrador ', '', 1),
(132, '00200006', '', 'ANSELMO RIVERA TERESA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '120', 103700, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 152200, 106540, 106540, 'Zoquitlan s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 146, 'BD Analitica por ahorrador ', '', 1),
(133, '', '', '', 'Partes sociales', '5', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '113', 48000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 147, 'BD Analitica por ahorrador ', '', 1),
(134, '00200007', '', 'ARELLANO SANTIAGO MARGARITA', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'W5-171', 50000, 'S/D', '0', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, '26 Sur num 535', 'Venustiano Carranza', 'Tehuacan', 'S/D', 148, 'BD Analitica por ahorrador ', '', 1),
(135, '00200008', '', 'ARIAS HERNANDEZ JESUS DELFINO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2779', 8414.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8914.57, 6240.2, 6240.2, 'Camelia Oriente num 120', 'Francisco Sarabia', 'Tehuacan', 'S/D', 149, 'BD Analitica por ahorrador ', '', 1),
(136, '00200009', '', 'ARJONA PAVIA FANNY MARIA DE JESUS', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2374', 468000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 556297.26, 389408.08, 167930, '14 Oriente num 111', 'Buenos Aires', 'Tehuacan', 'S/D', 150, 'BD Analitica por ahorrador ', '', 1),
(137, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2374', 34697.26, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 151, 'BD Analitica por ahorrador ', '', 1),
(138, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2657', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 152, 'BD Analitica por ahorrador ', '', 1),
(139, '', '', '', 'Ficha de depósito', '434', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2674', 13100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 153, 'BD Analitica por ahorrador ', '', 1),
(140, '00200010', '', 'BACA LOPEZ FRANCISCO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1323', 500500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 501000, 350700, 167930, 'Ramon Corona num315', 'Reforma', 'Tehuacan', '1075375', 154, 'BD Analitica por ahorrador ', '', 1),
(141, '00200011', '', 'BAGLIETO MORA JUAN MANUEL', 'Partes sociales', '2229', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Privada 4 Norte 1825', 'Buenos Aires', 'Tehuacan', '238-383-23-34', 155, 'BD Analitica por ahorrador ', '', 1),
(142, '', '', '', 'Partes sociales', '8912', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 156, 'BD Analitica por ahorrador ', '', 1),
(143, '00200012', '', 'BARRIGUETE RAMIREZ CECILIO', 'Partes sociales', '2182', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1823', 80340, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 80840, 56588, 56588, 'Agustin Lara mza 132 Lote 1045', 'San Jose Tlahuac', 'Tehuacan', 'S/D', 157, 'BD Analitica por ahorrador ', '', 1),
(144, '00200013', '', 'BARTOLO VALERIO BERTHA INES', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4619', 18380.85, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18380.85, 12866.6, 12866.6, 'Avenida Nacional s/n', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 158, 'BD Analitica por ahorrador ', '', 1),
(145, '00200014', '', 'BARTOLO VALERIO CONCEPCION ROSARIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4633B', 78584.92, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 78584.92, 55009.44, 55009.44, '7 poniente num 303', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 159, 'BD Analitica por ahorrador ', '', 1),
(146, '00200015', '', 'BAUTISTA SERRANO JOSE JOEL', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '158', 31000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 31500, 22050, 22050, 'Juarez num221', 'Seccion primera', 'Zinacatepec', 'S/D', 160, 'BD Analitica por ahorrador ', '', 1),
(147, '00200016', '', 'BECERRA MACHADO FERNANDO Y/O HERNANDEZ HERNANDEZ VIRGINIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6285', 160000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 160000, 112000, 112000, '22 Norte num 619', 'San Rafael', 'Tehuacan', 'S/D', 161, 'BD Analitica por ahorrador ', '', 1),
(148, '00200017', '', 'BELLO MARTINEZ CELESTINO', 'Partes sociales', '1491', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2491', 193256.44, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 193756.44, 135629.51, 135629.51, 'Av 22 de Feb 423 Sauce 205', 'San Marcos', 'Azcapotzalco', 'S/D', 162, 'BD Analitica por ahorrador ', '', 1),
(149, '00200018', '', 'BENITEZ SAID JESUS', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10000, 7000, 7000, '16 Oriente num 109', 'Sarabia', 'Tehuacan', 'S/D', 163, 'BD Analitica por ahorrador ', '', 1),
(150, '00200019', '', 'BIBIANO JERONIMO ARTEMIO', 'Partes sociales', '1386', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2727', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Avenida Portes Gil num1022', 'San Nicolas', 'Tetitzintla', 'S/D', 164, 'BD Analitica por ahorrador ', '', 1),
(151, '00200020', '', 'BOLAÑOS MOGUEL ALFREDO DAMIAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8970', 576500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 920000, 644000, 167930, '20 Poniente 110', 'El Eden', 'Tehuacan', 'S/D', 165, 'BD Analitica por ahorrador ', '', 1),
(152, '', '', '', 'Partes sociales', '735', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8965', 343000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 166, 'BD Analitica por ahorrador ', '', 1),
(153, '00200021', '', 'BOLAÑOS MOGUEL FLOR VERONICA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '715', 97000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 97000, 67900, 67900, 'Lazaro Cardenas num2418', 'Francisco Villa', 'Tehuacan', 'S/D', 167, 'BD Analitica por ahorrador ', '', 1),
(154, '00200022', '', 'BONFIL MARTINEZ ROBERTA HERACLIA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 630.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1332.87, 933.01, 933.01, 'Zoquitlan s/n', 'Barrio 2', 'Zoquitlan', 'S/D', 168, 'BD Analitica por ahorrador ', '', 1),
(155, '', '', '', 'Partes sociales', '2008', 500, 'Certificado de ahorro', 'S/F', 201.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 169, 'BD Analitica por ahorrador ', '', 1),
(156, '00200023', '', 'BUENABAD CASTILLA JOSEFA', 'Partes sociales', '2250', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73877', 39919.23, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40419.23, 28293.46, 28293.46, 'San Sebastian Frontera S/N', 'Sebastian Frontera', 'Santiago Chazumba', 'S/D', 170, 'BD Analitica por ahorrador ', '', 1);
INSERT INTO `analiticasCertificadas` (`idanaliticasCertificadas`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `curp`, `basesCertificadas_idbasesCertificadas`) VALUES
(157, '00200024', '', 'CABRERA HERNANDEZ ELVIRA', 'Partes sociales', '2144', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73220', 20248.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20748.38, 14523.87, 14523.87, 'Av Vicente Guerrero num 307', 'Santa Maria Monte', 'Vicente Guerrero', 'S/D', 171, 'BD Analitica por ahorrador ', '', 1),
(158, '00200025', '', 'CACHO GARCIA BEATRIZ', 'Partes sociales', '733', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '159', 8500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, 'Reforma num 6', 'Centro', 'San Jose Miahuatlan', 'S/D', 172, 'BD Analitica por ahorrador ', '', 1),
(159, '00200026', '', 'CALDERON SOLIS REGINO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '60116', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10000, 7000, 7000, 'Venustiano Carranza num 24', 'Centro', 'Zinacatepec', 'S/D', 173, 'BD Analitica por ahorrador ', '', 1),
(160, '00200027', '', 'CAMACHO ALONSO JOSE JUAN', 'Partes sociales', '1522', 500, 'Ficha de depósito', 'S/F', 36595.02, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 37095.02, 25966.51, 25966.51, '12 Sur num 1930', '16 de Marzo', 'Tehuacan ', 'S/D', 174, 'BD Analitica por ahorrador ', '', 1),
(161, '00200028', '', 'CARRANZA MARIN PABLO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74027', 50333.33, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50833.33, 35583.33, 35583.33, 'Barrio Peña Blanca s/n', 'Peña Blanca', 'San Lucas Zoquiampan', 'S/D', 175, 'BD Analitica por ahorrador ', '', 1),
(162, '00200029', '', 'CARRERA CARRERA CATARINA AMPARO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8993', 177500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 187863.1, 131504.17, 131504.17, 'Josefa Ortiz de Dominguez num 547', 'Nicolas Bravo', 'Tehuacan', 'S/D', 176, 'BD Analitica por ahorrador ', '', 1),
(163, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72805', 10363.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 177, 'BD Analitica por ahorrador ', '', 1),
(164, '00200030', '', 'CARRERA LEZAMA FERNANDO MANUEL', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '69828', 36228.61, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36728.61, 25710.03, 25710.03, '13 Poniente num 434', 'Benito Juarez', 'Tehuacan', 'S/D', 178, 'BD Analitica por ahorrador ', '', 1),
(165, '00200031', '', 'CASTILLO ARCOS MODESTA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2419', 1300000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1300000, 910000, 167930, '2 norte num139', 'Zaragoza', 'Tehuacan', 'S/D', 179, 'BD Analitica por ahorrador ', '', 1),
(166, '00200032', '', 'CASTILLO GOMEZ DANIEL', 'Partes sociales', '1800', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '167', 2900000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2900500, 2030350, 167930, 'Priv 5 num Edif 2012', 'Los Pinos', 'Tehuacan', 'S/D', 180, 'BD Analitica por ahorrador ', '', 1),
(167, '00200033', '', 'CASTRO PANTZI ABEL ANDRES', 'Partes sociales', '1638', 83000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 83000, 58100, 58100, '5 de febrero sur num 532', 'Coculco', 'Ajalpan', 'S/D', 181, 'BD Analitica por ahorrador ', '', 1),
(168, '00200034', '', 'CERQUERA DE LA CRUZ CRISPIN', 'Partes sociales', '1337', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2405', 11566.16, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12066.16, 8446.31, 8446.31, '5 sur num917', 'Nicolas Bravo', 'Tehuacan', 'S/D', 182, 'BD Analitica por ahorrador ', '', 1),
(169, '00200035', '', 'CHAVEZ MARTINEZ MARIA LORENA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2499', 93000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93000, 65100, 65100, '9 Oriente num 905', 'La Purisima', 'Tehuacan', 'S/D', 183, 'BD Analitica por ahorrador ', '', 1),
(170, '00200036', '', 'CORREA REYES LORENA', 'Partes sociales', '1403', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2673', 12018.16, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12518.16, 8762.71, 8762.71, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 184, 'BD Analitica por ahorrador ', '', 1),
(171, '00200037', '', 'CORREA REYES MATILDE', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2730', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 70500, 49350, 49350, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 185, 'BD Analitica por ahorrador ', '', 1),
(172, '00200038', '', 'CORREO JUAREZ EDUARDO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72537', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8000, 5600, 5600, 'Mariano Matamoros num 177', 'Centro', 'San Gabriel Chilac', 'S/D', 186, 'BD Analitica por ahorrador ', '', 1),
(173, '00200039', '', 'CORTES REYES ISRAEL', 'Partes sociales', '1638', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6267', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Independencia num 6', 'San Juan Atzingo', 'San Gabriel Chilac', '012371052829', 187, 'BD Analitica por ahorrador ', '', 1),
(174, '00200040', '', 'CORTES REYES PEDRO PASCUAL', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '71832', 13200, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20700, 14490, 14490, 'Priv 15 norte num 22', 'Obreros Peñafiel', 'Teotitlan Flores', '2381374231', 188, 'BD Analitica por ahorrador ', '', 1),
(175, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2451', 7500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 189, 'BD Analitica por ahorrador ', '', 1),
(176, '00200041', '', 'CORTES LOPEZ JOSE', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2421', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, '6 Poniente num 511', 'Santiago Miahuatlan', 'Tehuacan', 'S/D', 190, 'BD Analitica por ahorrador ', '', 1),
(177, '00200042', '', 'CORTEZ COELLO CIRENIA', 'Partes sociales', '1407', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '70451', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Priv Maestro Aaron Joaquin num 2312', 'Mexico Sur', 'Coyomeapan', 'S/D', 191, 'BD Analitica por ahorrador ', '', 1),
(178, '00200043', '', 'CRUZ AVENDAÑO GONZALO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74061', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12500, 8750, 8750, '8 Norte 416', 'Serdan', 'Serdan', '012381085381', 192, 'BD Analitica por ahorrador ', '', 1),
(179, '00200044', '', 'CRUZ PARRA PAULINA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2648', 150000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150500, 105350, 105350, '13 Oriente Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 193, 'BD Analitica por ahorrador ', '', 1),
(180, '00200045', '', 'CUELLO MONTAL DIONISIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '75044', 131400.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 131900.66, 92330.46, 92330.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 194, 'BD Analitica por ahorrador ', '', 1),
(181, '00200046', '', 'DE JESUS HERNANDEZ JUANA', 'Partes sociales', '170', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '83', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Telpatlan s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 195, 'BD Analitica por ahorrador ', '', 1),
(182, '00200047', '', 'DE JESUS MACEDONIO FRANCISCO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4630B', 300000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 300000, 210000, 167930, 'Real num 203', 'Jose Maria Morelos', 'Tlachichuca', 'S/D', 196, 'BD Analitica por ahorrador ', '', 1),
(183, '00200048', '', 'DE LOS SANTOS SALINAS JOSE', 'S/D', 'S/F', 0, 'Ficha de depósito', 'W514244', 4000, 'Depósito a plazo fijo', '2590', 95000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 99000, 69300, 69300, '3 oriente num12', 'Centro', 'Atexcal', 'S/D', 197, 'BD Analitica por ahorrador ', '', 1),
(184, '00200049', '', 'DIAZ OSORIO JUAN', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74043', 109765.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 110265.77, 77186.04, 77186.04, 'Buena Vista s/n', 'Santa Maria Teopoxco', 'Santa Maria Teopoxco', 'S/D', 198, 'BD Analitica por ahorrador ', '', 1),
(185, '00200050', '', 'DIEGO GAYTAN ALEJANDRO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1693', 117500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 117500, 82250, 82250, 'Aeromexico num Lote 36', 'Aeropuerto', 'Tehuacan', 'S/D', 199, 'BD Analitica por ahorrador ', '', 1),
(186, '00200051', '', 'DUARTE HUITZITL AGRIPINA ALICIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1636', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, 'Zoquitlan s/n', 'Zoquitlan', 'Zoquitlan', 'S/D', 200, 'BD Analitica por ahorrador ', '', 1),
(187, '00200052', '', 'DUARTE OLMOS FIDENCIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1554', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50000, 35000, 35000, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 201, 'BD Analitica por ahorrador ', '', 1),
(188, '00200053', '', 'DURAN AVENDAÑO LEOVIGILDA', 'Partes sociales', '1759', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1713', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Republica Brazil num 2512', 'America', 'Tehuacan', 'S/D', 202, 'BD Analitica por ahorrador ', '', 1),
(189, '00200054', '', 'DURAN LOPEZ FLORENCIO LAZARO', 'Partes sociales', '1600', 500, 'Ficha de depósito', 'U142576', 41508.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 42008.73, 29406.11, 29406.11, 'Guerrero num 13', 'Cuauhtemoc', 'San Juan B Cuicatlan', 'S/D', 203, 'BD Analitica por ahorrador ', '', 1),
(190, '00200055', '', 'FERMIN HERNANDEZ ESTEBAN', 'Partes sociales', '2313', 500, 'Ficha de depósito', '701646', 8633.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9133.67, 6393.57, 6393.57, '1RA Priv 9 nte 7', 'Observatorio', 'Tehuacan', 'S/D', 204, 'BD Analitica por ahorrador ', '', 1),
(191, '00200056', '', 'FLORES ARCOS DOLORES', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1415', 175800, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 175800, 123060, 123060, 'Reforma Sur 700', 'Centro', 'Tehuacan', 'S/D', 205, 'BD Analitica por ahorrador ', '', 1),
(192, '00200057', '', 'FLORIAN COLMENARES DELIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1107', 1400000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1825343.19, 1277740.23, 167930, '3 era Privada de la 3 Oriente num10', 'El Mirador', 'Tehuacan', 'S/D', 206, 'BD Analitica por ahorrador ', '', 1),
(193, '', '', '', 'Partes sociales', '1459', 500, 'Certificado de ahorro', 'S/F', 224843.19, 'Depósito a plazo fijo', '1525', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 207, 'BD Analitica por ahorrador ', '', 1),
(194, '00200058', '', 'FLORIUK GONZALEZ MARIA EUGENIA', 'Partes sociales', '8963', 900000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 900000, 630000, 167930, '3 Sur 313 y 3 oriente', 'Centro', 'Tehuacan', '238-383-23-34', 208, 'BD Analitica por ahorrador ', '', 1),
(195, '00200059', '', 'GALVAN RODRIGUEZ ADELA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 7000, 'Depósito a plazo fijo', '2626', 16000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23500, 16450, 16450, 'Pipila num2027', 'Aeropuerto', 'Tehuacan', 'S/D', 209, 'BD Analitica por ahorrador ', '', 1),
(196, '00200060', '', 'GALVEZ GONZALEZ ELIA TRINIDAD', 'Partes sociales', '827', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2377', 19000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19500, 13650, 13650, '4 Oriente num 717 4', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 210, 'BD Analitica por ahorrador ', '', 1),
(197, '00200061', '', 'GALVEZ GONZALEZ MARIA DEL CARMEN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6274', 90000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 90000, 63000, 63000, '3 Norte num 211', 'Centro', 'Tehuacan', 'S/D', 211, 'BD Analitica por ahorrador ', '', 1),
(198, '00200062', '', 'GALVEZ GONZALEZ SOLEDAD', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 15424.16, 'S/D', '0', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15424.16, 10796.91, 10796.91, '3 norte num 211', 'Centro', 'Tehuacan', 'S/D', 212, 'BD Analitica por ahorrador ', '', 1),
(199, '00200063', '', 'GARCIA BRETON MARIA JOSEFINA EVARISTA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2330', 10892.55, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10892.55, 7624.79, 7624.79, 's/nombre s/n', 'Temaxcalapa', 'Cañada Morelos', 'S/D', 213, 'BD Analitica por ahorrador ', '', 1),
(200, '00200064', '', 'GARCIA GARCIA MARCELINA', 'Partes sociales', '3053', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '16518', 36633.15, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 37133.15, 25993.21, 25993.21, '13 Mza 103 LT 19', 'Valle de los Reyes', 'La Paz Mexico', 'S/D', 214, 'BD Analitica por ahorrador ', '', 1),
(201, '00200065', '', 'GARCIA LOPEZ CONSUELO', 'Partes sociales', '4777', 105000, 'Ficha de depósito', 'F11130', 3030.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 108030.38, 75621.27, 75621.27, '11 oriente num 741', 'Nicolas Bravo', 'Tehuacan', 'S/D', 215, 'BD Analitica por ahorrador ', '', 1),
(202, '00200066', '', 'GARCIA MARTINEZ JUANA', 'Partes sociales', '1605', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74076', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10500, 7350, 7350, 'Lerdo de Tejada num 924 Galeana Y 11 Poniente', 'Benito Juarez', 'Tehuacan', 'S/D', 216, 'BD Analitica por ahorrador ', '', 1),
(203, '00200067', '', 'GARCIA MARTINEZ RAYMUNDO', 'Partes sociales', '775', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73890', 15486.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15986.28, 11190.4, 11190.4, '26 Sur num 1936', 'Puebla', 'Tehuacan', 'S/D', 217, 'BD Analitica por ahorrador ', '', 1),
(204, '00200068', '', 'GASPAR GONZALEZ GORGONIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73809', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25500, 17850, 17850, 'Puerto de angel s/n', 'Puerto san Angel', 'Ajalpan', 'S/D', 218, 'BD Analitica por ahorrador ', '', 1),
(205, '', '', '', 'Partes sociales', '1986', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73816', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 219, 'BD Analitica por ahorrador ', '', 1),
(206, '00200069', '', 'GASPAR MONTALVO MAURA', 'Partes sociales', '1956', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '124', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3500, 2450, 2450, 'Puerto de angel s/n', 'Barrio Atempa', 'Ajalpan', 'S/D', 220, 'BD Analitica por ahorrador ', '', 1),
(207, '00200070', '', 'GINEZ GINEZ ADRIAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '84', 25305.35, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 123576.13, 86503.29, 86503.29, 'sin nombre s/n', 'Santa Maria Monte', 'Vicente Guerrero', '2361126582', 221, 'BD Analitica por ahorrador ', '', 1),
(208, '', '', '', 'Partes sociales', '2116', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '85', 97770.78, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 222, 'BD Analitica por ahorrador ', '', 1),
(209, '00200071', '', 'GONZALEZ GARCIA CONRADO AUSENCIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1703', 51900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51900, 36330, 36330, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 223, 'BD Analitica por ahorrador ', '', 1),
(210, '00200072', '', 'GONZALEZ GIL MARIANO', 'Partes sociales', '2223', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1674', 20869.24, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21369.24, 14958.47, 14958.47, 'Morelos num17', 'Barrio Gonzalisco', 'Ajalpan', 'S/D', 224, 'BD Analitica por ahorrador ', '', 1),
(211, '00200073', '', 'GONZALEZ MONTALVO RIGOBERTO', 'Partes sociales', '1501275', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '32681', 8500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, '4 Oriente 117', 'Centro', 'Tehuacan', '238-383-23-34', 225, 'BD Analitica por ahorrador ', '', 1),
(212, '00200074', '', 'GORDILLO JIMENEZ VELINO', 'Partes sociales', '905', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1544', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 500500, 350350, 167930, '16 de septiembre num913', 'Hidalgo', 'Tehuacan', 'S/D', 226, 'BD Analitica por ahorrador ', '', 1),
(213, '00200075', '', 'HERNANDEZ ANASTACIO SERAFINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74049', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 66817.38, 46772.17, 46772.17, 'Callejon Jacarandas num 12', 'Aeropuerto', 'Tehuacan', 'S/D', 227, 'BD Analitica por ahorrador ', '', 1),
(214, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74092', 36817.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 228, 'BD Analitica por ahorrador ', '', 1),
(215, '00200076', '', 'HERNANDEZ BENITEZ HERON REMIGIO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2736', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Avenida 5 de mayo num11', 'Centro', 'Cañada Morelos', 'S/D', 229, 'BD Analitica por ahorrador ', '', 1),
(216, '00200077', '', 'HERNANDEZ ESPINOZA ALBERTA', 'Partes sociales', '1522', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1542', 26780, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 27280, 19096, 19096, 'Cerrada de Amdo Nervo num8', 'La Purisima', 'Tehuacan', 'S/D', 230, 'BD Analitica por ahorrador ', '', 1),
(217, '00200078', '', 'HERNANDEZ GONZALEZ JUANA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1602', 61300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 90600, 63420, 63420, 'Vicente Guerrero s/n', 'Villa Nueva', 'Santa Maria Teopoxco', 'S/D', 231, 'BD Analitica por ahorrador ', '', 1),
(218, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1541', 29300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 232, 'BD Analitica por ahorrador ', '', 1),
(219, '00200079', '', 'HERNANDEZ HERNANDEZ ARACELI', 'Partes sociales', '2277', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1551', 18173.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18673.99, 13071.79, 13071.79, '5 norte num110', 'Centro', 'Tehuacan', 'S/D', 233, 'BD Analitica por ahorrador ', '', 1),
(220, '00200080', '', 'HERNANDEZ HERNANDEZ MARIA MARGARITA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '43748', 4476.52, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4976.52, 3483.56, 3483.56, 'Priv Atlixco num 1913', 'San Juan Bautista', 'Cuicatlan', '1071257', 234, 'BD Analitica por ahorrador ', '', 1),
(221, '00200081', '', 'HERNANDEZ OLAYA GUADALUPE DELFINA', 'Partes sociales', '732', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '10139', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Benito Juarez 513', 'Centro', 'Zinacatepec', '012362811431', 235, 'BD Analitica por ahorrador ', '', 1),
(222, '00200082', '', 'HERNANDEZ REYES MARIA AGUSTINA', 'Ficha de depósito ', 'W5-12258', 500, 'Certificado de ahorro', 'S/F', 36370, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36870, 25809, 25809, 'Priv Miguel Hidalgo num 623 Int 1', 'San Lorenzo Teopilco', 'Tehuacan', 'S/D', 236, 'BD Analitica por ahorrador ', '', 1),
(223, '00200083', '', 'HUERTA ALVAREZ ROSA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 260000, 182000, 167930, '2 Oriente num 712', 'Centro', 'Tehuacan', 'S/D', 237, 'BD Analitica por ahorrador ', '', 1),
(224, '', '', '', 'Partes sociales', '5352', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 238, 'BD Analitica por ahorrador ', '', 1),
(225, '', '', '', 'Partes sociales', '5327', 134500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 239, 'BD Analitica por ahorrador ', '', 1),
(226, '', '', '', 'Partes sociales', '5328', 75000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 240, 'BD Analitica por ahorrador ', '', 1),
(227, '00200084', '', 'HUERTA ROMUALDO ISAAC', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Pino Suarez num 327', 'Jesus Carranza', 'Zinacatepec', 'S/D', 241, 'BD Analitica por ahorrador ', '', 1),
(228, '', '', '', 'Partes sociales', '10135', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 242, 'BD Analitica por ahorrador ', '', 1),
(229, '00200085', '', 'JIMENEZ RIVERA SIBILINA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 158555.13, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 159055.13, 111338.59, 111338.59, 'Privada Nacional Lote 49', 'Vista hermosa', 'Teotipilco', '23610445555', 243, 'BD Analitica por ahorrador ', '', 1),
(230, '00200086', '', 'JUANA GASPAR MONTALVO', 'Partes sociales', '1992', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73815', 33100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 33600, 23520, 23520, 'El mirador s/n', 'El mirado', 'Ajalpan', 'S/D', 244, 'BD Analitica por ahorrador ', '', 1),
(231, '00200087', '', 'JUAREZ SANCHEZ CLEMENCIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2670', 216500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 216500, 151550, 151550, 'Quinta Privada 6 Oriente num619', 'Quinta Guadalupe', 'Tehuacan', 'S/D', 245, 'BD Analitica por ahorrador ', '', 1),
(232, '00200088', '', 'JULITA HERNANDEZ MAGDALENA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 20300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20300, 14210, 14210, '16 de Septiembre num 101', 'Zentlapatl', 'Zinacatepec', '012361121232', 246, 'BD Analitica por ahorrador ', '', 1),
(233, '00200089', '', 'LADINO GARCIA PATRICIA', 'Partes sociales', '11435', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18815.97, 13171.18, 13171.18, 'Lazaro Cardenas num 904 B', 'El Riego', 'Tehuacan', 'S/D', 247, 'BD Analitica por ahorrador ', '', 1),
(234, '', '', '', 'Ficha de depósito', '11436', 18315.97, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 248, 'BD Analitica por ahorrador ', '', 1),
(235, '00200090', '', 'LARA MARTINEZ GERMAN', 'Partes sociales', '1400', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 249547.79, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 250047.79, 175033.45, 167930, 'Sor Juana Ines de la Cruz num 3512', 'Fracc Cultural', 'Tehuacan', 'S/D', 249, 'BD Analitica por ahorrador ', '', 1),
(236, '00200091', '', 'LEYVA OLMOS CARMELA', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'S/F', 6020.32, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6520.32, 4564.22, 4564.22, 'Porfirio Diaz num1201', 'Centro', 'Zinacatepec', 'S/D', 250, 'BD Analitica por ahorrador ', '', 1),
(237, '00200092', '', 'LEYVA PACHECO GREGORIO', 'Partes sociales', '731', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '151', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Privada Guerrero 806 int5', 'Centro', 'Zinacatepec', 'S/D', 251, 'BD Analitica por ahorrador ', '', 1),
(238, '00200093', '', 'LEZAMA FERNANDEZ JUDITH SULLY', 'Partes sociales', '922', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 149587.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150087.93, 105061.55, 105061.55, 'Privada de la 6 oriente num 19 int 6', 'Centro', 'Tehuacan', 'S/D', 252, 'BD Analitica por ahorrador ', '', 1),
(239, '00200094', '', 'LEZAMA TOBON JOSE', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2705', 150000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150000, 105000, 105000, 'Callejon Hidalgo no 520', 'La Pedrera', 'Tehuacan', 'S/D', 253, 'BD Analitica por ahorrador ', '', 1),
(240, '00200095', '', 'LIMA LEON TEODORO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8978', 600000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 652500, 456750, 167930, 'Priv 7 sur andador 3 56', 'La purisima', 'Tehuacan', '012383830713', 254, 'BD Analitica por ahorrador ', '', 1),
(241, '', '', '', 'Partes sociales', '695', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', '901481', 52000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 255, 'BD Analitica por ahorrador ', '', 1),
(242, '00200096', '', 'LOPEZ GARCIA ROBERTO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60500, 42350, 42350, '4 Sur num 1120', 'Benito Juarez', 'Tehuacan', 'S/D', 256, 'BD Analitica por ahorrador ', '', 1),
(243, '', '', '', 'Partes sociales', '6262', 60000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 257, 'BD Analitica por ahorrador ', '', 1),
(244, '00200097', '', 'LOPEZ GAYOSSO EZEQUIEL', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'W515774', 5457.46, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5957.46, 4170.22, 4170.22, 'Justo Sierra num3708', 'Cultural', 'Tehuacan', 'S/D', 258, 'BD Analitica por ahorrador ', '', 1),
(245, '00200098', '', 'LOPEZ HERNANDEZ GERARDO', 'Partes sociales', '1524', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'W6-15548', 56083.32, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 56583.32, 39608.32, 39608.32, 'Gardenia num 4115', 'Villa Vista', 'Tehuacan', 'S/D', 259, 'BD Analitica por ahorrador ', '', 1),
(246, '00200099', '', 'LOPEZ SANCHEZ PETRA', 'Partes sociales', '6222', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50000, 35000, 35000, 'Puerto de Veracruz 2128', 'Revolucion', 'Tehuacan', 'S/D', 260, 'BD Analitica por ahorrador ', '', 1),
(247, '00200100', '', 'LUCAS MORALES LEONARDO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2683.06, 'Depósito a plazo fijo', '53473', 8407.17, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11590.23, 8113.16, 8113.16, 'Privada 19 sur num 1913', 'Las Flores', 'Tehuacan', '012383838246', 261, 'BD Analitica por ahorrador ', '', 1),
(248, '00200101', '', 'LUNA CARRETO SILVIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'W5-15646', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Privada Amado Nervo num 331', 'La Purisima', 'Tehuacan', 'S/D', 262, 'BD Analitica por ahorrador ', '', 1),
(249, '00200102', '', 'MALCON OROZCO GUADALUPE', 'Partes sociales', '1501236', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1681', 193886.26, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 194386.26, 136070.38, 136070.38, 'Privada la Paz num119', 'Centro', 'Tehuacan', '3823944', 263, 'BD Analitica por ahorrador ', '', 1),
(250, '00200103', '', 'MALDONADO QUINTANA RAMON', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1649', 350000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 350000, 245000, 167930, 'De la 6 Oriente num 602', 'Francisco Sarabia', 'Tehuacan', 'S/D', 264, 'BD Analitica por ahorrador ', '', 1),
(251, '00200104', '', 'MARCELINO HERNANDEZ CARMELITA JOAQUINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2464', 14500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 14500, 10150, 10150, 'Venustiano Carranza num 714', 'Sentlalpal', 'Zinacatepec', 'S/D', 265, 'BD Analitica por ahorrador ', '', 1),
(252, '00200105', '', 'MARCELINO HERNANDEZ GORGONIO FELIPE', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12500, 8750, 8750, '16 de Septiembre num 504', 'Barr Zentlapatl', 'Zincatepec', 'S/D', 266, 'BD Analitica por ahorrador ', '', 1),
(253, '00200106', '', 'MARTINEZ GARCIA CAROLINA', 'Partes sociales', '6280', 150000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150000, 105000, 105000, 'Hector Lezama Sur Roca 337', 'La Purisima', 'Tehuacan', 'S/D', 267, 'BD Analitica por ahorrador ', '', 1),
(254, '00200107', '', 'MARTINEZ JIMENEZ DANIELA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1732', 1500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1500000, 1050000, 167930, 'Biarritz num 116', 'Arcadia', 'Tehuacan', 'S/D', 268, 'BD Analitica por ahorrador ', '', 1),
(255, '00200108', '', 'MARTINEZ MORFINEZ MARIA ANGELICA', 'Partes sociales', '1405', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '62404', 11007, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11507, 8054.9, 8054.9, 'C Matamoros num 10', 'Centro', 'San Gabriel Chilac', 'S/D', 269, 'BD Analitica por ahorrador ', '', 1),
(256, '00200109', '', 'MARTINEZ VALERIO MIGUEL ANGEL GERMAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1695', 1000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1000000, 700000, 167930, 'Priv Biarritz num 116', 'Fracc Arcadia', 'Tehuacan', 'S/D', 270, 'BD Analitica por ahorrador ', '', 1),
(257, '00200110', '', 'MENDOZA DIEGO MAGARITA INES', 'Partes sociales', '1131', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'W56258', 9500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10000, 7000, 7000, 'Venustiano Carranza num 1908', '16 de Marzo', 'Tehuacan', 'S/D', 271, 'BD Analitica por ahorrador ', '', 1),
(258, '00200111', '', 'MIGUEL SANTIAGO OMEGA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8997', 900000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 900000, 630000, 167930, 'Macario Gaxiola edif 27 202', 'U Hab las Armas', 'Azcapotzalco', 'S/D', 272, 'BD Analitica por ahorrador ', '', 1),
(259, '00200112', '', 'MOLINA GOMEZ LUCIO', 'Partes sociales', '76', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 442443.53, 309710.47, 167930, '5 sur esq con 11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', 'S/D', 273, 'BD Analitica por ahorrador ', '', 1),
(260, '', '', '', 'Partes sociales', '4605B', 441943.53, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 274, 'BD Analitica por ahorrador ', '', 1),
(261, '00200113', '', 'MOLINA LOPEZ JULIA AMALIA', 'Partes sociales', '75', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 306928.88, 214850.22, 167930, '11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', '012383830001', 275, 'BD Analitica por ahorrador ', '', 1),
(262, '', '', '', 'Pagaré', '4604', 306428.88, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 276, 'BD Analitica por ahorrador ', '', 1),
(263, '00200114', '', 'MONTALVO ANSELMO AMBROCIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2250', 325500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 325500, 227850, 167930, 'Tepexilotla s/n', 'Seccion Tercera', 'Zoquitlan', 'S/D', 277, 'BD Analitica por ahorrador ', '', 1),
(264, '00200115', '', 'MORAL CANO GONZALO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73819', 36600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36600, 25620, 25620, 'Primera Seccion', 'Barrio Zacapechco', 'Zoquitlan', 'S/D', 278, 'BD Analitica por ahorrador ', '', 1),
(265, '00200116', '', 'MORALES JIMENEZ HERMINIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2728', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Guadalupe Victoria num1640', 'Aeropuerto', 'Tehuacan', '2381133641', 279, 'BD Analitica por ahorrador ', '', 1),
(266, '00200117', '', 'MORALES ROJAS ALFREDO VICTOR', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'S/F', 238300.12, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 238800.12, 167160.08, 167160.08, '12 poniente num617', 'Lazaro Cardena Norte', 'Tehuacan', 'S/D', 280, 'BD Analitica por ahorrador ', '', 1),
(267, '00200118', '', 'MORENO ANGELA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 20000, 'Depósito a plazo fijo', '2761', 159117.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 179617.63, 125732.34, 125732.34, 'Privada Nacional LT 49A', 'Vista Hermosa', 'Tehuacan', 'S/D', 281, 'BD Analitica por ahorrador ', '', 1),
(268, '00200119', '', 'OLAYA ROMERO SOCORRO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '154', 112900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 163400, 114380, 114380, 'Benito Juarez num513', 'Centro', 'Zinacatepec', 'S/D', 282, 'BD Analitica por ahorrador ', '', 1),
(269, '', '', '', 'Partes sociales', '580', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '155', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 283, 'BD Analitica por ahorrador ', '', 1),
(270, '00200120', '', 'OLMOS DORANTES DULCE MARIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2589', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Juquilita Lote 5', 'Maldonado Colosio', 'Tehuacan', 'S/D', 284, 'BD Analitica por ahorrador ', '', 1),
(271, '00200121', '', 'OLMOS VALENCIA LEONARDO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2597', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150500, 105350, 105350, 'Ocotlamanic s/n', 'Ocotla', 'Coxcatlan', 'S/D', 285, 'BD Analitica por ahorrador ', '', 1),
(272, '', '', '', 'Partes sociales', '1030', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2598', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 286, 'BD Analitica por ahorrador ', '', 1),
(273, '00200122', '', 'ORTIZ JIMENEZ VIRGINIA ORTENCIA', 'Partes sociales', '1957', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72771', 35400, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 35900, 25130, 25130, 'Av 5 de mayo num 5', 'Seccion cuarta', 'Zoquitlan', 'S/D', 287, 'BD Analitica por ahorrador ', '', 1),
(274, '00200123', '', 'OSORIO GUZMAN HERLINDA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6288', 350000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 350000, 245000, 167930, 'Del panteon s/n', 'San Juan Atzingo', 'San Gabriel Chilac', 'S/D', 288, 'BD Analitica por ahorrador ', '', 1),
(275, '00200124', '', 'PARRA GARRERA MARTHA', 'Partes sociales', '1419', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2490', 60000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60500, 42350, 42350, '13 Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 289, 'BD Analitica por ahorrador ', '', 1),
(276, '00200125', '', 'PASTRANA SOLIS FROYLAN', 'Partes sociales', '1640', 500, 'Certificado de ahorro', 'S/F', 3006.44, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3506.44, 2454.51, 2454.51, '18 Poniente num 818', 'Tetizintla', 'Tehuacan', 'S/D', 290, 'BD Analitica por ahorrador ', '', 1),
(277, '00200126', '', 'PEREZ MENDEZ MATEO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1784', 4247652, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10557652, 7390356.4, 167930, 'Reforma norte num 127', 'Centro', 'Tehuacan', 'S/D', 291, 'BD Analitica por ahorrador ', '', 1),
(278, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '3806', 2310000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 292, 'BD Analitica por ahorrador ', '', 1),
(279, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '65566', 2000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 293, 'BD Analitica por ahorrador ', '', 1),
(280, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1110', 2000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 294, 'BD Analitica por ahorrador ', '', 1),
(281, '00200127', '', 'PEREZ NAVA ADRIANA', 'Partes sociales', '12065', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '420', 31500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 32000, 22400, 22400, 'Corregidora num2', 'San Jose Tilapa', 'Coxcatlan', 'S/D', 295, 'BD Analitica por ahorrador ', '', 1),
(282, '00200128', '', 'QUIXTIANO COGQUE MIGUEL', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1684', 410989, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 410989, 287692.3, 167930, 'Revolucion num 415', 'Guadalupe', 'Ajalpan', 'S/D', 296, 'BD Analitica por ahorrador ', '', 1),
(283, '00200129', '', 'QUIXTIANO TEMAXTE SOFIA', 'Partes sociales', '2224', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1675', 68501, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 69001, 48300.7, 48300.7, 'Revolucion Poniente num17', 'Centro', 'Ajalpan', 'S/D', 297, 'BD Analitica por ahorrador ', '', 1),
(284, '00200130', '', 'RABAGO BALBUENA MARIA CONCEPCION JOSEFINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4627-B', 2841262.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3650262.43, 2555183.7, 167930, 'Av Reforma Sur num 317', 'Centro', 'Tehuacan', 'S/D', 298, 'BD Analitica por ahorrador ', '', 1),
(285, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1692', 309000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 299, 'BD Analitica por ahorrador ', '', 1),
(286, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '170', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 300, 'BD Analitica por ahorrador ', '', 1),
(287, '00200131', '', 'RAMIREZ BAUTISTA OLGA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '65682', 26050, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26550, 18585, 18585, 'Manuel Hernandez num 804', 'Xaltepec', 'Altepexi', 'S/D', 301, 'BD Analitica por ahorrador ', '', 1),
(288, '00200132', '', 'RAMIREZ CABRERA CONCEPCION', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2748', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, '10 Poniente num 405', 'Cerritos', 'Tehuacan', 'S/D', 302, 'BD Analitica por ahorrador ', '', 1),
(289, '00200133', '', 'RAMIREZ CARRERA MARIA DEL SOCORRO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2622', 115000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 115500, 80850, 80850, '10 Poniente num407', 'Cerritos', 'Tehuacan', 'S/D', 303, 'BD Analitica por ahorrador ', '', 1),
(290, '00200134', '', 'RAMIREZ CORDOVA EULALIA', 'Partes sociales', '40', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '60248', 8500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, 'Zoquitlan s/n', 'Tercera Seccion', 'Tecpanzcoalco', 'S/D', 304, 'BD Analitica por ahorrador ', '', 1),
(291, '00200135', '', 'RAMIREZ DOMINGUEZ GRECIA CAROLINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2409', 220000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 220000, 154000, 154000, 'Avenida Ramon Caballero num641', 'San Rafael', 'Tehuacan', 'S/D', 305, 'BD Analitica por ahorrador ', '', 1),
(292, '00200136', '', 'RAMIREZ GARCIA NORBERTO', 'Partes sociales', '2010', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '110', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Seccion seguda num', 'Loma Ixmicapa', 'Zoquitlan', 'S/D', 306, 'BD Analitica por ahorrador ', '', 1),
(293, '00200137', '', 'RAMIREZ PAZOS JORGE', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 689335.31, 'Depósito a plazo fijo', '1702', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 889835.31, 622884.72, 167930, 'Prol 1 poniente 3000', 'Fracc Reforma', 'Tehuacan', 'S/D', 307, 'BD Analitica por ahorrador ', '', 1),
(294, '00200138', '', 'RAMIREZ VAQUERO ROMUALDO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2079', 160000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 160000, 112000, 112000, 'Ramon Caballero num 611', 'San Rafael', 'Tehuacan', 'S/D', 308, 'BD Analitica por ahorrador ', '', 1),
(295, '00200139', '', 'RCHING RAMIREZ SOCORRO SOLEDAD', 'Partes sociales', '1500891', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1352', 421223.78, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 421723.78, 295206.65, 167930, 'Avenida Reforma Sur sn', 'Guadalupe Hidalgo', 'Tehuacan', '3717275', 309, 'BD Analitica por ahorrador ', '', 1),
(296, '00200140', '', 'REYES VENTURA ANGELICA', 'Partes sociales', '2154', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'MH-15629', 36122.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36622.21, 25635.55, 25635.55, 'Independencia num 32', 'Centro', 'Tehuacan', 'S/D', 310, 'BD Analitica por ahorrador ', '', 1),
(297, '00200141', '', 'RODRIGUEZ ARCE RICARDA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2338', 4359.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15761.4, 11032.98, 11032.98, 'Ocotlamanic s/n', 'Ocotlamanic', 'Coxcatlan', 'S/D', 311, 'BD Analitica por ahorrador ', '', 1),
(298, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2688', 10902.22, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 312, 'BD Analitica por ahorrador ', '', 1),
(299, '00200142', '', 'RODRIGUEZ ARCE TAURINO ANGELES', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74083', 116420.65, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 116420.65, 81494.46, 81494.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 313, 'BD Analitica por ahorrador ', '', 1),
(300, '00200143', '', 'RODRIGUEZ CUELLO ROLANDO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6279', 147000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 147000, 102900, 102900, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 314, 'BD Analitica por ahorrador ', '', 1),
(301, '00200144', '', 'RODRIGUEZ MOLINA ROSA', 'Pagaré', '4611', 542483.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 542483.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1084966.56, 759476.59, 167930, '11 Ote num 500 Esquina con 5 Sur', 'Nicolas Bravo', 'Tehuacan', 'S/D', 315, 'BD Analitica por ahorrador ', '', 1),
(302, '00200145', '', 'ROMERO CID MARIA', 'Partes sociales', '859', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '64952', 12200, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12700, 8890, 8890, 'Nacional num 83 1A Secc', 'Nicolas Bravo', 'Tehuacan', 'S/D', 316, 'BD Analitica por ahorrador ', '', 1),
(303, '00200146', '', 'ROMERO DUARTE TAURINO CARLOS', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73854', 73651.32, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 73651.32, 51555.92, 51555.92, 'Av Rafael Avila Camacho num 227', 'Centro', 'San Gabriel Chilac', 'S/D', 317, 'BD Analitica por ahorrador ', '', 1),
(304, '00200147', '', 'ROSALES VILLANUEVA ROSARIO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1700', 370000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 370500, 259350, 167930, 'Heroes de Nacozari Norte num 124 Int 1', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 318, 'BD Analitica por ahorrador ', '', 1),
(305, '00200148', '', 'RUIZ FLORES MARTHA NANCY Y/O FlORES GARCIA PAULINA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 30000, 'Depósito a plazo fijo', '2775', 38000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 68500, 47950, 47950, 'Av Nicolas Bravo num 702', 'Nicolas Bravo', 'Tehuacan', 'S/D', 319, 'BD Analitica por ahorrador ', '', 1),
(306, '00200149', '', 'SAENZ ESCALANTE GUSTAVO', 'Partes sociales', '6292', 2000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 14270000, 9989000, 167930, 'Bould Ingeniero Pastor Rouaix num 700', 'Benito Juarez', 'Tehuacan', 'S/D', 320, 'BD Analitica por ahorrador ', '', 1),
(307, '', '', '', 'Partes sociales', '6242', 4000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 321, 'BD Analitica por ahorrador ', '', 1),
(308, '', '', '', 'Partes sociales', '4123', 3000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 322, 'BD Analitica por ahorrador ', '', 1),
(309, '', '', '', 'Partes sociales', '6255', 1000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 323, 'BD Analitica por ahorrador ', '', 1),
(310, '', '', '', 'Partes sociales', '74077', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 324, 'BD Analitica por ahorrador ', '', 1),
(311, '', '', '', 'Partes sociales', '74059', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 325, 'BD Analitica por ahorrador ', '', 1),
(312, '', '', '', 'Partes sociales', '74074', 1000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 326, 'BD Analitica por ahorrador ', '', 1),
(313, '', '', '', 'Partes sociales', '6256', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 327, 'BD Analitica por ahorrador ', '', 1),
(314, '', '', '', 'Partes sociales', '6293', 1000000, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74078', 1500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 328, 'BD Analitica por ahorrador ', '', 1),
(315, '00200150', '', 'SALINAS FLORES HERIBERTO CARLOS', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 61310.56, 'Depósito a plazo fijo', '2472', 54000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 115810.56, 81067.39, 81067.39, '5 norte num642', 'Cerritos', 'Tehuacan', 'S/D', 329, 'BD Analitica por ahorrador ', '', 1);
INSERT INTO `analiticasCertificadas` (`idanaliticasCertificadas`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `curp`, `basesCertificadas_idbasesCertificadas`) VALUES
(316, '00200151', '', 'SANCHEZ COELLO CATALINA JAQUELINA', 'Partes sociales', '63', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '121', 17900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18400, 12880, 12880, 'Zoquitlan s/n', 'Tecpantzacualco', 'Zoquitlan', 'S/D', 330, 'BD Analitica por ahorrador ', '', 1),
(317, '00200152', '', 'SANCHEZ HERNANDEZ CARLOS', 'Partes sociales', '1511', 500, 'Certificado de ahorro', 'S/F', 5141.7, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5641.7, 3949.19, 3949.19, 'Republica de Panama num 2325', 'America', 'Cuicatlan', 'S/D', 331, 'BD Analitica por ahorrador ', '', 1),
(318, '00200153', '', 'SANCHEZ MENDEZ FAUSTINO', 'Partes sociales', '1556', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6276', 50500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51000, 35700, 35700, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 332, 'BD Analitica por ahorrador ', '', 1),
(319, '00200154', '', 'SANCHEZ MONTALVO CATALINA', 'Ficha de depósito', '1437', 500, 'Ficha de depósito', 'W515535', 12006.58, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12506.58, 8754.61, 8754.61, 'Salinas num 28', 'Chalma', 'Tehuacan', 'S/D', 333, 'BD Analitica por ahorrador ', '', 1),
(320, '00200155', '', 'SANCHEZ MONTALVO FLORENCIO', 'Partes sociales', '2190', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73896', 25540.41, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26040.41, 18228.29, 18228.29, '7 Sur 1106 Santa Maria 1106', 'Centro', 'Tehuacan', 'S/D', 334, 'BD Analitica por ahorrador ', '', 1),
(321, '00200156', '', 'SANCHEZ RAMOS LETICIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74047', 31000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 31500, 22050, 22050, 'Callejon Pachuca num 5', 'Hidalgo Tehuantepec', 'Tehuacan', 'S/D', 335, 'BD Analitica por ahorrador ', '', 1),
(322, '00200157', '', 'SANCHEZ ROMERO ARCENIO IGNACIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1753', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15975, 11182.5, 11182.5, 'Vicente Guerrero lt-6', '21 de Marzo', 'Tehuacan', 'S/D', 336, 'BD Analitica por ahorrador ', '', 1),
(323, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '530', 975, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 337, 'BD Analitica por ahorrador ', '', 1),
(324, '00200158', '', 'SANCHEZ SANCHEZ LEOPOLDO', 'Partes sociales', 'S/F', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 500000, 350000, 167930, 'Nicolas Bravo num 19 A', 'Loc San Jose Ixtapa', 'Cañada Morelos', 'S/D', 338, 'BD Analitica por ahorrador ', '', 1),
(325, '00200159', '', 'SANDOVAL ATILANO GILBERTO', 'Partes sociales', '1911', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '125', 35000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 35500, 24850, 24850, 'Tepeaca de Zaragoza s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 339, 'BD Analitica por ahorrador ', '', 1),
(326, '00200160', '', 'SANDOVAL GONZALEZ EMILIANO', 'Partes sociales', '1999', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '118', 36000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36500, 25550, 25550, 'Domicilio conocido s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 340, 'BD Analitica por ahorrador ', '', 1),
(327, '00200161', '', 'SANDOVAL QUIAHUA LEONARDO', 'Partes sociales', '2141', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 90500, 63350, 63350, 'San Bartolo s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 341, 'BD Analitica por ahorrador ', '', 1),
(328, '', '', '', 'Partes sociales', '10006', 90000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 342, 'BD Analitica por ahorrador ', '', 1),
(329, '00200162', '', 'SANTIAGO LOPEZ EMMA MARIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1767', 643500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 643500, 450450, 167930, 'Andador 3/1', 'La Purisima', 'Tehuacan', 'S/D', 343, 'BD Analitica por ahorrador ', '', 1),
(330, '00200163', '', 'SERAFIN MONTALVO EMMA', 'Partes sociales', '1983', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '96', 35000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 35500, 24850, 24850, 'Playa Vicente s/n', 'Playa Vicente', 'Ajalpan', 'S/D', 344, 'BD Analitica por ahorrador ', '', 1),
(331, '00200164', '', 'TAPIA HERNANDEZ FILADELFIA', 'Partes sociales', '0349', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '75289', 22253.42, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 22753.42, 15927.39, 15927.39, 'Reforma num 89', 'San Jose del Chilar', 'Cuicatlan', 'S/D', 345, 'BD Analitica por ahorrador ', '', 1),
(332, '00200165', '', 'TEMOXTLE GARCIA EUFEMIA', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', '90-1865', 15003.28, 'S/D', '0', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15503.28, 10852.3, 10852.3, 'Av Morelos num 2', 'Zacapanga', 'Vicente Guerrero', 'S/D', 346, 'BD Analitica por ahorrador ', '', 1),
(333, '00200166', '', 'TENORIO CARRILLO LUZ MARIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72793', 73573.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 94490, 66143, 66143, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', '012383831718', 347, 'BD Analitica por ahorrador ', '', 1),
(334, '', '', '', 'Partes sociales', '709', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73869', 20416.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 348, 'BD Analitica por ahorrador ', '', 1),
(335, '00200167', '', 'TENORIO GARCIA SANDRA LUCY', 'Ficha de depósito', '781', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1716', 21145, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21645, 15151.5, 15151.5, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 349, 'BD Analitica por ahorrador ', '', 1),
(336, '00200168', '', 'TORRES ALVA GUILLERMO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2707', 26122.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26622.21, 18635.55, 18635.55, 'Dom Conocido s/n', 'Seccion Cuarta', 'Zoquitlan', 'S/D', 350, 'BD Analitica por ahorrador ', '', 1),
(337, '00200169', '', 'TRUJILLO MORENO RAFAELA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1615', 43812.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 43812.4, 30668.68, 30668.68, '2 Poniente num 1617', 'Aquiles Serdan', 'Tehuacan', 'S/D', 351, 'BD Analitica por ahorrador ', '', 1),
(338, '00200170', '', 'VALENCIA PEREZ ANGELA', 'Partes sociales', '1402', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1482', 14591, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15091, 10563.7, 10563.7, 'Centenario num 42', 'Centro', 'San Jeronimo Teocatl', 'S/D', 352, 'BD Analitica por ahorrador ', '', 1),
(339, '00200171', '', 'VALERIO FUENTES CAMILA MARINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4636', 159000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 159000, 111300, 111300, 'Av 7 sur num 205', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 353, 'BD Analitica por ahorrador ', '', 1),
(340, '00200172', '', 'VARELA ROMAN MARCO ANTONIO', 'Partes sociales', '1010', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1738', 162000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 162500, 113750, 113750, '8 Pte num Edficio 404 Int DTO 303', 'Fovisst Garci Crespo', 'Tehuacan', 'S/D', 354, 'BD Analitica por ahorrador ', '', 1),
(341, '00200173', '', 'VARELA ROMAN MARIA TERESA', 'Partes sociales', '1501164', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1664', 1101000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1101500, 771050, 167930, '3 oriente', 'Centro', 'Tehuacan', '3835231', 355, 'BD Analitica por ahorrador ', '', 1),
(342, '00200174', '', 'VARELA ROMAN SERAFINA ENCARNACION', 'Partes sociales', '983', 500, 'Certificado de ahorro', 'S/F', 350188.4, 'Depósito a plazo fijo', '1724', 346071.06, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 696759.46, 487731.62, 167930, '3 Norte num 1612', 'Francisco Sarabia', 'Tehuacan', 'S/D', 356, 'BD Analitica por ahorrador ', '', 1),
(343, '00200175', '', 'VARILLAS CASTRO JOSE EDUARDO FAUSTO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6257', 195500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 230994.82, 161696.37, 161696.37, 'Independencia num 4', 'San Jose Buena Vista', 'Tlacotepec', 'S/D', 357, 'BD Analitica por ahorrador ', '', 1),
(344, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74097', 30277.52, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 358, 'BD Analitica por ahorrador ', '', 1),
(345, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 5217.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 359, 'BD Analitica por ahorrador ', '', 1),
(346, '00200176', '', 'VEGA COELLO ANDRES ELEAZAR', 'Partes sociales', '11', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '128', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30500, 21350, 21350, 'Obregon s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 360, 'BD Analitica por ahorrador ', '', 1),
(347, '00200177', '', 'VIVEROS MONTALVO JORGIN ALICIA', 'Partes sociales', '1996', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73802', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5500, 3850, 3850, 'Av Nacional num 12', 'Segunda Seccion', 'Zoquitlan', 'S/D', 361, 'BD Analitica por ahorrador ', '', 1),
(348, '00200178', '', 'ZAQUEROS COELLO ERASTO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1393', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15000, 10500, 10500, 'Cacaloc s/n', 'Xala', 'Zoquitlan', 'S/D', 362, 'BD Analitica por ahorrador ', '', 1),
(349, '00200179', '', 'ZARATE BARRAGAN EPIGMENIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72784', 330767.75, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 330767.75, 231537.43, 167930, '7 Oriente num112', 'Francisco I Madero', 'Tepanco de Lopez', 'S/D', 363, 'BD Analitica por ahorrador ', '', 1),
(350, '00200180', '', 'ZARATE RAMOS MARGARITA', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'S/F', 15000, 'Depósito a plazo fijo', '2533', 37874, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 53374, 37361.8, 37361.8, 'Nuevo Leon Sur num1914', 'Mexico', 'Tehuacan', 'S/D', 364, 'BD Analitica por ahorrador ', '', 1),
(351, '00300001', '', 'AGUIRRE MORALES ERIKA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1939.79, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2439.79, 1707.85, 1707.85, '5 de Mayo 91', 'Monte Chiquito', 'Santiago Miahuatlan', 'S/D', 365, 'BD Analitica por ahorrador ', '', 1),
(352, '00300002', '', 'ALTA ARANDIA LEONOR', 'Recibo de depósito', '115-1-14', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3500, 2450, 2450, '28 Oriente 534', 'Santiago Tula', 'Tehuacan', 'S/D', 366, 'BD Analitica por ahorrador ', '', 1),
(353, '00300003', '', 'ALTA MARTINEZ TERESA', 'Recibo de depósito', '115-1-16', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-002', 15826.12, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16326.12, 11428.28, 11428.28, 'Agua Axoxopan 2100 B', 'Villas Agua Blanca', 'Tehuacan', 'S/D', 367, 'BD Analitica por ahorrador ', '', 1),
(354, '00300004', '', 'ALVARADO SOLANO MANUELA HORTENCIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '007008', 222000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 222500, 155750, 155750, '3 Sur 1301', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 368, 'BD Analitica por ahorrador ', '', 1),
(355, '00300005', '', 'ANASTACIO ALFONSO HERMELINDO', 'Recibo de depósito', '11515', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 351386.26, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 351886.26, 246320.38, 167930, '17 de Septiembre 28', 'Hidalgo', 'Teotitlan', 'S/D', 369, 'BD Analitica por ahorrador ', '', 1),
(356, '00300006', '', 'ANDRADE JUSTINIANO MINERVA', 'Recibo de depósito', '5065', 500, 'Recibo de depósito', '5913', 10383.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10883.63, 7618.54, 7618.54, '4 Sur 702', 'Centro', 'Tecamachalco', 'S/D', 370, 'BD Analitica por ahorrador ', '', 1),
(357, '00300007', '', 'APOLINAR PACHECO PABLO', 'Partes sociales', '60473', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '60474', 97500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 98000, 68600, 68600, 'Vicente Guerrero 1108', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 371, 'BD Analitica por ahorrador ', '', 1),
(358, '00300008', '', 'ARISTA HERNANDEZ CRISTINA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '009-006', 186824.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 187324.73, 131127.31, 131127.31, 'Nahoas 17', 'Ancon', 'La Paz Mexico', 'S/D', 372, 'BD Analitica por ahorrador ', '', 1),
(359, '00300009', '', 'ARISTA HERNANDEZ HERLINDA', 'Partes sociales', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006002', 26200, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 180213.06, 126149.14, 126149.14, 'Buena Vista 2512', 'El Humilladero', 'Tehuacan', 'S/D', 373, 'BD Analitica por ahorrador ', '', 1),
(360, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '007001', 33400, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 374, 'BD Analitica por ahorrador ', '', 1),
(361, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '008001', 26924, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 375, 'BD Analitica por ahorrador ', '', 1),
(362, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006005', 30050, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 376, 'BD Analitica por ahorrador ', '', 1),
(363, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '007003', 34990.06, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 377, 'BD Analitica por ahorrador ', '', 1),
(364, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '008002', 28149, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 378, 'BD Analitica por ahorrador ', '', 1),
(365, '00300010', '', 'ATENOGENEZ GUERRERO MICAELA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006006', 8796.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9296.31, 6507.42, 6507.42, 'Casa Blanca 1', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 379, 'BD Analitica por ahorrador ', '', 1),
(366, '00300011', '', 'BARRAGAN GERALDO HIPOLITO', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11517', 11464.94, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11964.94, 8375.46, 8375.46, '6 Sur', 'Marcos Necoxtla', 'Tehuacan', 'S/D', 380, 'BD Analitica por ahorrador ', '', 1),
(367, '00300012', '', 'BARRAGAN RIVERA CELIA CONCEPCION', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115123', 10737.08, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11237.08, 7865.96, 7865.96, 'Av Nacional Oriente 111', 'Maria Pinosuarez', 'Tehuacan', 'S/D', 381, 'BD Analitica por ahorrador ', '', 1),
(368, '00300013', '', 'BAUTISTA OLIVARES CATALINA AVERTINA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '004017', 52000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 52500, 36750, 36750, 'San Luis Temalacayuca', 'Luis Temalacayuca', 'Tepanco de Lopez', 'S/D', 382, 'BD Analitica por ahorrador ', '', 1),
(369, '00300014', '', 'BOLAÑOS CORTES CLAUDIA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '11516', 2879.15, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3379.15, 2365.41, 2365.41, 'Miguel Hidalgo 14', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 383, 'BD Analitica por ahorrador ', '', 1),
(370, '00300015', '', 'BRAVO HERNANDEZ RICARDA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 95500, 66850, 66850, '25 Oriente 923', 'Nicolas Bravo 3ra Se', 'Tehuacan', 'S/D', 384, 'BD Analitica por ahorrador ', '', 1),
(371, '', '', '', 'Ficha de depósito', '193005', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 385, 'BD Analitica por ahorrador ', '', 1),
(372, '00300016', '', 'CAMACHO TORRES JUAN FRANCISCO', 'Recibo de depósito', '11515', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 70500, 49350, 49350, 'Prol 4 Sur 2100', 'Industrial', 'Santa Maria Coapan', 'S/D', 386, 'BD Analitica por ahorrador ', '', 1),
(373, '00300017', '', 'CARPINTEYRO DE JESUS HORTENCIA', 'Partes sociales', '11516', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 11479.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11979.4, 8385.58, 8385.58, 'Av 15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 387, 'BD Analitica por ahorrador ', '', 1),
(374, '00300018', '', 'CARRERA JUAREZ IVON', 'Recibo de depósito', 'S/F', 500, 'Recibo de depósito', '11514', 218.43, 'Recibo de depósito', '004001', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30718.43, 21502.9, 21502.9, 'Iturbide 124', 'Tepanco de Lopez', 'Tlacotepec', 'S/D', 388, 'BD Analitica por ahorrador ', '', 1),
(375, '00300019', '', 'CASTAÑEDA MENDEZ CATALINA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-15', 3794.79, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4294.79, 3006.35, 3006.35, 'Dalia 4605', 'Antonio Viveros', 'Tehuacan', 'S/D', 389, 'BD Analitica por ahorrador ', '', 1),
(376, '00300020', '', 'CASTAÑEDA VALENCIA GREGORIO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2134, 'Recibo de depósito', '005-001', 38500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 41134, 28793.8, 28793.8, 'Av Hidalgo 45', 'Cuayucatepec', 'Tehuacan', 'S/D', 390, 'BD Analitica por ahorrador ', '', 1),
(377, '00300021', '', 'CASTILLO PEREZ CARLOS', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-8', 12249.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12749.93, 8924.95, 8924.95, 'Sagrado Corazon de Jesus 7', 'Zentlapatl', 'Zinacatepec', 'S/D', 391, 'BD Analitica por ahorrador ', '', 1),
(378, '00300022', '', 'CECILIO EUSEVIO GENOVEVA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11519', 24777.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25277.18, 17694.03, 17694.03, 'Juarez Poniente 138', 'Maria Coapan', 'Tehuacan', 'S/D', 392, 'BD Analitica por ahorrador ', '', 1),
(379, '00300023', '', 'CLEMENTE ROMERO GUADALUPE CARMEN', 'Recibo de depósito', '11513', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 11557.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12057.5, 8440.25, 8440.25, '7 Oriente 4', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 393, 'BD Analitica por ahorrador ', '', 1),
(380, '00300024', '', 'CONTRERAS PACHECO CATALINA', 'Recibo de depósito', '115130', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005003', 100001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100501, 70350.7, 70350.7, '25 de Febrero 919', 'Observatorio', 'Tepanco de Lopez', '2381272213', 394, 'BD Analitica por ahorrador ', '', 1),
(381, '00300025', '', 'CONTRERAS VAZQUEZ OCOTLAN', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 966.51, 'Recibo de depósito', '004006', 29837.17, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 31303.68, 21912.58, 21912.58, 'Leon Guzman 334', 'Reforma', 'Tehuacan', 'S/D', 395, 'BD Analitica por ahorrador ', '', 1),
(382, '00300026', '', 'CORTES DOLORES MARCELA RAQUEL', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11518', 2268.41, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2768.41, 1937.89, 1937.89, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 396, 'BD Analitica por ahorrador ', '', 1),
(383, '00300027', '', 'CORTEZ PEREZ ALBERTINA', 'Recibo de depósito', '115-1-35', 500, 'Recibo de depósito', '115-1-10', 6497.61, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6997.61, 4898.33, 4898.33, 'Viente Guerrero 155', 'San Lorezno Teopilco', 'Tehuacan', 'S/D', 397, 'BD Analitica por ahorrador ', '', 1),
(384, '00300028', '', 'CORTEZ RAMIREZ ROSA', 'Recibo de depósito', '115-1-9', 500, 'Recibo de depósito', '115-1-18', 6030.52, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6530.52, 4571.36, 4571.36, '7 Poniente 230', 'La Pedrera', 'Tehuacan', 'S/D', 398, 'BD Analitica por ahorrador ', '', 1),
(385, '00300029', '', 'CRUZ DE LA CRUZ JOSE ALFREDO', 'Recibo de depósito', '115-1-30', 500, 'Recibo de depósito', '115-1-4', 5494.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5994.6, 4196.22, 4196.22, 'Centenario 500', 'Hidalgo', 'Tehuacan', 'S/D', 399, 'BD Analitica por ahorrador ', '', 1),
(386, '00300030', '', 'CRUZ VILLEGAS ERNESTINA LEONOR', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 21000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 46500, 32550, 32550, 'Privada 25 dur 123', 'El Rosario', 'Tehuacan', 'S/D', 400, 'BD Analitica por ahorrador ', '', 1),
(387, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005009', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 401, 'BD Analitica por ahorrador ', '', 1),
(388, '00300031', '', 'DE JESUS MENDOZA GENOVEBA MARGARITA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 99500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, '15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 402, 'BD Analitica por ahorrador ', '', 1),
(389, '00300032', '', 'DE LA CRUZ ZUÑIGA EDITH', 'S/D', 'S/F', 0, 'Recibo de depósito', '5872', 23280.54, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23280.54, 16296.38, 16296.38, '17 Sur 703', 'San Sebastian', 'Tecamachalco', 'S/D', 403, 'BD Analitica por ahorrador ', '', 1),
(390, '00300033', '', 'DOMINGUEZ LUCAS ROSALIA', 'Recibo de depósito', '115126', 500, 'Recibo de depósito', '115119', 8980.8, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9480.8, 6636.56, 6636.56, '22 Poniente 2416', 'San Rafael', 'Ahuatempan', 'S/D', 404, 'BD Analitica por ahorrador ', '', 1),
(391, '00300034', '', 'ENRIQUE BRAVO CECILIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005002', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15500, 10850, 10850, 'Isabel la catolica 725', 'Morelos', 'Tehuacan', 'S/D', 405, 'BD Analitica por ahorrador ', '', 1),
(392, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004017', 5500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 406, 'BD Analitica por ahorrador ', '', 1),
(393, '00300035', '', 'ESPINOZA PACHECO FRANCISCO CONSTANTINO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 21000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 407, 'BD Analitica por ahorrador ', '', 1),
(394, '00300036', '', 'FLORES RODRIGUEZ ELIAS', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005005', 179184.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 179184.99, 125429.49, 125429.49, '11 Norte 113', 'Independencia', 'Tehuacan', 'S/D', 408, 'BD Analitica por ahorrador ', '', 1),
(395, '00300037', '', 'FLORES RODRIGUEZ JAVIER', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '010006', 600000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 600000, 420000, 167930, '7 Norte 2000', 'Emiliano Zapata', 'Tehuacan', 'S/D', 409, 'BD Analitica por ahorrador ', '', 1),
(396, '00300038', '', 'FLORES VERA PATRICIA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 9096.22, 'Recibo de depósito', '004012', 26660.81, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36257.03, 25379.92, 25379.92, 'Av Zacatecas 4', 'Tlacuitlapan', 'Tlacotepec', 'S/D', 410, 'BD Analitica por ahorrador ', '', 1),
(397, '00300039', '', 'FLORES VERA RUFINA', 'S/D', 'S/F', 0, 'Certificado de ahorro', '115137', 34467.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 34467.4, 24127.18, 24127.18, '6 Sur 3', 'Seccion Tercera', 'Tlacotepec', 'S/D', 411, 'BD Analitica por ahorrador ', '', 1),
(398, '00300040', '', 'FUENTES GONZALEZ ABELINO NICOLAS', 'Recibo de depósito', '115-1-26', 500, 'Recibo de depósito', '115-1-19', 500, 'Recibo de depósito', '115-1-36', 400, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1400, 980, 980, 'Mariano Matamoros 120', 'Centro', 'San Gabriel Chilac', 'S/D', 412, 'BD Analitica por ahorrador ', '', 1),
(399, '00300041', '', 'FUENTES NARVAEZ JULIANA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115125', 1613.51, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2113.51, 1479.46, 1479.46, 'Sonora Sur 1504', 'Mexico Sur', 'Tehuacan', 'S/D', 413, 'BD Analitica por ahorrador ', '', 1),
(400, '00300042', '', 'GARCIA CHAVEZ DIANA ASUNCION', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '64552', 10579.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11079.71, 7755.8, 7755.8, 'Priv Las Dalias 8', 'El Eden', 'Tehuacan', 'S/D', 414, 'BD Analitica por ahorrador ', '', 1),
(401, '00300043', '', 'GARCIA CRUZ EUFEMIA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 1620.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1620.14, 1134.1, 1134.1, '14 Pte 807 Int A', 'SanRafael', 'Tehuacan', 'S/D', 415, 'BD Analitica por ahorrador ', '', 1),
(402, '00300044', '', 'GARCIA DE LA LUZ XOCHITL', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115126', 3007.33, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3507.33, 2455.13, 2455.13, 'Alvaro Obregon 50', 'Centro', 'Coxcatlan', 'S/D', 416, 'BD Analitica por ahorrador ', '', 1),
(403, '00300045', '', 'GARCIA FLORES ANTONINA TEODULA', 'S/D', 'S/F', 0, 'Recibo de depósito', '115121', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25000, 17500, 17500, '15 Norte 108', 'Obrero Peñafiel', 'Tehuacan', 'S/D', 417, 'BD Analitica por ahorrador ', '', 1),
(404, '00300046', '', 'GARCIA GARCIA CLAUDIA', 'Recibo de depósito', '115-1-13', 500, 'Certificado de ahorro', 'S/F', 8024.18, 'Depósito a plazo fijo', 'S/F', 2229.68, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10753.86, 7527.7, 7527.7, 'Miguel Hidalgo 2331', 'America', 'Tehuacan', 'S/D', 418, 'BD Analitica por ahorrador ', '', 1),
(405, '00300047', '', 'GARCIA GONZALEZ MARIA ALICIA SOTERA', 'S/D', 'S/F', 0, 'Recibo de depósito', '115113', 40950, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50920.38, 35644.27, 35644.27, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 419, 'BD Analitica por ahorrador ', '', 1),
(406, '', '', '', 'S/D', 'S/F', 500, 'Recibo de depósito', '115114', 9470.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 420, 'BD Analitica por ahorrador ', '', 1),
(407, '00300048', '', 'GARCIA HERNANDEZ MARIO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005006', 156557.48, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 157057.48, 109940.24, 109940.24, '11 Sur 511', 'La Purisima', 'Tehuacan', 'S/D', 421, 'BD Analitica por ahorrador ', '', 1),
(408, '00300049', '', 'GARCIA MARTINEZ FELICITAS', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5500, 3850, 3850, '15 Sur 318', 'La Purisima', 'Tehuacan', 'S/D', 422, 'BD Analitica por ahorrador ', '', 1),
(409, '00300050', '', 'GARCIA REYES ELENA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005002', 825.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2367.84, 1657.49, 1657.49, '26 Sur 2526', '3 de Mayo', 'Tehuacan', 'S/D', 423, 'BD Analitica por ahorrador ', '', 1),
(410, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 1042.74, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 424, 'BD Analitica por ahorrador ', '', 1),
(411, '00300051', '', 'GARCIA REYES ZEFERINO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004007', 7315, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7815, 5470.5, 5470.5, '3A priv De la 26 sur 2604', '3 de Mayo', 'Tehuacan', 'S/D', 425, 'BD Analitica por ahorrador ', '', 1),
(412, '00300052', '', 'GARCIA RODRIGUEZ IGNACIO FRANCISCO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '6002', 36000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 61500, 43050, 43050, 'Oriente', 'Lomas de Romero', 'Tecamachalco', 'S/D', 426, 'BD Analitica por ahorrador ', '', 1),
(413, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '4004', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 427, 'BD Analitica por ahorrador ', '', 1),
(414, '00300053', '', 'GARCIA SORCIA ENRIQUETA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006-001', 17132.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17632.71, 12342.9, 12342.9, 'Alvaro Obregon 817', 'Francisco Sarabia', 'Tehuacan', 'S/D', 428, 'BD Analitica por ahorrador ', '', 1),
(415, '00300054', '', 'GIL ALVARADO MERCEDES', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 7424.63, 'Recibo de depósito', '007001', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17924.63, 12547.24, 12547.24, 'Adolfo Lopez Mateos 804', '16 de Marzo', 'Tehuacan', 'S/D', 429, 'BD Analitica por ahorrador ', '', 1),
(416, '00300055', '', 'GOMEZ RODRIGUEZ SERGIO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 50001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50001, 35000.7, 35000.7, '23 Sur 2314', 'Granjas de Oriente', 'Tehuacan', 'S/D', 430, 'BD Analitica por ahorrador ', '', 1),
(417, '00300056', '', 'GONZALES MORALES MOISES LUIS', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004010', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15500, 10850, 10850, 'Allende Poniente 104', 'Maria Coapan', 'Tehuacan', 'S/D', 431, 'BD Analitica por ahorrador ', '', 1),
(418, '00300057', '', 'GONZALEZ BAUTISTA FRANCISCO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 10962.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11462.28, 8023.6, 8023.6, 'Priv 2 sur 5', 'Nativitas Cuautempan', 'Coyotepec', 'S/D', 432, 'BD Analitica por ahorrador ', '', 1),
(419, '00300058', '', 'GONZALEZ VAZQUEZ MARIA YOLANDA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-010', 40502.41, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 87092.13, 60964.49, 60964.49, '3 Oriente 506 Int 6', 'Centro', 'Tehuacan', 'S/D', 433, 'BD Analitica por ahorrador ', '', 1),
(420, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-004', 5305.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 434, 'BD Analitica por ahorrador ', '', 1),
(421, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-005', 35372.65, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 435, 'BD Analitica por ahorrador ', '', 1),
(422, '', '', '', 'Recibo de depósito', '116-1-4', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-006', 5411.51, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 436, 'BD Analitica por ahorrador ', '', 1),
(423, '00300059', '', 'GUZMAN MENDEZ FLOR DE MARIA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-30', 21106.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21606.66, 15124.66, 15124.66, 'San Luis Potosi 4', 'Tlacotepec', 'Tlacotepec', 'S/D', 437, 'BD Analitica por ahorrador ', '', 1),
(424, '00300060', '', 'HERNANDEZ ANGEL LETICIA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-17', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5500, 3850, 3850, 'Guerrero 700', 'Francisco I Madero', 'Chapulco', 'S/D', 438, 'BD Analitica por ahorrador ', '', 1),
(425, '00300061', '', 'HERNANDEZ CRUZ JUAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004008', 110000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1345000, 941500, 167930, 'Lerdo de Tejada 3', 'Tilapa', 'Coxcatlan', 'S/D', 439, 'BD Analitica por ahorrador ', '', 1),
(426, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004006', 1235000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 440, 'BD Analitica por ahorrador ', '', 1),
(427, '00300062', '', 'HERNANDEZ GARCI CATALINA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115117', 13402.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13902.91, 9732.04, 9732.04, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 441, 'BD Analitica por ahorrador ', '', 1),
(428, '00300063', '', 'HERNANDEZ MARISCAL GLORIA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2584.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3084.99, 2159.49, 2159.49, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 442, 'BD Analitica por ahorrador ', '', 1),
(429, '00300064', '', 'HERNANDEZ MARISCAL GUADALUPE', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004005', 8721.88, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24673.06, 17271.14, 17271.14, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 443, 'BD Analitica por ahorrador ', '', 1),
(430, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004004', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 444, 'BD Analitica por ahorrador ', '', 1),
(431, '', '', '', 'Ficha de depósito', '58762', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004003', 5451.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 445, 'BD Analitica por ahorrador ', '', 1),
(432, '00300065', '', 'HERNANDEZ MARISCAL JUAN MANUEL', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 632.63, 'Depósito a plazo fijo', 'S/F', 2435.69, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3568.32, 2497.82, 2497.82, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 446, 'BD Analitica por ahorrador ', '', 1),
(433, '00300066', '', 'IBAÑEZ DURAN RUPERTO', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-8', 7700, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18200, 12740, 12740, 'Conocido ', 'Catarina Otzolotepec', 'Tehuacan', 'S/D', 447, 'BD Analitica por ahorrador ', '', 1),
(434, '', '', '', 'Recibo de depósito', '115-1-7', 500, 'Recibo de depósito', '115-1-8', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 448, 'BD Analitica por ahorrador ', '', 1),
(435, '00300067', '', 'INIESTRA HERRERA AMELIA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 60000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60500, 42350, 42350, '16 Poniente 2809', 'San Rafael', 'Tehuacan', 'S/D', 449, 'BD Analitica por ahorrador ', '', 1),
(436, '00300068', '', 'JIMENEZ HUERTA NORBERTA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 7835.87, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8335.87, 5835.11, 5835.11, 'Venustiano Carranza no 1316', 'Libertad', 'Tehuacan', 'S/D', 450, 'BD Analitica por ahorrador ', '', 1),
(437, '00300069', '', 'JIMENEZ PEREZ MELITON', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115114', 41054.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 41554.1, 29087.87, 29087.87, '15 de Mayo 52', 'San Isidro', 'Santiago Miahuatlan', 'S/D', 451, 'BD Analitica por ahorrador ', '', 1),
(438, '00300070', '', 'JUAREZ MARTINEZ ROSA MARIA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115111', 50264.83, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50764.83, 35535.38, 35535.38, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 452, 'BD Analitica por ahorrador ', '', 1),
(439, '00300071', '', 'LEINES ANDRADE CRISTINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004006', 12619.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30576.26, 21403.38, 21403.38, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 453, 'BD Analitica por ahorrador ', '', 1),
(440, '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 5840.36, 'Recibo de depósito', '004005', 12116.59, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 454, 'BD Analitica por ahorrador ', '', 1),
(441, '00300072', '', 'LEYNES HERNANDEZ FRANCISCA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004005', 5832.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6922.72, 4845.9, 4845.9, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 455, 'BD Analitica por ahorrador ', '', 1),
(442, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004006', 1089.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 456, 'BD Analitica por ahorrador ', '', 1),
(443, '00300073', '', 'LEYVA ROMERO RUTILD ANGELES', 'Ficha de depósito', '108137', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', '108137', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30500, 21350, 21350, 'Av Guerrero 806 Int 7', 'Centro', 'Zinacatepec', 'S/D', 457, 'BD Analitica por ahorrador ', '', 1),
(444, '00300074', '', 'LOPEZ GIL MARIO MIGUEL', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004010', 750000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 750000, 525000, 167930, 'Centenario 902', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 458, 'BD Analitica por ahorrador ', '', 1),
(445, '00300075', '', 'LOPEZ LOPEZ GENARO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 10543.42, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11043.42, 7730.39, 7730.39, 'La paz 1913', 'La Paz', 'S/D', 'S/D', 459, 'BD Analitica por ahorrador ', '', 1),
(446, '00300076', '', 'LOPEZ MENDEZ GUADALUPE', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '115117', 14346.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 14846.14, 10392.3, 10392.3, '4 Poniente 1614 Int 4A', 'Aquiles Serdan', 'Tehuacan', 'S/D', 460, 'BD Analitica por ahorrador ', '', 1),
(447, '00300077', '', 'LOPEZ VALERIO DOLORES AUREA TERESA', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 10754.34, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24458.05, 17120.64, 17120.64, '8 Oriente 1307', 'Paseo de San Pedro', 'Tehuacan', 'S/D', 461, 'BD Analitica por ahorrador ', '', 1),
(448, '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 3203.71, 'Recibo de depósito', '004007', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 462, 'BD Analitica por ahorrador ', '', 1),
(449, '00300078', '', 'LOPEZ VALERIO SOCORRO AIDA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '008005', 15369.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15869.57, 11108.7, 11108.7, '4 Poniente 415', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 463, 'BD Analitica por ahorrador ', '', 1),
(450, '00300079', '', 'LORENZINI JUAREZ MARIA TERESA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 165000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 165000, 115500, 115500, 'Vicente Guerrero y 33 Sur', 'San Sebastian', 'Tecamachalco', 'S/D', 464, 'BD Analitica por ahorrador ', '', 1),
(451, '00300080', '', 'LOZANO TRUJILLO SABINA', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115111', 7681.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8181.71, 5727.2, 5727.2, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 465, 'BD Analitica por ahorrador ', '', 1),
(452, '00300081', '', 'MARIA RODRIGUEZ ROSA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004014', 2331, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10331, 7231.7, 7231.7, '2 Oriente 928', 'Moctezuma', 'Tehuacan', 'S/D', 466, 'BD Analitica por ahorrador ', '', 1),
(453, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 7500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 467, 'BD Analitica por ahorrador ', '', 1),
(454, '00300082', '', 'MARIN MORENO MAXIMINO', 'Recibo de depósito', '115-1-12', 500, 'Recibo de depósito', '115-1-13', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2500, 1750, 1750, 'Ignacio Allende LT 54', 'Aviacion', 'Tehuacan', 'S/D', 468, 'BD Analitica por ahorrador ', '', 1),
(455, '00300083', '', 'MARISCAL SANDOVAL ANTONIA', 'Recibo de depósito', '115-1-29', 500, 'Certificado de ahorro', 'S/F', 2191.68, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2691.68, 1884.18, 1884.18, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 469, 'BD Analitica por ahorrador ', '', 1),
(456, '00300084', '', 'MARTINEZ ALTA GERMAN', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-006', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Zoquitlan s/n', 'Seccion I Xicala', 'Zoquitlan', 'S/D', 470, 'BD Analitica por ahorrador ', '', 1),
(457, '00300085', '', 'MARTINEZ ANTONIO JUAN', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 13359.27, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13859.27, 9701.49, 9701.49, '24 de Diciembre 26', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 471, 'BD Analitica por ahorrador ', '', 1),
(458, '00300086', '', 'MARTINEZ CORTEZ HERMELINDA', 'S/D', 'S/F', 0, 'Recibo de depósito', '116-1-11', 727.58, 'Recibo de depósito', '004-005', 39841.36, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40568.94, 28398.26, 28398.26, 'Buena Vista 2', 'El Progreso', 'Tehuacan', 'S/D', 472, 'BD Analitica por ahorrador ', '', 1),
(459, '00300087', '', 'MARTINEZ ESPIDIO LETICIA', 'S/D', 'S/F', 500, 'Certificado de ahorro', 'S/F', 8873.25, 'Recibo de depósito', '005015', 84000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93373.25, 65361.28, 65361.28, 'Independencia 5', 'Cristobal Tepeteopan', 'Tehuacan', 'S/D', 473, 'BD Analitica por ahorrador ', '', 1),
(460, '00300088', '', 'MARTINEZ LOPEZ UBALDA LETICIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '062007', 158000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 591578.09, 414104.66, 167930, '13 Oriente 334', 'Nicolas Bravo', 'Tehuacan', 'S/D', 474, 'BD Analitica por ahorrador ', '', 1),
(461, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005017', 163180, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 475, 'BD Analitica por ahorrador ', '', 1),
(462, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005018', 217948.09, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 476, 'BD Analitica por ahorrador ', '', 1),
(463, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '012003', 15300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 477, 'BD Analitica por ahorrador ', '', 1),
(464, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004016', 36650, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 478, 'BD Analitica por ahorrador ', '', 1),
(465, '00300089', '', 'MARTINEZ NUÑEZ ANTONIETA', 'Recibo de depósito', 'S/F', 500, 'Certificado de ahorro', 'S/F', 9967.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10467.31, 7327.12, 7327.12, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 479, 'BD Analitica por ahorrador ', '', 1),
(466, '00300090', '', 'MARTINEZ RIVERA PAULINA INOCENCIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005023', 224000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 224000, 156800, 156800, 'Av Nacional 69', 'Olleras Bustamante', 'Tehuacan', 'S/D', 480, 'BD Analitica por ahorrador ', '', 1),
(467, '00300091', '', 'MENDEZ CATALINA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5000, 3500, 3500, 'Insurgentes 3406', 'La Soledad', 'Tehuacan', 'S/D', 481, 'BD Analitica por ahorrador ', '', 1),
(468, '00300092', '', 'MENDOZA CRUZ ELIZABETH', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 3450.16, 'Recibo de depósito', '005007', 96140.48, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100090.64, 70063.45, 70063.45, 'Miguel Hidalgo', 'Guadalupe', 'Zapotitlan', 'S/D', 482, 'BD Analitica por ahorrador ', '', 1),
(469, '00300093', '', 'MERINO MERINO SUSANA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '061203', 18000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18500, 12950, 12950, '19 sur 709', 'La Purisima', 'Tehuacan', 'S/D', 483, 'BD Analitica por ahorrador ', '', 1),
(470, '00300094', '', 'MEXICANO ORTIZ ESPERANZA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 275.78, 'Recibo de depósito', '005-004', 17190.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17966.71, 12576.7, 12576.7, 'Republica de Nicaragua 803', 'America', 'Tehuacan', 'S/D', 484, 'BD Analitica por ahorrador ', '', 1),
(471, '00300095', '', 'MIRAMON OLMOS MARTHA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006005', 12396.07, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12396.07, 8677.25, 8677.25, 'Morelos sn', 'San Jose Miahuatlan', 'San Jose Miahuatlan', 'S/D', 485, 'BD Analitica por ahorrador ', '', 1),
(472, '00300096', '', 'MIRAMON SEBASTIAN JUAN', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005010', 2997.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2997.71, 2098.4, 2098.4, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 486, 'BD Analitica por ahorrador ', '', 1);
INSERT INTO `analiticasCertificadas` (`idanaliticasCertificadas`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `curp`, `basesCertificadas_idbasesCertificadas`) VALUES
(473, '00300097', '', 'MONTALVO ROQUE CIRILA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 193320.55, 135324.39, 135324.39, '11 Oriente 1117', 'La Purisima', 'Tehuacan', 'S/D', 487, 'BD Analitica por ahorrador ', '', 1),
(474, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 71859.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 488, 'BD Analitica por ahorrador ', '', 1),
(475, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005002', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 489, 'BD Analitica por ahorrador ', '', 1),
(476, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 490, 'BD Analitica por ahorrador ', '', 1),
(477, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 491, 'BD Analitica por ahorrador ', '', 1),
(478, '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005006', 72960.92, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 492, 'BD Analitica por ahorrador ', '', 1),
(479, '00300098', '', 'MONTAÑO HUERTA SILDIA HAYDEE', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 1849.64, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4007.39, 2805.17, 2805.17, 'Fresno 2316 A', 'Rancho Grande', 'Tehuacan', 'S/D', 493, 'BD Analitica por ahorrador ', '', 1),
(480, '', '', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115123', 1657.75, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 494, 'BD Analitica por ahorrador ', '', 1),
(481, '00300099', '', 'MORALES VAZQUEZ FRANCISCO', 'Recibo de depósito', '115128', 500, 'Recibo de depósito', '11512', 14550, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15050, 10535, 10535, 'San Agustin 106-7', 'Maria Coapan', 'Tehuacan', 'S/D', 495, 'BD Analitica por ahorrador ', '', 1),
(482, '00300100', '', 'MORAN CORTES CECILIA MICAELA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005005', 40501.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40501.6, 28351.12, 28351.12, '25 Norte 203', 'El Rosario', 'Tehuacan', 'S/D', 496, 'BD Analitica por ahorrador ', '', 1),
(483, '00300101', '', 'MORENO MORALES ABRAHAM', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '007-006', 250000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 250000, 175000, 167930, 'Granada LT 124', 'Los Olivos', 'Tehuacan', 'S/D', 497, 'BD Analitica por ahorrador ', '', 1),
(484, '00300102', '', 'MORENO MORALES JOSUE', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-33', 135166.89, 'Recibo de depósito', '004-008', 750000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 885166.89, 619616.82, 167930, '2 Sur 128', 'Centro', 'Tehuacan', 'S/D', 498, 'BD Analitica por ahorrador ', '', 1),
(485, '00300103', '', 'MOSQUEDA MARTINEZ MARIA ISABEL', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 27500, 19250, 19250, '2da Privada de Ahuehuetes 49', 'Ahuehuetes', 'Gustavo AMadero', 'S/D', 499, 'BD Analitica por ahorrador ', '', 1),
(486, '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 17500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 500, 'BD Analitica por ahorrador ', '', 1),
(487, '00300104', '', 'OLMOS CAMPOS ANDREA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004011', 9000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 501, 'BD Analitica por ahorrador ', '', 1),
(488, '00300105', '', 'OROZCO GARCIA JOSE', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1408.36, 'Recibo de depósito', '004002', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6908.36, 4835.85, 4835.85, 'Privada de Chalma 4-12', 'San Diego Chalma', 'Tehuacan', 'S/D', 502, 'BD Analitica por ahorrador ', '', 1),
(489, '00300106', '', 'ORTIZ MENDEZ ALVARO', 'S/D', 'S/F', 0, 'Certificado de ahorro', '5837', 101196.72, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 101196.72, 70837.7, 70837.7, '31 norte ', 'San Sebastian', 'Tecamachalco', 'S/D', 503, 'BD Analitica por ahorrador ', '', 1),
(490, '00300107', '', 'OSORIO REYES AMALIA', 'Recibo de depósito', '115-1-12', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-002', 15558.84, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16058.84, 11241.19, 11241.19, 'Av Libertad 11', 'Bartolo Teontepec', 'Tepanco de Lopez', 'S/D', 504, 'BD Analitica por ahorrador ', '', 1),
(491, '00300108', '', 'PACHECO RODRIGUEZ TOMAS', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', 'S/F', 61.14, 'Recibo de depósito', '004003', 1750.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2311.64, 1618.15, 1618.15, 'Sedesol lt 7', 'Dr Miguel Romero', 'Teotihuacan', 'S/D', 505, 'BD Analitica por ahorrador ', '', 1),
(492, '00300109', '', 'PAQUE PEREZ ALFREDO', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 21269.23, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21269.23, 14888.46, 14888.46, '23 Sur 152', 'La Concepcion', 'Tehuacan', 'S/D', 506, 'BD Analitica por ahorrador ', '', 1),
(493, '00300110', '', 'PEREDA HERNANDEZ BONIFACIO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 500, 350, 350, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 507, 'BD Analitica por ahorrador ', '', 1),
(494, '00300111', '', 'PEREZ BAUTISTA ERNESTINA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 21000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 508, 'BD Analitica por ahorrador ', '', 1),
(495, '00300112', '', 'PEREZ JIMENEZ MARGARITO BALENTIN', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11517', 17082.06, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17582.06, 12307.44, 12307.44, '4 Poniente 68', 'Santa Mariala Alta', 'Tlacotepec', 'S/D', 509, 'BD Analitica por ahorrador ', '', 1),
(496, '00300113', '', 'PIEDRA GONZALEZ NORMA', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8500, 5950, 5950, 'Allende Oriente 126', 'Maria Coapan', 'Tehuacan', 'S/D', 510, 'BD Analitica por ahorrador ', '', 1),
(497, '00300114', '', 'PORRAS CHAVEZ SERVANDO PEDRO LAZARO', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11515', 46744.92, 'Recibo de depósito', '008009', 1200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1247244.92, 873071.44, 167930, 'Carmen Serdan 106', 'Centro', 'Tehuacan', 'S/D', 511, 'BD Analitica por ahorrador ', '', 1),
(498, '00300115', '', 'QUIÑONES HERNANDEZ EFREN', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 25.19, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25.19, 17.63, 17.63, 'San Bernardino Lagunas', 'Bernardino Lagunas', 'Vicente Guerrero', 'S/D', 512, 'BD Analitica por ahorrador ', '', 1),
(499, '00300116', '', 'RAMIREZ SANCHEZ MARCELA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1221.2, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8545.58, 5981.91, 5981.91, '6 Poniente 602 A', 'Constituyentes', 'Tehuacan', 'S/D', 513, 'BD Analitica por ahorrador ', '', 1),
(500, '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 6324.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 514, 'BD Analitica por ahorrador ', '', 1),
(501, '00300117', '', 'REYES JIMENEZ MARICELA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2019.45, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2519.45, 1763.62, 1763.62, '17 poniente 2007', 'El Riego', 'Tehuacan', 'S/D', 515, 'BD Analitica por ahorrador ', '', 1),
(502, '00300118', '', 'REYES MERINO EDITH', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 5112.9, 'Recibo de depósito', '004-001', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20612.9, 14429.03, 14429.03, '5 de Mayo', 'Jose Buena Vista', 'Ajalpan', 'S/D', 516, 'BD Analitica por ahorrador ', '', 1),
(503, '00300119', '', 'RIOS DIAZ PASCUALA', 'S/D', 'S/F', 0, 'Recibo de depósito', '115112', 2331.01, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11072.31, 7750.62, 7750.62, 'Benito Juarez 405', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 517, 'BD Analitica por ahorrador ', '', 1),
(504, '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115110', 8741.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 518, 'BD Analitica por ahorrador ', '', 1),
(505, '00300120', '', 'ROJAS CHAVEZ PRAXEDES', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004004', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10500, 7350, 7350, 'Guadalupe Victoria 1425', 'El Riego', 'Tehuacan', 'S/D', 519, 'BD Analitica por ahorrador ', '', 1),
(506, '00300121', '', 'ROSALES ROJAS IGNACIA', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 26230.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26730.67, 18711.47, 18711.47, '17 Oriente 1123 B', 'Los Pinos', 'Zoquitlan', 'S/D', 520, 'BD Analitica por ahorrador ', '', 1),
(507, '00300122', '', 'SALVADOR FLORES SERAPIO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8500, 5950, 5950, 'Av Nacional', 'El Molino', 'Chapulco', 'S/D', 521, 'BD Analitica por ahorrador ', '', 1),
(508, '00300123', '', 'SANCHEZ ADAME GREGORIO', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8500, 5950, 5950, 'Juan Diego Lote 41', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 522, 'BD Analitica por ahorrador ', '', 1),
(509, '00300124', '', 'SANCHEZ ELEJO LAURANEO', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-003', 174000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 174000, 121800, 121800, 'Conocido', 'Tlaxitla', 'Ajalpan', 'S/D', 523, 'BD Analitica por ahorrador ', '', 1),
(510, '00300125', '', 'SANCHEZ GARCIA ARMANDO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 5399.87, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5899.87, 4129.91, 4129.91, '12 Sur 2128', '16 de Marzo', 'Tehuacan', 'S/D', 524, 'BD Analitica por ahorrador ', '', 1),
(511, '00300126', '', 'SORIANO FIGUEROA SILVINO LEONCIO', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-12', 300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21800, 15260, 15260, '21 Oriente 919', 'Nias Bravo', 'Tehuacan', 'S/D', 525, 'BD Analitica por ahorrador ', '', 1),
(512, '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-13', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 526, 'BD Analitica por ahorrador ', '', 1),
(513, '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-15', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 527, 'BD Analitica por ahorrador ', '', 1),
(514, '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-30', 4000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 528, 'BD Analitica por ahorrador ', '', 1),
(515, '', '', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 529, 'BD Analitica por ahorrador ', '', 1),
(516, '', '', '', 'Recibo de depósito', '115-1-11', 500, 'Recibo de depósito', '115-1-17', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 530, 'BD Analitica por ahorrador ', '', 1),
(517, '00300127', '', 'TEHUACANERO JIMENEZ JOSEFINA MARTHA', 'Partes sociales', '62629', 500, 'Certificado de ahorro', '64302', 10125.47, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10625.47, 7437.83, 7437.83, 'Boulevard Ing Pastor Rouaix 713', 'Hidalgo', 'Tehuacan', 'S/D', 531, 'BD Analitica por ahorrador ', '', 1),
(518, '00300128', '', 'TEHUINTLE CALIHUA EUSEBIO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 11590.84, 'Recibo de depósito', '006-001', 15900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 27990.84, 19593.59, 19593.59, 'Coxcatepachapa', 'Coxcatepachapa', 'Vicente Guerrero', 'S/D', 532, 'BD Analitica por ahorrador ', '', 1),
(519, '00300129', '', 'TENORIO HERNANDEZ MARTHA AMELIA', 'Recibo de depósito', '115-1-25', 500, 'Recibo de depósito', '115-1-16', 5678.99, 'Recibo de depósito', '006-002', 54000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60178.99, 42125.29, 42125.29, 'Alamo 716', 'Morelos', 'Tehuacan', 'S/D', 533, 'BD Analitica por ahorrador ', '', 1),
(520, '00300130', '', 'TOMAS VENTURA DOLORES GUADALUPE', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 2264.27, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13272.27, 9290.59, 9290.59, 'Alvarez 700', 'Centro', 'Zinacatepec', 'S/D', 534, 'BD Analitica por ahorrador ', '', 1),
(521, '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 10508, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 535, 'BD Analitica por ahorrador ', '', 1),
(522, '00300131', '', 'VAZQUEZ MARTINEZ FRANCISCO JAVIER', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115129', 4771.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5271.91, 3690.34, 3690.34, '26 Oriente 300', 'Lomas de la Soledad', 'Tehuacan', 'S/D', 536, 'BD Analitica por ahorrador ', '', 1),
(523, '00300132', '', 'VEGA HERNANDEZ RUFINO', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 4198.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4698.6, 3289.02, 3289.02, 'Jose Maria Morelos 5408', 'San Angel', 'Tehuacan', 'S/D', 537, 'BD Analitica por ahorrador ', '', 1),
(524, '00300133', '', 'VELEZ GONZALEZ ISABEL PATRICIA', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93934.17, 65753.92, 65753.92, 'Sedesol 16', 'Mig Romero Sanchez', 'Tehuacan', 'S/D', 538, 'BD Analitica por ahorrador ', '', 1),
(525, '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 13434.17, 'Recibo de depósito', '004-002', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 539, 'BD Analitica por ahorrador ', '', 1),
(526, '00300134', '', 'VIVEROS JUAREZ CLETO JOEL', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1000, 'Recibo de depósito', '004006', 20387.03, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21887.03, 15320.92, 15320.92, 'Colombia 308 A', 'El Riego', 'Tehuacan', 'S/D', 540, 'BD Analitica por ahorrador ', '', 1),
(527, '', '', 'TOTAL', '', '', 16498771.66, '', '', 8816877.93, '', '', 60511763.9, '', '', 0, '', '', 0, '', '', 0, '', '', 0, 85827413.49, 60079189.55, 22539554.41, '', '', '', '', 541, 'BD Analitica por ahorrador ', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analiticasTemporales`
--

CREATE TABLE `analiticasTemporales` (
  `idanaliticasTemporales` int(11) NOT NULL,
  `revisionesTemporales_idrevisionesTemporales` int(11) NOT NULL,
  `nuevoFolioIdentificador` char(11) DEFAULT NULL,
  `folioIdentificadorAnterior` char(11) DEFAULT NULL,
  `nombreAhorrador` text,
  `curp` varchar(45) DEFAULT NULL,
  `tipoDocumentoPS` text,
  `folioPS` text,
  `importePS` double DEFAULT NULL,
  `tipoDocumentoCA` text,
  `folioCA` text,
  `importeCA` double DEFAULT NULL,
  `tipoDocumentoCI` text,
  `folioCI` text,
  `importeCI` double DEFAULT NULL,
  `tipoDocumentoDG` text,
  `folioDG` text,
  `importeDG` double DEFAULT NULL,
  `tipoDocumentoCNC` text,
  `folioCNC` text,
  `importeCNC` double DEFAULT NULL,
  `tipoDocumentoOtros` text,
  `folioOtros` text,
  `importeOtros` double DEFAULT NULL,
  `tipoDocumentoPrestamos` text,
  `folioPrestamos` text,
  `importePrestamos` double DEFAULT NULL,
  `saldoNeto100` double DEFAULT NULL,
  `saldoNeto70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `calleYNumero` text,
  `delegacionMunicipio` text,
  `colonia` text NOT NULL,
  `telefono` text,
  `filaDocumentoOriginal` int(45) NOT NULL,
  `hojaDocumentoOriginal` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `analiticasTemporales`
--

INSERT INTO `analiticasTemporales` (`idanaliticasTemporales`, `revisionesTemporales_idrevisionesTemporales`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `curp`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(1, 1, '00100001', '', 'ADAUTA CAMACHO SERGIO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 146000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 146000, 102200, 102200, 'S/D', 'S/D', 'S/D', 'S/D', 15, 'BD Analitica por ahorrador '),
(2, 1, '00100002', '', 'ALVAREZ AGUILAR FRANCISCO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '11', 19600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19600, 13720, 13720, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 16, 'BD Analitica por ahorrador '),
(3, 1, '00100003', '', 'ARROLLO SUAREZ GUADALUPE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'Depósito a plazo fijo', '9', 10001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10101, 7070.7, 7070.7, 'Reforma num7', 'Allende', 'Cuyoaco', 'S/D', 17, 'BD Analitica por ahorrador '),
(4, 1, '00100004', '', 'BAEZ ESPINOSA FERNANDO', '', 'Partes sociales', '465', 300, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '44667', 53000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 53300, 37310, 37310, 'Emilio Carranza num 24', 'Grajales', 'Rafael Lara Grajales', 'S/D', 18, 'BD Analitica por ahorrador '),
(5, 1, '00100005', '', 'BAEZ HERNANDEZ GUILLERMINA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45517', 8639.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8639.38, 6047.57, 6047.57, '7 Norte num 42', 'Centro', 'Rafael Lara Grajales', 'S/D', 19, 'BD Analitica por ahorrador '),
(6, 1, '00100006', '', 'BAEZ HERNANDEZ NORMA LIDIA', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 152627.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 152627.67, 106839.37, 106839.37, 'Av Emiliano Carranza num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 20, 'BD Analitica por ahorrador '),
(7, 1, '00100007', '', 'BAEZ REYES MARIA LUISA GUADALUPE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46815', 93203.01, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93203.01, 65242.11, 65242.11, '10 Sur num 1502', 'Centro', 'San Jose Chiapa', 'S/D', 21, 'BD Analitica por ahorrador '),
(8, 1, '00100008', '', 'BARRALEZ GONZALEZ MARGARITA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46382', 7939.11, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7939.11, 5557.38, 5557.38, 'Av Ignacio Zaragoza num 18', 'Cruz del Bosque', 'Nopalucan', 'S/D', 22, 'BD Analitica por ahorrador '),
(9, 1, '00100009', '', 'BARRANCO LOPEZ MARTIN', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '415', 400001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 400001, 280000.7, 167930, 'S/D', 'S/D', 'S/D', 'S/D', 23, 'BD Analitica por ahorrador '),
(10, 1, '00100010', '', 'BECERRIL VILCHIS HILDA', '', 'Ficha universal', '546352', 300, 'Ficha universal', '546352', 10863.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11163.43, 7814.4, 7814.4, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 24, 'BD Analitica por ahorrador '),
(11, 1, '00100011', '', 'BRAVO LOPEZ ARNULFO', '', 'Partes sociales', '033', 300, 'Depósito a plazo fijo', '43758', 50599, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50899, 35629.3, 35629.3, 'Guanajuato num 6', 'Centro', 'Rafael Lara Grajales', 'S/D', 25, 'BD Analitica por ahorrador '),
(12, 1, '00100012', '', 'CABALLERO RODRIGUEZ MINERVA', '', 'Partes sociales', 'S/F', 300, 'Recibo de depósito', 'S/F', 40000, 'Ficha de depósito', 'S/F', 1545.89, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 41845.89, 29292.12, 29292.12, '2 de abril num385', 'Barrio de Tetela', 'Libres', '2764731536', 26, 'BD Analitica por ahorrador '),
(13, 1, '00100013', '', 'CABRERA MUÑOZ JUAN GUSTAVO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '44206', 260000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 860000, 602000, 167930, '16 de Septiembre no 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 27, 'BD Analitica por ahorrador '),
(14, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42543', 600000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 28, 'BD Analitica por ahorrador '),
(15, 1, '00100014', '', 'CANDELARIO LOPEZ CLAUDIA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45471', 18927.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18927.71, 13249.4, 13249.4, '11 Poniente num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 29, 'BD Analitica por ahorrador '),
(16, 1, '00100015', '', 'CARREON SANCHEZ LEONEL', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46424', 221558.42, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 221558.42, 155090.89, 155090.89, '3 Poniente num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 30, 'BD Analitica por ahorrador '),
(17, 1, '00100016', '', 'CASTILLO CERON JOSE ANDRES', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '7325', 16705, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16705, 11693.5, 11693.5, '6 Poniente num 8', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 31, 'BD Analitica por ahorrador '),
(18, 1, '00100017', '', 'CASTILLO ROMERO JOSE GERONIMO AURELIO', '', 'Partes sociales', '350', 300, 'Certificado de ahorro', '47126', 60405.29, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60705.29, 42493.7, 42493.7, 'Hermanos Serdan num 305', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 32, 'BD Analitica por ahorrador '),
(19, 1, '00100018', '', 'CASTILLO SANCHEZ MARICELA AURORA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46045', 61984.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 61984.31, 43389.02, 43389.02, '7 Oriente num 2', 'Grajales', 'Rafael Lara Grajales', 'S/D', 33, 'BD Analitica por ahorrador '),
(20, 1, '00100019', '', 'CAYETANO PAULINO ENEDINA', '', 'Partes sociales', '330', 300, 'Certificado de ahorro', '46412', 23753.51, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30028, 21019.6, 21019.6, 'Del Monte s/n', 'Benito Juarez', 'Soltepec', 'S/D', 34, 'BD Analitica por ahorrador '),
(21, 1, '', '', '', '', 'Partes sociales', '439', 300, 'Certificado de ahorro', '46414', 5674.49, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 35, 'BD Analitica por ahorrador '),
(22, 1, '00100020', '', 'CERVANTES MONTES JUAN', '1', 'Partes sociales', '440', 300, 'Certificado de ahorro', '46414', 3813.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4113.5, 2879.45, 2879.45, '5 Sur num 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 36, 'BD Analitica por ahorrador '),
(23, 1, '00100021', '', 'CRUZ DE LOS ANGELES MA GUADALUPE', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 12551.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12551.93, 8786.35, 8786.35, 'Juan Sarabia num 7', 'Obrera', 'Rafael Lara Grajales', '4741025', 37, 'BD Analitica por ahorrador '),
(24, 1, '00100022', '', 'CRUZ DOMINGUEZ MICAELA', '', 'Partes sociales', 'S/F', 300, 'Certificado de ahorro', 'S/F', 100, 'Depósito a plazo fijo', '14', 49600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50000, 35000, 35000, '4 Sur num6', 'Allende', 'Cuyoaco', 'S/D', 38, 'BD Analitica por ahorrador '),
(25, 1, '00100023', '', 'CRUZ TORRES CELSO VICTOR', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 46321.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 46321.96, 32425.37, 32425.37, 'Priv Los Naranjos num 18', 'San Miguel', 'Amozoc de Mota', 'S/D', 39, 'BD Analitica por ahorrador '),
(26, 1, '00100024', '', 'CUELLAR MUÑOZ MARIA GUADALUPE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46371', 47333.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 47333.93, 33133.75, 33133.75, 'Av Progreso num 10', 'Centro', 'Rafael Lara Grajales', 'S/D', 40, 'BD Analitica por ahorrador '),
(27, 1, '00100025', '', 'DE LA CRUZ HERNANDEZ JUANA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '44307', 73365, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 73365, 51355.5, 51355.5, '2 Norte num 38', 'Centro', 'Rafael Lara Grajales', 'S/D', 41, 'BD Analitica por ahorrador '),
(28, 1, '00100026', '', 'DEL CARMEN LOPEZ GUADALUPE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46123', 154762.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 154762.67, 108333.87, 108333.87, 'Salto del agua num 37', 'Salto del Agua', 'Rafael Lara Grajales', 'S/D', 42, 'BD Analitica por ahorrador '),
(29, 1, '00100027', '', 'DIAZ BAUTISTA VICTORIA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47308', 7482, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7482, 5237.4, 5237.4, '8 Oriente num 28', 'Barrio San Juan', 'Acajete', 'S/D', 43, 'BD Analitica por ahorrador '),
(30, 1, '00100028', '', 'DIAZ HERNANDEZ MARCELINA', '', 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42471', 29500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 29500, 20650, 20650, 'Camino a Obregon num 7', 'La Ermita', 'Soltepec', 'S/D', 44, 'BD Analitica por ahorrador '),
(31, 1, '00100029', '', 'DIAZ VAZQUEZ MIGUEL', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 16096.61, 'S/D', 'S/F', 277.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16374.57, 11462.2, 11462.2, 'Principal 1', 'La Cañada', 'Libres', 'S/D', 45, 'BD Analitica por ahorrador '),
(32, 1, '00100030', '', 'DURAN HERNANDEZ FABIOLA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46824', 213619.84, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 213619.84, 149533.89, 149533.89, '4 Norte s/n', 'Centro', 'San Jose Chiapa', 'S/D', 46, 'BD Analitica por ahorrador '),
(33, 1, '00100031', '', 'DURAN LOPEZ ERASMO', '', 'Partes sociales', 'S/F', 300, 'Certificado de ahorro', '44092', 16781.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17081.21, 11956.85, 11956.85, '16 de Septiembre num 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 47, 'BD Analitica por ahorrador '),
(34, 1, '00100032', '', 'DURAN MARTINEZ SEBASTIAN EVELINA', '', 'Partes sociales', '0195', 300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 300, 210, 210, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 48, 'BD Analitica por ahorrador '),
(35, 1, '00100033', '', 'FERNANDEZ HERNANDEZ SOLIRENE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '547715', 85088.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 85088.71, 59562.1, 59562.1, 'Rubi num 8', 'La Joya', 'Rafael Lara Grajales', 'S/D', 49, 'BD Analitica por ahorrador '),
(36, 1, '00100034', '', 'FLORES DIAZ MARGARITO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47307', 20466, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20466, 14326.2, 14326.2, '12 Norte num 8', 'Barrio San Juan', 'Acajete', 'S/D', 50, 'BD Analitica por ahorrador '),
(37, 1, '00100035', '', 'FLORES MOZO RODE', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 11704.59, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11704.59, 8193.21, 8193.21, '11 Sur num 25', 'Centro', 'Rafael Lara Grajales', 'S/D', 51, 'BD Analitica por ahorrador '),
(38, 1, '00100036', '', 'GARCIA MONTES VICENTA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45290', 19376.85, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19376.85, 13563.8, 13563.8, '7 Sur num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 52, 'BD Analitica por ahorrador '),
(39, 1, '00100037', '', 'GONZALEZ HERNANDEZ ALEJANDRO', '', 'Partes sociales', '179', 300, 'Ficha de depósito', 'S/F', 144030.9, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 144330.9, 101031.63, 101031.63, '5 Oriente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 53, 'BD Analitica por ahorrador '),
(40, 1, '00100038', '', 'GONZALEZ LOPEZ HILARIA', '', 'Partes sociales', '398', 300, 'Certificado de ahorro', '43819', 5703, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6003, 4202.1, 4202.1, 'Plaza de la Gardenia Edif 19A DPTO 2', 'U Hab Lara Grajales', 'Nopalucan', 'S/D', 54, 'BD Analitica por ahorrador '),
(41, 1, '00100039', '', 'GUEVARA LOPEZ ELIGIO', '', 'S/D', 'S/F', 300, 'Ficha de depósito', '195227', 100, 'Depósito a plazo fijo', '16', 195000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 195400, 136780, 136780, 'Avenida 16 de septiembre s/n', 'Tonalapa', 'Ixtacamaxtitlan', '4880221', 55, 'BD Analitica por ahorrador '),
(42, 1, '00100040', '', 'HERNANDEZ CERON MARTHA', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 74815, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 74815, 52370.5, 52370.5, '3 Sur num 14', 'Grajales', 'Rafael Lara Grajales', 'S/D', 56, 'BD Analitica por ahorrador '),
(43, 1, '00100041', '', 'HERNANDEZ LOPEZ ROSA', '', 'Partes sociales ', '529', 300, 'Ficha de depósito', 'S/F', 142597, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 142897, 100027.9, 100027.9, 'Hidalgo 404', 'La Granja', 'Nopalucan', 'S/D', 57, 'BD Analitica por ahorrador '),
(44, 1, '00100042', '', 'HERNANDEZ PLATINI MARIA LUCINA', '', 'Partes sociales', '260', 300, 'Certificado de ahorro', '47422', 52698, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 52998, 37098.6, 37098.6, 'Av Del Trabajo num 20 Col Obrera', 'Grajales', 'S/D', 'S/D', 58, 'BD Analitica por ahorrador '),
(45, 1, '00100043', '', 'HERNANDEZ RAMIREZ JOSE PORFIRIO PASCUAL', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46176', 10243.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10243.63, 7170.54, 7170.54, '7 Sur num 16', 'Centro', 'Rafael Lara Grajales', 'S/D', 59, 'BD Analitica por ahorrador '),
(46, 1, '00100044', '', 'HERRERA HERNANDEZ JOSE ARMANDO', '', 'Ficha de depósito', '130-150', 300, 'Certificado de ahorro', 'S/F', 53743.62, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 54043.62, 37830.53, 37830.53, 'Iturbide num21', 'Barrio de San Miguel', 'Libres', 'S/D', 60, 'BD Analitica por ahorrador '),
(47, 1, '00100045', '', 'HUERTA VEGA ESPERANZA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12000.77, 8400.54, 8400.54, '2 dos norte num 51', 'Centro', 'Rafael Lara Grajales', 'S/D', 61, 'BD Analitica por ahorrador '),
(48, 1, '', '', '', '', 'Partes sociales', '509', 300, 'Certificado de ahorro', '544864', 11600.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 62, 'BD Analitica por ahorrador '),
(49, 1, '00100046', '', 'JIMENEZ SANCHEZ SIXTA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '545708', 9726.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9726.56, 6808.59, 6808.59, '2 norte num 50', 'Barrio Sto Entierro', 'Acajete', 'S/D', 63, 'BD Analitica por ahorrador '),
(50, 1, '00100047', '', 'JUAREZ DURAN JUAN', '', 'Partes sociales', '0160', 300, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42467', 39089.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 39389.6, 27572.72, 27572.72, '4 Poniente num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 64, 'BD Analitica por ahorrador '),
(51, 1, '00100048', '', 'JUAREZ JIMENEZ MARIA DE LOURDES', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 23408.15, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23408.15, 16385.71, 16385.71, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 65, 'BD Analitica por ahorrador '),
(52, 1, '00100049', '', 'JUAREZ JIMENEZ MARIA LAURA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 23081.29, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23081.29, 16156.9, 16156.9, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 66, 'BD Analitica por ahorrador '),
(53, 1, '00100050', '', 'JUAREZ NERI MARIA DEL CARMEN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20000, 14000, 14000, '6 Poniente num 310', 'Centro', 'Rafael Lara Grajales', 'S/D', 67, 'BD Analitica por ahorrador '),
(54, 1, '00100051', '', 'LOBATO BAEZ MARIANA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5100, 3570, 3570, '5 Poniente num 500', 'Loc Oriental', 'Oriental', 'S/D', 68, 'BD Analitica por ahorrador '),
(55, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 69, 'BD Analitica por ahorrador '),
(56, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 70, 'BD Analitica por ahorrador '),
(57, 1, '00100052', '', 'LOPEZ MAZAPILA DALILA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46809', 18967.9, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18967.9, 13277.53, 13277.53, 'Av Benito Juarez num 13', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 71, 'BD Analitica por ahorrador '),
(58, 1, '00100053', '', 'LOPEZ MORALES MARGARITA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47426', 150006, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150006, 105004.2, 105004.2, 'Cale 2 Pte num 13', 'Nopalucan', 'Nopalucan', 'S/D', 72, 'BD Analitica por ahorrador '),
(59, 1, '00100054', '', 'LOZANO SALAZAR GUILLERMINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '42361', 20096.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20096.73, 14067.71, 14067.71, 'S/D', 'S/D', 'S/D', 'S/D', 73, 'BD Analitica por ahorrador '),
(60, 1, '00100055', '', 'MARQUEZ DURAN PEDRO ELOY', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 290000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 290000, 203000, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 74, 'BD Analitica por ahorrador '),
(61, 1, '00100056', '', 'MARQUEZ PEREZ ERICK', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46567', 289000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 289000, 202300, 167930, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 75, 'BD Analitica por ahorrador '),
(62, 1, '00100057', '', 'MARTINEZ GONZALEZ MARIBEL', '', 'Partes sociales', '0481', 300, 'Certificado de ahorro', 'S/F', 3191.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3491.77, 2444.24, 2444.24, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 76, 'BD Analitica por ahorrador '),
(63, 1, '00100058', '', 'MARTINEZ LOPEZ JOSE EZEQUIEL', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 63192.05, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 63192.05, 44234.44, 44234.44, 'Allende num 14', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 77, 'BD Analitica por ahorrador '),
(64, 1, '00100059', '', 'MARTINEZ MARTINEZ ALEJANDRO', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 24494.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24494.18, 17145.93, 17145.93, 'Colosio num 6', 'San Jose Ozumba', 'San Jose Chiapa', 'S/D', 78, 'BD Analitica por ahorrador '),
(65, 1, '00100060', '', 'MARTINEZ TORRES ANGEL', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '1029', 1635.02, 'Depósito a plazo fijo', '545462', 24906.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26541.68, 18579.18, 18579.18, 'S/D', 'S/D', 'S/D', 'S/D', 79, 'BD Analitica por ahorrador '),
(66, 1, '00100061', '', 'MAURICIO RODRIGUEZ FAUSTINO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46888', 1456.94, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1456.94, 1019.86, 1019.86, '6 Sur num 705', 'B Virgen de la Luz', 'Acajete', 'S/D', 80, 'BD Analitica por ahorrador '),
(67, 1, '00100062', '', 'MENDEZ ALCANTARA AURORA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '547713', 7476.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7476.43, 5233.5, 5233.5, '3 poniente num 1', 'Centro', 'Rafael Lara Grajales', 'S/D', 81, 'BD Analitica por ahorrador '),
(68, 1, '00100063', '', 'MENDEZ ARMAS MARIA DE LOURDES', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 100, 'Depósito a plazo fijo', '10', 10001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10101, 7070.7, 7070.7, '3 Oriente s/n', 'San Jose Morelos', 'Libres', 'S/D', 82, 'BD Analitica por ahorrador '),
(69, 1, '00100064', '', 'MENDEZ LOZANO EZEQUIEL', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47163', 231326.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 231326.3, 161928.41, 161928.41, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 83, 'BD Analitica por ahorrador '),
(70, 1, '00100065', '', 'MENDEZ LOZANO MARGARITA', '', 'Partes sociales', '0149', 300, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '47336', 19292.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19592.91, 13715.04, 13715.04, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 84, 'BD Analitica por ahorrador '),
(71, 1, '00100066', '', 'MENDEZ ROQUE AURELIO IGNACIO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47425', 164751, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 164751, 115325.7, 115325.7, '5 Norte num 203', 'Centro', 'Rafael Lara Grajales', 'S/D', 85, 'BD Analitica por ahorrador '),
(72, 1, '00100067', '', 'MONTES MARTINEZ JESUS', '', 'S/D', 'S/F', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', '0136000363', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Adolfo Lopez Mateos num915', 'San Juan Negrete', 'Tepeaca', '2231031283', 86, 'BD Analitica por ahorrador '),
(73, 1, '00100068', '', 'MORALES BONILLA FLORINA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '66947', 24236.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24336.38, 17035.47, 17035.47, '7 poniente s/n', 'B Virgen de la Luz', 'Acajete', 'S/D', 87, 'BD Analitica por ahorrador '),
(74, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '64247', 100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 88, 'BD Analitica por ahorrador '),
(75, 1, '00100069', '', 'MORALES HERNANDEZ AMBROCIO', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '417', 54980, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 54980, 38486, 38486, 'Av Matamoros num 310', 'Juan de la Granja', 'Nopalucan', 'S/D', 89, 'BD Analitica por ahorrador '),
(76, 1, '00100070', '', 'MORALES MENDOZA JOSE ROSENDO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 69213.58, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 69213.58, 48449.51, 48449.51, '9 Pte num 45', 'Centro', 'Rafael Lara Grajales', 'S/D', 90, 'BD Analitica por ahorrador '),
(77, 1, '00100071', '', 'NERI NICANOR RAUL JAVIER', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47303', 292201.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 292201.14, 204540.8, 167930, 'Av Emiliano Carranza num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 91, 'BD Analitica por ahorrador '),
(78, 1, '00100072', '', 'OCHOA SALAS JUAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '505', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 157042.94, 109930.06, 109930.06, 'Ayuntamiento num S/N', 'La Virgen de la Luz', 'Acajete', 'S/D', 92, 'BD Analitica por ahorrador '),
(79, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '506', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 93, 'BD Analitica por ahorrador '),
(80, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '507', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 94, 'BD Analitica por ahorrador '),
(81, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 47042.94, 'Depósito a plazo fijo', '510', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 95, 'BD Analitica por ahorrador '),
(82, 1, '00100073', '', 'ORTEGA BECERRIL RAFAEL', '', 'S/D', 'S/F', 0, 'Ficha universal', '545840', 2872.53, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2872.53, 2010.77, 2010.77, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 96, 'BD Analitica por ahorrador '),
(83, 1, '00100074', '', 'ORTEGA ROJAS ANGELA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46345', 8825.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8825.21, 6177.65, 6177.65, 'Av Del Sol num 15', 'Fracc Los Olivos', 'Tijuana BC', 'S/D', 97, 'BD Analitica por ahorrador '),
(84, 1, '00100075', '', 'ORTIZ PEREZ GABINO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 28577.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 28577.56, 20004.29, 20004.29, '2 Norte num 73', 'Centro', 'Rafael Lara Grajales', 'S/D', 98, 'BD Analitica por ahorrador '),
(85, 1, '00100076', '', 'OSORIO HUERTA ARTURO', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 288524.83, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 288524.83, 201967.38, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 99, 'BD Analitica por ahorrador '),
(86, 1, '00100077', '', 'OSORIO SANTAMARIA EDUARDO', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 322648.46, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 322648.46, 225853.92, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 100, 'BD Analitica por ahorrador '),
(87, 1, '00100078', '', 'PEREZ DE LAZARO ISABEL', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 51337.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51337.4, 35936.18, 35936.18, '6 Pte no 21', 'Centro', 'Rafael Lara Grajales', 'S/D', 101, 'BD Analitica por ahorrador '),
(88, 1, '00100079', '', 'PEREZ LOZANO LUCRECIA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 1330.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1330.1, 931.07, 931.07, 'Av Lazaro Cardenas num 226', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 102, 'BD Analitica por ahorrador '),
(89, 1, '00100080', '', 'PEREZ PARRA ENCARNACION', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 258064.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 258064.3, 180645.01, 167930, '11 Sur num 31', 'Centro', 'Rafael Lara Grajales', 'S/D', 103, 'BD Analitica por ahorrador '),
(90, 1, '00100081', '', 'PEREZ VARGAS GABRIELA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '47388', 148175, 'Depósito a plazo fijo', '46479', 916782.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1064957.21, 745470.05, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 104, 'BD Analitica por ahorrador '),
(91, 1, '00100082', '', 'PEREZ VARGAS ROMAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46740', 290000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 290000, 203000, 167930, '4 Norte no 1203', 'Centro', 'San Jose Chiapa', 'S/D', 105, 'BD Analitica por ahorrador '),
(92, 1, '00100083', '', 'PROYLAN BAEZ ALEJANDRO', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 150704.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150704.28, 105493, 105493, 'Av Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 106, 'BD Analitica por ahorrador '),
(93, 1, '00100084', '', 'RAMIREZ BARRALES MARICELA', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 29858, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 29858, 20900.6, 20900.6, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 107, 'BD Analitica por ahorrador '),
(94, 1, '00100085', '', 'RAMIREZ HERNANDEZ UBALDO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', '164-188', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, 'Cabo Franco num1299', 'Barrio Guadalupe', 'Libres', 'S/D', 108, 'BD Analitica por ahorrador '),
(95, 1, '00100086', '', 'RAMIREZ MELENDEZ JAVIER', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '545633', 17806.61, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17806.61, 12464.63, 12464.63, '2 norte num 28', 'Barrio Sto Entierro', 'Acajete', 'S/D', 109, 'BD Analitica por ahorrador '),
(96, 1, '00100087', '', 'RAMIREZ TAPIA FERNANDO', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 78368.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 78368.63, 54858.04, 54858.04, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 110, 'BD Analitica por ahorrador '),
(97, 1, '00100088', '', 'REYES GONZALEZ GUADALUPE', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 32391.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 32391.38, 22673.97, 22673.97, '14 Poniente s/n', 'Centro', 'Nopalucan', 'S/D', 111, 'BD Analitica por ahorrador '),
(98, 1, '00100089', '', 'ROCHA LOPEZ MOISES', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 13651.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13651.77, 9556.24, 9556.24, '2 Norte num 48', 'Centro', 'Rafael Lara Grajales', 'S/D', 112, 'BD Analitica por ahorrador '),
(99, 1, '00100090', '', 'RODRIGUEZ MENDOZA SILVIA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 141704, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 141704, 99192.8, 99192.8, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 113, 'BD Analitica por ahorrador '),
(100, 1, '00100091', '', 'ROMERO AVILA TERESA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 26405.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26405.31, 18483.72, 18483.72, 'Av 20 de Noviembre num 45', 'Grajales', 'Rafael Lara Grajales', 'S/D', 114, 'BD Analitica por ahorrador '),
(101, 1, '00100092', '', 'ROMERO MORALES MIGUEL', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 51769.04, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51769.04, 36238.33, 36238.33, '7 Sur num 43 Col Centro', 'Grajales', 'Rafael Lara Grajales', 'S/D', 115, 'BD Analitica por ahorrador '),
(102, 1, '00100093', '', 'ROMERO MORALES SOLEDAD', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '46264', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40000, 28000, 28000, '9 Poniente num 28', 'Centro', 'Rafael Lara Grajales', 'S/D', 116, 'BD Analitica por ahorrador '),
(103, 1, '00100094', '', 'ROMERO PEREZ VICTORIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 6818.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20368.5, 14257.95, 14257.95, 'Av Francisco I Madero num 410', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 117, 'BD Analitica por ahorrador '),
(104, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 100, 'Depósito a plazo fijo', 'S/F', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 118, 'BD Analitica por ahorrador '),
(105, 1, '', '', '', '', 'Partes sociales', '603', 300, 'Certificado de ahorro', 'S/F', 150, 'Depósito a plazo fijo', 'S/F', 11000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 119, 'BD Analitica por ahorrador '),
(106, 1, '00100095', '', 'ROMERO SOSA MIGUEL', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 17067.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17067.96, 11947.57, 11947.57, 'Francisco I Madero num 720', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 120, 'BD Analitica por ahorrador '),
(107, 1, '00100096', '', 'SALAZAR VALENCIA MARIA OCOTLAN ENRIQUETA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 94600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 94600, 66220, 66220, '2 Pte no 52', 'Centro', 'Rafael Lara Grajales', 'S/D', 121, 'BD Analitica por ahorrador '),
(108, 1, '00100097', '', 'SANCHEZ HERNANDEZ IRENE', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 84703.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 84703.57, 59292.5, 59292.5, 'San Francisco s/n', 'Benito Juarez', 'Soltepec', 'S/D', 122, 'BD Analitica por ahorrador '),
(109, 1, '00100098', '', 'SANCHEZ HERNANDEZ RICARDA', '', 'Partes sociales', '0040', 300, 'Certificado de ahorro', 'S/F', 4245.52, 'Depósito a plazo fijo', '47159', 405300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 409845.52, 286891.86, 167930, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 123, 'BD Analitica por ahorrador '),
(110, 1, '00100099', '', 'SANCHEZ LEONARDO JOSE RODOLFO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '45929', 8855.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8855.56, 6198.89, 6198.89, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 124, 'BD Analitica por ahorrador '),
(111, 1, '00100100', '', 'SANCHEZ LOMELI VENTURA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '64904', 200, 'Depósito a plazo fijo', '65497', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20200, 14140, 14140, 'Miguel Hidalgo num 12', 'Isabel Tepetzala', 'Acajete', 'S/D', 125, 'BD Analitica por ahorrador '),
(112, 1, '00100101', '', 'SANCHEZ PEREZ JOSE ANDRES', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '18', 100001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100001, 70000.7, 70000.7, 'Cabo Franco num699', 'Barrio Guadalupe', 'Libres', '2764730574', 126, 'BD Analitica por ahorrador '),
(113, 1, '00100102', '', 'SARMIENTO HUERTA EVELIA', '', 'Ficha universal', '547379', 300, 'Certificado de ahorro', '516087', 24700, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25000, 17500, 17500, '5 norte num 17', 'Centro', 'Rafael Lara Grajales', 'S/D', 127, 'BD Analitica por ahorrador '),
(114, 1, '00100103', '', 'SARMIENTOS FERNANDEZ IRMA', '', 'Ficha de depósito', '188-216', 300, 'Ficha de depósito', '188216', 100, 'Ficha de depósito', '189-217', 19600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20000, 14000, 14000, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 128, 'BD Analitica por ahorrador '),
(115, 1, '00100104', '', 'SARMIENTOS LOPEZ OTILIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', '184-212', 10284.48, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10284.48, 7199.14, 7199.14, 'Calle sin nombre s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 129, 'BD Analitica por ahorrador '),
(116, 1, '00100105', '', 'SILVA BAUTISTA SEGIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '45315', 430000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 430000, 301000, 167930, '3 Oriente no 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 130, 'BD Analitica por ahorrador '),
(117, 1, '00100106', '', 'TORRES CRUZ MARIBEL', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 300914.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 300914.66, 210640.26, 167930, '7 Sur num 33', 'Centro', 'Rafael Lara Grajales', 'S/D', 131, 'BD Analitica por ahorrador '),
(118, 1, '00100107', '', 'UGARTE LOZANO JOSE LUIS', '', 'Partes sociales', '0322', 300, 'Ficha de depósito', 'S/F', 5868.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6168.3, 4317.81, 4317.81, '9 Poniente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 132, 'BD Analitica por ahorrador '),
(119, 1, '00100108', '', 'VALDIVIA BARRALES CAROLINA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 5068.62, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5068.62, 3548.03, 3548.03, '7 poniente s/n', 'Barrio de Jesus', 'Acajete', 'S/D', 133, 'BD Analitica por ahorrador '),
(120, 1, '00100109', '', 'VALENCIA BAEZ OSCAR', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '43597', 11768, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11768, 8237.6, 8237.6, 'Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 134, 'BD Analitica por ahorrador '),
(121, 1, '00100110', '', 'VARGAS VELEZ MARIA DEL ROSARIO SOLEDAD', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '46827', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 200000, 140000, 140000, '5 norte num s/n', 'San Jose Chiapa', 'San Jose Chiapa', 'S/D', 135, 'BD Analitica por ahorrador '),
(122, 1, '00100111', '', 'VAZQUEZ PEREZ ROSA', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 69385.85, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 69385.85, 48570.1, 48570.1, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 136, 'BD Analitica por ahorrador '),
(123, 1, '00100112', '', 'VEDE PEREZ JOSE FERNANDO TRINIDAD', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '40571', 49640.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 49640.14, 34748.1, 34748.1, '14 Oriente s/n', 'Centro', 'San Jose Chiapa', 'S/D', 137, 'BD Analitica por ahorrador '),
(124, 1, '00100113', '', 'VILLEGAS BONILLA CLEMENCIA', '', 'Partes sociales ', '382', 300, 'Certificado de ahorro', '39418', 1928.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2228.21, 1559.75, 1559.75, 'S/D', 'San Bartolo Pinal', 'Acajete', 'S/D', 138, 'BD Analitica por ahorrador '),
(125, 1, '00200001', '', 'ABUNDIO SANCHEZ ESTELA ROSA', '', 'Partes sociales', '1923', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12500, 8750, 8750, 'Cuautilica s/n', 'Seccion tercera', 'Zoquitlan', '012383922524', 139, 'BD Analitica por ahorrador '),
(126, 1, '00200002', '', 'ALTAMIRANO LOPEZ MARIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2566', 2884000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4336000, 3035200, 167930, '2 Poniente num 201', 'Centro', 'Tehuacan', 'S/D', 140, 'BD Analitica por ahorrador '),
(127, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2181', 1452000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 141, 'BD Analitica por ahorrador '),
(128, 1, '00200003', '', 'ALVAREZ ATILANO MARIA CATALINA', '', 'Partes sociales', '1631', 500, 'Certificado de ahorro', '2605', 5625, 'Depósito a plazo fijo', '2605', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 56125, 39287.5, 39287.5, 'Xicotencatl num219', 'Cuauhtemoc', 'Tehuacan', 'S/D', 142, 'BD Analitica por ahorrador '),
(129, 1, '00200004', '', 'ANSELMO RAMOS JULIAN', '', 'Partes sociales', '1627', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2632', 50712.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51212.5, 35848.75, 35848.75, 'Benito Juarez Sur s/n', 'Cuautotolapa', 'Ajalpan', 'S/D', 143, 'BD Analitica por ahorrador '),
(130, 1, '00200005', '', 'ANSELMO RIVERA EVA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73820', 17800, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30300, 21210, 21210, 'Zoquitlan s/n', 'Segunda Seccion', 'Tecpanzcoalco', 'S/D', 144, 'BD Analitica por ahorrador '),
(131, 1, '', '', '', '', 'Partes sociales', '2015', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73817', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 145, 'BD Analitica por ahorrador '),
(132, 1, '00200006', '', 'ANSELMO RIVERA TERESA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '120', 103700, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 152200, 106540, 106540, 'Zoquitlan s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 146, 'BD Analitica por ahorrador '),
(133, 1, '', '', '', '', 'Partes sociales', '5', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '113', 48000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 147, 'BD Analitica por ahorrador '),
(134, 1, '00200007', '', 'ARELLANO SANTIAGO MARGARITA', '', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'W5-171', 50000, 'S/D', '0', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, '26 Sur num 535', 'Venustiano Carranza', 'Tehuacan', 'S/D', 148, 'BD Analitica por ahorrador '),
(135, 1, '00200008', '', 'ARIAS HERNANDEZ JESUS DELFINO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2779', 8414.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8914.57, 6240.2, 6240.2, 'Camelia Oriente num 120', 'Francisco Sarabia', 'Tehuacan', 'S/D', 149, 'BD Analitica por ahorrador '),
(136, 1, '00200009', '', 'ARJONA PAVIA FANNY MARIA DE JESUS', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2374', 468000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 556297.26, 389408.08, 167930, '14 Oriente num 111', 'Buenos Aires', 'Tehuacan', 'S/D', 150, 'BD Analitica por ahorrador '),
(137, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2374', 34697.26, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 151, 'BD Analitica por ahorrador '),
(138, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2657', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 152, 'BD Analitica por ahorrador '),
(139, 1, '', '', '', '', 'Ficha de depósito', '434', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2674', 13100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 153, 'BD Analitica por ahorrador '),
(140, 1, '00200010', '', 'BACA LOPEZ FRANCISCO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1323', 500500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 501000, 350700, 167930, 'Ramon Corona num315', 'Reforma', 'Tehuacan', '1075375', 154, 'BD Analitica por ahorrador '),
(141, 1, '00200011', '', 'BAGLIETO MORA JUAN MANUEL', '', 'Partes sociales', '2229', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Privada 4 Norte 1825', 'Buenos Aires', 'Tehuacan', '238-383-23-34', 155, 'BD Analitica por ahorrador '),
(142, 1, '', '', '', '', 'Partes sociales', '8912', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 156, 'BD Analitica por ahorrador '),
(143, 1, '00200012', '', 'BARRIGUETE RAMIREZ CECILIO', '', 'Partes sociales', '2182', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1823', 80340, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 80840, 56588, 56588, 'Agustin Lara mza 132 Lote 1045', 'San Jose Tlahuac', 'Tehuacan', 'S/D', 157, 'BD Analitica por ahorrador '),
(144, 1, '00200013', '', 'BARTOLO VALERIO BERTHA INES', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4619', 18380.85, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18380.85, 12866.6, 12866.6, 'Avenida Nacional s/n', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 158, 'BD Analitica por ahorrador '),
(145, 1, '00200014', '', 'BARTOLO VALERIO CONCEPCION ROSARIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4633B', 78584.92, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 78584.92, 55009.44, 55009.44, '7 poniente num 303', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 159, 'BD Analitica por ahorrador '),
(146, 1, '00200015', '', 'BAUTISTA SERRANO JOSE JOEL', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '158', 31000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 31500, 22050, 22050, 'Juarez num221', 'Seccion primera', 'Zinacatepec', 'S/D', 160, 'BD Analitica por ahorrador '),
(147, 1, '00200016', '', 'BECERRA MACHADO FERNANDO Y/O HERNANDEZ HERNANDEZ VIRGINIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6285', 160000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 160000, 112000, 112000, '22 Norte num 619', 'San Rafael', 'Tehuacan', 'S/D', 161, 'BD Analitica por ahorrador '),
(148, 1, '00200017', '', 'BELLO MARTINEZ CELESTINO', '', 'Partes sociales', '1491', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2491', 193256.44, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 193756.44, 135629.51, 135629.51, 'Av 22 de Feb 423 Sauce 205', 'San Marcos', 'Azcapotzalco', 'S/D', 162, 'BD Analitica por ahorrador '),
(149, 1, '00200018', '', 'BENITEZ SAID JESUS', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10000, 7000, 7000, '16 Oriente num 109', 'Sarabia', 'Tehuacan', 'S/D', 163, 'BD Analitica por ahorrador '),
(150, 1, '00200019', '', 'BIBIANO JERONIMO ARTEMIO', '', 'Partes sociales', '1386', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2727', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Avenida Portes Gil num1022', 'San Nicolas', 'Tetitzintla', 'S/D', 164, 'BD Analitica por ahorrador '),
(151, 1, '00200020', '', 'BOLAÑOS MOGUEL ALFREDO DAMIAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8970', 576500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 920000, 644000, 167930, '20 Poniente 110', 'El Eden', 'Tehuacan', 'S/D', 165, 'BD Analitica por ahorrador '),
(152, 1, '', '', '', '', 'Partes sociales', '735', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8965', 343000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 166, 'BD Analitica por ahorrador '),
(153, 1, '00200021', '', 'BOLAÑOS MOGUEL FLOR VERONICA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '715', 97000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 97000, 67900, 67900, 'Lazaro Cardenas num2418', 'Francisco Villa', 'Tehuacan', 'S/D', 167, 'BD Analitica por ahorrador '),
(154, 1, '00200022', '', 'BONFIL MARTINEZ ROBERTA HERACLIA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 630.96, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1332.87, 933.01, 933.01, 'Zoquitlan s/n', 'Barrio 2', 'Zoquitlan', 'S/D', 168, 'BD Analitica por ahorrador '),
(155, 1, '', '', '', '', 'Partes sociales', '2008', 500, 'Certificado de ahorro', 'S/F', 201.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 169, 'BD Analitica por ahorrador '),
(156, 1, '00200023', '', 'BUENABAD CASTILLA JOSEFA', '', 'Partes sociales', '2250', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73877', 39919.23, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40419.23, 28293.46, 28293.46, 'San Sebastian Frontera S/N', 'Sebastian Frontera', 'Santiago Chazumba', 'S/D', 170, 'BD Analitica por ahorrador ');
INSERT INTO `analiticasTemporales` (`idanaliticasTemporales`, `revisionesTemporales_idrevisionesTemporales`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `curp`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(157, 1, '00200024', '', 'CABRERA HERNANDEZ ELVIRA', '', 'Partes sociales', '2144', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73220', 20248.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20748.38, 14523.87, 14523.87, 'Av Vicente Guerrero num 307', 'Santa Maria Monte', 'Vicente Guerrero', 'S/D', 171, 'BD Analitica por ahorrador '),
(158, 1, '00200025', '', 'CACHO GARCIA BEATRIZ', '', 'Partes sociales', '733', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '159', 8500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, 'Reforma num 6', 'Centro', 'San Jose Miahuatlan', 'S/D', 172, 'BD Analitica por ahorrador '),
(159, 1, '00200026', '', 'CALDERON SOLIS REGINO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '60116', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10000, 7000, 7000, 'Venustiano Carranza num 24', 'Centro', 'Zinacatepec', 'S/D', 173, 'BD Analitica por ahorrador '),
(160, 1, '00200027', '', 'CAMACHO ALONSO JOSE JUAN', '', 'Partes sociales', '1522', 500, 'Ficha de depósito', 'S/F', 36595.02, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 37095.02, 25966.51, 25966.51, '12 Sur num 1930', '16 de Marzo', 'Tehuacan ', 'S/D', 174, 'BD Analitica por ahorrador '),
(161, 1, '00200028', '', 'CARRANZA MARIN PABLO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74027', 50333.33, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50833.33, 35583.33, 35583.33, 'Barrio Peña Blanca s/n', 'Peña Blanca', 'San Lucas Zoquiampan', 'S/D', 175, 'BD Analitica por ahorrador '),
(162, 1, '00200029', '', 'CARRERA CARRERA CATARINA AMPARO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8993', 177500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 187863.1, 131504.17, 131504.17, 'Josefa Ortiz de Dominguez num 547', 'Nicolas Bravo', 'Tehuacan', 'S/D', 176, 'BD Analitica por ahorrador '),
(163, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72805', 10363.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 177, 'BD Analitica por ahorrador '),
(164, 1, '00200030', '', 'CARRERA LEZAMA FERNANDO MANUEL', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '69828', 36228.61, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36728.61, 25710.03, 25710.03, '13 Poniente num 434', 'Benito Juarez', 'Tehuacan', 'S/D', 178, 'BD Analitica por ahorrador '),
(165, 1, '00200031', '', 'CASTILLO ARCOS MODESTA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2419', 1300000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1300000, 910000, 167930, '2 norte num139', 'Zaragoza', 'Tehuacan', 'S/D', 179, 'BD Analitica por ahorrador '),
(166, 1, '00200032', '', 'CASTILLO GOMEZ DANIEL', '', 'Partes sociales', '1800', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '167', 2900000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2900500, 2030350, 167930, 'Priv 5 num Edif 2012', 'Los Pinos', 'Tehuacan', 'S/D', 180, 'BD Analitica por ahorrador '),
(167, 1, '00200033', '', 'CASTRO PANTZI ABEL ANDRES', '', 'Partes sociales', '1638', 83000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 83000, 58100, 58100, '5 de febrero sur num 532', 'Coculco', 'Ajalpan', 'S/D', 181, 'BD Analitica por ahorrador '),
(168, 1, '00200034', '', 'CERQUERA DE LA CRUZ CRISPIN', '', 'Partes sociales', '1337', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2405', 11566.16, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12066.16, 8446.31, 8446.31, '5 sur num917', 'Nicolas Bravo', 'Tehuacan', 'S/D', 182, 'BD Analitica por ahorrador '),
(169, 1, '00200035', '', 'CHAVEZ MARTINEZ MARIA LORENA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2499', 93000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93000, 65100, 65100, '9 Oriente num 905', 'La Purisima', 'Tehuacan', 'S/D', 183, 'BD Analitica por ahorrador '),
(170, 1, '00200036', '', 'CORREA REYES LORENA', '', 'Partes sociales', '1403', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2673', 12018.16, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12518.16, 8762.71, 8762.71, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 184, 'BD Analitica por ahorrador '),
(171, 1, '00200037', '', 'CORREA REYES MATILDE', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2730', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 70500, 49350, 49350, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 185, 'BD Analitica por ahorrador '),
(172, 1, '00200038', '', 'CORREO JUAREZ EDUARDO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72537', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8000, 5600, 5600, 'Mariano Matamoros num 177', 'Centro', 'San Gabriel Chilac', 'S/D', 186, 'BD Analitica por ahorrador '),
(173, 1, '00200039', '', 'CORTES REYES ISRAEL', '', 'Partes sociales', '1638', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6267', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Independencia num 6', 'San Juan Atzingo', 'San Gabriel Chilac', '012371052829', 187, 'BD Analitica por ahorrador '),
(174, 1, '00200040', '', 'CORTES REYES PEDRO PASCUAL', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '71832', 13200, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20700, 14490, 14490, 'Priv 15 norte num 22', 'Obreros Peñafiel', 'Teotitlan Flores', '2381374231', 188, 'BD Analitica por ahorrador '),
(175, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2451', 7500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 189, 'BD Analitica por ahorrador '),
(176, 1, '00200041', '', 'CORTES LOPEZ JOSE', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2421', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, '6 Poniente num 511', 'Santiago Miahuatlan', 'Tehuacan', 'S/D', 190, 'BD Analitica por ahorrador '),
(177, 1, '00200042', '', 'CORTEZ COELLO CIRENIA', '', 'Partes sociales', '1407', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '70451', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Priv Maestro Aaron Joaquin num 2312', 'Mexico Sur', 'Coyomeapan', 'S/D', 191, 'BD Analitica por ahorrador '),
(178, 1, '00200043', '', 'CRUZ AVENDAÑO GONZALO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74061', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12500, 8750, 8750, '8 Norte 416', 'Serdan', 'Serdan', '012381085381', 192, 'BD Analitica por ahorrador '),
(179, 1, '00200044', '', 'CRUZ PARRA PAULINA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2648', 150000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150500, 105350, 105350, '13 Oriente Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 193, 'BD Analitica por ahorrador '),
(180, 1, '00200045', '', 'CUELLO MONTAL DIONISIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '75044', 131400.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 131900.66, 92330.46, 92330.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 194, 'BD Analitica por ahorrador '),
(181, 1, '00200046', '', 'DE JESUS HERNANDEZ JUANA', '', 'Partes sociales', '170', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '83', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Telpatlan s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 195, 'BD Analitica por ahorrador '),
(182, 1, '00200047', '', 'DE JESUS MACEDONIO FRANCISCO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4630B', 300000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 300000, 210000, 167930, 'Real num 203', 'Jose Maria Morelos', 'Tlachichuca', 'S/D', 196, 'BD Analitica por ahorrador '),
(183, 1, '00200048', '', 'DE LOS SANTOS SALINAS JOSE', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'W514244', 4000, 'Depósito a plazo fijo', '2590', 95000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 99000, 69300, 69300, '3 oriente num12', 'Centro', 'Atexcal', 'S/D', 197, 'BD Analitica por ahorrador '),
(184, 1, '00200049', '', 'DIAZ OSORIO JUAN', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74043', 109765.77, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 110265.77, 77186.04, 77186.04, 'Buena Vista s/n', 'Santa Maria Teopoxco', 'Santa Maria Teopoxco', 'S/D', 198, 'BD Analitica por ahorrador '),
(185, 1, '00200050', '', 'DIEGO GAYTAN ALEJANDRO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1693', 117500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 117500, 82250, 82250, 'Aeromexico num Lote 36', 'Aeropuerto', 'Tehuacan', 'S/D', 199, 'BD Analitica por ahorrador '),
(186, 1, '00200051', '', 'DUARTE HUITZITL AGRIPINA ALICIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1636', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, 'Zoquitlan s/n', 'Zoquitlan', 'Zoquitlan', 'S/D', 200, 'BD Analitica por ahorrador '),
(187, 1, '00200052', '', 'DUARTE OLMOS FIDENCIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1554', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50000, 35000, 35000, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 201, 'BD Analitica por ahorrador '),
(188, 1, '00200053', '', 'DURAN AVENDAÑO LEOVIGILDA', '', 'Partes sociales', '1759', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1713', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Republica Brazil num 2512', 'America', 'Tehuacan', 'S/D', 202, 'BD Analitica por ahorrador '),
(189, 1, '00200054', '', 'DURAN LOPEZ FLORENCIO LAZARO', '', 'Partes sociales', '1600', 500, 'Ficha de depósito', 'U142576', 41508.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 42008.73, 29406.11, 29406.11, 'Guerrero num 13', 'Cuauhtemoc', 'San Juan B Cuicatlan', 'S/D', 203, 'BD Analitica por ahorrador '),
(190, 1, '00200055', '', 'FERMIN HERNANDEZ ESTEBAN', '', 'Partes sociales', '2313', 500, 'Ficha de depósito', '701646', 8633.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9133.67, 6393.57, 6393.57, '1RA Priv 9 nte 7', 'Observatorio', 'Tehuacan', 'S/D', 204, 'BD Analitica por ahorrador '),
(191, 1, '00200056', '', 'FLORES ARCOS DOLORES', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1415', 175800, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 175800, 123060, 123060, 'Reforma Sur 700', 'Centro', 'Tehuacan', 'S/D', 205, 'BD Analitica por ahorrador '),
(192, 1, '00200057', '', 'FLORIAN COLMENARES DELIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1107', 1400000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1825343.19, 1277740.23, 167930, '3 era Privada de la 3 Oriente num10', 'El Mirador', 'Tehuacan', 'S/D', 206, 'BD Analitica por ahorrador '),
(193, 1, '', '', '', '', 'Partes sociales', '1459', 500, 'Certificado de ahorro', 'S/F', 224843.19, 'Depósito a plazo fijo', '1525', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 207, 'BD Analitica por ahorrador '),
(194, 1, '00200058', '', 'FLORIUK GONZALEZ MARIA EUGENIA', '', 'Partes sociales', '8963', 900000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 900000, 630000, 167930, '3 Sur 313 y 3 oriente', 'Centro', 'Tehuacan', '238-383-23-34', 208, 'BD Analitica por ahorrador '),
(195, 1, '00200059', '', 'GALVAN RODRIGUEZ ADELA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 7000, 'Depósito a plazo fijo', '2626', 16000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23500, 16450, 16450, 'Pipila num2027', 'Aeropuerto', 'Tehuacan', 'S/D', 209, 'BD Analitica por ahorrador '),
(196, 1, '00200060', '', 'GALVEZ GONZALEZ ELIA TRINIDAD', '', 'Partes sociales', '827', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2377', 19000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 19500, 13650, 13650, '4 Oriente num 717 4', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 210, 'BD Analitica por ahorrador '),
(197, 1, '00200061', '', 'GALVEZ GONZALEZ MARIA DEL CARMEN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6274', 90000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 90000, 63000, 63000, '3 Norte num 211', 'Centro', 'Tehuacan', 'S/D', 211, 'BD Analitica por ahorrador '),
(198, 1, '00200062', '', 'GALVEZ GONZALEZ SOLEDAD', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 15424.16, 'S/D', '0', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15424.16, 10796.91, 10796.91, '3 norte num 211', 'Centro', 'Tehuacan', 'S/D', 212, 'BD Analitica por ahorrador '),
(199, 1, '00200063', '', 'GARCIA BRETON MARIA JOSEFINA EVARISTA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2330', 10892.55, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10892.55, 7624.79, 7624.79, 's/nombre s/n', 'Temaxcalapa', 'Cañada Morelos', 'S/D', 213, 'BD Analitica por ahorrador '),
(200, 1, '00200064', '', 'GARCIA GARCIA MARCELINA', '', 'Partes sociales', '3053', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '16518', 36633.15, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 37133.15, 25993.21, 25993.21, '13 Mza 103 LT 19', 'Valle de los Reyes', 'La Paz Mexico', 'S/D', 214, 'BD Analitica por ahorrador '),
(201, 1, '00200065', '', 'GARCIA LOPEZ CONSUELO', '', 'Partes sociales', '4777', 105000, 'Ficha de depósito', 'F11130', 3030.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 108030.38, 75621.27, 75621.27, '11 oriente num 741', 'Nicolas Bravo', 'Tehuacan', 'S/D', 215, 'BD Analitica por ahorrador '),
(202, 1, '00200066', '', 'GARCIA MARTINEZ JUANA', '', 'Partes sociales', '1605', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74076', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10500, 7350, 7350, 'Lerdo de Tejada num 924 Galeana Y 11 Poniente', 'Benito Juarez', 'Tehuacan', 'S/D', 216, 'BD Analitica por ahorrador '),
(203, 1, '00200067', '', 'GARCIA MARTINEZ RAYMUNDO', '', 'Partes sociales', '775', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73890', 15486.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15986.28, 11190.4, 11190.4, '26 Sur num 1936', 'Puebla', 'Tehuacan', 'S/D', 217, 'BD Analitica por ahorrador '),
(204, 1, '00200068', '', 'GASPAR GONZALEZ GORGONIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73809', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25500, 17850, 17850, 'Puerto de angel s/n', 'Puerto san Angel', 'Ajalpan', 'S/D', 218, 'BD Analitica por ahorrador '),
(205, 1, '', '', '', '', 'Partes sociales', '1986', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73816', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 219, 'BD Analitica por ahorrador '),
(206, 1, '00200069', '', 'GASPAR MONTALVO MAURA', '', 'Partes sociales', '1956', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '124', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3500, 2450, 2450, 'Puerto de angel s/n', 'Barrio Atempa', 'Ajalpan', 'S/D', 220, 'BD Analitica por ahorrador '),
(207, 1, '00200070', '', 'GINEZ GINEZ ADRIAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '84', 25305.35, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 123576.13, 86503.29, 86503.29, 'sin nombre s/n', 'Santa Maria Monte', 'Vicente Guerrero', '2361126582', 221, 'BD Analitica por ahorrador '),
(208, 1, '', '', '', '', 'Partes sociales', '2116', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '85', 97770.78, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 222, 'BD Analitica por ahorrador '),
(209, 1, '00200071', '', 'GONZALEZ GARCIA CONRADO AUSENCIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1703', 51900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51900, 36330, 36330, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 223, 'BD Analitica por ahorrador '),
(210, 1, '00200072', '', 'GONZALEZ GIL MARIANO', '', 'Partes sociales', '2223', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1674', 20869.24, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21369.24, 14958.47, 14958.47, 'Morelos num17', 'Barrio Gonzalisco', 'Ajalpan', 'S/D', 224, 'BD Analitica por ahorrador '),
(211, 1, '00200073', '', 'GONZALEZ MONTALVO RIGOBERTO', '', 'Partes sociales', '1501275', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '32681', 8500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, '4 Oriente 117', 'Centro', 'Tehuacan', '238-383-23-34', 225, 'BD Analitica por ahorrador '),
(212, 1, '00200074', '', 'GORDILLO JIMENEZ VELINO', '', 'Partes sociales', '905', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1544', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 500500, 350350, 167930, '16 de septiembre num913', 'Hidalgo', 'Tehuacan', 'S/D', 226, 'BD Analitica por ahorrador '),
(213, 1, '00200075', '', 'HERNANDEZ ANASTACIO SERAFINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74049', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 66817.38, 46772.17, 46772.17, 'Callejon Jacarandas num 12', 'Aeropuerto', 'Tehuacan', 'S/D', 227, 'BD Analitica por ahorrador '),
(214, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74092', 36817.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 228, 'BD Analitica por ahorrador '),
(215, 1, '00200076', '', 'HERNANDEZ BENITEZ HERON REMIGIO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2736', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Avenida 5 de mayo num11', 'Centro', 'Cañada Morelos', 'S/D', 229, 'BD Analitica por ahorrador '),
(216, 1, '00200077', '', 'HERNANDEZ ESPINOZA ALBERTA', '', 'Partes sociales', '1522', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1542', 26780, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 27280, 19096, 19096, 'Cerrada de Amdo Nervo num8', 'La Purisima', 'Tehuacan', 'S/D', 230, 'BD Analitica por ahorrador '),
(217, 1, '00200078', '', 'HERNANDEZ GONZALEZ JUANA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1602', 61300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 90600, 63420, 63420, 'Vicente Guerrero s/n', 'Villa Nueva', 'Santa Maria Teopoxco', 'S/D', 231, 'BD Analitica por ahorrador '),
(218, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1541', 29300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 232, 'BD Analitica por ahorrador '),
(219, 1, '00200079', '', 'HERNANDEZ HERNANDEZ ARACELI', '', 'Partes sociales', '2277', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1551', 18173.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18673.99, 13071.79, 13071.79, '5 norte num110', 'Centro', 'Tehuacan', 'S/D', 233, 'BD Analitica por ahorrador '),
(220, 1, '00200080', '', 'HERNANDEZ HERNANDEZ MARIA MARGARITA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '43748', 4476.52, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4976.52, 3483.56, 3483.56, 'Priv Atlixco num 1913', 'San Juan Bautista', 'Cuicatlan', '1071257', 234, 'BD Analitica por ahorrador '),
(221, 1, '00200081', '', 'HERNANDEZ OLAYA GUADALUPE DELFINA', '', 'Partes sociales', '732', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '10139', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Benito Juarez 513', 'Centro', 'Zinacatepec', '012362811431', 235, 'BD Analitica por ahorrador '),
(222, 1, '00200082', '', 'HERNANDEZ REYES MARIA AGUSTINA', '', 'Ficha de depósito ', 'W5-12258', 500, 'Certificado de ahorro', 'S/F', 36370, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36870, 25809, 25809, 'Priv Miguel Hidalgo num 623 Int 1', 'San Lorenzo Teopilco', 'Tehuacan', 'S/D', 236, 'BD Analitica por ahorrador '),
(223, 1, '00200083', '', 'HUERTA ALVAREZ ROSA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 260000, 182000, 167930, '2 Oriente num 712', 'Centro', 'Tehuacan', 'S/D', 237, 'BD Analitica por ahorrador '),
(224, 1, '', '', '', '', 'Partes sociales', '5352', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 238, 'BD Analitica por ahorrador '),
(225, 1, '', '', '', '', 'Partes sociales', '5327', 134500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 239, 'BD Analitica por ahorrador '),
(226, 1, '', '', '', '', 'Partes sociales', '5328', 75000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 240, 'BD Analitica por ahorrador '),
(227, 1, '00200084', '', 'HUERTA ROMUALDO ISAAC', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Pino Suarez num 327', 'Jesus Carranza', 'Zinacatepec', 'S/D', 241, 'BD Analitica por ahorrador '),
(228, 1, '', '', '', '', 'Partes sociales', '10135', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 242, 'BD Analitica por ahorrador '),
(229, 1, '00200085', '', 'JIMENEZ RIVERA SIBILINA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 158555.13, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 159055.13, 111338.59, 111338.59, 'Privada Nacional Lote 49', 'Vista hermosa', 'Teotipilco', '23610445555', 243, 'BD Analitica por ahorrador '),
(230, 1, '00200086', '', 'JUANA GASPAR MONTALVO', '', 'Partes sociales', '1992', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73815', 33100, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 33600, 23520, 23520, 'El mirador s/n', 'El mirado', 'Ajalpan', 'S/D', 244, 'BD Analitica por ahorrador '),
(231, 1, '00200087', '', 'JUAREZ SANCHEZ CLEMENCIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2670', 216500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 216500, 151550, 151550, 'Quinta Privada 6 Oriente num619', 'Quinta Guadalupe', 'Tehuacan', 'S/D', 245, 'BD Analitica por ahorrador '),
(232, 1, '00200088', '', 'JULITA HERNANDEZ MAGDALENA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 20300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20300, 14210, 14210, '16 de Septiembre num 101', 'Zentlapatl', 'Zinacatepec', '012361121232', 246, 'BD Analitica por ahorrador '),
(233, 1, '00200089', '', 'LADINO GARCIA PATRICIA', '', 'Partes sociales', '11435', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18815.97, 13171.18, 13171.18, 'Lazaro Cardenas num 904 B', 'El Riego', 'Tehuacan', 'S/D', 247, 'BD Analitica por ahorrador '),
(234, 1, '', '', '', '', 'Ficha de depósito', '11436', 18315.97, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 248, 'BD Analitica por ahorrador '),
(235, 1, '00200090', '', 'LARA MARTINEZ GERMAN', '', 'Partes sociales', '1400', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 249547.79, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 250047.79, 175033.45, 167930, 'Sor Juana Ines de la Cruz num 3512', 'Fracc Cultural', 'Tehuacan', 'S/D', 249, 'BD Analitica por ahorrador '),
(236, 1, '00200091', '', 'LEYVA OLMOS CARMELA', '', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'S/F', 6020.32, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6520.32, 4564.22, 4564.22, 'Porfirio Diaz num1201', 'Centro', 'Zinacatepec', 'S/D', 250, 'BD Analitica por ahorrador '),
(237, 1, '00200092', '', 'LEYVA PACHECO GREGORIO', '', 'Partes sociales', '731', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '151', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Privada Guerrero 806 int5', 'Centro', 'Zinacatepec', 'S/D', 251, 'BD Analitica por ahorrador '),
(238, 1, '00200093', '', 'LEZAMA FERNANDEZ JUDITH SULLY', '', 'Partes sociales', '922', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', 'S/F', 149587.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150087.93, 105061.55, 105061.55, 'Privada de la 6 oriente num 19 int 6', 'Centro', 'Tehuacan', 'S/D', 252, 'BD Analitica por ahorrador '),
(239, 1, '00200094', '', 'LEZAMA TOBON JOSE', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2705', 150000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150000, 105000, 105000, 'Callejon Hidalgo no 520', 'La Pedrera', 'Tehuacan', 'S/D', 253, 'BD Analitica por ahorrador '),
(240, 1, '00200095', '', 'LIMA LEON TEODORO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8978', 600000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 652500, 456750, 167930, 'Priv 7 sur andador 3 56', 'La purisima', 'Tehuacan', '012383830713', 254, 'BD Analitica por ahorrador '),
(241, 1, '', '', '', '', 'Partes sociales', '695', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', '901481', 52000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 255, 'BD Analitica por ahorrador '),
(242, 1, '00200096', '', 'LOPEZ GARCIA ROBERTO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60500, 42350, 42350, '4 Sur num 1120', 'Benito Juarez', 'Tehuacan', 'S/D', 256, 'BD Analitica por ahorrador '),
(243, 1, '', '', '', '', 'Partes sociales', '6262', 60000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 257, 'BD Analitica por ahorrador '),
(244, 1, '00200097', '', 'LOPEZ GAYOSSO EZEQUIEL', '', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'W515774', 5457.46, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5957.46, 4170.22, 4170.22, 'Justo Sierra num3708', 'Cultural', 'Tehuacan', 'S/D', 258, 'BD Analitica por ahorrador '),
(245, 1, '00200098', '', 'LOPEZ HERNANDEZ GERARDO', '', 'Partes sociales', '1524', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'W6-15548', 56083.32, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 56583.32, 39608.32, 39608.32, 'Gardenia num 4115', 'Villa Vista', 'Tehuacan', 'S/D', 259, 'BD Analitica por ahorrador '),
(246, 1, '00200099', '', 'LOPEZ SANCHEZ PETRA', '', 'Partes sociales', '6222', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50000, 35000, 35000, 'Puerto de Veracruz 2128', 'Revolucion', 'Tehuacan', 'S/D', 260, 'BD Analitica por ahorrador '),
(247, 1, '00200100', '', 'LUCAS MORALES LEONARDO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2683.06, 'Depósito a plazo fijo', '53473', 8407.17, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11590.23, 8113.16, 8113.16, 'Privada 19 sur num 1913', 'Las Flores', 'Tehuacan', '012383838246', 261, 'BD Analitica por ahorrador '),
(248, 1, '00200101', '', 'LUNA CARRETO SILVIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'W5-15646', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Privada Amado Nervo num 331', 'La Purisima', 'Tehuacan', 'S/D', 262, 'BD Analitica por ahorrador '),
(249, 1, '00200102', '', 'MALCON OROZCO GUADALUPE', '', 'Partes sociales', '1501236', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1681', 193886.26, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 194386.26, 136070.38, 136070.38, 'Privada la Paz num119', 'Centro', 'Tehuacan', '3823944', 263, 'BD Analitica por ahorrador '),
(250, 1, '00200103', '', 'MALDONADO QUINTANA RAMON', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1649', 350000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 350000, 245000, 167930, 'De la 6 Oriente num 602', 'Francisco Sarabia', 'Tehuacan', 'S/D', 264, 'BD Analitica por ahorrador '),
(251, 1, '00200104', '', 'MARCELINO HERNANDEZ CARMELITA JOAQUINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2464', 14500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 14500, 10150, 10150, 'Venustiano Carranza num 714', 'Sentlalpal', 'Zinacatepec', 'S/D', 265, 'BD Analitica por ahorrador '),
(252, 1, '00200105', '', 'MARCELINO HERNANDEZ GORGONIO FELIPE', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 12000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12500, 8750, 8750, '16 de Septiembre num 504', 'Barr Zentlapatl', 'Zincatepec', 'S/D', 266, 'BD Analitica por ahorrador '),
(253, 1, '00200106', '', 'MARTINEZ GARCIA CAROLINA', '', 'Partes sociales', '6280', 150000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150000, 105000, 105000, 'Hector Lezama Sur Roca 337', 'La Purisima', 'Tehuacan', 'S/D', 267, 'BD Analitica por ahorrador '),
(254, 1, '00200107', '', 'MARTINEZ JIMENEZ DANIELA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1732', 1500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1500000, 1050000, 167930, 'Biarritz num 116', 'Arcadia', 'Tehuacan', 'S/D', 268, 'BD Analitica por ahorrador '),
(255, 1, '00200108', '', 'MARTINEZ MORFINEZ MARIA ANGELICA', '', 'Partes sociales', '1405', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '62404', 11007, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11507, 8054.9, 8054.9, 'C Matamoros num 10', 'Centro', 'San Gabriel Chilac', 'S/D', 269, 'BD Analitica por ahorrador '),
(256, 1, '00200109', '', 'MARTINEZ VALERIO MIGUEL ANGEL GERMAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1695', 1000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1000000, 700000, 167930, 'Priv Biarritz num 116', 'Fracc Arcadia', 'Tehuacan', 'S/D', 270, 'BD Analitica por ahorrador '),
(257, 1, '00200110', '', 'MENDOZA DIEGO MAGARITA INES', '', 'Partes sociales', '1131', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'W56258', 9500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10000, 7000, 7000, 'Venustiano Carranza num 1908', '16 de Marzo', 'Tehuacan', 'S/D', 271, 'BD Analitica por ahorrador '),
(258, 1, '00200111', '', 'MIGUEL SANTIAGO OMEGA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '8997', 900000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 900000, 630000, 167930, 'Macario Gaxiola edif 27 202', 'U Hab las Armas', 'Azcapotzalco', 'S/D', 272, 'BD Analitica por ahorrador '),
(259, 1, '00200112', '', 'MOLINA GOMEZ LUCIO', '', 'Partes sociales', '76', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 442443.53, 309710.47, 167930, '5 sur esq con 11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', 'S/D', 273, 'BD Analitica por ahorrador '),
(260, 1, '', '', '', '', 'Partes sociales', '4605B', 441943.53, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 274, 'BD Analitica por ahorrador '),
(261, 1, '00200113', '', 'MOLINA LOPEZ JULIA AMALIA', '', 'Partes sociales', '75', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 306928.88, 214850.22, 167930, '11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', '012383830001', 275, 'BD Analitica por ahorrador '),
(262, 1, '', '', '', '', 'Pagaré', '4604', 306428.88, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 276, 'BD Analitica por ahorrador '),
(263, 1, '00200114', '', 'MONTALVO ANSELMO AMBROCIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2250', 325500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 325500, 227850, 167930, 'Tepexilotla s/n', 'Seccion Tercera', 'Zoquitlan', 'S/D', 277, 'BD Analitica por ahorrador '),
(264, 1, '00200115', '', 'MORAL CANO GONZALO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73819', 36600, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36600, 25620, 25620, 'Primera Seccion', 'Barrio Zacapechco', 'Zoquitlan', 'S/D', 278, 'BD Analitica por ahorrador '),
(265, 1, '00200116', '', 'MORALES JIMENEZ HERMINIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2728', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Guadalupe Victoria num1640', 'Aeropuerto', 'Tehuacan', '2381133641', 279, 'BD Analitica por ahorrador '),
(266, 1, '00200117', '', 'MORALES ROJAS ALFREDO VICTOR', '', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'S/F', 238300.12, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 238800.12, 167160.08, 167160.08, '12 poniente num617', 'Lazaro Cardena Norte', 'Tehuacan', 'S/D', 280, 'BD Analitica por ahorrador '),
(267, 1, '00200118', '', 'MORENO ANGELA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 20000, 'Depósito a plazo fijo', '2761', 159117.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 179617.63, 125732.34, 125732.34, 'Privada Nacional LT 49A', 'Vista Hermosa', 'Tehuacan', 'S/D', 281, 'BD Analitica por ahorrador '),
(268, 1, '00200119', '', 'OLAYA ROMERO SOCORRO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '154', 112900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 163400, 114380, 114380, 'Benito Juarez num513', 'Centro', 'Zinacatepec', 'S/D', 282, 'BD Analitica por ahorrador '),
(269, 1, '', '', '', '', 'Partes sociales', '580', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '155', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 283, 'BD Analitica por ahorrador '),
(270, 1, '00200120', '', 'OLMOS DORANTES DULCE MARIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2589', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50500, 35350, 35350, 'Juquilita Lote 5', 'Maldonado Colosio', 'Tehuacan', 'S/D', 284, 'BD Analitica por ahorrador '),
(271, 1, '00200121', '', 'OLMOS VALENCIA LEONARDO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2597', 50000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 150500, 105350, 105350, 'Ocotlamanic s/n', 'Ocotla', 'Coxcatlan', 'S/D', 285, 'BD Analitica por ahorrador '),
(272, 1, '', '', '', '', 'Partes sociales', '1030', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2598', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 286, 'BD Analitica por ahorrador '),
(273, 1, '00200122', '', 'ORTIZ JIMENEZ VIRGINIA ORTENCIA', '', 'Partes sociales', '1957', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72771', 35400, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 35900, 25130, 25130, 'Av 5 de mayo num 5', 'Seccion cuarta', 'Zoquitlan', 'S/D', 287, 'BD Analitica por ahorrador '),
(274, 1, '00200123', '', 'OSORIO GUZMAN HERLINDA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6288', 350000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 350000, 245000, 167930, 'Del panteon s/n', 'San Juan Atzingo', 'San Gabriel Chilac', 'S/D', 288, 'BD Analitica por ahorrador '),
(275, 1, '00200124', '', 'PARRA GARRERA MARTHA', '', 'Partes sociales', '1419', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2490', 60000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60500, 42350, 42350, '13 Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 289, 'BD Analitica por ahorrador '),
(276, 1, '00200125', '', 'PASTRANA SOLIS FROYLAN', '', 'Partes sociales', '1640', 500, 'Certificado de ahorro', 'S/F', 3006.44, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3506.44, 2454.51, 2454.51, '18 Poniente num 818', 'Tetizintla', 'Tehuacan', 'S/D', 290, 'BD Analitica por ahorrador '),
(277, 1, '00200126', '', 'PEREZ MENDEZ MATEO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1784', 4247652, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10557652, 7390356.4, 167930, 'Reforma norte num 127', 'Centro', 'Tehuacan', 'S/D', 291, 'BD Analitica por ahorrador '),
(278, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '3806', 2310000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 292, 'BD Analitica por ahorrador '),
(279, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '65566', 2000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 293, 'BD Analitica por ahorrador '),
(280, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1110', 2000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 294, 'BD Analitica por ahorrador '),
(281, 1, '00200127', '', 'PEREZ NAVA ADRIANA', '', 'Partes sociales', '12065', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '420', 31500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 32000, 22400, 22400, 'Corregidora num2', 'San Jose Tilapa', 'Coxcatlan', 'S/D', 295, 'BD Analitica por ahorrador '),
(282, 1, '00200128', '', 'QUIXTIANO COGQUE MIGUEL', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1684', 410989, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 410989, 287692.3, 167930, 'Revolucion num 415', 'Guadalupe', 'Ajalpan', 'S/D', 296, 'BD Analitica por ahorrador '),
(283, 1, '00200129', '', 'QUIXTIANO TEMAXTE SOFIA', '', 'Partes sociales', '2224', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1675', 68501, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 69001, 48300.7, 48300.7, 'Revolucion Poniente num17', 'Centro', 'Ajalpan', 'S/D', 297, 'BD Analitica por ahorrador '),
(284, 1, '00200130', '', 'RABAGO BALBUENA MARIA CONCEPCION JOSEFINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4627-B', 2841262.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3650262.43, 2555183.7, 167930, 'Av Reforma Sur num 317', 'Centro', 'Tehuacan', 'S/D', 298, 'BD Analitica por ahorrador '),
(285, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1692', 309000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 299, 'BD Analitica por ahorrador '),
(286, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '170', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 300, 'BD Analitica por ahorrador '),
(287, 1, '00200131', '', 'RAMIREZ BAUTISTA OLGA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '65682', 26050, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26550, 18585, 18585, 'Manuel Hernandez num 804', 'Xaltepec', 'Altepexi', 'S/D', 301, 'BD Analitica por ahorrador '),
(288, 1, '00200132', '', 'RAMIREZ CABRERA CONCEPCION', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2748', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, '10 Poniente num 405', 'Cerritos', 'Tehuacan', 'S/D', 302, 'BD Analitica por ahorrador '),
(289, 1, '00200133', '', 'RAMIREZ CARRERA MARIA DEL SOCORRO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2622', 115000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 115500, 80850, 80850, '10 Poniente num407', 'Cerritos', 'Tehuacan', 'S/D', 303, 'BD Analitica por ahorrador '),
(290, 1, '00200134', '', 'RAMIREZ CORDOVA EULALIA', '', 'Partes sociales', '40', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '60248', 8500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, 'Zoquitlan s/n', 'Tercera Seccion', 'Tecpanzcoalco', 'S/D', 304, 'BD Analitica por ahorrador '),
(291, 1, '00200135', '', 'RAMIREZ DOMINGUEZ GRECIA CAROLINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2409', 220000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 220000, 154000, 154000, 'Avenida Ramon Caballero num641', 'San Rafael', 'Tehuacan', 'S/D', 305, 'BD Analitica por ahorrador '),
(292, 1, '00200136', '', 'RAMIREZ GARCIA NORBERTO', '', 'Partes sociales', '2010', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '110', 100000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100500, 70350, 70350, 'Seccion seguda num', 'Loma Ixmicapa', 'Zoquitlan', 'S/D', 306, 'BD Analitica por ahorrador '),
(293, 1, '00200137', '', 'RAMIREZ PAZOS JORGE', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 689335.31, 'Depósito a plazo fijo', '1702', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 889835.31, 622884.72, 167930, 'Prol 1 poniente 3000', 'Fracc Reforma', 'Tehuacan', 'S/D', 307, 'BD Analitica por ahorrador '),
(294, 1, '00200138', '', 'RAMIREZ VAQUERO ROMUALDO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2079', 160000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 160000, 112000, 112000, 'Ramon Caballero num 611', 'San Rafael', 'Tehuacan', 'S/D', 308, 'BD Analitica por ahorrador '),
(295, 1, '00200139', '', 'RCHING RAMIREZ SOCORRO SOLEDAD', '', 'Partes sociales', '1500891', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1352', 421223.78, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 421723.78, 295206.65, 167930, 'Avenida Reforma Sur sn', 'Guadalupe Hidalgo', 'Tehuacan', '3717275', 309, 'BD Analitica por ahorrador '),
(296, 1, '00200140', '', 'REYES VENTURA ANGELICA', '', 'Partes sociales', '2154', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', 'MH-15629', 36122.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36622.21, 25635.55, 25635.55, 'Independencia num 32', 'Centro', 'Tehuacan', 'S/D', 310, 'BD Analitica por ahorrador '),
(297, 1, '00200141', '', 'RODRIGUEZ ARCE RICARDA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2338', 4359.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15761.4, 11032.98, 11032.98, 'Ocotlamanic s/n', 'Ocotlamanic', 'Coxcatlan', 'S/D', 311, 'BD Analitica por ahorrador '),
(298, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2688', 10902.22, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 312, 'BD Analitica por ahorrador '),
(299, 1, '00200142', '', 'RODRIGUEZ ARCE TAURINO ANGELES', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74083', 116420.65, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 116420.65, 81494.46, 81494.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 313, 'BD Analitica por ahorrador '),
(300, 1, '00200143', '', 'RODRIGUEZ CUELLO ROLANDO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6279', 147000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 147000, 102900, 102900, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 314, 'BD Analitica por ahorrador '),
(301, 1, '00200144', '', 'RODRIGUEZ MOLINA ROSA', '', 'Pagaré', '4611', 542483.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 542483.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1084966.56, 759476.59, 167930, '11 Ote num 500 Esquina con 5 Sur', 'Nicolas Bravo', 'Tehuacan', 'S/D', 315, 'BD Analitica por ahorrador '),
(302, 1, '00200145', '', 'ROMERO CID MARIA', '', 'Partes sociales', '859', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '64952', 12200, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12700, 8890, 8890, 'Nacional num 83 1A Secc', 'Nicolas Bravo', 'Tehuacan', 'S/D', 316, 'BD Analitica por ahorrador '),
(303, 1, '00200146', '', 'ROMERO DUARTE TAURINO CARLOS', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73854', 73651.32, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 73651.32, 51555.92, 51555.92, 'Av Rafael Avila Camacho num 227', 'Centro', 'San Gabriel Chilac', 'S/D', 317, 'BD Analitica por ahorrador '),
(304, 1, '00200147', '', 'ROSALES VILLANUEVA ROSARIO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1700', 370000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 370500, 259350, 167930, 'Heroes de Nacozari Norte num 124 Int 1', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 318, 'BD Analitica por ahorrador '),
(305, 1, '00200148', '', 'RUIZ FLORES MARTHA NANCY Y/O FlORES GARCIA PAULINA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 30000, 'Depósito a plazo fijo', '2775', 38000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 68500, 47950, 47950, 'Av Nicolas Bravo num 702', 'Nicolas Bravo', 'Tehuacan', 'S/D', 319, 'BD Analitica por ahorrador '),
(306, 1, '00200149', '', 'SAENZ ESCALANTE GUSTAVO', '', 'Partes sociales', '6292', 2000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 14270000, 9989000, 167930, 'Bould Ingeniero Pastor Rouaix num 700', 'Benito Juarez', 'Tehuacan', 'S/D', 320, 'BD Analitica por ahorrador '),
(307, 1, '', '', '', '', 'Partes sociales', '6242', 4000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 321, 'BD Analitica por ahorrador '),
(308, 1, '', '', '', '', 'Partes sociales', '4123', 3000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 322, 'BD Analitica por ahorrador '),
(309, 1, '', '', '', '', 'Partes sociales', '6255', 1000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 323, 'BD Analitica por ahorrador '),
(310, 1, '', '', '', '', 'Partes sociales', '74077', 200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 324, 'BD Analitica por ahorrador '),
(311, 1, '', '', '', '', 'Partes sociales', '74059', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 325, 'BD Analitica por ahorrador '),
(312, 1, '', '', '', '', 'Partes sociales', '74074', 1000000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 326, 'BD Analitica por ahorrador '),
(313, 1, '', '', '', '', 'Partes sociales', '6256', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 327, 'BD Analitica por ahorrador '),
(314, 1, '', '', '', '', 'Partes sociales', '6293', 1000000, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74078', 1500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 328, 'BD Analitica por ahorrador '),
(315, 1, '00200150', '', 'SALINAS FLORES HERIBERTO CARLOS', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 61310.56, 'Depósito a plazo fijo', '2472', 54000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 115810.56, 81067.39, 81067.39, '5 norte num642', 'Cerritos', 'Tehuacan', 'S/D', 329, 'BD Analitica por ahorrador ');
INSERT INTO `analiticasTemporales` (`idanaliticasTemporales`, `revisionesTemporales_idrevisionesTemporales`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `curp`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(316, 1, '00200151', '', 'SANCHEZ COELLO CATALINA JAQUELINA', '', 'Partes sociales', '63', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '121', 17900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18400, 12880, 12880, 'Zoquitlan s/n', 'Tecpantzacualco', 'Zoquitlan', 'S/D', 330, 'BD Analitica por ahorrador '),
(317, 1, '00200152', '', 'SANCHEZ HERNANDEZ CARLOS', '', 'Partes sociales', '1511', 500, 'Certificado de ahorro', 'S/F', 5141.7, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5641.7, 3949.19, 3949.19, 'Republica de Panama num 2325', 'America', 'Cuicatlan', 'S/D', 331, 'BD Analitica por ahorrador '),
(318, 1, '00200153', '', 'SANCHEZ MENDEZ FAUSTINO', '', 'Partes sociales', '1556', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6276', 50500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 51000, 35700, 35700, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 332, 'BD Analitica por ahorrador '),
(319, 1, '00200154', '', 'SANCHEZ MONTALVO CATALINA', '', 'Ficha de depósito', '1437', 500, 'Ficha de depósito', 'W515535', 12006.58, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12506.58, 8754.61, 8754.61, 'Salinas num 28', 'Chalma', 'Tehuacan', 'S/D', 333, 'BD Analitica por ahorrador '),
(320, 1, '00200155', '', 'SANCHEZ MONTALVO FLORENCIO', '', 'Partes sociales', '2190', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73896', 25540.41, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26040.41, 18228.29, 18228.29, '7 Sur 1106 Santa Maria 1106', 'Centro', 'Tehuacan', 'S/D', 334, 'BD Analitica por ahorrador '),
(321, 1, '00200156', '', 'SANCHEZ RAMOS LETICIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74047', 31000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 31500, 22050, 22050, 'Callejon Pachuca num 5', 'Hidalgo Tehuantepec', 'Tehuacan', 'S/D', 335, 'BD Analitica por ahorrador '),
(322, 1, '00200157', '', 'SANCHEZ ROMERO ARCENIO IGNACIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1753', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15975, 11182.5, 11182.5, 'Vicente Guerrero lt-6', '21 de Marzo', 'Tehuacan', 'S/D', 336, 'BD Analitica por ahorrador '),
(323, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '530', 975, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 337, 'BD Analitica por ahorrador '),
(324, 1, '00200158', '', 'SANCHEZ SANCHEZ LEOPOLDO', '', 'Partes sociales', 'S/F', 500000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 500000, 350000, 167930, 'Nicolas Bravo num 19 A', 'Loc San Jose Ixtapa', 'Cañada Morelos', 'S/D', 338, 'BD Analitica por ahorrador '),
(325, 1, '00200159', '', 'SANDOVAL ATILANO GILBERTO', '', 'Partes sociales', '1911', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '125', 35000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 35500, 24850, 24850, 'Tepeaca de Zaragoza s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 339, 'BD Analitica por ahorrador '),
(326, 1, '00200160', '', 'SANDOVAL GONZALEZ EMILIANO', '', 'Partes sociales', '1999', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '118', 36000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36500, 25550, 25550, 'Domicilio conocido s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 340, 'BD Analitica por ahorrador '),
(327, 1, '00200161', '', 'SANDOVAL QUIAHUA LEONARDO', '', 'Partes sociales', '2141', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 90500, 63350, 63350, 'San Bartolo s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 341, 'BD Analitica por ahorrador '),
(328, 1, '', '', '', '', 'Partes sociales', '10006', 90000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 342, 'BD Analitica por ahorrador '),
(329, 1, '00200162', '', 'SANTIAGO LOPEZ EMMA MARIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1767', 643500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 643500, 450450, 167930, 'Andador 3/1', 'La Purisima', 'Tehuacan', 'S/D', 343, 'BD Analitica por ahorrador '),
(330, 1, '00200163', '', 'SERAFIN MONTALVO EMMA', '', 'Partes sociales', '1983', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '96', 35000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 35500, 24850, 24850, 'Playa Vicente s/n', 'Playa Vicente', 'Ajalpan', 'S/D', 344, 'BD Analitica por ahorrador '),
(331, 1, '00200164', '', 'TAPIA HERNANDEZ FILADELFIA', '', 'Partes sociales', '0349', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '75289', 22253.42, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 22753.42, 15927.39, 15927.39, 'Reforma num 89', 'San Jose del Chilar', 'Cuicatlan', 'S/D', 345, 'BD Analitica por ahorrador '),
(332, 1, '00200165', '', 'TEMOXTLE GARCIA EUFEMIA', '', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', '90-1865', 15003.28, 'S/D', '0', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15503.28, 10852.3, 10852.3, 'Av Morelos num 2', 'Zacapanga', 'Vicente Guerrero', 'S/D', 346, 'BD Analitica por ahorrador '),
(333, 1, '00200166', '', 'TENORIO CARRILLO LUZ MARIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72793', 73573.43, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 94490, 66143, 66143, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', '012383831718', 347, 'BD Analitica por ahorrador '),
(334, 1, '', '', '', '', 'Partes sociales', '709', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73869', 20416.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 348, 'BD Analitica por ahorrador '),
(335, 1, '00200167', '', 'TENORIO GARCIA SANDRA LUCY', '', 'Ficha de depósito', '781', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1716', 21145, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21645, 15151.5, 15151.5, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 349, 'BD Analitica por ahorrador '),
(336, 1, '00200168', '', 'TORRES ALVA GUILLERMO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '2707', 26122.21, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26622.21, 18635.55, 18635.55, 'Dom Conocido s/n', 'Seccion Cuarta', 'Zoquitlan', 'S/D', 350, 'BD Analitica por ahorrador '),
(337, 1, '00200169', '', 'TRUJILLO MORENO RAFAELA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1615', 43812.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 43812.4, 30668.68, 30668.68, '2 Poniente num 1617', 'Aquiles Serdan', 'Tehuacan', 'S/D', 351, 'BD Analitica por ahorrador '),
(338, 1, '00200170', '', 'VALENCIA PEREZ ANGELA', '', 'Partes sociales', '1402', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1482', 14591, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15091, 10563.7, 10563.7, 'Centenario num 42', 'Centro', 'San Jeronimo Teocatl', 'S/D', 352, 'BD Analitica por ahorrador '),
(339, 1, '00200171', '', 'VALERIO FUENTES CAMILA MARINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '4636', 159000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 159000, 111300, 111300, 'Av 7 sur num 205', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 353, 'BD Analitica por ahorrador '),
(340, 1, '00200172', '', 'VARELA ROMAN MARCO ANTONIO', '', 'Partes sociales', '1010', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1738', 162000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 162500, 113750, 113750, '8 Pte num Edficio 404 Int DTO 303', 'Fovisst Garci Crespo', 'Tehuacan', 'S/D', 354, 'BD Analitica por ahorrador '),
(341, 1, '00200173', '', 'VARELA ROMAN MARIA TERESA', '', 'Partes sociales', '1501164', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1664', 1101000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1101500, 771050, 167930, '3 oriente', 'Centro', 'Tehuacan', '3835231', 355, 'BD Analitica por ahorrador '),
(342, 1, '00200174', '', 'VARELA ROMAN SERAFINA ENCARNACION', '', 'Partes sociales', '983', 500, 'Certificado de ahorro', 'S/F', 350188.4, 'Depósito a plazo fijo', '1724', 346071.06, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 696759.46, 487731.62, 167930, '3 Norte num 1612', 'Francisco Sarabia', 'Tehuacan', 'S/D', 356, 'BD Analitica por ahorrador '),
(343, 1, '00200175', '', 'VARILLAS CASTRO JOSE EDUARDO FAUSTO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '6257', 195500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 230994.82, 161696.37, 161696.37, 'Independencia num 4', 'San Jose Buena Vista', 'Tlacotepec', 'S/D', 357, 'BD Analitica por ahorrador '),
(344, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '74097', 30277.52, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 358, 'BD Analitica por ahorrador '),
(345, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 5217.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 359, 'BD Analitica por ahorrador '),
(346, 1, '00200176', '', 'VEGA COELLO ANDRES ELEAZAR', '', 'Partes sociales', '11', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '128', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30500, 21350, 21350, 'Obregon s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 360, 'BD Analitica por ahorrador '),
(347, 1, '00200177', '', 'VIVEROS MONTALVO JORGIN ALICIA', '', 'Partes sociales', '1996', 500, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '73802', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5500, 3850, 3850, 'Av Nacional num 12', 'Segunda Seccion', 'Zoquitlan', 'S/D', 361, 'BD Analitica por ahorrador '),
(348, 1, '00200178', '', 'ZAQUEROS COELLO ERASTO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '1393', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15000, 10500, 10500, 'Cacaloc s/n', 'Xala', 'Zoquitlan', 'S/D', 362, 'BD Analitica por ahorrador '),
(349, 1, '00200179', '', 'ZARATE BARRAGAN EPIGMENIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Depósito a plazo fijo', '72784', 330767.75, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 330767.75, 231537.43, 167930, '7 Oriente num112', 'Francisco I Madero', 'Tepanco de Lopez', 'S/D', 363, 'BD Analitica por ahorrador '),
(350, 1, '00200180', '', 'ZARATE RAMOS MARGARITA', '', 'Partes sociales', 'S/F', 500, 'Ficha de depósito', 'S/F', 15000, 'Depósito a plazo fijo', '2533', 37874, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 53374, 37361.8, 37361.8, 'Nuevo Leon Sur num1914', 'Mexico', 'Tehuacan', 'S/D', 364, 'BD Analitica por ahorrador '),
(351, 1, '00300001', '', 'AGUIRRE MORALES ERIKA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1939.79, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2439.79, 1707.85, 1707.85, '5 de Mayo 91', 'Monte Chiquito', 'Santiago Miahuatlan', 'S/D', 365, 'BD Analitica por ahorrador '),
(352, 1, '00300002', '', 'ALTA ARANDIA LEONOR', '', 'Recibo de depósito', '115-1-14', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3500, 2450, 2450, '28 Oriente 534', 'Santiago Tula', 'Tehuacan', 'S/D', 366, 'BD Analitica por ahorrador '),
(353, 1, '00300003', '', 'ALTA MARTINEZ TERESA', '', 'Recibo de depósito', '115-1-16', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-002', 15826.12, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16326.12, 11428.28, 11428.28, 'Agua Axoxopan 2100 B', 'Villas Agua Blanca', 'Tehuacan', 'S/D', 367, 'BD Analitica por ahorrador '),
(354, 1, '00300004', '', 'ALVARADO SOLANO MANUELA HORTENCIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '007008', 222000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 222500, 155750, 155750, '3 Sur 1301', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 368, 'BD Analitica por ahorrador '),
(355, 1, '00300005', '', 'ANASTACIO ALFONSO HERMELINDO', '', 'Recibo de depósito', '11515', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 351386.26, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 351886.26, 246320.38, 167930, '17 de Septiembre 28', 'Hidalgo', 'Teotitlan', 'S/D', 369, 'BD Analitica por ahorrador '),
(356, 1, '00300006', '', 'ANDRADE JUSTINIANO MINERVA', '', 'Recibo de depósito', '5065', 500, 'Recibo de depósito', '5913', 10383.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10883.63, 7618.54, 7618.54, '4 Sur 702', 'Centro', 'Tecamachalco', 'S/D', 370, 'BD Analitica por ahorrador '),
(357, 1, '00300007', '', 'APOLINAR PACHECO PABLO', '', 'Partes sociales', '60473', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '60474', 97500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 98000, 68600, 68600, 'Vicente Guerrero 1108', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 371, 'BD Analitica por ahorrador '),
(358, 1, '00300008', '', 'ARISTA HERNANDEZ CRISTINA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '009-006', 186824.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 187324.73, 131127.31, 131127.31, 'Nahoas 17', 'Ancon', 'La Paz Mexico', 'S/D', 372, 'BD Analitica por ahorrador '),
(359, 1, '00300009', '', 'ARISTA HERNANDEZ HERLINDA', '', 'Partes sociales', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006002', 26200, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 180213.06, 126149.14, 126149.14, 'Buena Vista 2512', 'El Humilladero', 'Tehuacan', 'S/D', 373, 'BD Analitica por ahorrador '),
(360, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '007001', 33400, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 374, 'BD Analitica por ahorrador '),
(361, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '008001', 26924, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 375, 'BD Analitica por ahorrador '),
(362, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006005', 30050, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 376, 'BD Analitica por ahorrador '),
(363, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '007003', 34990.06, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 377, 'BD Analitica por ahorrador '),
(364, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '008002', 28149, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 378, 'BD Analitica por ahorrador '),
(365, 1, '00300010', '', 'ATENOGENEZ GUERRERO MICAELA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006006', 8796.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9296.31, 6507.42, 6507.42, 'Casa Blanca 1', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 379, 'BD Analitica por ahorrador '),
(366, 1, '00300011', '', 'BARRAGAN GERALDO HIPOLITO', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11517', 11464.94, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11964.94, 8375.46, 8375.46, '6 Sur', 'Marcos Necoxtla', 'Tehuacan', 'S/D', 380, 'BD Analitica por ahorrador '),
(367, 1, '00300012', '', 'BARRAGAN RIVERA CELIA CONCEPCION', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115123', 10737.08, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11237.08, 7865.96, 7865.96, 'Av Nacional Oriente 111', 'Maria Pinosuarez', 'Tehuacan', 'S/D', 381, 'BD Analitica por ahorrador '),
(368, 1, '00300013', '', 'BAUTISTA OLIVARES CATALINA AVERTINA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '004017', 52000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 52500, 36750, 36750, 'San Luis Temalacayuca', 'Luis Temalacayuca', 'Tepanco de Lopez', 'S/D', 382, 'BD Analitica por ahorrador '),
(369, 1, '00300014', '', 'BOLAÑOS CORTES CLAUDIA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '11516', 2879.15, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3379.15, 2365.41, 2365.41, 'Miguel Hidalgo 14', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 383, 'BD Analitica por ahorrador '),
(370, 1, '00300015', '', 'BRAVO HERNANDEZ RICARDA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 95500, 66850, 66850, '25 Oriente 923', 'Nicolas Bravo 3ra Se', 'Tehuacan', 'S/D', 384, 'BD Analitica por ahorrador '),
(371, 1, '', '', '', '', 'Ficha de depósito', '193005', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 385, 'BD Analitica por ahorrador '),
(372, 1, '00300016', '', 'CAMACHO TORRES JUAN FRANCISCO', '', 'Recibo de depósito', '11515', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 70000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 70500, 49350, 49350, 'Prol 4 Sur 2100', 'Industrial', 'Santa Maria Coapan', 'S/D', 386, 'BD Analitica por ahorrador '),
(373, 1, '00300017', '', 'CARPINTEYRO DE JESUS HORTENCIA', '', 'Partes sociales', '11516', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 11479.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11979.4, 8385.58, 8385.58, 'Av 15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 387, 'BD Analitica por ahorrador '),
(374, 1, '00300018', '', 'CARRERA JUAREZ IVON', '', 'Recibo de depósito', 'S/F', 500, 'Recibo de depósito', '11514', 218.43, 'Recibo de depósito', '004001', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30718.43, 21502.9, 21502.9, 'Iturbide 124', 'Tepanco de Lopez', 'Tlacotepec', 'S/D', 388, 'BD Analitica por ahorrador '),
(375, 1, '00300019', '', 'CASTAÑEDA MENDEZ CATALINA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-15', 3794.79, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4294.79, 3006.35, 3006.35, 'Dalia 4605', 'Antonio Viveros', 'Tehuacan', 'S/D', 389, 'BD Analitica por ahorrador '),
(376, 1, '00300020', '', 'CASTAÑEDA VALENCIA GREGORIO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2134, 'Recibo de depósito', '005-001', 38500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 41134, 28793.8, 28793.8, 'Av Hidalgo 45', 'Cuayucatepec', 'Tehuacan', 'S/D', 390, 'BD Analitica por ahorrador '),
(377, 1, '00300021', '', 'CASTILLO PEREZ CARLOS', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-8', 12249.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12749.93, 8924.95, 8924.95, 'Sagrado Corazon de Jesus 7', 'Zentlapatl', 'Zinacatepec', 'S/D', 391, 'BD Analitica por ahorrador '),
(378, 1, '00300022', '', 'CECILIO EUSEVIO GENOVEVA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11519', 24777.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25277.18, 17694.03, 17694.03, 'Juarez Poniente 138', 'Maria Coapan', 'Tehuacan', 'S/D', 392, 'BD Analitica por ahorrador '),
(379, 1, '00300023', '', 'CLEMENTE ROMERO GUADALUPE CARMEN', '', 'Recibo de depósito', '11513', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 11557.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12057.5, 8440.25, 8440.25, '7 Oriente 4', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 393, 'BD Analitica por ahorrador '),
(380, 1, '00300024', '', 'CONTRERAS PACHECO CATALINA', '', 'Recibo de depósito', '115130', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005003', 100001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100501, 70350.7, 70350.7, '25 de Febrero 919', 'Observatorio', 'Tepanco de Lopez', '2381272213', 394, 'BD Analitica por ahorrador '),
(381, 1, '00300025', '', 'CONTRERAS VAZQUEZ OCOTLAN', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 966.51, 'Recibo de depósito', '004006', 29837.17, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 31303.68, 21912.58, 21912.58, 'Leon Guzman 334', 'Reforma', 'Tehuacan', 'S/D', 395, 'BD Analitica por ahorrador '),
(382, 1, '00300026', '', 'CORTES DOLORES MARCELA RAQUEL', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11518', 2268.41, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2768.41, 1937.89, 1937.89, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 396, 'BD Analitica por ahorrador '),
(383, 1, '00300027', '', 'CORTEZ PEREZ ALBERTINA', '', 'Recibo de depósito', '115-1-35', 500, 'Recibo de depósito', '115-1-10', 6497.61, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6997.61, 4898.33, 4898.33, 'Viente Guerrero 155', 'San Lorezno Teopilco', 'Tehuacan', 'S/D', 397, 'BD Analitica por ahorrador '),
(384, 1, '00300028', '', 'CORTEZ RAMIREZ ROSA', '', 'Recibo de depósito', '115-1-9', 500, 'Recibo de depósito', '115-1-18', 6030.52, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6530.52, 4571.36, 4571.36, '7 Poniente 230', 'La Pedrera', 'Tehuacan', 'S/D', 398, 'BD Analitica por ahorrador '),
(385, 1, '00300029', '', 'CRUZ DE LA CRUZ JOSE ALFREDO', '', 'Recibo de depósito', '115-1-30', 500, 'Recibo de depósito', '115-1-4', 5494.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5994.6, 4196.22, 4196.22, 'Centenario 500', 'Hidalgo', 'Tehuacan', 'S/D', 399, 'BD Analitica por ahorrador '),
(386, 1, '00300030', '', 'CRUZ VILLEGAS ERNESTINA LEONOR', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 21000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 46500, 32550, 32550, 'Privada 25 dur 123', 'El Rosario', 'Tehuacan', 'S/D', 400, 'BD Analitica por ahorrador '),
(387, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005009', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 401, 'BD Analitica por ahorrador '),
(388, 1, '00300031', '', 'DE JESUS MENDOZA GENOVEBA MARGARITA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 99500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100000, 70000, 70000, '15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 402, 'BD Analitica por ahorrador '),
(389, 1, '00300032', '', 'DE LA CRUZ ZUÑIGA EDITH', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '5872', 23280.54, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 23280.54, 16296.38, 16296.38, '17 Sur 703', 'San Sebastian', 'Tecamachalco', 'S/D', 403, 'BD Analitica por ahorrador '),
(390, 1, '00300033', '', 'DOMINGUEZ LUCAS ROSALIA', '', 'Recibo de depósito', '115126', 500, 'Recibo de depósito', '115119', 8980.8, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9480.8, 6636.56, 6636.56, '22 Poniente 2416', 'San Rafael', 'Ahuatempan', 'S/D', 404, 'BD Analitica por ahorrador '),
(391, 1, '00300034', '', 'ENRIQUE BRAVO CECILIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005002', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15500, 10850, 10850, 'Isabel la catolica 725', 'Morelos', 'Tehuacan', 'S/D', 405, 'BD Analitica por ahorrador '),
(392, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004017', 5500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 406, 'BD Analitica por ahorrador '),
(393, 1, '00300035', '', 'ESPINOZA PACHECO FRANCISCO CONSTANTINO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 21000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 407, 'BD Analitica por ahorrador '),
(394, 1, '00300036', '', 'FLORES RODRIGUEZ ELIAS', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005005', 179184.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 179184.99, 125429.49, 125429.49, '11 Norte 113', 'Independencia', 'Tehuacan', 'S/D', 408, 'BD Analitica por ahorrador '),
(395, 1, '00300037', '', 'FLORES RODRIGUEZ JAVIER', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '010006', 600000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 600000, 420000, 167930, '7 Norte 2000', 'Emiliano Zapata', 'Tehuacan', 'S/D', 409, 'BD Analitica por ahorrador '),
(396, 1, '00300038', '', 'FLORES VERA PATRICIA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 9096.22, 'Recibo de depósito', '004012', 26660.81, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 36257.03, 25379.92, 25379.92, 'Av Zacatecas 4', 'Tlacuitlapan', 'Tlacotepec', 'S/D', 410, 'BD Analitica por ahorrador '),
(397, 1, '00300039', '', 'FLORES VERA RUFINA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '115137', 34467.4, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 34467.4, 24127.18, 24127.18, '6 Sur 3', 'Seccion Tercera', 'Tlacotepec', 'S/D', 411, 'BD Analitica por ahorrador '),
(398, 1, '00300040', '', 'FUENTES GONZALEZ ABELINO NICOLAS', '', 'Recibo de depósito', '115-1-26', 500, 'Recibo de depósito', '115-1-19', 500, 'Recibo de depósito', '115-1-36', 400, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1400, 980, 980, 'Mariano Matamoros 120', 'Centro', 'San Gabriel Chilac', 'S/D', 412, 'BD Analitica por ahorrador '),
(399, 1, '00300041', '', 'FUENTES NARVAEZ JULIANA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115125', 1613.51, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2113.51, 1479.46, 1479.46, 'Sonora Sur 1504', 'Mexico Sur', 'Tehuacan', 'S/D', 413, 'BD Analitica por ahorrador '),
(400, 1, '00300042', '', 'GARCIA CHAVEZ DIANA ASUNCION', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '64552', 10579.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11079.71, 7755.8, 7755.8, 'Priv Las Dalias 8', 'El Eden', 'Tehuacan', 'S/D', 414, 'BD Analitica por ahorrador '),
(401, 1, '00300043', '', 'GARCIA CRUZ EUFEMIA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 1620.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1620.14, 1134.1, 1134.1, '14 Pte 807 Int A', 'SanRafael', 'Tehuacan', 'S/D', 415, 'BD Analitica por ahorrador '),
(402, 1, '00300044', '', 'GARCIA DE LA LUZ XOCHITL', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115126', 3007.33, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3507.33, 2455.13, 2455.13, 'Alvaro Obregon 50', 'Centro', 'Coxcatlan', 'S/D', 416, 'BD Analitica por ahorrador '),
(403, 1, '00300045', '', 'GARCIA FLORES ANTONINA TEODULA', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115121', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25000, 17500, 17500, '15 Norte 108', 'Obrero Peñafiel', 'Tehuacan', 'S/D', 417, 'BD Analitica por ahorrador '),
(404, 1, '00300046', '', 'GARCIA GARCIA CLAUDIA', '', 'Recibo de depósito', '115-1-13', 500, 'Certificado de ahorro', 'S/F', 8024.18, 'Depósito a plazo fijo', 'S/F', 2229.68, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10753.86, 7527.7, 7527.7, 'Miguel Hidalgo 2331', 'America', 'Tehuacan', 'S/D', 418, 'BD Analitica por ahorrador '),
(405, 1, '00300047', '', 'GARCIA GONZALEZ MARIA ALICIA SOTERA', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115113', 40950, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50920.38, 35644.27, 35644.27, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 419, 'BD Analitica por ahorrador '),
(406, 1, '', '', '', '', 'S/D', 'S/F', 500, 'Recibo de depósito', '115114', 9470.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 420, 'BD Analitica por ahorrador '),
(407, 1, '00300048', '', 'GARCIA HERNANDEZ MARIO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005006', 156557.48, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 157057.48, 109940.24, 109940.24, '11 Sur 511', 'La Purisima', 'Tehuacan', 'S/D', 421, 'BD Analitica por ahorrador '),
(408, 1, '00300049', '', 'GARCIA MARTINEZ FELICITAS', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5500, 3850, 3850, '15 Sur 318', 'La Purisima', 'Tehuacan', 'S/D', 422, 'BD Analitica por ahorrador '),
(409, 1, '00300050', '', 'GARCIA REYES ELENA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005002', 825.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2367.84, 1657.49, 1657.49, '26 Sur 2526', '3 de Mayo', 'Tehuacan', 'S/D', 423, 'BD Analitica por ahorrador '),
(410, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 1042.74, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 424, 'BD Analitica por ahorrador '),
(411, 1, '00300051', '', 'GARCIA REYES ZEFERINO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004007', 7315, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 7815, 5470.5, 5470.5, '3A priv De la 26 sur 2604', '3 de Mayo', 'Tehuacan', 'S/D', 425, 'BD Analitica por ahorrador '),
(412, 1, '00300052', '', 'GARCIA RODRIGUEZ IGNACIO FRANCISCO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '6002', 36000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 61500, 43050, 43050, 'Oriente', 'Lomas de Romero', 'Tecamachalco', 'S/D', 426, 'BD Analitica por ahorrador '),
(413, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '4004', 25000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 427, 'BD Analitica por ahorrador '),
(414, 1, '00300053', '', 'GARCIA SORCIA ENRIQUETA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006-001', 17132.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17632.71, 12342.9, 12342.9, 'Alvaro Obregon 817', 'Francisco Sarabia', 'Tehuacan', 'S/D', 428, 'BD Analitica por ahorrador '),
(415, 1, '00300054', '', 'GIL ALVARADO MERCEDES', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 7424.63, 'Recibo de depósito', '007001', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17924.63, 12547.24, 12547.24, 'Adolfo Lopez Mateos 804', '16 de Marzo', 'Tehuacan', 'S/D', 429, 'BD Analitica por ahorrador '),
(416, 1, '00300055', '', 'GOMEZ RODRIGUEZ SERGIO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 50001, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50001, 35000.7, 35000.7, '23 Sur 2314', 'Granjas de Oriente', 'Tehuacan', 'S/D', 430, 'BD Analitica por ahorrador '),
(417, 1, '00300056', '', 'GONZALES MORALES MOISES LUIS', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004010', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15500, 10850, 10850, 'Allende Poniente 104', 'Maria Coapan', 'Tehuacan', 'S/D', 431, 'BD Analitica por ahorrador '),
(418, 1, '00300057', '', 'GONZALEZ BAUTISTA FRANCISCO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 10962.28, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11462.28, 8023.6, 8023.6, 'Priv 2 sur 5', 'Nativitas Cuautempan', 'Coyotepec', 'S/D', 432, 'BD Analitica por ahorrador '),
(419, 1, '00300058', '', 'GONZALEZ VAZQUEZ MARIA YOLANDA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-010', 40502.41, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 87092.13, 60964.49, 60964.49, '3 Oriente 506 Int 6', 'Centro', 'Tehuacan', 'S/D', 433, 'BD Analitica por ahorrador '),
(420, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-004', 5305.56, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 434, 'BD Analitica por ahorrador '),
(421, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-005', 35372.65, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 435, 'BD Analitica por ahorrador '),
(422, 1, '', '', '', '', 'Recibo de depósito', '116-1-4', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-006', 5411.51, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 436, 'BD Analitica por ahorrador '),
(423, 1, '00300059', '', 'GUZMAN MENDEZ FLOR DE MARIA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-30', 21106.66, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21606.66, 15124.66, 15124.66, 'San Luis Potosi 4', 'Tlacotepec', 'Tlacotepec', 'S/D', 437, 'BD Analitica por ahorrador '),
(424, 1, '00300060', '', 'HERNANDEZ ANGEL LETICIA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115-1-17', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5500, 3850, 3850, 'Guerrero 700', 'Francisco I Madero', 'Chapulco', 'S/D', 438, 'BD Analitica por ahorrador '),
(425, 1, '00300061', '', 'HERNANDEZ CRUZ JUAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004008', 110000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1345000, 941500, 167930, 'Lerdo de Tejada 3', 'Tilapa', 'Coxcatlan', 'S/D', 439, 'BD Analitica por ahorrador '),
(426, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004006', 1235000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 440, 'BD Analitica por ahorrador '),
(427, 1, '00300062', '', 'HERNANDEZ GARCI CATALINA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115117', 13402.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13902.91, 9732.04, 9732.04, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 441, 'BD Analitica por ahorrador '),
(428, 1, '00300063', '', 'HERNANDEZ MARISCAL GLORIA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2584.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3084.99, 2159.49, 2159.49, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 442, 'BD Analitica por ahorrador '),
(429, 1, '00300064', '', 'HERNANDEZ MARISCAL GUADALUPE', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004005', 8721.88, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24673.06, 17271.14, 17271.14, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 443, 'BD Analitica por ahorrador '),
(430, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004004', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 444, 'BD Analitica por ahorrador '),
(431, 1, '', '', '', '', 'Ficha de depósito', '58762', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004003', 5451.18, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 445, 'BD Analitica por ahorrador '),
(432, 1, '00300065', '', 'HERNANDEZ MARISCAL JUAN MANUEL', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 632.63, 'Depósito a plazo fijo', 'S/F', 2435.69, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 3568.32, 2497.82, 2497.82, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 446, 'BD Analitica por ahorrador '),
(433, 1, '00300066', '', 'IBAÑEZ DURAN RUPERTO', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-8', 7700, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18200, 12740, 12740, 'Conocido ', 'Catarina Otzolotepec', 'Tehuacan', 'S/D', 447, 'BD Analitica por ahorrador '),
(434, 1, '', '', '', '', 'Recibo de depósito', '115-1-7', 500, 'Recibo de depósito', '115-1-8', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 448, 'BD Analitica por ahorrador '),
(435, 1, '00300067', '', 'INIESTRA HERRERA AMELIA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 60000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60500, 42350, 42350, '16 Poniente 2809', 'San Rafael', 'Tehuacan', 'S/D', 449, 'BD Analitica por ahorrador '),
(436, 1, '00300068', '', 'JIMENEZ HUERTA NORBERTA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 7835.87, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8335.87, 5835.11, 5835.11, 'Venustiano Carranza no 1316', 'Libertad', 'Tehuacan', 'S/D', 450, 'BD Analitica por ahorrador '),
(437, 1, '00300069', '', 'JIMENEZ PEREZ MELITON', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115114', 41054.1, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 41554.1, 29087.87, 29087.87, '15 de Mayo 52', 'San Isidro', 'Santiago Miahuatlan', 'S/D', 451, 'BD Analitica por ahorrador '),
(438, 1, '00300070', '', 'JUAREZ MARTINEZ ROSA MARIA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115111', 50264.83, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 50764.83, 35535.38, 35535.38, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 452, 'BD Analitica por ahorrador '),
(439, 1, '00300071', '', 'LEINES ANDRADE CRISTINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004006', 12619.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30576.26, 21403.38, 21403.38, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 453, 'BD Analitica por ahorrador '),
(440, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 5840.36, 'Recibo de depósito', '004005', 12116.59, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 454, 'BD Analitica por ahorrador '),
(441, 1, '00300072', '', 'LEYNES HERNANDEZ FRANCISCA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004005', 5832.73, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6922.72, 4845.9, 4845.9, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 455, 'BD Analitica por ahorrador '),
(442, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004006', 1089.99, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 456, 'BD Analitica por ahorrador '),
(443, 1, '00300073', '', 'LEYVA ROMERO RUTILD ANGELES', '', 'Ficha de depósito', '108137', 500, 'S/D', 'S/F', 0, 'Ficha de depósito', '108137', 30000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 30500, 21350, 21350, 'Av Guerrero 806 Int 7', 'Centro', 'Zinacatepec', 'S/D', 457, 'BD Analitica por ahorrador '),
(444, 1, '00300074', '', 'LOPEZ GIL MARIO MIGUEL', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004010', 750000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 750000, 525000, 167930, 'Centenario 902', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 458, 'BD Analitica por ahorrador '),
(445, 1, '00300075', '', 'LOPEZ LOPEZ GENARO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 10543.42, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11043.42, 7730.39, 7730.39, 'La paz 1913', 'La Paz', 'S/D', 'S/D', 459, 'BD Analitica por ahorrador '),
(446, 1, '00300076', '', 'LOPEZ MENDEZ GUADALUPE', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '115117', 14346.14, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 14846.14, 10392.3, 10392.3, '4 Poniente 1614 Int 4A', 'Aquiles Serdan', 'Tehuacan', 'S/D', 460, 'BD Analitica por ahorrador '),
(447, 1, '00300077', '', 'LOPEZ VALERIO DOLORES AUREA TERESA', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 10754.34, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 24458.05, 17120.64, 17120.64, '8 Oriente 1307', 'Paseo de San Pedro', 'Tehuacan', 'S/D', 461, 'BD Analitica por ahorrador '),
(448, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 3203.71, 'Recibo de depósito', '004007', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 462, 'BD Analitica por ahorrador '),
(449, 1, '00300078', '', 'LOPEZ VALERIO SOCORRO AIDA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '008005', 15369.57, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15869.57, 11108.7, 11108.7, '4 Poniente 415', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 463, 'BD Analitica por ahorrador '),
(450, 1, '00300079', '', 'LORENZINI JUAREZ MARIA TERESA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 165000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 165000, 115500, 115500, 'Vicente Guerrero y 33 Sur', 'San Sebastian', 'Tecamachalco', 'S/D', 464, 'BD Analitica por ahorrador '),
(451, 1, '00300080', '', 'LOZANO TRUJILLO SABINA', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115111', 7681.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8181.71, 5727.2, 5727.2, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 465, 'BD Analitica por ahorrador '),
(452, 1, '00300081', '', 'MARIA RODRIGUEZ ROSA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004014', 2331, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10331, 7231.7, 7231.7, '2 Oriente 928', 'Moctezuma', 'Tehuacan', 'S/D', 466, 'BD Analitica por ahorrador '),
(453, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 7500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 467, 'BD Analitica por ahorrador '),
(454, 1, '00300082', '', 'MARIN MORENO MAXIMINO', '', 'Recibo de depósito', '115-1-12', 500, 'Recibo de depósito', '115-1-13', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2500, 1750, 1750, 'Ignacio Allende LT 54', 'Aviacion', 'Tehuacan', 'S/D', 468, 'BD Analitica por ahorrador '),
(455, 1, '00300083', '', 'MARISCAL SANDOVAL ANTONIA', '', 'Recibo de depósito', '115-1-29', 500, 'Certificado de ahorro', 'S/F', 2191.68, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2691.68, 1884.18, 1884.18, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 469, 'BD Analitica por ahorrador '),
(456, 1, '00300084', '', 'MARTINEZ ALTA GERMAN', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-006', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20500, 14350, 14350, 'Zoquitlan s/n', 'Seccion I Xicala', 'Zoquitlan', 'S/D', 470, 'BD Analitica por ahorrador '),
(457, 1, '00300085', '', 'MARTINEZ ANTONIO JUAN', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 13359.27, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13859.27, 9701.49, 9701.49, '24 de Diciembre 26', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 471, 'BD Analitica por ahorrador '),
(458, 1, '00300086', '', 'MARTINEZ CORTEZ HERMELINDA', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '116-1-11', 727.58, 'Recibo de depósito', '004-005', 39841.36, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40568.94, 28398.26, 28398.26, 'Buena Vista 2', 'El Progreso', 'Tehuacan', 'S/D', 472, 'BD Analitica por ahorrador '),
(459, 1, '00300087', '', 'MARTINEZ ESPIDIO LETICIA', '', 'S/D', 'S/F', 500, 'Certificado de ahorro', 'S/F', 8873.25, 'Recibo de depósito', '005015', 84000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93373.25, 65361.28, 65361.28, 'Independencia 5', 'Cristobal Tepeteopan', 'Tehuacan', 'S/D', 473, 'BD Analitica por ahorrador '),
(460, 1, '00300088', '', 'MARTINEZ LOPEZ UBALDA LETICIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '062007', 158000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 591578.09, 414104.66, 167930, '13 Oriente 334', 'Nicolas Bravo', 'Tehuacan', 'S/D', 474, 'BD Analitica por ahorrador '),
(461, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005017', 163180, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 475, 'BD Analitica por ahorrador '),
(462, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005018', 217948.09, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 476, 'BD Analitica por ahorrador '),
(463, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '012003', 15300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 477, 'BD Analitica por ahorrador '),
(464, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004016', 36650, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 478, 'BD Analitica por ahorrador '),
(465, 1, '00300089', '', 'MARTINEZ NUÑEZ ANTONIETA', '', 'Recibo de depósito', 'S/F', 500, 'Certificado de ahorro', 'S/F', 9967.31, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10467.31, 7327.12, 7327.12, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 479, 'BD Analitica por ahorrador '),
(466, 1, '00300090', '', 'MARTINEZ RIVERA PAULINA INOCENCIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005023', 224000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 224000, 156800, 156800, 'Av Nacional 69', 'Olleras Bustamante', 'Tehuacan', 'S/D', 480, 'BD Analitica por ahorrador '),
(467, 1, '00300091', '', 'MENDEZ CATALINA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5000, 3500, 3500, 'Insurgentes 3406', 'La Soledad', 'Tehuacan', 'S/D', 481, 'BD Analitica por ahorrador '),
(468, 1, '00300092', '', 'MENDOZA CRUZ ELIZABETH', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 3450.16, 'Recibo de depósito', '005007', 96140.48, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 100090.64, 70063.45, 70063.45, 'Miguel Hidalgo', 'Guadalupe', 'Zapotitlan', 'S/D', 482, 'BD Analitica por ahorrador '),
(469, 1, '00300093', '', 'MERINO MERINO SUSANA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', '061203', 18000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 18500, 12950, 12950, '19 sur 709', 'La Purisima', 'Tehuacan', 'S/D', 483, 'BD Analitica por ahorrador '),
(470, 1, '00300094', '', 'MEXICANO ORTIZ ESPERANZA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 275.78, 'Recibo de depósito', '005-004', 17190.93, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17966.71, 12576.7, 12576.7, 'Republica de Nicaragua 803', 'America', 'Tehuacan', 'S/D', 484, 'BD Analitica por ahorrador '),
(471, 1, '00300095', '', 'MIRAMON OLMOS MARTHA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006005', 12396.07, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 12396.07, 8677.25, 8677.25, 'Morelos sn', 'San Jose Miahuatlan', 'San Jose Miahuatlan', 'S/D', 485, 'BD Analitica por ahorrador '),
(472, 1, '00300096', '', 'MIRAMON SEBASTIAN JUAN', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005010', 2997.71, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2997.71, 2098.4, 2098.4, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 486, 'BD Analitica por ahorrador ');
INSERT INTO `analiticasTemporales` (`idanaliticasTemporales`, `revisionesTemporales_idrevisionesTemporales`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `curp`, `tipoDocumentoPS`, `folioPS`, `importePS`, `tipoDocumentoCA`, `folioCA`, `importeCA`, `tipoDocumentoCI`, `folioCI`, `importeCI`, `tipoDocumentoDG`, `folioDG`, `importeDG`, `tipoDocumentoCNC`, `folioCNC`, `importeCNC`, `tipoDocumentoOtros`, `folioOtros`, `importeOtros`, `tipoDocumentoPrestamos`, `folioPrestamos`, `importePrestamos`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `delegacionMunicipio`, `colonia`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(473, 1, '00300097', '', 'MONTALVO ROQUE CIRILA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 20000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 193320.55, 135324.39, 135324.39, '11 Oriente 1117', 'La Purisima', 'Tehuacan', 'S/D', 487, 'BD Analitica por ahorrador '),
(474, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 71859.63, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 488, 'BD Analitica por ahorrador '),
(475, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005002', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 489, 'BD Analitica por ahorrador '),
(476, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 490, 'BD Analitica por ahorrador '),
(477, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 3000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 491, 'BD Analitica por ahorrador '),
(478, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005006', 72960.92, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 492, 'BD Analitica por ahorrador '),
(479, 1, '00300098', '', 'MONTAÑO HUERTA SILDIA HAYDEE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 1849.64, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4007.39, 2805.17, 2805.17, 'Fresno 2316 A', 'Rancho Grande', 'Tehuacan', 'S/D', 493, 'BD Analitica por ahorrador '),
(480, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115123', 1657.75, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 494, 'BD Analitica por ahorrador '),
(481, 1, '00300099', '', 'MORALES VAZQUEZ FRANCISCO', '', 'Recibo de depósito', '115128', 500, 'Recibo de depósito', '11512', 14550, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 15050, 10535, 10535, 'San Agustin 106-7', 'Maria Coapan', 'Tehuacan', 'S/D', 495, 'BD Analitica por ahorrador '),
(482, 1, '00300100', '', 'MORAN CORTES CECILIA MICAELA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005005', 40501.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 40501.6, 28351.12, 28351.12, '25 Norte 203', 'El Rosario', 'Tehuacan', 'S/D', 496, 'BD Analitica por ahorrador '),
(483, 1, '00300101', '', 'MORENO MORALES ABRAHAM', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '007-006', 250000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 250000, 175000, 167930, 'Granada LT 124', 'Los Olivos', 'Tehuacan', 'S/D', 497, 'BD Analitica por ahorrador '),
(484, 1, '00300102', '', 'MORENO MORALES JOSUE', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-33', 135166.89, 'Recibo de depósito', '004-008', 750000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 885166.89, 619616.82, 167930, '2 Sur 128', 'Centro', 'Tehuacan', 'S/D', 498, 'BD Analitica por ahorrador '),
(485, 1, '00300103', '', 'MOSQUEDA MARTINEZ MARIA ISABEL', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 27500, 19250, 19250, '2da Privada de Ahuehuetes 49', 'Ahuehuetes', 'Gustavo AMadero', 'S/D', 499, 'BD Analitica por ahorrador '),
(486, 1, '', '', '', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005001', 17500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 500, 'BD Analitica por ahorrador '),
(487, 1, '00300104', '', 'OLMOS CAMPOS ANDREA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004011', 9000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 9000, 6300, 6300, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 501, 'BD Analitica por ahorrador '),
(488, 1, '00300105', '', 'OROZCO GARCIA JOSE', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1408.36, 'Recibo de depósito', '004002', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 6908.36, 4835.85, 4835.85, 'Privada de Chalma 4-12', 'San Diego Chalma', 'Tehuacan', 'S/D', 502, 'BD Analitica por ahorrador '),
(489, 1, '00300106', '', 'ORTIZ MENDEZ ALVARO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', '5837', 101196.72, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 101196.72, 70837.7, 70837.7, '31 norte ', 'San Sebastian', 'Tecamachalco', 'S/D', 503, 'BD Analitica por ahorrador '),
(490, 1, '00300107', '', 'OSORIO REYES AMALIA', '', 'Recibo de depósito', '115-1-12', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-002', 15558.84, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 16058.84, 11241.19, 11241.19, 'Av Libertad 11', 'Bartolo Teontepec', 'Tepanco de Lopez', 'S/D', 504, 'BD Analitica por ahorrador '),
(491, 1, '00300108', '', 'PACHECO RODRIGUEZ TOMAS', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', 'S/F', 61.14, 'Recibo de depósito', '004003', 1750.5, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2311.64, 1618.15, 1618.15, 'Sedesol lt 7', 'Dr Miguel Romero', 'Teotihuacan', 'S/D', 505, 'BD Analitica por ahorrador '),
(492, 1, '00300109', '', 'PAQUE PEREZ ALFREDO', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 21269.23, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21269.23, 14888.46, 14888.46, '23 Sur 152', 'La Concepcion', 'Tehuacan', 'S/D', 506, 'BD Analitica por ahorrador '),
(493, 1, '00300110', '', 'PEREDA HERNANDEZ BONIFACIO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 500, 350, 350, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 507, 'BD Analitica por ahorrador '),
(494, 1, '00300111', '', 'PEREZ BAUTISTA ERNESTINA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '006001', 21000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 508, 'BD Analitica por ahorrador '),
(495, 1, '00300112', '', 'PEREZ JIMENEZ MARGARITO BALENTIN', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11517', 17082.06, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 17582.06, 12307.44, 12307.44, '4 Poniente 68', 'Santa Mariala Alta', 'Tlacotepec', 'S/D', 509, 'BD Analitica por ahorrador '),
(496, 1, '00300113', '', 'PIEDRA GONZALEZ NORMA', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004002', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8500, 5950, 5950, 'Allende Oriente 126', 'Maria Coapan', 'Tehuacan', 'S/D', 510, 'BD Analitica por ahorrador '),
(497, 1, '00300114', '', 'PORRAS CHAVEZ SERVANDO PEDRO LAZARO', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '11515', 46744.92, 'Recibo de depósito', '008009', 1200000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 1247244.92, 873071.44, 167930, 'Carmen Serdan 106', 'Centro', 'Tehuacan', 'S/D', 511, 'BD Analitica por ahorrador '),
(498, 1, '00300115', '', 'QUIÑONES HERNANDEZ EFREN', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 25.19, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 25.19, 17.63, 17.63, 'San Bernardino Lagunas', 'Bernardino Lagunas', 'Vicente Guerrero', 'S/D', 512, 'BD Analitica por ahorrador '),
(499, 1, '00300116', '', 'RAMIREZ SANCHEZ MARCELA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1221.2, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8545.58, 5981.91, 5981.91, '6 Poniente 602 A', 'Constituyentes', 'Tehuacan', 'S/D', 513, 'BD Analitica por ahorrador '),
(500, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 6324.38, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 514, 'BD Analitica por ahorrador '),
(501, 1, '00300117', '', 'REYES JIMENEZ MARICELA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 2019.45, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 2519.45, 1763.62, 1763.62, '17 poniente 2007', 'El Riego', 'Tehuacan', 'S/D', 515, 'BD Analitica por ahorrador '),
(502, 1, '00300118', '', 'REYES MERINO EDITH', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 5112.9, 'Recibo de depósito', '004-001', 15000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 20612.9, 14429.03, 14429.03, '5 de Mayo', 'Jose Buena Vista', 'Ajalpan', 'S/D', 516, 'BD Analitica por ahorrador '),
(503, 1, '00300119', '', 'RIOS DIAZ PASCUALA', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115112', 2331.01, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 11072.31, 7750.62, 7750.62, 'Benito Juarez 405', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 517, 'BD Analitica por ahorrador '),
(504, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115110', 8741.3, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 518, 'BD Analitica por ahorrador '),
(505, 1, '00300120', '', 'ROJAS CHAVEZ PRAXEDES', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004004', 10000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10500, 7350, 7350, 'Guadalupe Victoria 1425', 'El Riego', 'Tehuacan', 'S/D', 519, 'BD Analitica por ahorrador '),
(506, 1, '00300121', '', 'ROSALES ROJAS IGNACIA', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 26230.67, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 26730.67, 18711.47, 18711.47, '17 Oriente 1123 B', 'Los Pinos', 'Zoquitlan', 'S/D', 520, 'BD Analitica por ahorrador '),
(507, 1, '00300122', '', 'SALVADOR FLORES SERAPIO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004001', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8500, 5950, 5950, 'Av Nacional', 'El Molino', 'Chapulco', 'S/D', 521, 'BD Analitica por ahorrador '),
(508, 1, '00300123', '', 'SANCHEZ ADAME GREGORIO', '', 'Partes sociales', 'S/F', 500, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 8000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 8500, 5950, 5950, 'Juan Diego Lote 41', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 522, 'BD Analitica por ahorrador '),
(509, 1, '00300124', '', 'SANCHEZ ELEJO LAURANEO', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '005-003', 174000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 174000, 121800, 121800, 'Conocido', 'Tlaxitla', 'Ajalpan', 'S/D', 523, 'BD Analitica por ahorrador '),
(510, 1, '00300125', '', 'SANCHEZ GARCIA ARMANDO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 5399.87, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5899.87, 4129.91, 4129.91, '12 Sur 2128', '16 de Marzo', 'Tehuacan', 'S/D', 524, 'BD Analitica por ahorrador '),
(511, 1, '00300126', '', 'SORIANO FIGUEROA SILVINO LEONCIO', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-12', 300, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21800, 15260, 15260, '21 Oriente 919', 'Nias Bravo', 'Tehuacan', 'S/D', 525, 'BD Analitica por ahorrador '),
(512, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-13', 2000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 526, 'BD Analitica por ahorrador '),
(513, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-15', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 527, 'BD Analitica por ahorrador '),
(514, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Recibo de depósito', '115-1-30', 4000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 528, 'BD Analitica por ahorrador '),
(515, 1, '', '', '', '', 'S/D', 'S/F', 0, 'Ficha de depósito', 'S/F', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 529, 'BD Analitica por ahorrador '),
(516, 1, '', '', '', '', 'Recibo de depósito', '115-1-11', 500, 'Recibo de depósito', '115-1-17', 5000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 530, 'BD Analitica por ahorrador '),
(517, 1, '00300127', '', 'TEHUACANERO JIMENEZ JOSEFINA MARTHA', '', 'Partes sociales', '62629', 500, 'Certificado de ahorro', '64302', 10125.47, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 10625.47, 7437.83, 7437.83, 'Boulevard Ing Pastor Rouaix 713', 'Hidalgo', 'Tehuacan', 'S/D', 531, 'BD Analitica por ahorrador '),
(518, 1, '00300128', '', 'TEHUINTLE CALIHUA EUSEBIO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 11590.84, 'Recibo de depósito', '006-001', 15900, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 27990.84, 19593.59, 19593.59, 'Coxcatepachapa', 'Coxcatepachapa', 'Vicente Guerrero', 'S/D', 532, 'BD Analitica por ahorrador '),
(519, 1, '00300129', '', 'TENORIO HERNANDEZ MARTHA AMELIA', '', 'Recibo de depósito', '115-1-25', 500, 'Recibo de depósito', '115-1-16', 5678.99, 'Recibo de depósito', '006-002', 54000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 60178.99, 42125.29, 42125.29, 'Alamo 716', 'Morelos', 'Tehuacan', 'S/D', 533, 'BD Analitica por ahorrador '),
(520, 1, '00300130', '', 'TOMAS VENTURA DOLORES GUADALUPE', '', 'S/D', 'S/F', 0, 'Certificado de ahorro', 'S/F', 2264.27, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 13272.27, 9290.59, 9290.59, 'Alvarez 700', 'Centro', 'Zinacatepec', 'S/D', 534, 'BD Analitica por ahorrador '),
(521, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 10508, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 535, 'BD Analitica por ahorrador '),
(522, 1, '00300131', '', 'VAZQUEZ MARTINEZ FRANCISCO JAVIER', '', 'Partes sociales', 'S/F', 500, 'Recibo de depósito', '115129', 4771.91, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 5271.91, 3690.34, 3690.34, '26 Oriente 300', 'Lomas de la Soledad', 'Tehuacan', 'S/D', 536, 'BD Analitica por ahorrador '),
(523, 1, '00300132', '', 'VEGA HERNANDEZ RUFINO', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 4198.6, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 4698.6, 3289.02, 3289.02, 'Jose Maria Morelos 5408', 'San Angel', 'Tehuacan', 'S/D', 537, 'BD Analitica por ahorrador '),
(524, 1, '00300133', '', 'VELEZ GONZALEZ ISABEL PATRICIA', '', 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'Recibo de depósito', '004-001', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 93934.17, 65753.92, 65753.92, 'Sedesol 16', 'Mig Romero Sanchez', 'Tehuacan', 'S/D', 538, 'BD Analitica por ahorrador '),
(525, 1, '', '', '', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 13434.17, 'Recibo de depósito', '004-002', 40000, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 0, 0, 0, '', '', '', '', 539, 'BD Analitica por ahorrador '),
(526, 1, '00300134', '', 'VIVEROS JUAREZ CLETO JOEL', '', 'Partes sociales', 'S/F', 500, 'Certificado de ahorro', 'S/F', 1000, 'Recibo de depósito', '004006', 20387.03, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 'S/D', 'S/F', 0, 21887.03, 15320.92, 15320.92, 'Colombia 308 A', 'El Riego', 'Tehuacan', 'S/D', 540, 'BD Analitica por ahorrador '),
(527, 1, '', '', 'TOTAL', '', '', '', 16498771.66, '', '', 8816877.93, '', '', 60511763.9, '', '', 0, '', '', 0, '', '', 0, '', '', 0, 85827413.49, 60079189.55, 22539554.41, '', '', '', '', 541, 'BD Analitica por ahorrador ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `idbancos` int(11) NOT NULL,
  `nombre` text,
  `nombreCorto` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`idbancos`, `nombre`, `nombreCorto`) VALUES
(1, 'IXE Banco, S.A., Institución de Banca Múltiple, IXE Grupo Financiero', 'IXE'),
(2, 'Banco Inbursa, S.A., Institución de Banca Múltiple, Grupo Financiero Inbursa', 'INBURSA'),
(3, 'Banco Interacciones, S.A., Institución de Banca Múltiple', 'INTERACCIONES'),
(4, 'Banca Mifel, S.A., Institución de Banca Múltiple, Grupo Financiero Mifel', 'MIFEL'),
(5, 'Scotiabank Inverlat, S.A.', 'SCOTIABANK'),
(6, 'Banco Regional de Monterrey, S.A., Institución de Banca Múltiple, Banregio Grupo Financiero', 'BANREGIO'),
(7, 'Banco Invex, S.A., Institución de Banca Múltiple, Invex Grupo Financiero', 'INVEX'),
(8, 'Bansi, S.A., Institución de Banca Múltiple', 'BANSI'),
(9, 'Banca Afirme, S.A., Institución de Banca Múltiple', 'AFIRME'),
(10, 'Banco Mercantil del Norte, S.A., Institución de Banca Múltiple, Grupo Financiero Banorte', 'BANORTE'),
(11, 'The Royal Bank of Scotland México, S.A., Institución de Banca Múltiple', 'THE ROYAL BANK '),
(12, 'EXPRESS American Express Bank (México), S.A., Institución de Banca Múltiple', 'AMERICAN'),
(13, 'Bank of America México, S.A., Institución de Banca Múltiple, Grupo Financiero Bank of America', 'BAMSA'),
(14, 'Bank of Tokyo-Mitsubishi UFJ (México), S.A.', 'TOKYO'),
(15, 'Banco J.P. Morgan, S.A., Institución de Banca Múltiple, J.P. Morgan Grupo Financiero', 'JP MORGAN'),
(16, 'Banco Monex, S.A., Institución de Banca Múltiple', 'BMONEX'),
(17, 'Banco Ve Por Mas, S.A. Institución de Banca Múltiple', 'VE POR MAS'),
(18, 'ING Bank (México), S.A., Institución de Banca Múltiple, ING Grupo Financiero', 'ING'),
(19, 'Deutsche Bank México, S.A., Institución de Banca Múltiple', 'DEUTSCHE'),
(20, 'SUISSE Banco Credit Suisse (México), S.A. Institución de Banca Múltiple, Grupo Financiero Credit Suisse (México)', 'CREDIT'),
(21, 'Banco Azteca, S.A. Institución de Banca Múltiple.', 'AZTECA'),
(22, 'Banco Autofin México, S.A. Institución de Banca Múltiple', 'AUTOFIN'),
(23, 'Barclays Bank México, S.A., Institución de Banca Múltiple, Grupo Financiero Barclays México', 'BARCLAYS'),
(24, 'Banco Compartamos, S.A., Institución de Banca Múltiple', 'COMPARTAMOS'),
(25, 'Banco Ahorro Famsa, S.A., Institución de Banca Múltiple', 'BANCO FAMSA'),
(26, 'Banco Multiva, S.A., Institución de Banca Múltiple, Multivalores Grupo Financiero', 'BMULTIVA'),
(27, 'Banco Actinver, S.A. Institución de Banca Múltiple, Grupo Financiero Actinver', 'ACTINVER'),
(28, 'Banco Wal-Mart de México Adelante, S.A., Institución de Banca Múltiple', 'WAL-MART'),
(29, 'Nacional Financiera, Sociedad Nacional de Crédito, Institución de Banca de Desarrollo', 'NAFIN'),
(30, 'Inter Banco, S.A. Institución de Banca Múltiple', 'INTERBANCO'),
(31, 'BanCoppel, S.A., Institución de Banca Múltiple', 'BANCOPPEL'),
(32, 'ABC Capital, S.A., Institución de Banca Múltiple', 'ABC CAPITAL'),
(33, 'UBS Bank México, S.A., Institución de Banca Múltiple, UBS Grupo Financiero', 'UBS BANK'),
(34, 'Consubanco, S.A. Institución de Banca Múltiple', 'CONSUBANCO'),
(35, 'Volkswagen Bank, S.A., Institución de Banca Múltiple', 'VOLKSWAGEN'),
(36, 'CIBanco, S.A.', 'CIBANCO'),
(37, 'Banco Base, S.A., Institución de Banca Múltiple', 'BBASE'),
(38, 'Banco del Ahorro Nacional y Servicios Financieros, Sociedad Nacional de Crédito, Institución de Banca de Desarrollo', 'BANSEFI'),
(39, 'Sociedad Hipotecaria Federal, Sociedad Nacional de Crédito, Institución de Banca de Desarrollo', 'HIPOTECARIA FEDERAL'),
(40, 'Monex Casa de Bolsa, S.A. de C.V. Monex Grupo Financiero', 'MONEXCB'),
(41, 'GBM Grupo Bursátil Mexicano, S.A. de C.V. Casa de Bolsa', 'GBM'),
(42, 'Masari Casa de Bolsa, S.A.', 'MASARI'),
(43, 'Value, S.A. de C.V. Casa de Bolsa', 'VALUE'),
(44, 'Estructuradores del Mercado de Valores Casa de Bolsa, S.A. de C.V.', 'ESTRUCTURADORES'),
(45, 'Casa de Cambio Tiber, S.A. de C.V.', 'TIBER'),
(46, 'Vector Casa de Bolsa, S.A. de C.V.', 'VECTOR'),
(47, 'B y B, Casa de Cambio, S.A. de C.V.', 'B & B'),
(48, 'Acciones y Valores Banamex, S.A. de C.V., Casa de Bolsa', 'ACCIVAL'),
(49, 'Merrill Lynch México, S.A. de C.V. Casa de Bolsa', 'MERRILL LYNCH'),
(50, 'Casa de Bolsa Finamex, S.A. de C.V.', 'FINAMEX'),
(51, 'Valores Mexicanos Casa de Bolsa, S.A. de C.V.', 'VALMEX'),
(52, 'Unica Casa de Cambio, S.A. de C.V.', 'UNICA'),
(53, 'MAPFRE Tepeyac, S.A.', 'MAPFRE'),
(54, 'Profuturo G.N.P., S.A. de C.V., Afore', 'PROFUTURO'),
(55, 'Actinver Casa de Bolsa, S.A. de C.V.', 'CB ACTINVER'),
(56, 'OPERADORA ACTINVER, S.A. DE C.V.', 'OACTIN'),
(57, 'Skandia Vida, S.A. de C.V.', 'SKANDIA'),
(58, 'Deutsche Securities, S.A. de C.V. CASA DE BOLSA', 'CBDEUTSCHE'),
(59, 'Zurich Compañía de Seguros, S.A.', 'ZURICH'),
(60, 'Zurich Vida, Compañía de Seguros, S.A.', 'ZURICHVI'),
(61, 'Hipotecaria Su Casita, S.A. de C.V. SOFOM ENR', 'SU CASITA'),
(62, 'Intercam Casa de Bolsa, S.A. de C.V.', 'CB INTERCAM'),
(63, 'CI Casa de Bolsa, S.A. de C.V.', 'CI BOLSA'),
(64, 'Bulltick Casa de Bolsa, S.A., de C.V.', 'BULLTICK CB'),
(65, 'Sterling Casa de Cambio, S.A. de C.V.', 'STERLING'),
(66, 'Fincomún, Servicios Financieros Comunitarios, S.A. de C.V.', 'FINCOMUN'),
(67, 'SEGUROS HDI Seguros, S.A. de C.V.', 'HDI'),
(68, 'Order Express Casa de Cambio, S.A. de C.V Clave Nombre corto Nombre o razón social', 'ORDER'),
(69, 'Akala, S.A. de C.V., Sociedad Financiera Popular', 'AKALA'),
(70, 'J.P. Morgan Casa de Bolsa, S.A. de C.V. J.P. Morgan Grupo Financiero', 'CB JPMORGAN'),
(71, 'Operadora de Recursos Reforma, S.A. de C.V., S.F.P.', 'REFORMA'),
(72, 'Sistema de Transferencias y Pagos STP, S.A. de C.V.SOFOM ENR', 'STP'),
(73, 'Telecomunicaciones de México', 'TELECOMM'),
(74, 'Evercore Casa de Bolsa, S.A. de C.V.', 'EVERCORE'),
(75, 'Skandia Operadora de Fondos, S.A. de C.V.', 'SKANDIA'),
(76, 'Seguros Monterrey New York Life, S.A de C.V', 'SEGMTY'),
(77, 'Solución Asea, S.A. de C.V., Sociedad Financiera Popular', 'ASEA'),
(78, 'Kuspit Casa de Bolsa, S.A. de C.V.', 'KUSPIT'),
(79, 'J.P. SOFIEXPRESS, S.A. de C.V., S.F.P.', 'SOFIEXPRESS'),
(80, 'UNAGRA, S.A. de C.V., S.F.P.', 'UNAGRA'),
(81, 'OPCIONES EMPRESARIALES DEL NORESTE, S.A. DE C.V., S.F.P.', 'OPCIONES EMPRESARIALES DEL NOROESTE'),
(82, 'Cls Bank International', 'CLS'),
(83, 'SD. Indeval, S.A. de C.V.', 'INDEVAL'),
(84, 'Libertad Servicios Financieros, S.A. De C.V.', 'LIBERTAD'),
(85, 'BBVA BANCOMER', 'BBVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basesCertificadas`
--

CREATE TABLE `basesCertificadas` (
  `idbasesCertificadas` int(11) NOT NULL,
  `archivo` varchar(99) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalErrores` int(11) NOT NULL DEFAULT '1',
  `convenio_idconvenio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `basesCertificadas`
--

INSERT INTO `basesCertificadas` (`idbasesCertificadas`, `archivo`, `fecha`, `totalErrores`, `convenio_idconvenio`) VALUES
(1, '../certFiles/pruebaEnVivoZc.xlsx', '2017-04-13 14:58:26', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion`
--

CREATE TABLE `capacitacion` (
  `idcapacitacion` int(11) NOT NULL,
  `convenio_idconvenio` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinalizacion` date NOT NULL,
  `sede` text NOT NULL,
  `capacitadores` text NOT NULL,
  `noAsistentes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `capacitacion`
--

INSERT INTO `capacitacion` (`idcapacitacion`, `convenio_idconvenio`, `fechaInicio`, `fechaFinalizacion`, `sede`, `capacitadores`, `noAsistentes`) VALUES
(1, 1, '2017-06-04', '2017-04-27', 'una sede', 'luis y daniel', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consolidadasCertificadas`
--

CREATE TABLE `consolidadasCertificadas` (
  `idconsolidadasCertificadas` int(11) NOT NULL,
  `nuevoFolioIdentificador` char(11) DEFAULT NULL,
  `folioIdentificadorAnterior` char(11) DEFAULT NULL,
  `nombreAhorrador` text,
  `parteSocial` double DEFAULT NULL,
  `cuentasAhorro` double DEFAULT NULL,
  `cuentasInversion` double DEFAULT NULL,
  `depositosGarantia` double DEFAULT NULL,
  `chequesNoCobrados` double DEFAULT NULL,
  `otrosDepositos` double DEFAULT NULL,
  `prestamosACargo` double DEFAULT NULL,
  `saldoNeto100` double DEFAULT NULL,
  `saldoNeto70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `calleYNumero` text,
  `colonia` text,
  `delegacionMunicipio` text,
  `telefono` text,
  `filaDocumentoOriginal` int(45) NOT NULL,
  `hojaDocumentoOriginal` varchar(45) NOT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `basesCertificadas_idbasesCertificadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consolidadasCertificadas`
--

INSERT INTO `consolidadasCertificadas` (`idconsolidadasCertificadas`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `parteSocial`, `cuentasAhorro`, `cuentasInversion`, `depositosGarantia`, `chequesNoCobrados`, `otrosDepositos`, `prestamosACargo`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `colonia`, `delegacionMunicipio`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `curp`, `basesCertificadas_idbasesCertificadas`) VALUES
(1, '00100001', '', 'ADAUTA CAMACHO SERGIO', 0, 146000, 0, 0, 0, 0, 0, 146000, 102200, 102200, 'S/D', 'S/D', 'S/D', 'S/D', 14, 'BD Consolidada Ahorradores ', '100001', 1),
(2, '00100002', '', 'ALVAREZ AGUILAR FRANCISCO', 0, 0, 19600, 0, 0, 0, 0, 19600, 13720, 13720, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 15, 'BD Consolidada Ahorradores ', '100002', 1),
(3, '00100003', '', 'ARROLLO SUAREZ GUADALUPE', 0, 100, 10001, 0, 0, 0, 0, 10101, 7070.7, 7070.7, 'Reforma num7', 'Allende', 'Cuyoaco', 'S/D', 16, 'BD Consolidada Ahorradores ', '100003', 1),
(4, '00100004', '', 'BAEZ ESPINOSA FERNANDO', 300, 0, 53000, 0, 0, 0, 0, 53300, 37310, 37310, 'Emilio Carranza num 24', 'Grajales', 'Rafael Lara Grajales', 'S/D', 17, 'BD Consolidada Ahorradores ', '100004', 1),
(5, '00100005', '', 'BAEZ HERNANDEZ GUILLERMINA', 0, 8639.38, 0, 0, 0, 0, 0, 8639.38, 6047.57, 6047.57, '7 Norte num 42', 'Centro', 'Rafael Lara Grajales', 'S/D', 18, 'BD Consolidada Ahorradores ', '100005', 1),
(6, '00100006', '', 'BAEZ HERNANDEZ NORMA LIDIA', 0, 152627.67, 0, 0, 0, 0, 0, 152627.67, 106839.37, 106839.37, 'Av Emiliano Carranza num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 19, 'BD Consolidada Ahorradores ', '100006', 1),
(7, '00100007', '', 'BAEZ REYES MARIA LUISA GUADALUPE', 0, 93203.01, 0, 0, 0, 0, 0, 93203.01, 65242.11, 65242.11, '10 Sur num 1502', 'Centro', 'San Jose Chiapa', 'S/D', 20, 'BD Consolidada Ahorradores ', '100007', 1),
(8, '00100008', '', 'BARRALEZ GONZALEZ MARGARITA', 0, 7939.11, 0, 0, 0, 0, 0, 7939.11, 5557.38, 5557.38, 'Av Ignacio Zaragoza num 18', 'Cruz del Bosque', 'Nopalucan', 'S/D', 21, 'BD Consolidada Ahorradores ', '100008', 1),
(9, '00100009', '', 'BARRANCO LOPEZ MARTIN', 0, 400001, 0, 0, 0, 0, 0, 400001, 280000.7, 167930, 'S/D', 'S/D', 'S/D', 'S/D', 22, 'BD Consolidada Ahorradores ', '100009', 1),
(10, '00100010', '', 'BECERRIL VILCHIS HILDA', 300, 10863.43, 0, 0, 0, 0, 0, 11163.43, 7814.4, 7814.4, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 23, 'BD Consolidada Ahorradores ', '100010', 1),
(11, '00100011', '', 'BRAVO LOPEZ ARNULFO', 300, 50599, 0, 0, 0, 0, 0, 50899, 35629.3, 35629.3, 'Guanajuato num 6', 'Centro', 'Rafael Lara Grajales', 'S/D', 24, 'BD Consolidada Ahorradores ', '100011', 1),
(12, '00100012', '', 'CABALLERO RODRIGUEZ MINERVA', 300, 40000, 1545.89, 0, 0, 0, 0, 41845.89, 29292.12, 29292.12, '2 de abril num385', 'Barrio de Tetela', 'Libres', '2764731536', 25, 'BD Consolidada Ahorradores ', '100012', 1),
(13, '00100013', '', 'CABRERA MUÑOZ JUAN GUSTAVO', 0, 0, 860000, 0, 0, 0, 0, 860000, 602000, 167930, '16 de Septiembre no 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 26, 'BD Consolidada Ahorradores ', '100013', 1),
(14, '00100014', '', 'CANDELARIO LOPEZ CLAUDIA', 0, 18927.71, 0, 0, 0, 0, 0, 18927.71, 13249.4, 13249.4, '11 Poniente num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 27, 'BD Consolidada Ahorradores ', '100014', 1),
(15, '00100015', '', 'CARREON SANCHEZ LEONEL', 0, 0, 221558.42, 0, 0, 0, 0, 221558.42, 155090.89, 155090.89, '3 Poniente num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 28, 'BD Consolidada Ahorradores ', '100015', 1),
(16, '00100016', '', 'CASTILLO CERON JOSE ANDRES', 0, 16705, 0, 0, 0, 0, 0, 16705, 11693.5, 11693.5, '6 Poniente num 8', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 29, 'BD Consolidada Ahorradores ', '100016', 1),
(17, '00100017', '', 'CASTILLO ROMERO JOSE GERONIMO AURELIO', 300, 60405.29, 0, 0, 0, 0, 0, 60705.29, 42493.7, 42493.7, 'Hermanos Serdan num 305', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 30, 'BD Consolidada Ahorradores ', '100017', 1),
(18, '00100018', '', 'CASTILLO SANCHEZ MARICELA AURORA', 0, 61984.31, 0, 0, 0, 0, 0, 61984.31, 43389.02, 43389.02, '7 Oriente num 2', 'Grajales', 'Rafael Lara Grajales', 'S/D', 31, 'BD Consolidada Ahorradores ', '100018', 1),
(19, '00100019', '', 'CAYETANO PAULINO ENEDINA', 600, 29428, 0, 0, 0, 0, 0, 30028, 21019.6, 21019.6, 'Del Monte s/n', 'Benito Juarez', 'Soltepec', 'S/D', 32, 'BD Consolidada Ahorradores ', '100019', 1),
(20, '00100020', '', 'CERVANTES MONTES JUAN', 300, 3813.5, 0, 0, 0, 0, 0, 4113.5, 2879.45, 2879.45, '5 Sur num 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 33, 'BD Consolidada Ahorradores ', '100020', 1),
(21, '00100021', '', 'CRUZ DE LOS ANGELES MA GUADALUPE', 0, 12551.93, 0, 0, 0, 0, 0, 12551.93, 8786.35, 8786.35, 'Juan Sarabia num 7', 'Obrera', 'Rafael Lara Grajales', '4741025', 34, 'BD Consolidada Ahorradores ', '100021', 1),
(22, '00100022', '', 'CRUZ DOMINGUEZ MICAELA', 300, 100, 49600, 0, 0, 0, 0, 50000, 35000, 35000, '4 Sur num6', 'Allende', 'Cuyoaco', 'S/D', 35, 'BD Consolidada Ahorradores ', '100022', 1),
(23, '00100023', '', 'CRUZ TORRES CELSO VICTOR', 0, 46321.96, 0, 0, 0, 0, 0, 46321.96, 32425.37, 32425.37, 'Priv Los Naranjos num 18', 'San Miguel', 'Amozoc de Mota', 'S/D', 36, 'BD Consolidada Ahorradores ', '100023', 1),
(24, '00100024', '', 'CUELLAR MUÑOZ MARIA GUADALUPE', 0, 47333.93, 0, 0, 0, 0, 0, 47333.93, 33133.75, 33133.75, 'Av Progreso num 10', 'Centro', 'Rafael Lara Grajales', 'S/D', 37, 'BD Consolidada Ahorradores ', '100024', 1),
(25, '00100025', '', 'DE LA CRUZ HERNANDEZ JUANA', 0, 0, 73365, 0, 0, 0, 0, 73365, 51355.5, 51355.5, '2 Norte num 38', 'Centro', 'Rafael Lara Grajales', 'S/D', 38, 'BD Consolidada Ahorradores ', '100025', 1),
(26, '00100026', '', 'DEL CARMEN LOPEZ GUADALUPE', 0, 154762.67, 0, 0, 0, 0, 0, 154762.67, 108333.87, 108333.87, 'Salto del agua num 37', 'Salto del Agua', 'Rafael Lara Grajales', 'S/D', 39, 'BD Consolidada Ahorradores ', '100026', 1),
(27, '00100027', '', 'DIAZ BAUTISTA VICTORIA', 0, 7482, 0, 0, 0, 0, 0, 7482, 5237.4, 5237.4, '8 Oriente num 28', 'Barrio San Juan', 'Acajete', 'S/D', 40, 'BD Consolidada Ahorradores ', '100027', 1),
(28, '00100028', '', 'DIAZ HERNANDEZ MARCELINA', 0, 29500, 0, 0, 0, 0, 0, 29500, 20650, 20650, 'Camino a Obregon num 7', 'La Ermita', 'Soltepec', 'S/D', 41, 'BD Consolidada Ahorradores ', '100028', 1),
(29, '00100029', '', 'DIAZ VAZQUEZ MIGUEL', 0, 16096.61, 277.96, 0, 0, 0, 0, 16374.57, 11462.2, 11462.2, 'Principal 1', 'La Cañada', 'Libres', 'S/D', 42, 'BD Consolidada Ahorradores ', '100029', 1),
(30, '00100030', '', 'DURAN HERNANDEZ FABIOLA', 0, 213619.84, 0, 0, 0, 0, 0, 213619.84, 149533.89, 149533.89, '4 Norte s/n', 'Centro', 'San Jose Chiapa', 'S/D', 43, 'BD Consolidada Ahorradores ', '100030', 1),
(31, '00100031', '', 'DURAN LOPEZ ERASMO', 300, 16781.21, 0, 0, 0, 0, 0, 17081.21, 11956.85, 11956.85, '16 de Septiembre num 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 44, 'BD Consolidada Ahorradores ', '100031', 1),
(32, '00100032', '', 'DURAN MARTINEZ SEBASTIAN EVELINA', 300, 0, 0, 0, 0, 0, 0, 300, 210, 210, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 45, 'BD Consolidada Ahorradores ', '100032', 1),
(33, '00100033', '', 'FERNANDEZ HERNANDEZ SOLIRENE', 0, 85088.71, 0, 0, 0, 0, 0, 85088.71, 59562.1, 59562.1, 'Rubi num 8', 'La Joya', 'Rafael Lara Grajales', 'S/D', 46, 'BD Consolidada Ahorradores ', '100033', 1),
(34, '00100034', '', 'FLORES DIAZ MARGARITO', 0, 20466, 0, 0, 0, 0, 0, 20466, 14326.2, 14326.2, '12 Norte num 8', 'Barrio San Juan', 'Acajete', 'S/D', 47, 'BD Consolidada Ahorradores ', '100034', 1),
(35, '00100035', '', 'FLORES MOZO RODE', 0, 11704.59, 0, 0, 0, 0, 0, 11704.59, 8193.21, 8193.21, '11 Sur num 25', 'Centro', 'Rafael Lara Grajales', 'S/D', 48, 'BD Consolidada Ahorradores ', '100035', 1),
(36, '00100036', '', 'GARCIA MONTES VICENTA', 0, 19376.85, 0, 0, 0, 0, 0, 19376.85, 13563.8, 13563.8, '7 Sur num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 49, 'BD Consolidada Ahorradores ', '100036', 1),
(37, '00100037', '', 'GONZALEZ HERNANDEZ ALEJANDRO', 300, 144030.9, 0, 0, 0, 0, 0, 144330.9, 101031.63, 101031.63, '5 Oriente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 50, 'BD Consolidada Ahorradores ', '100037', 1),
(38, '00100038', '', 'GONZALEZ LOPEZ HILARIA', 300, 5703, 0, 0, 0, 0, 0, 6003, 4202.1, 4202.1, 'Plaza de la Gardenia Edif 19A DPTO 2', 'U Hab Lara Grajales', 'Nopalucan', 'S/D', 51, 'BD Consolidada Ahorradores ', '100038', 1),
(39, '00100039', '', 'GUEVARA LOPEZ ELIGIO', 300, 100, 195000, 0, 0, 0, 0, 195400, 136780, 136780, 'Avenida 16 de septiembre s/n', 'Tonalapa', 'Ixtacamaxtitlan', '4880221', 52, 'BD Consolidada Ahorradores ', '100039', 1),
(40, '00100040', '', 'HERNANDEZ CERON MARTHA', 0, 74815, 0, 0, 0, 0, 0, 74815, 52370.5, 52370.5, '3 Sur num 14', 'Grajales', 'Rafael Lara Grajales', 'S/D', 53, 'BD Consolidada Ahorradores ', '100040', 1),
(41, '00100041', '', 'HERNANDEZ LOPEZ ROSA', 300, 142597, 0, 0, 0, 0, 0, 142897, 100027.9, 100027.9, 'Hidalgo 404', 'La Granja', 'Nopalucan', 'S/D', 54, 'BD Consolidada Ahorradores ', '100041', 1),
(42, '00100042', '', 'HERNANDEZ PLATINI MARIA LUCINA', 300, 52698, 0, 0, 0, 0, 0, 52998, 37098.6, 37098.6, 'Av Del Trabajo num 20 Col Obrera', 'Grajales', 'S/D', 'S/D', 55, 'BD Consolidada Ahorradores ', '100042', 1),
(43, '00100043', '', 'HERNANDEZ RAMIREZ JOSE PORFIRIO PASCUAL', 0, 10243.63, 0, 0, 0, 0, 0, 10243.63, 7170.54, 7170.54, '7 Sur num 16', 'Centro', 'Rafael Lara Grajales', 'S/D', 56, 'BD Consolidada Ahorradores ', '100043', 1),
(44, '00100044', '', 'HERRERA HERNANDEZ JOSE ARMANDO', 300, 53743.62, 0, 0, 0, 0, 0, 54043.62, 37830.53, 37830.53, 'Iturbide num21', 'Barrio de San Miguel', 'Libres', '012764740102', 57, 'BD Consolidada Ahorradores ', '100044', 1),
(45, '00100045', '', 'HUERTA VEGA ESPERANZA', 300, 11700.77, 0, 0, 0, 0, 0, 12000.77, 8400.54, 8400.54, '2 dos norte num 51', 'Centro', 'Rafael Lara Grajales', 'S/D', 58, 'BD Consolidada Ahorradores ', '100045', 1),
(46, '00100046', '', 'JIMENEZ SANCHEZ SIXTA', 0, 0, 9726.56, 0, 0, 0, 0, 9726.56, 6808.59, 6808.59, '2 norte num 50', 'Barrio Sto Entierro', 'Acajete', 'S/D', 59, 'BD Consolidada Ahorradores ', '100046', 1),
(47, '00100047', '', 'JUAREZ DURAN JUAN', 300, 0, 39089.6, 0, 0, 0, 0, 39389.6, 27572.72, 27572.72, '4 Poniente num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 60, 'BD Consolidada Ahorradores ', '100047', 1),
(48, '00100048', '', 'JUAREZ JIMENEZ MARIA DE LOURDES', 0, 23408.15, 0, 0, 0, 0, 0, 23408.15, 16385.71, 16385.71, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 61, 'BD Consolidada Ahorradores ', '100048', 1),
(49, '00100049', '', 'JUAREZ JIMENEZ MARIA LAURA', 0, 23081.29, 0, 0, 0, 0, 0, 23081.29, 16156.9, 16156.9, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 62, 'BD Consolidada Ahorradores ', '100049', 1),
(50, '00100050', '', 'JUAREZ NERI MARIA DEL CARMEN', 0, 20000, 0, 0, 0, 0, 0, 20000, 14000, 14000, '6 Poniente num 310', 'Centro', 'Rafael Lara Grajales', 'S/D', 63, 'BD Consolidada Ahorradores ', '100050', 1),
(51, '00100051', '', 'LOBATO BAEZ MARIANA', 0, 5100, 0, 0, 0, 0, 0, 5100, 3570, 3570, '5 Poniente num 500', 'Loc Oriental', 'Oriental', 'S/D', 64, 'BD Consolidada Ahorradores ', '100051', 1),
(52, '00100052', '', 'LOPEZ MAZAPILA DALILA', 0, 18967.9, 0, 0, 0, 0, 0, 18967.9, 13277.53, 13277.53, 'Av Benito Juarez num 13', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 65, 'BD Consolidada Ahorradores ', '100052', 1),
(53, '00100053', '', 'LOPEZ MORALES MARGARITA', 0, 150006, 0, 0, 0, 0, 0, 150006, 105004.2, 105004.2, 'Cale 2 Pte num 13', 'Nopalucan', 'Nopalucan', 'S/D', 66, 'BD Consolidada Ahorradores ', '100053', 1),
(54, '00100054', '', 'LOZANO SALAZAR GUILLERMINA', 0, 0, 20096.73, 0, 0, 0, 0, 20096.73, 14067.71, 14067.71, 'S/D', 'S/D', 'S/D', 'S/D', 67, 'BD Consolidada Ahorradores ', '100054', 1),
(55, '00100055', '', 'MARQUEZ DURAN PEDRO ELOY', 0, 0, 290000, 0, 0, 0, 0, 290000, 203000, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 68, 'BD Consolidada Ahorradores ', '100055', 1),
(56, '00100056', '', 'MARQUEZ PEREZ ERICK', 0, 0, 289000, 0, 0, 0, 0, 289000, 202300, 167930, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 69, 'BD Consolidada Ahorradores ', '100056', 1),
(57, '00100057', '', 'MARTINEZ GONZALEZ MARIBEL', 300, 3191.77, 0, 0, 0, 0, 0, 3491.77, 2444.24, 2444.24, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 70, 'BD Consolidada Ahorradores ', '100057', 1),
(58, '00100058', '', 'MARTINEZ LOPEZ JOSE EZEQUIEL', 0, 63192.05, 0, 0, 0, 0, 0, 63192.05, 44234.44, 44234.44, 'Allende num 14', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 71, 'BD Consolidada Ahorradores ', '100058', 1),
(59, '00100059', '', 'MARTINEZ MARTINEZ ALEJANDRO', 0, 24494.18, 0, 0, 0, 0, 0, 24494.18, 17145.93, 17145.93, 'Colosio num 6', 'San Jose Ozumba', 'San Jose Chiapa', 'S/D', 72, 'BD Consolidada Ahorradores ', '100059', 1),
(60, '00100060', '', 'MARTINEZ TORRES ANGEL', 0, 1635.02, 24906.66, 0, 0, 0, 0, 26541.68, 18579.18, 18579.18, 'S/D', 'S/D', 'S/D', 'S/D', 73, 'BD Consolidada Ahorradores ', '100060', 1),
(61, '00100061', '', 'MAURICIO RODRIGUEZ FAUSTINO', 0, 1456.94, 0, 0, 0, 0, 0, 1456.94, 1019.86, 1019.86, '6 Sur num 705', 'B Virgen de la Luz', 'Acajete', 'S/D', 74, 'BD Consolidada Ahorradores ', '100061', 1),
(62, '00100062', '', 'MENDEZ ALCANTARA AURORA', 0, 7476.43, 0, 0, 0, 0, 0, 7476.43, 5233.5, 5233.5, '3 poniente num 1', 'Centro', 'Rafael Lara Grajales', 'S/D', 75, 'BD Consolidada Ahorradores ', '100062', 1),
(63, '00100063', '', 'MENDEZ ARMAS MARIA DE LOURDES', 0, 100, 10001, 0, 0, 0, 0, 10101, 7070.7, 7070.7, '3 Oriente s/n', 'San Jose Morelos', 'Libres', 'S/D', 76, 'BD Consolidada Ahorradores ', '100063', 1),
(64, '00100064', '', 'MENDEZ LOZANO EZEQUIEL', 0, 231326.3, 0, 0, 0, 0, 0, 231326.3, 161928.41, 161928.41, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 77, 'BD Consolidada Ahorradores ', '100064', 1),
(65, '00100065', '', 'MENDEZ LOZANO MARGARITA', 300, 0, 19292.91, 0, 0, 0, 0, 19592.91, 13715.04, 13715.04, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 78, 'BD Consolidada Ahorradores ', '100065', 1),
(66, '00100066', '', 'MENDEZ ROQUE AURELIO IGNACIO', 0, 164751, 0, 0, 0, 0, 0, 164751, 115325.7, 115325.7, '5 Norte num 203', 'Centro', 'Rafael Lara Grajales', 'S/D', 79, 'BD Consolidada Ahorradores ', '100066', 1),
(67, '00100067', '', 'MONTES MARTINEZ JESUS', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Adolfo Lopez Mateos num915', 'San Juan Negrete', 'Tepeaca', '2231031283', 80, 'BD Consolidada Ahorradores ', '100067', 1),
(68, '00100068', '', 'MORALES BONILLA FLORINA', 0, 24336.38, 0, 0, 0, 0, 0, 24336.38, 17035.47, 17035.47, '7 poniente s/n', 'B Virgen de la Luz', 'Acajete', 'S/D', 81, 'BD Consolidada Ahorradores ', '100068', 1),
(69, '00100069', '', 'MORALES HERNANDEZ AMBROCIO', 0, 54980, 0, 0, 0, 0, 0, 54980, 38486, 38486, 'Av Matamoros num 310', 'Juan de la Granja', 'Nopalucan', 'S/D', 82, 'BD Consolidada Ahorradores ', '100069', 1),
(70, '00100070', '', 'MORALES MENDOZA JOSE ROSENDO', 0, 69213.58, 0, 0, 0, 0, 0, 69213.58, 48449.51, 48449.51, '9 Pte num 45', 'Centro', 'Rafael Lara Grajales', 'S/D', 83, 'BD Consolidada Ahorradores ', '100070', 1),
(71, '00100071', '', 'NERI NICANOR RAUL JAVIER', 0, 292201.14, 0, 0, 0, 0, 0, 292201.14, 204540.8, 167930, 'Av Emiliano Carranza num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 84, 'BD Consolidada Ahorradores ', '100071', 1),
(72, '00100072', '', 'OCHOA SALAS JUAN', 0, 47042.94, 110000, 0, 0, 0, 0, 157042.94, 109930.06, 109930.06, 'Ayuntamiento num S/N', 'La Virgen de la Luz', 'Acajete', 'S/D', 85, 'BD Consolidada Ahorradores ', '100072', 1),
(73, '00100073', '', 'ORTEGA BECERRIL RAFAEL', 0, 2872.53, 0, 0, 0, 0, 0, 2872.53, 2010.77, 2010.77, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 86, 'BD Consolidada Ahorradores ', '100073', 1),
(74, '00100074', '', 'ORTEGA ROJAS ANGELA', 0, 8825.21, 0, 0, 0, 0, 0, 8825.21, 6177.65, 6177.65, 'Av Del Sol num 15', 'Fracc Los Olivos', 'Tijuana BC', 'S/D', 87, 'BD Consolidada Ahorradores ', '100074', 1),
(75, '00100075', '', 'ORTIZ PEREZ GABINO', 0, 28577.56, 0, 0, 0, 0, 0, 28577.56, 20004.29, 20004.29, '2 Norte num 73', 'Centro', 'Rafael Lara Grajales', 'S/D', 88, 'BD Consolidada Ahorradores ', '100075', 1),
(76, '00100076', '', 'OSORIO HUERTA ARTURO', 0, 288524.83, 0, 0, 0, 0, 0, 288524.83, 201967.38, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 89, 'BD Consolidada Ahorradores ', '100076', 1),
(77, '00100077', '', 'OSORIO SANTAMARIA EDUARDO', 0, 322648.46, 0, 0, 0, 0, 0, 322648.46, 225853.92, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 90, 'BD Consolidada Ahorradores ', '100077', 1),
(78, '00100078', '', 'PEREZ DE LAZARO ISABEL', 0, 51337.4, 0, 0, 0, 0, 0, 51337.4, 35936.18, 35936.18, '6 Pte no 21', 'Centro', 'Rafael Lara Grajales', 'S/D', 91, 'BD Consolidada Ahorradores ', '100078', 1),
(79, '00100079', '', 'PEREZ LOZANO LUCRECIA', 0, 1330.1, 0, 0, 0, 0, 0, 1330.1, 931.07, 931.07, 'Av Lazaro Cardenas num 226', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 92, 'BD Consolidada Ahorradores ', '100079', 1),
(80, '00100080', '', 'PEREZ PARRA ENCARNACION', 0, 258064.3, 0, 0, 0, 0, 0, 258064.3, 180645.01, 167930, '11 Sur num 31', 'Centro', 'Rafael Lara Grajales', 'S/D', 93, 'BD Consolidada Ahorradores ', '100080', 1),
(81, '00100081', '', 'PEREZ VARGAS GABRIELA', 0, 148175, 916782.21, 0, 0, 0, 0, 1064957.21, 745470.05, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 94, 'BD Consolidada Ahorradores ', '100081', 1),
(82, '00100082', '', 'PEREZ VARGAS ROMAN', 0, 0, 290000, 0, 0, 0, 0, 290000, 203000, 167930, '4 Norte no 1203', 'Centro', 'San Jose Chiapa', 'S/D', 95, 'BD Consolidada Ahorradores ', '100082', 1),
(83, '00100083', '', 'PROYLAN BAEZ ALEJANDRO', 0, 150704.28, 0, 0, 0, 0, 0, 150704.28, 105493, 105493, 'Av Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 96, 'BD Consolidada Ahorradores ', '100083', 1),
(84, '00100084', '', 'RAMIREZ BARRALES MARICELA', 0, 29858, 0, 0, 0, 0, 0, 29858, 20900.6, 20900.6, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 97, 'BD Consolidada Ahorradores ', '100084', 1),
(85, '00100085', '', 'RAMIREZ HERNANDEZ UBALDO', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, 'Cabo Franco num1299', 'Barrio Guadalupe', 'Libres', 'S/D', 98, 'BD Consolidada Ahorradores ', '100085', 1),
(86, '00100086', '', 'RAMIREZ MELENDEZ JAVIER', 0, 17806.61, 0, 0, 0, 0, 0, 17806.61, 12464.63, 12464.63, '2 norte num 28', 'Barrio Sto Entierro', 'Acajete', 'S/D', 99, 'BD Consolidada Ahorradores ', '100086', 1),
(87, '00100087', '', 'RAMIREZ TAPIA FERNANDO', 0, 78368.63, 0, 0, 0, 0, 0, 78368.63, 54858.04, 54858.04, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 100, 'BD Consolidada Ahorradores ', '100087', 1),
(88, '00100088', '', 'REYES GONZALEZ GUADALUPE', 0, 32391.38, 0, 0, 0, 0, 0, 32391.38, 22673.97, 22673.97, '14 Poniente s/n', 'Centro', 'Nopalucan', 'S/D', 101, 'BD Consolidada Ahorradores ', '100088', 1),
(89, '00100089', '', 'ROCHA LOPEZ MOISES', 0, 13651.77, 0, 0, 0, 0, 0, 13651.77, 9556.24, 9556.24, '2 Norte num 48', 'Centro', 'Rafael Lara Grajales', 'S/D', 102, 'BD Consolidada Ahorradores ', '100089', 1),
(90, '00100090', '', 'RODRIGUEZ MENDOZA SILVIA', 0, 141704, 0, 0, 0, 0, 0, 141704, 99192.8, 99192.8, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 103, 'BD Consolidada Ahorradores ', '100090', 1),
(91, '00100091', '', 'ROMERO AVILA TERESA', 0, 26405.31, 0, 0, 0, 0, 0, 26405.31, 18483.72, 18483.72, 'Av 20 de Noviembre num 45', 'Grajales', 'Rafael Lara Grajales', 'S/D', 104, 'BD Consolidada Ahorradores ', '100091', 1),
(92, '00100092', '', 'ROMERO MORALES MIGUEL', 0, 51769.04, 0, 0, 0, 0, 0, 51769.04, 36238.33, 36238.33, '7 Sur num 43 Col Centro', 'Grajales', 'Rafael Lara Grajales', 'S/D', 105, 'BD Consolidada Ahorradores ', '100092', 1),
(93, '00100093', '', 'ROMERO MORALES SOLEDAD', 0, 40000, 0, 0, 0, 0, 0, 40000, 28000, 28000, '9 Poniente num 28', 'Centro', 'Rafael Lara Grajales', 'S/D', 106, 'BD Consolidada Ahorradores ', '100093', 1),
(94, '00100094', '', 'ROMERO PEREZ VICTORIA', 300, 250, 19818.5, 0, 0, 0, 0, 20368.5, 14257.95, 14257.95, 'Av Francisco I Madero num 410', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 107, 'BD Consolidada Ahorradores ', '100094', 1),
(95, '00100095', '', 'ROMERO SOSA MIGUEL', 0, 17067.96, 0, 0, 0, 0, 0, 17067.96, 11947.57, 11947.57, 'Francisco I Madero num 720', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 108, 'BD Consolidada Ahorradores ', '100095', 1),
(96, '00100096', '', 'SALAZAR VALENCIA MARIA OCOTLAN ENRIQUETA', 0, 94600, 0, 0, 0, 0, 0, 94600, 66220, 66220, '2 Pte no 52', 'Centro', 'Rafael Lara Grajales', 'S/D', 109, 'BD Consolidada Ahorradores ', '100096', 1),
(97, '00100097', '', 'SANCHEZ HERNANDEZ IRENE', 0, 84703.57, 0, 0, 0, 0, 0, 84703.57, 59292.5, 59292.5, 'San Francisco s/n', 'Benito Juarez', 'Soltepec', 'S/D', 110, 'BD Consolidada Ahorradores ', '100097', 1),
(98, '00100098', '', 'SANCHEZ HERNANDEZ RICARDA', 300, 4245.52, 405300, 0, 0, 0, 0, 409845.52, 286891.86, 167930, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 111, 'BD Consolidada Ahorradores ', '100098', 1),
(99, '00100099', '', 'SANCHEZ LEONARDO JOSE RODOLFO', 0, 8855.56, 0, 0, 0, 0, 0, 8855.56, 6198.89, 6198.89, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 112, 'BD Consolidada Ahorradores ', '100099', 1),
(100, '00100100', '', 'SANCHEZ LOMELI VENTURA', 0, 200, 20000, 0, 0, 0, 0, 20200, 14140, 14140, 'Miguel Hidalgo num 12', 'Isabel Tepetzala', 'Acajete', 'S/D', 113, 'BD Consolidada Ahorradores ', '100100', 1),
(101, '00100101', '', 'SANCHEZ PEREZ JOSE ANDRES', 0, 0, 100001, 0, 0, 0, 0, 100001, 70000.7, 70000.7, 'Cabo Franco num699', 'Barrio Guadalupe', 'Libres', '2764730574', 114, 'BD Consolidada Ahorradores ', '100101', 1),
(102, '00100102', '', 'SARMIENTO HUERTA EVELIA', 300, 24700, 0, 0, 0, 0, 0, 25000, 17500, 17500, '5 norte num 17', 'Centro', 'Rafael Lara Grajales', 'S/D', 115, 'BD Consolidada Ahorradores ', '100102', 1),
(103, '00100103', '', 'SARMIENTOS FERNANDEZ IRMA', 300, 100, 19600, 0, 0, 0, 0, 20000, 14000, 14000, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 116, 'BD Consolidada Ahorradores ', '100103', 1),
(104, '00100104', '', 'SARMIENTOS LOPEZ OTILIO', 0, 0, 10284.48, 0, 0, 0, 0, 10284.48, 7199.14, 7199.14, 'Calle sin nombre s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 117, 'BD Consolidada Ahorradores ', '100104', 1),
(105, '00100105', '', 'SILVA BAUTISTA SEGIO', 0, 0, 430000, 0, 0, 0, 0, 430000, 301000, 167930, '3 Oriente no 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 118, 'BD Consolidada Ahorradores ', '100105', 1),
(106, '00100106', '', 'TORRES CRUZ MARIBEL', 0, 300914.66, 0, 0, 0, 0, 0, 300914.66, 210640.26, 167930, '7 Sur num 33', 'Centro', 'Rafael Lara Grajales', 'S/D', 119, 'BD Consolidada Ahorradores ', '100106', 1),
(107, '00100107', '', 'UGARTE LOZANO JOSE LUIS', 300, 5868.3, 0, 0, 0, 0, 0, 6168.3, 4317.81, 4317.81, '9 Poniente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 120, 'BD Consolidada Ahorradores ', '100107', 1),
(108, '00100108', '', 'VALDIVIA BARRALES CAROLINA', 0, 5068.62, 0, 0, 0, 0, 0, 5068.62, 3548.03, 3548.03, '7 poniente s/n', 'Barrio de Jesus', 'Acajete', 'S/D', 121, 'BD Consolidada Ahorradores ', '100108', 1),
(109, '00100109', '', 'VALENCIA BAEZ OSCAR', 0, 11768, 0, 0, 0, 0, 0, 11768, 8237.6, 8237.6, 'Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 122, 'BD Consolidada Ahorradores ', '100109', 1),
(110, '00100110', '', 'VARGAS VELEZ MARIA DEL ROSARIO SOLEDAD', 0, 0, 200000, 0, 0, 0, 0, 200000, 140000, 140000, '5 norte num s/n', 'San Jose Chiapa', 'San Jose Chiapa', 'S/D', 123, 'BD Consolidada Ahorradores ', '100110', 1),
(111, '00100111', '', 'VAZQUEZ PEREZ ROSA', 0, 69385.85, 0, 0, 0, 0, 0, 69385.85, 48570.1, 48570.1, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 124, 'BD Consolidada Ahorradores ', '100111', 1),
(112, '00100112', '', 'VEDE PEREZ JOSE FERNANDO TRINIDAD', 0, 0, 49640.14, 0, 0, 0, 0, 49640.14, 34748.1, 34748.1, '14 Oriente s/n', 'Centro', 'San Jose Chiapa', 'S/D', 125, 'BD Consolidada Ahorradores ', '100112', 1),
(113, '00100113', '', 'VILLEGAS BONILLA CLEMENCIA', 300, 1928.21, 0, 0, 0, 0, 0, 2228.21, 1559.75, 1559.75, 'S/D', 'San Bartolo Pinal', 'Acajete', 'S/D', 126, 'BD Consolidada Ahorradores ', '100113', 1),
(114, '00200001', '', 'ABUNDIO SANCHEZ ESTELA ROSA', 500, 0, 12000, 0, 0, 0, 0, 12500, 8750, 8750, 'Cuautilica s/n', 'Seccion tercera', 'Zoquitlan', 'S/D', 127, 'BD Consolidada Ahorradores ', '200001', 1),
(115, '00200002', '', 'ALTAMIRANO LOPEZ MARIO', 0, 0, 4336000, 0, 0, 0, 0, 4336000, 3035200, 167930, '2 Poniente num 201', 'Centro', 'Tehuacan', 'S/D', 128, 'BD Consolidada Ahorradores ', '200002', 1),
(116, '00200003', '', 'ALVAREZ ATILANO MARIA CATALINA', 500, 5625, 50000, 0, 0, 0, 0, 56125, 39287.5, 39287.5, 'Xicotencatl num219', 'Cuauhtemoc', 'Tehuacan', 'S/D', 129, 'BD Consolidada Ahorradores ', '200003', 1),
(117, '00200004', '', 'ANSELMO RAMOS JULIAN', 500, 0, 50712.5, 0, 0, 0, 0, 51212.5, 35848.75, 35848.75, 'Benito Juarez Sur s/n', 'Cuautotolapa', 'Ajalpan', 'S/D', 130, 'BD Consolidada Ahorradores ', '200004', 1),
(118, '00200005', '', 'ANSELMO RIVERA EVA', 500, 0, 29800, 0, 0, 0, 0, 30300, 21210, 21210, 'Zoquitlan s/n', 'Segunda Seccion', 'Tecpanzcoalco', 'S/D', 131, 'BD Consolidada Ahorradores ', '200005', 1),
(119, '00200006', '', 'ANSELMO RIVERA TERESA', 500, 0, 151700, 0, 0, 0, 0, 152200, 106540, 106540, 'Zoquitlan s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 132, 'BD Consolidada Ahorradores ', '200006', 1),
(120, '00200007', '', 'ARELLANO SANTIAGO MARGARITA', 500, 50000, 0, 0, 0, 0, 0, 50500, 35350, 35350, '26 Sur num 535', 'Venustiano Carranza', 'Tehuacan', '012383922524', 133, 'BD Consolidada Ahorradores ', '200007', 1),
(121, '00200008', '', 'ARIAS HERNANDEZ JESUS DELFINO', 500, 0, 8414.57, 0, 0, 0, 0, 8914.57, 6240.2, 6240.2, 'Camelia Oriente num 120', 'Francisco Sarabia', 'Tehuacan', 'S/D', 134, 'BD Consolidada Ahorradores ', '200008', 1),
(122, '00200009', '', 'ARJONA PAVIA FANNY MARIA DE JESUS', 500, 0, 555797.26, 0, 0, 0, 0, 556297.26, 389408.08, 167930, '14 Oriente num 111', 'Buenos Aires', 'Tehuacan', '2383832334', 135, 'BD Consolidada Ahorradores ', '200009', 1),
(123, '00200010', '', 'BACA LOPEZ FRANCISCO', 500, 0, 500500, 0, 0, 0, 0, 501000, 350700, 167930, 'Ramon Corona num315', 'Reforma', 'Tehuacan', '1075375', 136, 'BD Consolidada Ahorradores ', '200010', 1),
(124, '00200011', '', 'BAGLIETO MORA JUAN MANUEL', 50500, 0, 0, 0, 0, 0, 0, 50500, 35350, 35350, 'Privada 4 Norte 1825', 'Buenos Aires', 'Tehuacan', 'S/D', 137, 'BD Consolidada Ahorradores ', '200011', 1),
(125, '00200012', '', 'BARRIGUETE RAMIREZ CECILIO', 500, 0, 80340, 0, 0, 0, 0, 80840, 56588, 56588, 'Agustin Lara mza 132 Lote 1045', 'San Jose Tlahuac', 'Tehuacan', 'S/D', 138, 'BD Consolidada Ahorradores ', '200012', 1),
(126, '00200013', '', 'BARTOLO VALERIO BERTHA INES', 0, 0, 18380.85, 0, 0, 0, 0, 18380.85, 12866.6, 12866.6, 'Avenida Nacional s/n', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 139, 'BD Consolidada Ahorradores ', '200013', 1),
(127, '00200014', '', 'BARTOLO VALERIO CONCEPCION ROSARIO', 0, 0, 78584.92, 0, 0, 0, 0, 78584.92, 55009.44, 55009.44, '7 poniente num 303', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 140, 'BD Consolidada Ahorradores ', '200014', 1),
(128, '00200015', '', 'BAUTISTA SERRANO JOSE JOEL', 500, 0, 31000, 0, 0, 0, 0, 31500, 22050, 22050, 'Juarez num221', 'Seccion primera', 'Zinacatepec', 'S/D', 141, 'BD Consolidada Ahorradores ', '200015', 1),
(129, '00200016', '', 'BECERRA MACHADO FERNANDO Y/O HERNANDEZ HERNANDEZ VIRGINIA', 0, 0, 160000, 0, 0, 0, 0, 160000, 112000, 112000, '22 Norte num 619', 'San Rafael', 'Tehuacan', 'S/D', 142, 'BD Consolidada Ahorradores ', '200016', 1),
(130, '00200017', '', 'BELLO MARTINEZ CELESTINO', 500, 0, 193256.44, 0, 0, 0, 0, 193756.44, 135629.51, 135629.51, 'Av 22 de Feb 423 Sauce 205', 'San Marcos', 'Azcapotzalco', 'S/D', 143, 'BD Consolidada Ahorradores ', '200017', 1),
(131, '00200018', '', 'BENITEZ SAID JESUS', 0, 0, 10000, 0, 0, 0, 0, 10000, 7000, 7000, '16 Oriente num 109', 'Sarabia', 'Tehuacan', 'S/D', 144, 'BD Consolidada Ahorradores ', '200018', 1),
(132, '00200019', '', 'BIBIANO JERONIMO ARTEMIO', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Avenida Portes Gil num1022', 'San Nicolas', 'Tetitzintla', 'S/D', 145, 'BD Consolidada Ahorradores ', '200019', 1),
(133, '00200020', '', 'BOLAÑOS MOGUEL ALFREDO DAMIAN', 500, 0, 919500, 0, 0, 0, 0, 920000, 644000, 167930, '20 Poniente 110', 'El Eden', 'Tehuacan', 'S/D', 146, 'BD Consolidada Ahorradores ', '200020', 1),
(134, '00200021', '', 'BOLAÑOS MOGUEL FLOR VERONICA', 0, 0, 97000, 0, 0, 0, 0, 97000, 67900, 67900, 'Lazaro Cardenas num2418', 'Francisco Villa', 'Tehuacan', 'S/D', 147, 'BD Consolidada Ahorradores ', '200021', 1),
(135, '00200022', '', 'BONFIL MARTINEZ ROBERTA HERACLIA', 500, 832.87, 0, 0, 0, 0, 0, 1332.87, 933.01, 933.01, 'Zoquitlan s/n', 'Barrio 2', 'Zoquitlan', 'S/D', 148, 'BD Consolidada Ahorradores ', '200022', 1),
(136, '00200023', '', 'BUENABAD CASTILLA JOSEFA', 500, 0, 39919.23, 0, 0, 0, 0, 40419.23, 28293.46, 28293.46, 'San Sebastian Frontera S/N', 'Sebastian Frontera', 'Santiago Chazumba', 'S/D', 149, 'BD Consolidada Ahorradores ', '200023', 1),
(137, '00200024', '', 'CABRERA HERNANDEZ ELVIRA', 500, 0, 20248.38, 0, 0, 0, 0, 20748.38, 14523.87, 14523.87, 'Av Vicente Guerrero num 307', 'Santa Maria Monte', 'Vicente Guerrero', 'S/D', 150, 'BD Consolidada Ahorradores ', '200024', 1),
(138, '00200025', '', 'CACHO GARCIA BEATRIZ', 500, 0, 8500, 0, 0, 0, 0, 9000, 6300, 6300, 'Reforma num 6', 'Centro', 'San Jose Miahuatlan', 'S/D', 151, 'BD Consolidada Ahorradores ', '200025', 1),
(139, '00200026', '', 'CALDERON SOLIS REGINO', 0, 0, 10000, 0, 0, 0, 0, 10000, 7000, 7000, 'Venustiano Carranza num 24', 'Centro', 'Zinacatepec', 'S/D', 152, 'BD Consolidada Ahorradores ', '200026', 1),
(140, '00200027', '', 'CAMACHO ALONSO JOSE JUAN', 500, 36595.02, 0, 0, 0, 0, 0, 37095.02, 25966.51, 25966.51, '12 Sur num 1930', '16 de Marzo', 'Tehuacan', 'S/D', 153, 'BD Consolidada Ahorradores ', '200027', 1),
(141, '00200028', '', 'CARRANZA MARIN PABLO', 500, 0, 50333.33, 0, 0, 0, 0, 50833.33, 35583.33, 35583.33, 'Barrio Peña Blanca s/n', 'Peña Blanca', 'San Lucas Zoquiampan', 'S/D', 154, 'BD Consolidada Ahorradores ', '200028', 1),
(142, '00200029', '', 'CARRERA CARRERA CATARINA AMPARO', 0, 0, 187863.1, 0, 0, 0, 0, 187863.1, 131504.17, 131504.17, 'Josefa Ortiz de Dominguez num 547', 'Nicolas Bravo', 'Tehuacan', 'S/D', 155, 'BD Consolidada Ahorradores ', '200029', 1),
(143, '00200030', '', 'CARRERA LEZAMA FERNANDO MANUEL', 500, 0, 36228.61, 0, 0, 0, 0, 36728.61, 25710.03, 25710.03, '13 Poniente num 434', 'Benito Juarez', 'Tehuacan', 'S/D', 156, 'BD Consolidada Ahorradores ', '200030', 1),
(144, '00200031', '', 'CASTILLO ARCOS MODESTA', 0, 0, 1300000, 0, 0, 0, 0, 1300000, 910000, 167930, '2 norte num139', 'Zaragoza', 'Tehuacan', 'S/D', 157, 'BD Consolidada Ahorradores ', '200031', 1),
(145, '00200032', '', 'CASTILLO GOMEZ DANIEL', 500, 0, 2900000, 0, 0, 0, 0, 2900500, 2030350, 167930, 'Priv 5 num Edif 2012', 'Los Pinos', 'Tehuacan', 'S/D', 158, 'BD Consolidada Ahorradores ', '200032', 1),
(146, '00200033', '', 'CASTRO PANTZI ABEL ANDRES', 83000, 0, 0, 0, 0, 0, 0, 83000, 58100, 58100, '5 de febrero sur num 532', 'Coculco', 'Ajalpan', 'S/D', 159, 'BD Consolidada Ahorradores ', '200033', 1),
(147, '00200034', '', 'CERQUERA DE LA CRUZ CRISPIN', 500, 0, 11566.16, 0, 0, 0, 0, 12066.16, 8446.31, 8446.31, '5 sur num917', 'Nicolas Bravo', 'Tehuacan', 'S/D', 160, 'BD Consolidada Ahorradores ', '200034', 1),
(148, '00200035', '', 'CHAVEZ MARTINEZ MARIA LORENA', 0, 0, 93000, 0, 0, 0, 0, 93000, 65100, 65100, '9 Oriente num 905', 'La Purisima', 'Tehuacan', 'S/D', 161, 'BD Consolidada Ahorradores ', '200035', 1),
(149, '00200036', '', 'CORREA REYES LORENA', 500, 0, 12018.16, 0, 0, 0, 0, 12518.16, 8762.71, 8762.71, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 162, 'BD Consolidada Ahorradores ', '200036', 1),
(150, '00200037', '', 'CORREA REYES MATILDE', 500, 0, 70000, 0, 0, 0, 0, 70500, 49350, 49350, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 163, 'BD Consolidada Ahorradores ', '200037', 1),
(151, '00200038', '', 'CORREO JUAREZ EDUARDO', 0, 0, 8000, 0, 0, 0, 0, 8000, 5600, 5600, 'Mariano Matamoros no 177', 'Centro', 'San Gabriel Chilac', 'S/D', 164, 'BD Consolidada Ahorradores ', '200038', 1),
(152, '00200039', '', 'CORTES REYES ISRAEL', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Independencia num 6', 'San Juan Atzingo', 'San Gabriel Chilac', '012371052829', 165, 'BD Consolidada Ahorradores ', '200039', 1),
(153, '00200040', '', 'CORTES REYES PEDRO PASCUAL', 0, 0, 20700, 0, 0, 0, 0, 20700, 14490, 14490, 'Priv 15 norte num 22', 'Obreros Peñafiel', 'Teotitlan Flores', 'S/D', 166, 'BD Consolidada Ahorradores ', '200040', 1),
(154, '00200041', '', 'CORTES LOPEZ JOSE', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, '6 Poniente num 511', 'Santiago Miahuatlan', 'Tehuacan', 'S/D', 167, 'BD Consolidada Ahorradores ', '200041', 1),
(155, '00200042', '', 'CORTEZ COELLO CIRENIA', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Priv Maestro Aaron Joaquin num 2312', 'Mexico Sur', 'Coyomeapan', 'S/D', 168, 'BD Consolidada Ahorradores ', '200042', 1),
(156, '00200043', '', 'CRUZ AVENDAÑO GONZALO', 500, 0, 12000, 0, 0, 0, 0, 12500, 8750, 8750, '8 Norte 416', 'Serdan', 'Serdan', '012381085381', 169, 'BD Consolidada Ahorradores ', '200043', 1),
(157, '00200044', '', 'CRUZ PARRA PAULINA', 500, 0, 150000, 0, 0, 0, 0, 150500, 105350, 105350, '13 Oriente Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 170, 'BD Consolidada Ahorradores ', '200044', 1),
(158, '00200045', '', 'CUELLO MONTAL DIONISIA', 500, 0, 131400.66, 0, 0, 0, 0, 131900.66, 92330.46, 92330.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 171, 'BD Consolidada Ahorradores ', '200045', 1),
(159, '00200046', '', 'DE JESUS HERNANDEZ JUANA', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Telpatlan s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 172, 'BD Consolidada Ahorradores ', '200046', 1),
(160, '00200047', '', 'DE JESUS MACEDONIO FRANCISCO', 0, 0, 300000, 0, 0, 0, 0, 300000, 210000, 167930, 'Real num 203', 'Jose Maria Morelos', 'Tlachichuca', 'S/D', 173, 'BD Consolidada Ahorradores ', '200047', 1),
(161, '00200048', '', 'DE LOS SANTOS SALINAS JOSE', 0, 4000, 95000, 0, 0, 0, 0, 99000, 69300, 69300, '3 oriente num12', 'Centro', 'Atexcal', 'S/D', 174, 'BD Consolidada Ahorradores ', '200048', 1),
(162, '00200049', '', 'DIAZ OSORIO JUAN', 500, 0, 109765.77, 0, 0, 0, 0, 110265.77, 77186.04, 77186.04, 'Buena Vista s/n', 'Santa Maria Teopoxco', 'Santa Maria Teopoxco', 'S/D', 175, 'BD Consolidada Ahorradores ', '200049', 1),
(163, '00200050', '', 'DIEGO GAYTAN ALEJANDRO', 0, 0, 117500, 0, 0, 0, 0, 117500, 82250, 82250, 'Aeromexico num Lote 36', 'Aeropuerto', 'Tehuacan', 'S/D', 176, 'BD Consolidada Ahorradores ', '200050', 1),
(164, '00200051', '', 'DUARTE HUITZITL AGRIPINA ALICIA', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, 'Zoquitlan s/n', 'Zoquitlan', 'Zoquitlan', 'S/D', 177, 'BD Consolidada Ahorradores ', '200051', 1),
(165, '00200052', '', 'DUARTE OLMOS FIDENCIO', 0, 0, 50000, 0, 0, 0, 0, 50000, 35000, 35000, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 178, 'BD Consolidada Ahorradores ', '200052', 1),
(166, '00200053', '', 'DURAN AVENDAÑO LEOVIGILDA', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Republica Brazil num 2512', 'America', 'Tehuacan', 'S/D', 179, 'BD Consolidada Ahorradores ', '200053', 1),
(167, '00200054', '', 'DURAN LOPEZ FLORENCIO LAZARO', 500, 41508.73, 0, 0, 0, 0, 0, 42008.73, 29406.11, 29406.11, 'Guerrero num 13', 'Cuauhtemoc', 'San Juan B Cuicatlan', 'S/D', 180, 'BD Consolidada Ahorradores ', '200054', 1),
(168, '00200055', '', 'FERMIN HERNANDEZ ESTEBAN', 500, 8633.67, 0, 0, 0, 0, 0, 9133.67, 6393.57, 6393.57, '1RA Priv 9 nte 7', 'Observatorio', 'Tehuacan', 'S/D', 181, 'BD Consolidada Ahorradores ', '200055', 1),
(169, '00200056', '', 'FLORES ARCOS DOLORES', 0, 0, 175800, 0, 0, 0, 0, 175800, 123060, 123060, 'Reforma Sur 700', 'Centro', 'Tehuacan', 'S/D', 182, 'BD Consolidada Ahorradores ', '200056', 1),
(170, '00200057', '', 'FLORIAN COLMENARES DELIA', 500, 224843.19, 1600000, 0, 0, 0, 0, 1825343.19, 1277740.23, 167930, '3 era Privada de la 3 Oriente num10', 'El Mirador', 'Tehuacan', 'S/D', 183, 'BD Consolidada Ahorradores ', '200057', 1),
(171, '00200058', '', 'FLORIUK GONZALEZ MARIA EUGENIA', 900000, 0, 0, 0, 0, 0, 0, 900000, 630000, 167930, '3 Sur 313 y 3 oriente', 'Centro', 'Tehuacan', 'S/D', 184, 'BD Consolidada Ahorradores ', '200058', 1),
(172, '00200059', '', 'GALVAN RODRIGUEZ ADELA', 500, 7000, 16000, 0, 0, 0, 0, 23500, 16450, 16450, 'Pipila num2027', 'Aeropuerto', 'Tehuacan', 'S/D', 185, 'BD Consolidada Ahorradores ', '200059', 1),
(173, '00200060', '', 'GALVEZ GONZALEZ ELIA TRINIDAD', 500, 0, 19000, 0, 0, 0, 0, 19500, 13650, 13650, '4 Oriente num 717 4', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 186, 'BD Consolidada Ahorradores ', '200060', 1),
(174, '00200061', '', 'GALVEZ GONZALEZ MARIA DEL CARMEN', 0, 0, 90000, 0, 0, 0, 0, 90000, 63000, 63000, '3 Norte num 211', 'Centro', 'Tehuacan', 'S/D', 187, 'BD Consolidada Ahorradores ', '200061', 1),
(175, '00200062', '', 'GALVEZ GONZALEZ SOLEDAD', 0, 15424.16, 0, 0, 0, 0, 0, 15424.16, 10796.91, 10796.91, '3 norte num 211', 'Centro', 'Tehuacan', 'S/D', 188, 'BD Consolidada Ahorradores ', '200062', 1),
(176, '00200063', '', 'GARCIA BRETON MARIA JOSEFINA EVARISTA', 0, 0, 10892.55, 0, 0, 0, 0, 10892.55, 7624.79, 7624.79, 's/nombre s/n', 'Temaxcalapa', 'Cañada Morelos', 'S/D', 189, 'BD Consolidada Ahorradores ', '200063', 1),
(177, '00200064', '', 'GARCIA GARCIA MARCELINA', 500, 0, 36633.15, 0, 0, 0, 0, 37133.15, 25993.21, 25993.21, '13 Mza 103 LT 19', 'Valle de los Reyes', 'La Paz Mexico', 'S/D', 190, 'BD Consolidada Ahorradores ', '200064', 1),
(178, '00200065', '', 'GARCIA LOPEZ CONSUELO', 105000, 3030.38, 0, 0, 0, 0, 0, 108030.38, 75621.27, 75621.27, '11 oriente num 741', 'Nicolas Bravo', 'Tehuacan', 'S/D', 191, 'BD Consolidada Ahorradores ', '200065', 1),
(179, '00200066', '', 'GARCIA MARTINEZ JUANA', 500, 0, 10000, 0, 0, 0, 0, 10500, 7350, 7350, 'Lerdo de Tejada num 924 Galeana Y 11 Poniente', 'Benito Juarez', 'Tehuacan', 'S/D', 192, 'BD Consolidada Ahorradores ', '200066', 1),
(180, '00200067', '', 'GARCIA MARTINEZ RAYMUNDO', 500, 0, 15486.28, 0, 0, 0, 0, 15986.28, 11190.4, 11190.4, '26 Sur num 1936', 'Puebla', 'Tehuacan', 'S/D', 193, 'BD Consolidada Ahorradores ', '200067', 1),
(181, '00200068', '', 'GASPAR GONZALEZ GORGONIO', 500, 0, 25000, 0, 0, 0, 0, 25500, 17850, 17850, 'Puerto de angel s/n', 'Puerto san Angel', 'Ajalpan', 'S/D', 194, 'BD Consolidada Ahorradores ', '200068', 1),
(182, '00200069', '', 'GASPAR MONTALVO MAURA', 500, 0, 3000, 0, 0, 0, 0, 3500, 2450, 2450, 'Puerto de Angel s/n', 'Barrio Atempa', 'Ajalpan', 'S/D', 195, 'BD Consolidada Ahorradores ', '200069', 1),
(183, '00200070', '', 'GINEZ GINEZ ADRIAN', 500, 0, 123076.13, 0, 0, 0, 0, 123576.13, 86503.29, 86503.29, 'sin nombre s/n', 'Santa Maria Monte', 'Vicente Guerrero', '2361126582', 196, 'BD Consolidada Ahorradores ', '200070', 1),
(184, '00200071', '', 'GONZALEZ GARCIA CONRADO AUSENCIO', 0, 0, 51900, 0, 0, 0, 0, 51900, 36330, 36330, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 197, 'BD Consolidada Ahorradores ', '200071', 1),
(185, '00200072', '', 'GONZALEZ GIL MARIANO', 500, 0, 20869.24, 0, 0, 0, 0, 21369.24, 14958.47, 14958.47, 'Morelos num17', 'Barrio Gonzalisco', 'Ajalpan', 'S/D', 198, 'BD Consolidada Ahorradores ', '200072', 1),
(186, '00200073', '', 'GONZALEZ MONTALVO RIGOBERTO', 500, 0, 8500, 0, 0, 0, 0, 9000, 6300, 6300, '4 Oriente 117', 'Centro', 'Tehuacan', 'S/D', 199, 'BD Consolidada Ahorradores ', '200073', 1),
(187, '00200074', '', 'GORDILLO JIMENEZ VELINO', 500, 0, 500000, 0, 0, 0, 0, 500500, 350350, 167930, '16 de septiembre num913', 'Hidalgo', 'Tehuacan', 'S/D', 200, 'BD Consolidada Ahorradores ', '200074', 1),
(188, '00200075', '', 'HERNANDEZ ANASTACIO SERAFINA', 0, 0, 66817.38, 0, 0, 0, 0, 66817.38, 46772.17, 46772.17, 'Callejon Jacarandas num 12', 'Aeropuerto', 'Tehuacan', 'S/D', 201, 'BD Consolidada Ahorradores ', '200075', 1),
(189, '00200076', '', 'HERNANDEZ BENITEZ HERON REMIGIO', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Avenida 5 de mayo num11', 'Centro', 'Cañada Morelos', 'S/D', 202, 'BD Consolidada Ahorradores ', '200076', 1),
(190, '00200077', '', 'HERNANDEZ ESPINOZA ALBERTA', 500, 0, 26780, 0, 0, 0, 0, 27280, 19096, 19096, 'Cerrada de Amdo Nervo num8', 'La Purisima', 'Tehuacan', 'S/D', 203, 'BD Consolidada Ahorradores ', '200077', 1),
(191, '00200078', '', 'HERNANDEZ GONZALEZ JUANA', 0, 0, 90600, 0, 0, 0, 0, 90600, 63420, 63420, 'Vicente Guerrero s/n', 'Villa Nueva', 'Santa Maria Teopoxco', 'S/D', 204, 'BD Consolidada Ahorradores ', '200078', 1),
(192, '00200079', '', 'HERNANDEZ HERNANDEZ ARACELI', 500, 0, 18173.99, 0, 0, 0, 0, 18673.99, 13071.79, 13071.79, '5 norte num110', 'Centro', 'Tehuacan', 'S/D', 205, 'BD Consolidada Ahorradores ', '200079', 1),
(193, '00200080', '', 'HERNANDEZ HERNANDEZ MARIA MARGARITA', 500, 0, 4476.52, 0, 0, 0, 0, 4976.52, 3483.56, 3483.56, 'Priv Atlixco num 1913', 'San Juan Bautista', 'Cuicatlan', '1071257', 206, 'BD Consolidada Ahorradores ', '200080', 1),
(194, '00200081', '', 'HERNANDEZ OLAYA GUADALUPE DELFINA', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Benito Juarez 513', 'Centro', 'Zinacatepec', '012362811431', 207, 'BD Consolidada Ahorradores ', '200081', 1),
(195, '00200082', '', 'HERNANDEZ REYES MARIA AGUSTINA', 500, 36370, 0, 0, 0, 0, 0, 36870, 25809, 25809, 'Priv Miguel Hidalgo num 623 Int 1', 'San Lorenzo Teopilco', 'Tehuacan', 'S/D', 208, 'BD Consolidada Ahorradores ', '200082', 1),
(196, '00200083', '', 'HUERTA ALVAREZ ROSA', 260000, 0, 0, 0, 0, 0, 0, 260000, 182000, 167930, '2 Oriente num 712', 'Centro', 'Tehuacan', 'S/D', 209, 'BD Consolidada Ahorradores ', '200083', 1),
(197, '00200084', '', 'HUERTA ROMUALDO ISAAC', 50500, 0, 0, 0, 0, 0, 0, 50500, 35350, 35350, 'Pino Suarez num 327', 'Jesus Carranza', 'Zinacatepec', 'S/D', 210, 'BD Consolidada Ahorradores ', '200084', 1),
(198, '00200085', '', 'JIMENEZ RIVERA SIBILINA', 500, 0, 158555.13, 0, 0, 0, 0, 159055.13, 111338.59, 111338.59, 'Privada Nacional Lote 49', 'Vista hermosa', 'Teotipilco', 'S/D', 211, 'BD Consolidada Ahorradores ', '200085', 1),
(199, '00200086', '', 'JUANA GASPAR MONTALVO', 500, 0, 33100, 0, 0, 0, 0, 33600, 23520, 23520, 'El mirador s/n', 'El mirado', 'Ajalpan', 'S/D', 212, 'BD Consolidada Ahorradores ', '200086', 1),
(200, '00200087', '', 'JUAREZ SANCHEZ CLEMENCIA', 0, 0, 216500, 0, 0, 0, 0, 216500, 151550, 151550, 'Quinta Privada 6 Oriente num619', 'Quinta Guadalupe', 'Tehuacan', 'S/D', 213, 'BD Consolidada Ahorradores ', '200087', 1),
(201, '00200088', '', 'JULITA HERNANDEZ MAGDALENA', 0, 0, 20300, 0, 0, 0, 0, 20300, 14210, 14210, '16 de Septiembre num 101', 'Zentlapatl', 'Zinacatepec', '012361121232', 214, 'BD Consolidada Ahorradores ', '200088', 1),
(202, '00200089', '', 'LADINO GARCIA PATRICIA', 18815.97, 0, 0, 0, 0, 0, 0, 18815.97, 13171.18, 13171.18, 'Lazaro Cardenas num 904 B', 'El Riego', 'Tehuacan', 'S/D', 215, 'BD Consolidada Ahorradores ', '200089', 1),
(203, '00200090', '', 'LARA MARTINEZ GERMAN', 500, 0, 249547.79, 0, 0, 0, 0, 250047.79, 175033.45, 167930, 'Sor Juana Ines de la Cruz num 3512', 'Fracc Cultural', 'Tehuacan', '012383800433', 216, 'BD Consolidada Ahorradores ', '200090', 1),
(204, '00200091', '', 'LEYVA OLMOS CARMELA', 500, 6020.32, 0, 0, 0, 0, 0, 6520.32, 4564.22, 4564.22, 'Porfirio Diaz num1201', 'Centro', 'Zinacatepec', 'S/D', 217, 'BD Consolidada Ahorradores ', '200091', 1),
(205, '00200092', '', 'LEYVA PACHECO GREGORIO', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Privada Guerrero 806 int5', 'Centro', 'Zinacatepec', 'S/D', 218, 'BD Consolidada Ahorradores ', '200092', 1),
(206, '00200093', '', 'LEZAMA FERNANDEZ JUDITH SULLY', 500, 0, 149587.93, 0, 0, 0, 0, 150087.93, 105061.55, 105061.55, 'Privada de la 6 oriente num 19 int 6', 'Centro', 'Tehuacan', '012383821694', 219, 'BD Consolidada Ahorradores ', '200093', 1),
(207, '00200094', '', 'LEZAMA TOBON JOSE', 0, 0, 150000, 0, 0, 0, 0, 150000, 105000, 105000, 'Callejon Hidalgo no 520', 'La Pedrera', 'Tehuacan', 'S/D', 220, 'BD Consolidada Ahorradores ', '200094', 1),
(208, '00200095', '', 'LIMA LEON TEODORO', 500, 0, 652000, 0, 0, 0, 0, 652500, 456750, 167930, 'Priv 7 sur andador 3 56', 'La purisima', 'Tehuacan', '012383830713', 221, 'BD Consolidada Ahorradores ', '200095', 1),
(209, '00200096', '', 'LOPEZ GARCIA ROBERTO', 60500, 0, 0, 0, 0, 0, 0, 60500, 42350, 42350, '4 Sur num 1120', 'Benito Juarez', 'Tehuacan', 'S/D', 222, 'BD Consolidada Ahorradores ', '200096', 1),
(210, '00200097', '', 'LOPEZ GAYOSSO EZEQUIEL', 500, 5457.46, 0, 0, 0, 0, 0, 5957.46, 4170.22, 4170.22, 'Justo Sierra num3708', 'Cultural', 'Tehuacan', 'S/D', 223, 'BD Consolidada Ahorradores ', '200097', 1),
(211, '00200098', '', 'LOPEZ HERNANDEZ GERARDO', 500, 0, 56083.32, 0, 0, 0, 0, 56583.32, 39608.32, 39608.32, 'Gardenia num 4115', 'Villa Vista', 'Tehuacan', 'S/D', 224, 'BD Consolidada Ahorradores ', '200098', 1),
(212, '00200099', '', 'LOPEZ SANCHEZ PETRA', 50000, 0, 0, 0, 0, 0, 0, 50000, 35000, 35000, 'Puerto de Veracruz 2128', 'Revolucion', 'Tehuacan', 'S/D', 225, 'BD Consolidada Ahorradores ', '200099', 1),
(213, '00200100', '', 'LUCAS MORALES LEONARDO', 500, 2683.06, 8407.17, 0, 0, 0, 0, 11590.23, 8113.16, 8113.16, 'Privada 19 sur num 1913', 'Las Flores', 'Tehuacan', '012383838246', 226, 'BD Consolidada Ahorradores ', '200100', 1),
(214, '00200101', '', 'LUNA CARRETO SILVIA', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Privada Amado Nervo num 331', 'La Purisima', 'Tehuacan', 'S/D', 227, 'BD Consolidada Ahorradores ', '200101', 1),
(215, '00200102', '', 'MALCON OROZCO GUADALUPE', 500, 0, 193886.26, 0, 0, 0, 0, 194386.26, 136070.38, 136070.38, 'Privada la Paz num119', 'Centro', 'Tehuacan', '3823944', 228, 'BD Consolidada Ahorradores ', '200102', 1),
(216, '00200103', '', 'MALDONADO QUINTANA RAMON', 0, 0, 350000, 0, 0, 0, 0, 350000, 245000, 167930, 'De la 6 Oriente num 602', 'Francisco Sarabia', 'Tehuacan', 'S/D', 229, 'BD Consolidada Ahorradores ', '200103', 1),
(217, '00200104', '', 'MARCELINO HERNANDEZ CARMELITA JOAQUINA', 0, 0, 14500, 0, 0, 0, 0, 14500, 10150, 10150, 'Venustiano Carranza num 714', 'Sentlalpal', 'Zinacatepec', 'S/D', 230, 'BD Consolidada Ahorradores ', '200104', 1),
(218, '00200105', '', 'MARCELINO HERNANDEZ GORGONIO FELIPE', 500, 0, 12000, 0, 0, 0, 0, 12500, 8750, 8750, '16 de Septiembre num 504', 'Barr Zentlapatl', 'Zincatepec', 'S/D', 231, 'BD Consolidada Ahorradores ', '200105', 1),
(219, '00200106', '', 'MARTINEZ GARCIA CAROLINA', 150000, 0, 0, 0, 0, 0, 0, 150000, 105000, 105000, 'Hector Lezama Sur Roca 337', 'La Purisima', 'Tehuacan', 'S/D', 232, 'BD Consolidada Ahorradores ', '200106', 1),
(220, '00200107', '', 'MARTINEZ JIMENEZ DANIELA', 0, 0, 1500000, 0, 0, 0, 0, 1500000, 1050000, 167930, 'Biarritz num 116', 'Arcadia', 'Tehuacan', 'S/D', 233, 'BD Consolidada Ahorradores ', '200107', 1),
(221, '00200108', '', 'MARTINEZ MORFINEZ MARIA ANGELICA', 500, 0, 11007, 0, 0, 0, 0, 11507, 8054.9, 8054.9, 'C Matamoros num 10', 'Centro', 'San Gabriel Chilac', 'S/D', 234, 'BD Consolidada Ahorradores ', '200108', 1),
(222, '00200109', '', 'MARTINEZ VALERIO MIGUEL ANGEL GERMAN', 0, 0, 1000000, 0, 0, 0, 0, 1000000, 700000, 167930, 'Priv Biarritz num 116', 'Fracc Arcadia', 'Tehuacan', 'S/D', 235, 'BD Consolidada Ahorradores ', '200109', 1),
(223, '00200110', '', 'MENDOZA DIEGO MAGARITA INES', 500, 0, 9500, 0, 0, 0, 0, 10000, 7000, 7000, 'Venustiano Carranza num 1908', '16 de Marzo', 'Tehuacan', 'S/D', 236, 'BD Consolidada Ahorradores ', '200110', 1),
(224, '00200111', '', 'MIGUEL SANTIAGO OMEGA', 0, 0, 900000, 0, 0, 0, 0, 900000, 630000, 167930, 'Macario Gaxiola edif 27 202', 'U Hab las Armas', 'Azcapotzalco', 'S/D', 237, 'BD Consolidada Ahorradores ', '200111', 1),
(225, '00200112', '', 'MOLINA GOMEZ LUCIO', 442443.53, 0, 0, 0, 0, 0, 0, 442443.53, 309710.47, 167930, '5 sur esq con 11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', '012383830001', 238, 'BD Consolidada Ahorradores ', '200112', 1),
(226, '00200113', '', 'MOLINA LOPEZ JULIA AMALIA', 306928.88, 0, 0, 0, 0, 0, 0, 306928.88, 214850.22, 167930, '11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', '012383830001', 239, 'BD Consolidada Ahorradores ', '200113', 1),
(227, '00200114', '', 'MONTALVO ANSELMO AMBROCIO', 0, 0, 325500, 0, 0, 0, 0, 325500, 227850, 167930, 'Tepexilotla s/n', 'Seccion Tercera', 'Zoquitlan', '2365962097', 240, 'BD Consolidada Ahorradores ', '200114', 1),
(228, '00200115', '', 'MORAL CANO GONZALO', 0, 0, 36600, 0, 0, 0, 0, 36600, 25620, 25620, 'Primera Seccion', 'Barrio Zacapechco', 'Zoquitlan', 'S/D', 241, 'BD Consolidada Ahorradores ', '200115', 1),
(229, '00200116', '', 'MORALES JIMENEZ HERMINIA', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Guadalupe Victoria num1640', 'Aeropuerto', 'Tehuacan', '2381133641', 242, 'BD Consolidada Ahorradores ', '200116', 1),
(230, '00200117', '', 'MORALES ROJAS ALFREDO VICTOR', 500, 238300.12, 0, 0, 0, 0, 0, 238800.12, 167160.08, 167160.08, '12 poniente num617', 'Lazaro Cardena Norte', 'Tehuacan', 'S/D', 243, 'BD Consolidada Ahorradores ', '200117', 1),
(231, '00200118', '', 'MORENO ANGELA', 500, 20000, 159117.63, 0, 0, 0, 0, 179617.63, 125732.34, 125732.34, 'Privada Nacional LT 49A', 'Vista Hermosa', 'Tehuacan', 'S/D', 244, 'BD Consolidada Ahorradores ', '200118', 1),
(232, '00200119', '', 'OLAYA ROMERO SOCORRO', 500, 0, 162900, 0, 0, 0, 0, 163400, 114380, 114380, 'Benito Juarez num513', 'Centro', 'Zinacatepec', 'S/D', 245, 'BD Consolidada Ahorradores ', '200119', 1),
(233, '00200120', '', 'OLMOS DORANTES DULCE MARIA', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Juquilita Lote 5', 'Maldonado Colosio', 'Tehuacan', 'S/D', 246, 'BD Consolidada Ahorradores ', '200120', 1);
INSERT INTO `consolidadasCertificadas` (`idconsolidadasCertificadas`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `parteSocial`, `cuentasAhorro`, `cuentasInversion`, `depositosGarantia`, `chequesNoCobrados`, `otrosDepositos`, `prestamosACargo`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `colonia`, `delegacionMunicipio`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `curp`, `basesCertificadas_idbasesCertificadas`) VALUES
(234, '00200121', '', 'OLMOS VALENCIA LEONARDO', 500, 0, 150000, 0, 0, 0, 0, 150500, 105350, 105350, 'Ocotlamanic s/n', 'Ocotla', 'Coxcatlan', 'S/D', 247, 'BD Consolidada Ahorradores ', '200121', 1),
(235, '00200122', '', 'ORTIZ JIMENEZ VIRGINIA ORTENCIA', 500, 0, 35400, 0, 0, 0, 0, 35900, 25130, 25130, 'Av 5 de mayo num 5', 'Seccion cuarta', 'Zoquitlan', 'S/D', 248, 'BD Consolidada Ahorradores ', '200122', 1),
(236, '00200123', '', 'OSORIO GUZMAN HERLINDA', 0, 0, 350000, 0, 0, 0, 0, 350000, 245000, 167930, 'Del panteon s/n', 'San Juan Atzingo', 'San Gabriel Chilac', 'S/D', 249, 'BD Consolidada Ahorradores ', '200123', 1),
(237, '00200124', '', 'PARRA GARRERA MARTHA', 500, 0, 60000, 0, 0, 0, 0, 60500, 42350, 42350, '13 Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 250, 'BD Consolidada Ahorradores ', '200124', 1),
(238, '00200125', '', 'PASTRANA SOLIS FROYLAN', 500, 3006.44, 0, 0, 0, 0, 0, 3506.44, 2454.51, 2454.51, '18 Poniente num 818', 'Tetizintla', 'Tehuacan', 'S/D', 251, 'BD Consolidada Ahorradores ', '200125', 1),
(239, '00200126', '', 'PEREZ MENDEZ MATEO', 0, 0, 10557652, 0, 0, 0, 0, 10557652, 7390356.4, 167930, 'Reforma norte num 127', 'Centro', 'Tehuacan', 'S/D', 252, 'BD Consolidada Ahorradores ', '200126', 1),
(240, '00200127', '', 'PEREZ NAVA ADRIANA', 500, 0, 31500, 0, 0, 0, 0, 32000, 22400, 22400, 'Corregidora num2', 'San Jose Tilapa', 'Coxcatlan', 'S/D', 253, 'BD Consolidada Ahorradores ', '200127', 1),
(241, '00200128', '', 'QUIXTIANO COGQUE MIGUEL', 0, 0, 410989, 0, 0, 0, 0, 410989, 287692.3, 167930, 'Revolucion num 415', 'Guadalupe', 'Ajalpan', 'S/D', 254, 'BD Consolidada Ahorradores ', '200128', 1),
(242, '00200129', '', 'QUIXTIANO TEMAXTE SOFIA', 500, 0, 68501, 0, 0, 0, 0, 69001, 48300.7, 48300.7, 'Revolucion Poniente num17', 'Centro', 'Ajalpan', 'S/D', 255, 'BD Consolidada Ahorradores ', '200129', 1),
(243, '00200130', '', 'RABAGO BALBUENA MARIA CONCEPCION JOSEFINA', 0, 0, 3650262.43, 0, 0, 0, 0, 3650262.43, 2555183.7, 167930, 'Av Reforma Sur num 317', 'Centro', 'Tehuacan', 'S/D', 256, 'BD Consolidada Ahorradores ', '200130', 1),
(244, '00200131', '', 'RAMIREZ BAUTISTA OLGA', 500, 0, 26050, 0, 0, 0, 0, 26550, 18585, 18585, 'Manuel Hernandez num 804', 'Xaltepec', 'Altepexi', 'S/D', 257, 'BD Consolidada Ahorradores ', '200131', 1),
(245, '00200132', '', 'RAMIREZ CABRERA CONCEPCION', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, '10 Poniente num 405', 'Cerritos', 'Tehuacan', 'S/D', 258, 'BD Consolidada Ahorradores ', '200132', 1),
(246, '00200133', '', 'RAMIREZ CARRERA MARIA DEL SOCORRO', 500, 0, 115000, 0, 0, 0, 0, 115500, 80850, 80850, '10 Poniente num407', 'Cerritos', 'Tehuacan', 'S/D', 259, 'BD Consolidada Ahorradores ', '200133', 1),
(247, '00200134', '', 'RAMIREZ CORDOVA EULALIA', 500, 0, 8500, 0, 0, 0, 0, 9000, 6300, 6300, 'Zoquitlan s/n', 'Tercera Seccion', 'Tecpanzcoalco', 'S/D', 260, 'BD Consolidada Ahorradores ', '200134', 1),
(248, '00200135', '', 'RAMIREZ DOMINGUEZ GRECIA CAROLINA', 0, 0, 220000, 0, 0, 0, 0, 220000, 154000, 154000, 'Avenida Ramon Caballero num641', 'San Rafael', 'Tehuacan', 'S/D', 261, 'BD Consolidada Ahorradores ', '200135', 1),
(249, '00200136', '', 'RAMIREZ GARCIA NORBERTO', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Seccion seguda num', 'Loma Ixmicapa', 'Zoquitlan', 'S/D', 262, 'BD Consolidada Ahorradores ', '200136', 1),
(250, '00200137', '', 'RAMIREZ PAZOS JORGE', 500, 689335.31, 200000, 0, 0, 0, 0, 889835.31, 622884.72, 167930, 'Prol 1 poniente 3000', 'Fracc Reforma', 'Tehuacan', 'S/D', 263, 'BD Consolidada Ahorradores ', '200137', 1),
(251, '00200138', '', 'RAMIREZ VAQUERO ROMUALDO', 0, 0, 160000, 0, 0, 0, 0, 160000, 112000, 112000, 'Ramon Caballero num 611', 'San Rafael', 'Tehuacan', 'S/D', 264, 'BD Consolidada Ahorradores ', '200138', 1),
(252, '00200139', '', 'RCHING RAMIREZ SOCORRO SOLEDAD', 500, 0, 421223.78, 0, 0, 0, 0, 421723.78, 295206.65, 167930, 'Avenida Reforma Sur sn', 'Guadalupe Hidalgo', 'Tehuacan', '3717275', 265, 'BD Consolidada Ahorradores ', '200139', 1),
(253, '00200140', '', 'REYES VENTURA ANGELICA', 500, 0, 36122.21, 0, 0, 0, 0, 36622.21, 25635.55, 25635.55, 'Independencia num 32', 'Centro', 'Tehuacan', 'S/D', 266, 'BD Consolidada Ahorradores ', '200140', 1),
(254, '00200141', '', 'RODRIGUEZ ARCE RICARDA', 500, 0, 15261.4, 0, 0, 0, 0, 15761.4, 11032.98, 11032.98, 'Ocotlamanic s/n', 'Ocotlamanic', 'Coxcatlan', 'S/D', 267, 'BD Consolidada Ahorradores ', '200141', 1),
(255, '00200142', '', 'RODRIGUEZ ARCE TAURINO ANGELES', 0, 0, 116420.65, 0, 0, 0, 0, 116420.65, 81494.46, 81494.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 268, 'BD Consolidada Ahorradores ', '200142', 1),
(256, '00200143', '', 'RODRIGUEZ CUELLO ROLANDO', 0, 0, 147000, 0, 0, 0, 0, 147000, 102900, 102900, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 269, 'BD Consolidada Ahorradores ', '200143', 1),
(257, '00200144', '', 'RODRIGUEZ MOLINA ROSA', 542483.28, 0, 542483.28, 0, 0, 0, 0, 1084966.56, 759476.59, 167930, '11 Ote num 500 Esquina con 5 Sur', 'Nicolas Bravo', 'Tehuacan', 'S/D', 270, 'BD Consolidada Ahorradores ', '200144', 1),
(258, '00200145', '', 'ROMERO CID MARIA', 500, 0, 12200, 0, 0, 0, 0, 12700, 8890, 8890, 'Nacional num 83 1A Secc', 'Nicolas Bravo', 'Tehuacan', 'S/D', 271, 'BD Consolidada Ahorradores ', '200145', 1),
(259, '00200146', '', 'ROMERO DUARTE TAURINO CARLOS', 0, 0, 73651.32, 0, 0, 0, 0, 73651.32, 51555.92, 51555.92, 'Av Rafael Avila Camacho num 227', 'Centro', 'San Gabriel Chilac', 'S/D', 272, 'BD Consolidada Ahorradores ', '200146', 1),
(260, '00200147', '', 'ROSALES VILLANUEVA ROSARIO', 500, 0, 370000, 0, 0, 0, 0, 370500, 259350, 167930, 'Heroes de Nacozari Norte num 124 Int 1', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 273, 'BD Consolidada Ahorradores ', '200147', 1),
(261, '00200148', '', 'RUIZ FLORES MARTHA NANCY Y/O FLORES GARCIA PAULINA', 500, 30000, 38000, 0, 0, 0, 0, 68500, 47950, 47950, 'Av Nicolas Bravo num 702', 'Nicolas Bravo', 'Tehuacan', 'S/D', 274, 'BD Consolidada Ahorradores ', '200148', 1),
(262, '00200149', '', 'SAENZ ESCALANTE GUSTAVO', 12770000, 0, 1500000, 0, 0, 0, 0, 14270000, 9989000, 167930, 'Bould Ingeniero Pastor Rouaix num 700', 'Benito Juarez', 'Tehuacan', 'S/D', 275, 'BD Consolidada Ahorradores ', '200149', 1),
(263, '00200150', '', 'SALINAS FLORES HERIBERTO CARLOS', 500, 61310.56, 54000, 0, 0, 0, 0, 115810.56, 81067.39, 81067.39, '5 norte num642', 'Cerritos', 'Tehuacan', 'S/D', 276, 'BD Consolidada Ahorradores ', '200150', 1),
(264, '00200151', '', 'SANCHEZ COELLO CATALINA JAQUELINA', 500, 0, 17900, 0, 0, 0, 0, 18400, 12880, 12880, 'Zoquitlan s/n', 'Tecpantzacualco', 'Zoquitlan', 'S/D', 277, 'BD Consolidada Ahorradores ', '200151', 1),
(265, '00200152', '', 'SANCHEZ HERNANDEZ CARLOS', 500, 5141.7, 0, 0, 0, 0, 0, 5641.7, 3949.19, 3949.19, 'Republica de Panama num 2325', 'America', 'Cuicatlan', 'S/D', 278, 'BD Consolidada Ahorradores ', '200152', 1),
(266, '00200153', '', 'SANCHEZ MENDEZ FAUSTINO', 500, 0, 50500, 0, 0, 0, 0, 51000, 35700, 35700, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 279, 'BD Consolidada Ahorradores ', '200153', 1),
(267, '00200154', '', 'SANCHEZ MONTALVO CATALINA', 500, 12006.58, 0, 0, 0, 0, 0, 12506.58, 8754.61, 8754.61, 'Salinas num 28', 'Chalma', 'Tehuacan', 'S/D', 280, 'BD Consolidada Ahorradores ', '200154', 1),
(268, '00200155', '', 'SANCHEZ MONTALVO FLORENCIO', 500, 0, 25540.41, 0, 0, 0, 0, 26040.41, 18228.29, 18228.29, '7 Sur 1106 Santa Maria 1106', 'Centro', 'Tehuacan', 'S/D', 281, 'BD Consolidada Ahorradores ', '200155', 1),
(269, '00200156', '', 'SANCHEZ RAMOS LETICIA', 500, 0, 31000, 0, 0, 0, 0, 31500, 22050, 22050, 'Callejon Pachuca num 5', 'Hidalgo Tehuantepec', 'Tehuacan', 'S/D', 282, 'BD Consolidada Ahorradores ', '200156', 1),
(270, '00200157', '', 'SANCHEZ ROMERO ARCENIO IGNACIO', 0, 0, 15975, 0, 0, 0, 0, 15975, 11182.5, 11182.5, 'Vicente Guerrero lt-6', '21 de Marzo', 'Tehuacan', 'S/D', 283, 'BD Consolidada Ahorradores ', '200157', 1),
(271, '00200158', '', 'SANCHEZ SANCHEZ LEOPOLDO', 500000, 0, 0, 0, 0, 0, 0, 500000, 350000, 167930, 'Nicolas Bravo num 19 A', 'Loc San Jose Ixtapa', 'Cañada Morelos', 'S/D', 284, 'BD Consolidada Ahorradores ', '200158', 1),
(272, '00200159', '', 'SANDOVAL ATILANO GILBERTO', 500, 0, 35000, 0, 0, 0, 0, 35500, 24850, 24850, 'Tepeaca de Zaragoza s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 285, 'BD Consolidada Ahorradores ', '200159', 1),
(273, '00200160', '', 'SANDOVAL GONZALEZ EMILIANO', 500, 0, 36000, 0, 0, 0, 0, 36500, 25550, 25550, 'Domicilio conocido s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 286, 'BD Consolidada Ahorradores ', '200160', 1),
(274, '00200161', '', 'SANDOVAL QUIAHUA LEONARDO', 90500, 0, 0, 0, 0, 0, 0, 90500, 63350, 63350, 'San Bartolo s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 287, 'BD Consolidada Ahorradores ', '200161', 1),
(275, '00200162', '', 'SANTIAGO LOPEZ EMMA MARIA', 0, 0, 643500, 0, 0, 0, 0, 643500, 450450, 167930, 'Andador 3/1', 'La Purisima', 'Tehuacan', 'S/D', 288, 'BD Consolidada Ahorradores ', '200162', 1),
(276, '00200163', '', 'SERAFIN MONTALVO EMMA', 500, 0, 35000, 0, 0, 0, 0, 35500, 24850, 24850, 'Playa Vicente s/n', 'Playa Vicente', 'Ajalpan', 'S/D', 289, 'BD Consolidada Ahorradores ', '200163', 1),
(277, '00200164', '', 'TAPIA HERNANDEZ FILADELFIA', 500, 0, 22253.42, 0, 0, 0, 0, 22753.42, 15927.39, 15927.39, 'Reforma num 89', 'San Jose del Chilar', 'Cuicatlan', 'S/D', 290, 'BD Consolidada Ahorradores ', '200164', 1),
(278, '00200165', '', 'TEMOXTLE GARCIA EUFEMIA', 500, 15003.28, 0, 0, 0, 0, 0, 15503.28, 10852.3, 10852.3, 'Av Morelos num 2', 'Zacapanga', 'Vicente Guerrero', '23610445555', 291, 'BD Consolidada Ahorradores ', '200165', 1),
(279, '00200166', '', 'TENORIO CARRILLO LUZ MARIA', 500, 0, 93990, 0, 0, 0, 0, 94490, 66143, 66143, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', '012383831718', 292, 'BD Consolidada Ahorradores ', '200166', 1),
(280, '00200167', '', 'TENORIO GARCIA SANDRA LUCY', 500, 0, 21145, 0, 0, 0, 0, 21645, 15151.5, 15151.5, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 293, 'BD Consolidada Ahorradores ', '200167', 1),
(281, '00200168', '', 'TORRES ALVA GUILLERMO', 500, 0, 26122.21, 0, 0, 0, 0, 26622.21, 18635.55, 18635.55, 'Dom Conocido s/n', 'Seccion Cuarta', 'Zoquitlan', 'S/D', 294, 'BD Consolidada Ahorradores ', '200168', 1),
(282, '00200169', '', 'TRUJILLO MORENO RAFAELA', 0, 0, 43812.4, 0, 0, 0, 0, 43812.4, 30668.68, 30668.68, '2 Poniente num 1617', 'Aquiles Serdan', 'Tehuacan', 'S/D', 295, 'BD Consolidada Ahorradores ', '200169', 1),
(283, '00200170', '', 'VALENCIA PEREZ ANGELA', 500, 0, 14591, 0, 0, 0, 0, 15091, 10563.7, 10563.7, 'Centenario num 42', 'Centro', 'San Jeronimo Teocatl', 'S/D', 296, 'BD Consolidada Ahorradores ', '200170', 1),
(284, '00200171', '', 'VALERIO FUENTES CAMILA MARINA', 0, 0, 159000, 0, 0, 0, 0, 159000, 111300, 111300, 'Av 7 sur num 205', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 297, 'BD Consolidada Ahorradores ', '200171', 1),
(285, '00200172', '', 'VARELA ROMAN MARCO ANTONIO', 500, 0, 162000, 0, 0, 0, 0, 162500, 113750, 113750, '8 Pte num Edficio 404 Int DTO 303', 'Fovisst Garci Crespo', 'Tehuacan', 'S/D', 298, 'BD Consolidada Ahorradores ', '200172', 1),
(286, '00200173', '', 'VARELA ROMAN MARIA TERESA', 500, 0, 1101000, 0, 0, 0, 0, 1101500, 771050, 167930, '3 oriente', 'Centro', 'Tehuacan', '3835231', 299, 'BD Consolidada Ahorradores ', '200173', 1),
(287, '00200174', '', 'VARELA ROMAN SERAFINA ENCARNACION', 500, 350188.4, 346071.06, 0, 0, 0, 0, 696759.46, 487731.62, 167930, '3 Norte num 1612', 'Francisco Sarabia', 'Tehuacan', 'S/D', 300, 'BD Consolidada Ahorradores ', '200174', 1),
(288, '00200175', '', 'VARILLAS CASTRO JOSE EDUARDO FAUSTO', 0, 0, 230994.82, 0, 0, 0, 0, 230994.82, 161696.37, 161696.37, 'Independencia num 4', 'San Jose Buena Vista', 'Tlacotepec', 'S/D', 301, 'BD Consolidada Ahorradores ', '200175', 1),
(289, '00200176', '', 'VEGA COELLO ANDRES ELEAZAR', 500, 0, 30000, 0, 0, 0, 0, 30500, 21350, 21350, 'Obregon s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 302, 'BD Consolidada Ahorradores ', '200176', 1),
(290, '00200177', '', 'VIVEROS MONTALVO JORGIN ALICIA', 500, 0, 5000, 0, 0, 0, 0, 5500, 3850, 3850, 'Av Nacional num 12', 'Segunda Seccion', 'Zoquitlan', 'S/D', 303, 'BD Consolidada Ahorradores ', '200177', 1),
(291, '00200178', '', 'ZAQUEROS COELLO ERASTO', 0, 0, 15000, 0, 0, 0, 0, 15000, 10500, 10500, 'Cacaloc s/n', 'Xala', 'Zoquitlan', 'S/D', 304, 'BD Consolidada Ahorradores ', '200178', 1),
(292, '00200179', '', 'ZARATE BARRAGAN EPIGMENIO', 0, 0, 330767.75, 0, 0, 0, 0, 330767.75, 231537.43, 167930, '7 Oriente num112', 'Francisco I Madero', 'Tepanco de Lopez', 'S/D', 305, 'BD Consolidada Ahorradores ', '200179', 1),
(293, '00200180', '', 'ZARATE RAMOS MARGARITA', 500, 15000, 37874, 0, 0, 0, 0, 53374, 37361.8, 37361.8, 'Nuevo Leon Sur num1914', 'Mexico', 'Tehuacan', 'S/D', 306, 'BD Consolidada Ahorradores ', '200180', 1),
(294, '00300001', '', 'AGUIRRE MORALES ERIKA', 500, 1939.79, 0, 0, 0, 0, 0, 2439.79, 1707.85, 1707.85, '5 de Mayo 91', 'Monte Chiquito', 'Santiago Miahuatlan', 'S/D', 307, 'BD Consolidada Ahorradores ', '300001', 1),
(295, '00300002', '', 'ALTA ARANDIA LEONOR', 500, 0, 3000, 0, 0, 0, 0, 3500, 2450, 2450, '28 Oriente 534', 'Santiago Tula', 'Tehuacan', 'S/D', 308, 'BD Consolidada Ahorradores ', '300002', 1),
(296, '00300003', '', 'ALTA MARTINEZ TERESA', 500, 0, 15826.12, 0, 0, 0, 0, 16326.12, 11428.28, 11428.28, 'Agua Axoxopan 2100 B', 'Villas Agua Blanca', 'Tehuacan', 'S/D', 309, 'BD Consolidada Ahorradores ', '300003', 1),
(297, '00300004', '', 'ALVARADO SOLANO MANUELA HORTENCIA', 500, 0, 222000, 0, 0, 0, 0, 222500, 155750, 155750, '3 Sur 1301', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 310, 'BD Consolidada Ahorradores ', '300004', 1),
(298, '00300005', '', 'ANASTACIO ALFONSO HERMELINDO', 500, 0, 351386.26, 0, 0, 0, 0, 351886.26, 246320.38, 167930, '17 de Septiembre 28', 'Hidalgo', 'Teotitlan', 'S/D', 311, 'BD Consolidada Ahorradores ', '300005', 1),
(299, '00300006', '', 'ANDRADE JUSTINIANO MINERVA', 500, 10383.63, 0, 0, 0, 0, 0, 10883.63, 7618.54, 7618.54, '4 Sur 702', 'Centro', 'Tecamachalco', 'S/D', 312, 'BD Consolidada Ahorradores ', '300006', 1),
(300, '00300007', '', 'APOLINAR PACHECO PABLO', 500, 0, 97500, 0, 0, 0, 0, 98000, 68600, 68600, 'Vicente Guerrero 1108', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 313, 'BD Consolidada Ahorradores ', '300007', 1),
(301, '00300008', '', 'ARISTA HERNANDEZ CRISTINA', 500, 0, 186824.73, 0, 0, 0, 0, 187324.73, 131127.31, 131127.31, 'Nahoas 17', 'Ancon', 'La Paz Mexico', 'S/D', 314, 'BD Consolidada Ahorradores ', '300008', 1),
(302, '00300009', '', 'ARISTA HERNANDEZ HERLINDA', 500, 0, 179713.06, 0, 0, 0, 0, 180213.06, 126149.14, 126149.14, 'Buena Vista 2512', 'El Humilladero', 'Tehuacan', 'S/D', 315, 'BD Consolidada Ahorradores ', '300009', 1),
(303, '00300010', '', 'ATENOGENEZ GUERRERO MICAELA', 500, 0, 8796.31, 0, 0, 0, 0, 9296.31, 6507.42, 6507.42, 'Casa Blanca 1', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 316, 'BD Consolidada Ahorradores ', '300010', 1),
(304, '00300011', '', 'BARRAGAN GERALDO HIPOLITO', 500, 11464.94, 0, 0, 0, 0, 0, 11964.94, 8375.46, 8375.46, '6 Sur', 'Marcos Necoxtla', 'Tehuacan', 'S/D', 317, 'BD Consolidada Ahorradores ', '300011', 1),
(305, '00300012', '', 'BARRAGAN RIVERA CELIA CONCEPCION', 500, 10737.08, 0, 0, 0, 0, 0, 11237.08, 7865.96, 7865.96, 'Av Nacional Oriente 111', 'Maria Pinosuarez', 'Tehuacan', 'S/D', 318, 'BD Consolidada Ahorradores ', '300012', 1),
(306, '00300013', '', 'BAUTISTA OLIVARES CATALINA AVERTINA', 500, 52000, 0, 0, 0, 0, 0, 52500, 36750, 36750, 'San Luis Temalacayuca', 'Luis Temalacayuca', 'Tepanco de Lopez', 'S/D', 319, 'BD Consolidada Ahorradores ', '300013', 1),
(307, '00300014', '', 'BOLAÑOS CORTES CLAUDIA', 500, 2879.15, 0, 0, 0, 0, 0, 3379.15, 2365.41, 2365.41, 'Miguel Hidalgo 14', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 320, 'BD Consolidada Ahorradores ', '300014', 1),
(308, '00300015', '', 'BRAVO HERNANDEZ RICARDA', 500, 0, 95000, 0, 0, 0, 0, 95500, 66850, 66850, '25 Oriente 923', 'Nicolas Bravo 3ra Se', 'Tehuacan', 'S/D', 321, 'BD Consolidada Ahorradores ', '300015', 1),
(309, '00300016', '', 'CAMACHO TORRES JUAN FRANCISCO', 500, 0, 70000, 0, 0, 0, 0, 70500, 49350, 49350, 'Prol 4 Sur 2100', 'Industrial', 'Santa Maria Coapan', 'S/D', 322, 'BD Consolidada Ahorradores ', '300016', 1),
(310, '00300017', '', 'CARPINTEYRO DE JESUS HORTENCIA', 500, 0, 11479.4, 0, 0, 0, 0, 11979.4, 8385.58, 8385.58, 'Av 15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 323, 'BD Consolidada Ahorradores ', '300017', 1),
(311, '00300018', '', 'CARRERA JUAREZ IVON', 500, 218.43, 30000, 0, 0, 0, 0, 30718.43, 21502.9, 21502.9, 'Iturbide 124', 'Tepanco de Lopez', 'Tlacotepec', 'S/D', 324, 'BD Consolidada Ahorradores ', '300018', 1),
(312, '00300019', '', 'CASTAÑEDA MENDEZ CATALINA', 500, 3794.79, 0, 0, 0, 0, 0, 4294.79, 3006.35, 3006.35, 'Dalia 4605', 'Antonio Viveros', 'Tehuacan', 'S/D', 325, 'BD Consolidada Ahorradores ', '300019', 1),
(313, '00300020', '', 'CASTAÑEDA VALENCIA GREGORIO', 500, 2134, 38500, 0, 0, 0, 0, 41134, 28793.8, 28793.8, 'Av Hidalgo 45', 'Cuayucatepec', 'Tehuacan', 'S/D', 326, 'BD Consolidada Ahorradores ', '300020', 1),
(314, '00300021', '', 'CASTILLO PEREZ CARLOS', 500, 12249.93, 0, 0, 0, 0, 0, 12749.93, 8924.95, 8924.95, 'Sagrado Corazon de Jesus 7', 'Zentlapatl', 'Zinacatepec', 'S/D', 327, 'BD Consolidada Ahorradores ', '300021', 1),
(315, '00300022', '', 'CECILIO EUSEVIO GENOVEVA', 500, 24777.18, 0, 0, 0, 0, 0, 25277.18, 17694.03, 17694.03, 'Juarez Poniente 138', 'Maria Coapan', 'Tehuacan', 'S/D', 328, 'BD Consolidada Ahorradores ', '300022', 1),
(316, '00300023', '', 'CLEMENTE ROMERO GUADALUPE CARMEN', 500, 0, 11557.5, 0, 0, 0, 0, 12057.5, 8440.25, 8440.25, '7 Oriente 4', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 329, 'BD Consolidada Ahorradores ', '300023', 1),
(317, '00300024', '', 'CONTRERAS PACHECO CATALINA', 500, 0, 100001, 0, 0, 0, 0, 100501, 70350.7, 70350.7, '25 de Febrero 919', 'Observatorio', 'Tepanco de Lopez', '2381272213', 330, 'BD Consolidada Ahorradores ', '300024', 1),
(318, '00300025', '', 'CONTRERAS VAZQUEZ OCOTLAN', 500, 966.51, 29837.17, 0, 0, 0, 0, 31303.68, 21912.58, 21912.58, 'Leon Guzman 334', 'Reforma', 'Tehuacan', 'S/D', 331, 'BD Consolidada Ahorradores ', '300025', 1),
(319, '00300026', '', 'CORTES DOLORES MARCELA RAQUEL', 500, 2268.41, 0, 0, 0, 0, 0, 2768.41, 1937.89, 1937.89, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 332, 'BD Consolidada Ahorradores ', '300026', 1),
(320, '00300027', '', 'CORTEZ PEREZ ALBERTINA', 500, 6497.61, 0, 0, 0, 0, 0, 6997.61, 4898.33, 4898.33, 'Viente Guerrero 155', 'San Lorezno Teopilco', 'Tehuacan', 'S/D', 333, 'BD Consolidada Ahorradores ', '300027', 1),
(321, '00300028', '', 'CORTEZ RAMIREZ ROSA', 500, 6030.52, 0, 0, 0, 0, 0, 6530.52, 4571.36, 4571.36, '7 Poniente 230', 'La Pedrera', 'Tehuacan', 'S/D', 334, 'BD Consolidada Ahorradores ', '300028', 1),
(322, '00300029', '', 'CRUZ DE LA CRUZ JOSE ALFREDO', 500, 5494.6, 0, 0, 0, 0, 0, 5994.6, 4196.22, 4196.22, 'Centenario 500', 'Hidalgo', 'Tehuacan', 'S/D', 335, 'BD Consolidada Ahorradores ', '300029', 1),
(323, '00300030', '', 'CRUZ VILLEGAS ERNESTINA LEONOR', 500, 0, 46000, 0, 0, 0, 0, 46500, 32550, 32550, 'Privada 25 dur 123', 'El Rosario', 'Tehuacan', 'S/D', 336, 'BD Consolidada Ahorradores ', '300030', 1),
(324, '00300031', '', 'DE JESUS MENDOZA GENOVEBA MARGARITA', 500, 0, 99500, 0, 0, 0, 0, 100000, 70000, 70000, '15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 337, 'BD Consolidada Ahorradores ', '300031', 1),
(325, '00300032', '', 'DE LA CRUZ ZUÑIGA EDITH', 0, 23280.54, 0, 0, 0, 0, 0, 23280.54, 16296.38, 16296.38, '17 Sur 703', 'San Sebastian', 'Tecamachalco', 'S/D', 338, 'BD Consolidada Ahorradores ', '300032', 1),
(326, '00300033', '', 'DOMINGUEZ LUCAS ROSALIA', 500, 8980.8, 0, 0, 0, 0, 0, 9480.8, 6636.56, 6636.56, '22 Poniente 2416', 'San Rafael', 'Ahuatempan', '2383922537', 339, 'BD Consolidada Ahorradores ', '300033', 1),
(327, '00300034', '', 'ENRIQUE BRAVO CECILIA', 0, 0, 15500, 0, 0, 0, 0, 15500, 10850, 10850, 'Isabel la catolica 725', 'Morelos', 'Tehuacan', 'S/D', 340, 'BD Consolidada Ahorradores ', '300034', 1),
(328, '00300035', '', 'ESPINOZA PACHECO FRANCISCO CONSTANTINO', 500, 0, 21000, 0, 0, 0, 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 341, 'BD Consolidada Ahorradores ', '300035', 1),
(329, '00300036', '', 'FLORES RODRIGUEZ ELIAS', 0, 0, 179184.99, 0, 0, 0, 0, 179184.99, 125429.49, 125429.49, '11 Norte 113', 'Independencia', 'Tehuacan', 'S/D', 342, 'BD Consolidada Ahorradores ', '300036', 1),
(330, '00300037', '', 'FLORES RODRIGUEZ JAVIER', 0, 0, 600000, 0, 0, 0, 0, 600000, 420000, 167930, '7 Norte 2000', 'Emiliano Zapata', 'Tehuacan', 'S/D', 343, 'BD Consolidada Ahorradores ', '300037', 1),
(331, '00300038', '', 'FLORES VERA PATRICIA', 500, 9096.22, 26660.81, 0, 0, 0, 0, 36257.03, 25379.92, 25379.92, 'Av Zacatecas 4', 'Tlacuitlapan', 'Tlacotepec', 'S/D', 344, 'BD Consolidada Ahorradores ', '300038', 1),
(332, '00300039', '', 'FLORES VERA RUFINA', 0, 34467.4, 0, 0, 0, 0, 0, 34467.4, 24127.18, 24127.18, '6 Sur 3', 'Seccion Tercera', 'Tlacotepec', 'S/D', 345, 'BD Consolidada Ahorradores ', '300039', 1),
(333, '00300040', '', 'FUENTES GONZALEZ ABELINO NICOLAS', 500, 500, 400, 0, 0, 0, 0, 1400, 980, 980, 'Mariano Matamoros 120', 'Centro', 'San Gabriel Chilac', 'S/D', 346, 'BD Consolidada Ahorradores ', '300040', 1),
(334, '00300041', '', 'FUENTES NARVAEZ JULIANA', 500, 1613.51, 0, 0, 0, 0, 0, 2113.51, 1479.46, 1479.46, 'Sonora Sur 1504', 'Mexico Sur', 'Tehuacan', '3921107', 347, 'BD Consolidada Ahorradores ', '300041', 1),
(335, '00300042', '', 'GARCIA CHAVEZ DIANA ASUNCION', 500, 10579.71, 0, 0, 0, 0, 0, 11079.71, 7755.8, 7755.8, 'Priv Las Dalias 8', 'El Eden', 'Tehuacan', '2381027787', 348, 'BD Consolidada Ahorradores ', '300042', 1),
(336, '00300043', '', 'GARCIA CRUZ EUFEMIA', 0, 1620.14, 0, 0, 0, 0, 0, 1620.14, 1134.1, 1134.1, '14 Pte 807 Int A', 'SanRafael', 'Tehuacan', 'S/D', 349, 'BD Consolidada Ahorradores ', '300043', 1),
(337, '00300044', '', 'GARCIA DE LA LUZ XOCHITL', 500, 3007.33, 0, 0, 0, 0, 0, 3507.33, 2455.13, 2455.13, 'Alvaro Obregon 50', 'Centro', 'Coxcatlan', 'S/D', 350, 'BD Consolidada Ahorradores ', '300044', 1),
(338, '00300045', '', 'GARCIA FLORES ANTONINA TEODULA', 0, 25000, 0, 0, 0, 0, 0, 25000, 17500, 17500, '15 Norte 108', 'Obrero Peñafiel', 'Tehuacan', 'S/D', 351, 'BD Consolidada Ahorradores ', '300045', 1),
(339, '00300046', '', 'GARCIA GARCIA CLAUDIA', 500, 8024.18, 2229.68, 0, 0, 0, 0, 10753.86, 7527.7, 7527.7, 'Miguel Hidalgo 2331', 'America', 'Tehuacan', 'S/D', 352, 'BD Consolidada Ahorradores ', '300046', 1),
(340, '00300047', '', 'GARCIA GONZALEZ MARIA ALICIA SOTERA', 500, 50420.38, 0, 0, 0, 0, 0, 50920.38, 35644.27, 35644.27, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 353, 'BD Consolidada Ahorradores ', '300047', 1),
(341, '00300048', '', 'GARCIA HERNANDEZ MARIO', 500, 0, 156557.48, 0, 0, 0, 0, 157057.48, 109940.24, 109940.24, '11 Sur 511', 'La Purisima', 'Tehuacan', 'S/D', 354, 'BD Consolidada Ahorradores ', '300048', 1),
(342, '00300049', '', 'GARCIA MARTINEZ FELICITAS', 500, 0, 5000, 0, 0, 0, 0, 5500, 3850, 3850, '15 Sur 318', 'La Purisima', 'Tehuacan', 'S/D', 355, 'BD Consolidada Ahorradores ', '300049', 1),
(343, '00300050', '', 'GARCIA REYES ELENA', 500, 0, 1867.84, 0, 0, 0, 0, 2367.84, 1657.49, 1657.49, '26 Sur 2526', '3 de Mayo', 'Tehuacan', 'S/D', 356, 'BD Consolidada Ahorradores ', '300050', 1),
(344, '00300051', '', 'GARCIA REYES ZEFERINO', 500, 0, 7315, 0, 0, 0, 0, 7815, 5470.5, 5470.5, '3A priv De la 26 sur 2604', '3 de Mayo', 'Tehuacan', 'S/D', 357, 'BD Consolidada Ahorradores ', '300051', 1),
(345, '00300052', '', 'GARCIA RODRIGUEZ IGNACIO FRANCISCO', 500, 0, 61000, 0, 0, 0, 0, 61500, 43050, 43050, 'Oriente', 'Lomas de Romero', 'Tecamachalco', 'S/D', 358, 'BD Consolidada Ahorradores ', '300052', 1),
(346, '00300053', '', 'GARCIA SORCIA ENRIQUETA', 500, 0, 17132.71, 0, 0, 0, 0, 17632.71, 12342.9, 12342.9, 'Alvaro Obregon 817', 'Francisco Sarabia', 'Tehuacan', 'S/D', 359, 'BD Consolidada Ahorradores ', '300053', 1),
(347, '00300054', '', 'GIL ALVARADO MERCEDES', 500, 7424.63, 10000, 0, 0, 0, 0, 17924.63, 12547.24, 12547.24, 'Adolfo Lopez Mateos 804', '16 de Marzo', 'Tehuacan', 'S/D', 360, 'BD Consolidada Ahorradores ', '300054', 1),
(348, '00300055', '', 'GOMEZ RODRIGUEZ SERGIO', 0, 0, 50001, 0, 0, 0, 0, 50001, 35000.7, 35000.7, '23 Sur 2314', 'Granjas de Oriente', 'Tehuacan', 'S/D', 361, 'BD Consolidada Ahorradores ', '300055', 1),
(349, '00300056', '', 'GONZALES MORALES MOISES LUIS', 500, 0, 15000, 0, 0, 0, 0, 15500, 10850, 10850, 'Allende Poniente 104', 'Maria Coapan', 'Tehuacan', 'S/D', 362, 'BD Consolidada Ahorradores ', '300056', 1),
(350, '00300057', '', 'GONZALEZ BAUTISTA FRANCISCO', 500, 10962.28, 0, 0, 0, 0, 0, 11462.28, 8023.6, 8023.6, 'Priv 2 sur 5', 'Nativitas Cuautempan', 'Coyotepec', 'S/D', 363, 'BD Consolidada Ahorradores ', '300057', 1),
(351, '00300058', '', 'GONZALEZ VAZQUEZ MARIA YOLANDA', 500, 0, 86592.13, 0, 0, 0, 0, 87092.13, 60964.49, 60964.49, '3 Oriente 506 Int 6', 'Centro', 'Tehuacan', 'S/D', 364, 'BD Consolidada Ahorradores ', '300058', 1),
(352, '00300059', '', 'GUZMAN MENDEZ FLOR DE MARIA', 500, 21106.66, 0, 0, 0, 0, 0, 21606.66, 15124.66, 15124.66, 'San Luis Potosi 4', 'Tlacotepec', 'Tlacotepec', 'S/D', 365, 'BD Consolidada Ahorradores ', '300059', 1),
(353, '00300060', '', 'HERNANDEZ ANGEL LETICIA', 500, 5000, 0, 0, 0, 0, 0, 5500, 3850, 3850, 'Guerrero 700', 'Francisco I Madero', 'Chapulco', 'S/D', 366, 'BD Consolidada Ahorradores ', '300060', 1),
(354, '00300061', '', 'HERNANDEZ CRUZ JUAN', 0, 0, 1345000, 0, 0, 0, 0, 1345000, 941500, 167930, 'Lerdo de Tejada 3', 'Tilapa', 'Coxcatlan', 'S/D', 367, 'BD Consolidada Ahorradores ', '300061', 1),
(355, '00300062', '', 'HERNANDEZ GARCI CATALINA', 500, 13402.91, 0, 0, 0, 0, 0, 13902.91, 9732.04, 9732.04, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 368, 'BD Consolidada Ahorradores ', '300062', 1),
(356, '00300063', '', 'HERNANDEZ MARISCAL GLORIA', 500, 2584.99, 0, 0, 0, 0, 0, 3084.99, 2159.49, 2159.49, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 369, 'BD Consolidada Ahorradores ', '300063', 1),
(357, '00300064', '', 'HERNANDEZ MARISCAL GUADALUPE', 500, 0, 24173.06, 0, 0, 0, 0, 24673.06, 17271.14, 17271.14, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 370, 'BD Consolidada Ahorradores ', '300064', 1),
(358, '00300065', '', 'HERNANDEZ MARISCAL JUAN MANUEL', 500, 632.63, 2435.69, 0, 0, 0, 0, 3568.32, 2497.82, 2497.82, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 371, 'BD Consolidada Ahorradores ', '300065', 1),
(359, '00300066', '', 'IBAÑEZ DURAN RUPERTO', 500, 17700, 0, 0, 0, 0, 0, 18200, 12740, 12740, 'Conocido ', 'Catarina Otzolotepec', 'Tehuacan', 'S/D', 372, 'BD Consolidada Ahorradores ', '300066', 1),
(360, '00300067', '', 'INIESTRA HERRERA AMELIA', 500, 0, 60000, 0, 0, 0, 0, 60500, 42350, 42350, '16 Poniente 2809', 'San Rafael', 'Tehuacan', '3922425', 373, 'BD Consolidada Ahorradores ', '300067', 1),
(361, '00300068', '', 'JIMENEZ HUERTA NORBERTA', 500, 7835.87, 0, 0, 0, 0, 0, 8335.87, 5835.11, 5835.11, 'Venustiano Carranza no 1316', 'Libertad', 'Tehuacan', 'S/D', 374, 'BD Consolidada Ahorradores ', '300068', 1),
(362, '00300069', '', 'JIMENEZ PEREZ MELITON', 500, 41054.1, 0, 0, 0, 0, 0, 41554.1, 29087.87, 29087.87, '15 de Mayo 52', 'San Isidro', 'Santiago Miahuatlan', 'S/D', 375, 'BD Consolidada Ahorradores ', '300069', 1),
(363, '00300070', '', 'JUAREZ MARTINEZ ROSA MARIA', 500, 50264.83, 0, 0, 0, 0, 0, 50764.83, 35535.38, 35535.38, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 376, 'BD Consolidada Ahorradores ', '300070', 1),
(364, '00300071', '', 'LEINES ANDRADE CRISTINA', 0, 5840.36, 24735.9, 0, 0, 0, 0, 30576.26, 21403.38, 21403.38, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 377, 'BD Consolidada Ahorradores ', '300071', 1),
(365, '00300072', '', 'LEYNES HERNANDEZ FRANCISCA', 0, 0, 6922.72, 0, 0, 0, 0, 6922.72, 4845.9, 4845.9, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 378, 'BD Consolidada Ahorradores ', '300072', 1),
(366, '00300073', '', 'LEYVA ROMERO RUTILD ANGELES', 500, 0, 30000, 0, 0, 0, 0, 30500, 21350, 21350, 'Av Guerrero 806 Int 7', 'Centro', 'Zinacatepec', 'S/D', 379, 'BD Consolidada Ahorradores ', '300073', 1),
(367, '00300074', '', 'LOPEZ GIL MARIO MIGUEL', 0, 0, 750000, 0, 0, 0, 0, 750000, 525000, 167930, 'Centenario 902', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 380, 'BD Consolidada Ahorradores ', '300074', 1),
(368, '00300075', '', 'LOPEZ LOPEZ GENARO', 500, 10543.42, 0, 0, 0, 0, 0, 11043.42, 7730.39, 7730.39, 'La paz 1913', 'La Paz', 'S/D', 'S/D', 381, 'BD Consolidada Ahorradores ', '300075', 1),
(369, '00300076', '', 'LOPEZ MENDEZ GUADALUPE', 500, 14346.14, 0, 0, 0, 0, 0, 14846.14, 10392.3, 10392.3, '4 Poniente 1614 Int 4A', 'Aquiles Serdan', 'Tehuacan', 'S/D', 382, 'BD Consolidada Ahorradores ', '300076', 1),
(370, '00300077', '', 'LOPEZ VALERIO DOLORES AUREA TERESA', 500, 13958.05, 10000, 0, 0, 0, 0, 24458.05, 17120.64, 17120.64, '8 Oriente 1307', 'Paseo de San Pedro', 'Tehuacan', 'S/D', 383, 'BD Consolidada Ahorradores ', '300077', 1),
(371, '00300078', '', 'LOPEZ VALERIO SOCORRO AIDA', 500, 0, 15369.57, 0, 0, 0, 0, 15869.57, 11108.7, 11108.7, '4 Poniente 415', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 384, 'BD Consolidada Ahorradores ', '300078', 1),
(372, '00300079', '', 'LORENZINI JUAREZ MARIA TERESA', 0, 0, 165000, 0, 0, 0, 0, 165000, 115500, 115500, 'Vicente Guerrero y 33 Sur', 'San Sebastian', 'Tecamachalco', 'S/D', 385, 'BD Consolidada Ahorradores ', '300079', 1),
(373, '00300080', '', 'LOZANO TRUJILLO SABINA', 500, 7681.71, 0, 0, 0, 0, 0, 8181.71, 5727.2, 5727.2, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 386, 'BD Consolidada Ahorradores ', '300080', 1),
(374, '00300081', '', 'MARIA RODRIGUEZ ROSA', 500, 0, 9831, 0, 0, 0, 0, 10331, 7231.7, 7231.7, '2 Oriente 928', 'Moctezuma', 'Tehuacan', 'S/D', 387, 'BD Consolidada Ahorradores ', '300081', 1),
(375, '00300082', '', 'MARIN MORENO MAXIMINO', 500, 2000, 0, 0, 0, 0, 0, 2500, 1750, 1750, 'Ignacio Allende LT 54', 'Aviacion', 'Tehuacan', 'S/D', 388, 'BD Consolidada Ahorradores ', '300082', 1),
(376, '00300083', '', 'MARISCAL SANDOVAL ANTONIA', 500, 2191.68, 0, 0, 0, 0, 0, 2691.68, 1884.18, 1884.18, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 389, 'BD Consolidada Ahorradores ', '300083', 1),
(377, '00300084', '', 'MARTINEZ ALTA GERMAN', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Zoquitlan s/n', 'Seccion I Xicala', 'Zoquitlan', 'S/D', 390, 'BD Consolidada Ahorradores ', '300084', 1),
(378, '00300085', '', 'MARTINEZ ANTONIO JUAN', 500, 13359.27, 0, 0, 0, 0, 0, 13859.27, 9701.49, 9701.49, '24 de Diciembre 26', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 391, 'BD Consolidada Ahorradores ', '300085', 1),
(379, '00300086', '', 'MARTINEZ CORTEZ HERMELINDA', 0, 727.58, 39841.36, 0, 0, 0, 0, 40568.94, 28398.26, 28398.26, 'Buena Vista 2', 'El Progreso', 'Tehuacan', 'S/D', 392, 'BD Consolidada Ahorradores ', '300086', 1),
(380, '00300087', '', 'MARTINEZ ESPIDIO LETICIA', 500, 8873.25, 84000, 0, 0, 0, 0, 93373.25, 65361.28, 65361.28, 'Independencia 5', 'Cristobal Tepeteopan', 'Tehuacan', 'S/D', 393, 'BD Consolidada Ahorradores ', '300087', 1),
(381, '00300088', '', 'MARTINEZ LOPEZ UBALDA LETICIA', 500, 0, 591078.09, 0, 0, 0, 0, 591578.09, 414104.66, 167930, '13 Oriente 334', 'Nicolas Bravo', 'Tehuacan', 'S/D', 394, 'BD Consolidada Ahorradores ', '300088', 1),
(382, '00300089', '', 'MARTINEZ NUÑEZ ANTONIETA', 500, 9967.31, 0, 0, 0, 0, 0, 10467.31, 7327.12, 7327.12, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 395, 'BD Consolidada Ahorradores ', '300089', 1),
(383, '00300090', '', 'MARTINEZ RIVERA PAULINA INOCENCIA', 0, 0, 224000, 0, 0, 0, 0, 224000, 156800, 156800, 'Av Nacional 69', 'Olleras Bustamante', 'Tehuacan', 'S/D', 396, 'BD Consolidada Ahorradores ', '300090', 1),
(384, '00300091', '', 'MENDEZ CATALINA', 0, 0, 5000, 0, 0, 0, 0, 5000, 3500, 3500, 'Insurgentes 3406', 'La Soledad', 'Tehuacan', 'S/D', 397, 'BD Consolidada Ahorradores ', '300091', 1),
(385, '00300092', '', 'MENDOZA CRUZ ELIZABETH', 500, 3450.16, 96140.48, 0, 0, 0, 0, 100090.64, 70063.45, 70063.45, 'Miguel Hidalgo', 'Guadalupe', 'Zapotitlan', 'S/D', 398, 'BD Consolidada Ahorradores ', '300092', 1),
(386, '00300093', '', 'MERINO MERINO SUSANA', 500, 18000, 0, 0, 0, 0, 0, 18500, 12950, 12950, '19 sur 709', 'La Purisima', 'Tehuacan', 'S/D', 399, 'BD Consolidada Ahorradores ', '300093', 1),
(387, '00300094', '', 'MEXICANO ORTIZ ESPERANZA', 500, 275.78, 17190.93, 0, 0, 0, 0, 17966.71, 12576.7, 12576.7, 'Republica de Nicaragua 803', 'America', 'Tehuacan', 'S/D', 400, 'BD Consolidada Ahorradores ', '300094', 1),
(388, '00300095', '', 'MIRAMON OLMOS MARTHA', 0, 0, 12396.07, 0, 0, 0, 0, 12396.07, 8677.25, 8677.25, 'Morelos sn', 'San Jose Miahuatlan', 'San Jose Miahuatlan', 'S/D', 401, 'BD Consolidada Ahorradores ', '300095', 1),
(389, '00300096', '', 'MIRAMON SEBASTIAN JUAN', 0, 0, 2997.71, 0, 0, 0, 0, 2997.71, 2098.4, 2098.4, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 402, 'BD Consolidada Ahorradores ', '300096', 1),
(390, '00300097', '', 'MONTALVO ROQUE CIRILA', 500, 0, 192820.55, 0, 0, 0, 0, 193320.55, 135324.39, 135324.39, '11 Oriente 1117', 'La Purisima', 'Tehuacan', 'S/D', 403, 'BD Consolidada Ahorradores ', '300097', 1),
(391, '00300098', '', 'MONTAÑO HUERTA SILDIA HAYDEE', 500, 3507.39, 0, 0, 0, 0, 0, 4007.39, 2805.17, 2805.17, 'Fresno 2316 A', 'Rancho Grande', 'Tehuacan', 'S/D', 404, 'BD Consolidada Ahorradores ', '300098', 1),
(392, '00300099', '', 'MORALES VAZQUEZ FRANCISCO', 500, 14550, 0, 0, 0, 0, 0, 15050, 10535, 10535, 'San Agustin 106-7', 'Maria Coapan', 'Tehuacan', 'S/D', 405, 'BD Consolidada Ahorradores ', '300099', 1),
(393, '00300100', '', 'MORAN CORTES CECILIA MICAELA', 0, 0, 40501.6, 0, 0, 0, 0, 40501.6, 28351.12, 28351.12, '25 Norte 203', 'El Rosario', 'Tehuacan', 'S/D', 406, 'BD Consolidada Ahorradores ', '300100', 1),
(394, '00300101', '', 'MORENO MORALES ABRAHAM', 0, 0, 250000, 0, 0, 0, 0, 250000, 175000, 167930, 'Granada LT 124', 'Los Olivos', 'Tehuacan', 'S/D', 407, 'BD Consolidada Ahorradores ', '300101', 1),
(395, '00300102', '', 'MORENO MORALES JOSUE', 0, 135166.89, 750000, 0, 0, 0, 0, 885166.89, 619616.82, 167930, '2 Sur 128', 'Centro', 'Tehuacan', 'S/D', 408, 'BD Consolidada Ahorradores ', '300102', 1),
(396, '00300103', '', 'MOSQUEDA MARTINEZ MARIA ISABEL', 0, 0, 27500, 0, 0, 0, 0, 27500, 19250, 19250, '2da Privada de Ahuehuetes 49', 'Ahuehuetes', 'Gustavo AMadero', 'S/D', 409, 'BD Consolidada Ahorradores ', '300103', 1),
(397, '00300104', '', 'OLMOS CAMPOS ANDREA', 0, 0, 9000, 0, 0, 0, 0, 9000, 6300, 6300, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 410, 'BD Consolidada Ahorradores ', '300104', 1),
(398, '00300105', '', 'OROZCO GARCIA JOSE', 500, 1408.36, 5000, 0, 0, 0, 0, 6908.36, 4835.85, 4835.85, 'Privada de Chalma 4-12', 'San Diego Chalma', 'Tehuacan', 'S/D', 411, 'BD Consolidada Ahorradores ', '300105', 1),
(399, '00300106', '', 'ORTIZ MENDEZ ALVARO', 0, 101196.72, 0, 0, 0, 0, 0, 101196.72, 70837.7, 70837.7, '31 norte ', 'San Sebastian', 'Tecamachalco', 'S/D', 412, 'BD Consolidada Ahorradores ', '300106', 1),
(400, '00300107', '', 'OSORIO REYES AMALIA', 500, 0, 15558.84, 0, 0, 0, 0, 16058.84, 11241.19, 11241.19, 'Av Libertad 11', 'Bartolo Teontepec', 'Tepanco de Lopez', 'S/D', 413, 'BD Consolidada Ahorradores ', '300107', 1),
(401, '00300108', '', 'PACHECO RODRIGUEZ TOMAS', 500, 61.14, 1750.5, 0, 0, 0, 0, 2311.64, 1618.15, 1618.15, 'Sedesol lt 7', 'Dr Miguel Romero', 'Teotihuacan', 'S/D', 414, 'BD Consolidada Ahorradores ', '300108', 1),
(402, '00300109', '', 'PAQUE PEREZ ALFREDO', 0, 21269.23, 0, 0, 0, 0, 0, 21269.23, 14888.46, 14888.46, '23 Sur 152', 'La Concepcion', 'Tehuacan', 'S/D', 415, 'BD Consolidada Ahorradores ', '300109', 1),
(403, '00300110', '', 'PEREDA HERNANDEZ BONIFACIO', 500, 0, 0, 0, 0, 0, 0, 500, 350, 350, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 416, 'BD Consolidada Ahorradores ', '300110', 1),
(404, '00300111', '', 'PEREZ BAUTISTA ERNESTINA', 500, 0, 21000, 0, 0, 0, 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 417, 'BD Consolidada Ahorradores ', '300111', 1),
(405, '00300112', '', 'PEREZ JIMENEZ MARGARITO BALENTIN', 500, 17082.06, 0, 0, 0, 0, 0, 17582.06, 12307.44, 12307.44, '4 Poniente 68', 'Santa Mariala Alta', 'Tlacotepec', 'S/D', 418, 'BD Consolidada Ahorradores ', '300112', 1),
(406, '00300113', '', 'PIEDRA GONZALEZ NORMA', 500, 0, 8000, 0, 0, 0, 0, 8500, 5950, 5950, 'Allende Oriente 126', 'Maria Coapan', 'Tehuacan', 'S/D', 419, 'BD Consolidada Ahorradores ', '300113', 1),
(407, '00300114', '', 'PORRAS CHAVEZ SERVANDO PEDRO LAZARO', 500, 46744.92, 1200000, 0, 0, 0, 0, 1247244.92, 873071.44, 167930, 'Carmen Serdan 106', 'Centro', 'Tehuacan', '23821957', 420, 'BD Consolidada Ahorradores ', '300114', 1),
(408, '00300115', '', 'QUIÑONES HERNANDEZ EFREN', 0, 25.19, 0, 0, 0, 0, 0, 25.19, 17.63, 17.63, 'San Bernardino Lagunas', 'Bernardino Lagunas', 'Vicente Guerrero', 'S/D', 421, 'BD Consolidada Ahorradores ', '300115', 1),
(409, '00300116', '', 'RAMIREZ SANCHEZ MARCELA', 1000, 7545.58, 0, 0, 0, 0, 0, 8545.58, 5981.91, 5981.91, '6 Poniente 602 A', 'Constituyentes', 'Tehuacan', 'S/D', 422, 'BD Consolidada Ahorradores ', '300116', 1),
(410, '00300117', '', 'REYES JIMENEZ MARICELA', 500, 2019.45, 0, 0, 0, 0, 0, 2519.45, 1763.62, 1763.62, '17 poniente 2007', 'El Riego', 'Tehuacan', 'S/D', 423, 'BD Consolidada Ahorradores ', '300117', 1),
(411, '00300118', '', 'REYES MERINO EDITH', 500, 5112.9, 15000, 0, 0, 0, 0, 20612.9, 14429.03, 14429.03, '5 de Mayo', 'Jose Buena Vista', 'Ajalpan', 'S/D', 424, 'BD Consolidada Ahorradores ', '300118', 1),
(412, '00300119', '', 'RIOS DIAZ PASCUALA', 0, 11072.31, 0, 0, 0, 0, 0, 11072.31, 7750.62, 7750.62, 'Benito Juarez 405', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 425, 'BD Consolidada Ahorradores ', '300119', 1),
(413, '00300120', '', 'ROJAS CHAVEZ PRAXEDES', 500, 0, 10000, 0, 0, 0, 0, 10500, 7350, 7350, 'Guadalupe Victoria 1425', 'El Riego', 'Tehuacan', 'S/D', 426, 'BD Consolidada Ahorradores ', '300120', 1),
(414, '00300121', '', 'ROSALES ROJAS IGNACIA', 500, 26230.67, 0, 0, 0, 0, 0, 26730.67, 18711.47, 18711.47, '17 Oriente 1123 B', 'Los Pinos', 'Zoquitlan', 'S/D', 427, 'BD Consolidada Ahorradores ', '300121', 1),
(415, '00300122', '', 'SALVADOR FLORES SERAPIO', 500, 0, 8000, 0, 0, 0, 0, 8500, 5950, 5950, 'Av Nacional', 'El Molino', 'Chapulco', 'S/D', 428, 'BD Consolidada Ahorradores ', '300122', 1),
(416, '00300123', '', 'SANCHEZ ADAME GREGORIO', 500, 0, 8000, 0, 0, 0, 0, 8500, 5950, 5950, 'Juan Diego Lote 41', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 429, 'BD Consolidada Ahorradores ', '300123', 1),
(417, '00300124', '', 'SANCHEZ ELEJO LAURANEO', 0, 0, 174000, 0, 0, 0, 0, 174000, 121800, 121800, 'Conocido', 'Tlaxitla', 'Ajalpan', 'S/D', 430, 'BD Consolidada Ahorradores ', '300124', 1),
(418, '00300125', '', 'SANCHEZ GARCIA ARMANDO', 500, 5399.87, 0, 0, 0, 0, 0, 5899.87, 4129.91, 4129.91, '12 Sur 2128', '16 de Marzo', 'Tehuacan', 'S/D', 431, 'BD Consolidada Ahorradores ', '300125', 1),
(419, '00300126', '', 'SORIANO FIGUEROA SILVINO LEONCIO', 500, 21300, 0, 0, 0, 0, 0, 21800, 15260, 15260, '21 Oriente 919', 'Nias Bravo', 'Tehuacan', 'S/D', 432, 'BD Consolidada Ahorradores ', '300126', 1),
(420, '00300127', '', 'TEHUACANERO JIMENEZ JOSEFINA MARTHA', 500, 10125.47, 0, 0, 0, 0, 0, 10625.47, 7437.83, 7437.83, 'Boulevard Ing Pastor Rouaix 713', 'Hidalgo', 'Tehuacan', 'S/D', 433, 'BD Consolidada Ahorradores ', '300127', 1),
(421, '00300128', '', 'TEHUINTLE CALIHUA EUSEBIO', 500, 11590.84, 15900, 0, 0, 0, 0, 27990.84, 19593.59, 19593.59, 'Coxcatepachapa', 'Coxcatepachapa', 'Vicente Guerrero', 'S/D', 434, 'BD Consolidada Ahorradores ', '300128', 1),
(422, '00300129', '', 'TENORIO HERNANDEZ MARTHA AMELIA', 500, 5678.99, 54000, 0, 0, 0, 0, 60178.99, 42125.29, 42125.29, 'Alamo 716', 'Morelos', 'Tehuacan', 'S/D', 435, 'BD Consolidada Ahorradores ', '300129', 1),
(423, '00300130', '', 'TOMAS VENTURA DOLORES GUADALUPE', 500, 12772.27, 0, 0, 0, 0, 0, 13272.27, 9290.59, 9290.59, 'Alvarez 700', 'Centro', 'Zinacatepec', 'S/D', 436, 'BD Consolidada Ahorradores ', '300130', 1),
(424, '00300131', '', 'VAZQUEZ MARTINEZ FRANCISCO JAVIER', 500, 4771.91, 0, 0, 0, 0, 0, 5271.91, 3690.34, 3690.34, '26 Oriente 300', 'Lomas de la Soledad', 'Tehuacan', 'S/D', 437, 'BD Consolidada Ahorradores ', '300131', 1),
(425, '00300132', '', 'VEGA HERNANDEZ RUFINO', 500, 4198.6, 0, 0, 0, 0, 0, 4698.6, 3289.02, 3289.02, 'Jose Maria Morelos 5408', 'San Angel', 'Tehuacan', 'S/D', 438, 'BD Consolidada Ahorradores ', '300132', 1),
(426, '00300133', '', 'VELEZ GONZALEZ ISABEL PATRICIA', 500, 13434.17, 80000, 0, 0, 0, 0, 93934.17, 65753.92, 65753.92, 'Sedesol 16', 'Mig Romero Sanchez', 'Tehuacan', 'S/D', 439, 'BD Consolidada Ahorradores ', '300133', 1),
(427, '00300134', '', 'VIVEROS JUAREZ CLETO JOEL', 500, 1000, 20387.03, 0, 0, 0, 0, 21887.03, 15320.92, 15320.92, 'Colombia 308 A', 'El Riego', 'Tehuacan', 'S/D', 440, 'BD Consolidada Ahorradores ', '300134', 1),
(428, '427', '', 'TOTAL', 16498771.66, 8816877.93, 60511763.9, 0, 0, 0, 0, 85827413.49, 60079189.55, 22539554.41, '', '', '', '', 441, 'BD Consolidada Ahorradores ', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consolidadasTemporales`
--

CREATE TABLE `consolidadasTemporales` (
  `idconsolidadasTemporales` int(11) NOT NULL,
  `revisionesTemporales_idrevisionesTemporales` int(11) NOT NULL,
  `nuevoFolioIdentificador` char(11) DEFAULT NULL,
  `folioIdentificadorAnterior` char(11) DEFAULT NULL,
  `nombreAhorrador` text,
  `curp` varchar(45) DEFAULT NULL,
  `parteSocial` double DEFAULT NULL,
  `cuentasAhorro` double DEFAULT NULL,
  `cuentasInversion` double DEFAULT NULL,
  `depositosGarantia` double DEFAULT NULL,
  `chequesNoCobrados` double DEFAULT NULL,
  `otrosDepositos` double DEFAULT NULL,
  `prestamosACargo` double DEFAULT NULL,
  `saldoNeto100` double DEFAULT NULL,
  `saldoNeto70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `calleYNumero` text,
  `colonia` text,
  `delegacionMunicipio` text,
  `telefono` text,
  `filaDocumentoOriginal` int(45) NOT NULL,
  `hojaDocumentoOriginal` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consolidadasTemporales`
--

INSERT INTO `consolidadasTemporales` (`idconsolidadasTemporales`, `revisionesTemporales_idrevisionesTemporales`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `curp`, `parteSocial`, `cuentasAhorro`, `cuentasInversion`, `depositosGarantia`, `chequesNoCobrados`, `otrosDepositos`, `prestamosACargo`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `colonia`, `delegacionMunicipio`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(1, 1, '00100001', '', 'ADAUTA CAMACHO SERGIO', '100001', 0, 146000, 0, 0, 0, 0, 0, 146000, 102200, 102200, 'S/D', 'S/D', 'S/D', 'S/D', 14, 'BD Consolidada Ahorradores '),
(2, 1, '00100002', '', 'ALVAREZ AGUILAR FRANCISCO', '100002', 0, 0, 19600, 0, 0, 0, 0, 19600, 13720, 13720, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 15, 'BD Consolidada Ahorradores '),
(3, 1, '00100003', '', 'ARROLLO SUAREZ GUADALUPE', '100003', 0, 100, 10001, 0, 0, 0, 0, 10101, 7070.7, 7070.7, 'Reforma num7', 'Allende', 'Cuyoaco', 'S/D', 16, 'BD Consolidada Ahorradores '),
(4, 1, '00100004', '', 'BAEZ ESPINOSA FERNANDO', '100004', 300, 0, 53000, 0, 0, 0, 0, 53300, 37310, 37310, 'Emilio Carranza num 24', 'Grajales', 'Rafael Lara Grajales', 'S/D', 17, 'BD Consolidada Ahorradores '),
(5, 1, '00100005', '', 'BAEZ HERNANDEZ GUILLERMINA', '100005', 0, 8639.38, 0, 0, 0, 0, 0, 8639.38, 6047.57, 6047.57, '7 Norte num 42', 'Centro', 'Rafael Lara Grajales', 'S/D', 18, 'BD Consolidada Ahorradores '),
(6, 1, '00100006', '', 'BAEZ HERNANDEZ NORMA LIDIA', '100006', 0, 152627.67, 0, 0, 0, 0, 0, 152627.67, 106839.37, 106839.37, 'Av Emiliano Carranza num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 19, 'BD Consolidada Ahorradores '),
(7, 1, '00100007', '', 'BAEZ REYES MARIA LUISA GUADALUPE', '100007', 0, 93203.01, 0, 0, 0, 0, 0, 93203.01, 65242.11, 65242.11, '10 Sur num 1502', 'Centro', 'San Jose Chiapa', 'S/D', 20, 'BD Consolidada Ahorradores '),
(8, 1, '00100008', '', 'BARRALEZ GONZALEZ MARGARITA', '100008', 0, 7939.11, 0, 0, 0, 0, 0, 7939.11, 5557.38, 5557.38, 'Av Ignacio Zaragoza num 18', 'Cruz del Bosque', 'Nopalucan', 'S/D', 21, 'BD Consolidada Ahorradores '),
(9, 1, '00100009', '', 'BARRANCO LOPEZ MARTIN', '100009', 0, 400001, 0, 0, 0, 0, 0, 400001, 280000.7, 167930, 'S/D', 'S/D', 'S/D', 'S/D', 22, 'BD Consolidada Ahorradores '),
(10, 1, '00100010', '', 'BECERRIL VILCHIS HILDA', '100010', 300, 10863.43, 0, 0, 0, 0, 0, 11163.43, 7814.4, 7814.4, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 23, 'BD Consolidada Ahorradores '),
(11, 1, '00100011', '', 'BRAVO LOPEZ ARNULFO', '100011', 300, 50599, 0, 0, 0, 0, 0, 50899, 35629.3, 35629.3, 'Guanajuato num 6', 'Centro', 'Rafael Lara Grajales', 'S/D', 24, 'BD Consolidada Ahorradores '),
(12, 1, '00100012', '', 'CABALLERO RODRIGUEZ MINERVA', '100012', 300, 40000, 1545.89, 0, 0, 0, 0, 41845.89, 29292.12, 29292.12, '2 de abril num385', 'Barrio de Tetela', 'Libres', '2764731536', 25, 'BD Consolidada Ahorradores '),
(13, 1, '00100013', '', 'CABRERA MUÑOZ JUAN GUSTAVO', '100013', 0, 0, 860000, 0, 0, 0, 0, 860000, 602000, 167930, '16 de Septiembre no 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 26, 'BD Consolidada Ahorradores '),
(14, 1, '00100014', '', 'CANDELARIO LOPEZ CLAUDIA', '100014', 0, 18927.71, 0, 0, 0, 0, 0, 18927.71, 13249.4, 13249.4, '11 Poniente num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 27, 'BD Consolidada Ahorradores '),
(15, 1, '00100015', '', 'CARREON SANCHEZ LEONEL', '100015', 0, 0, 221558.42, 0, 0, 0, 0, 221558.42, 155090.89, 155090.89, '3 Poniente num 13', 'Centro', 'Rafael Lara Grajales', 'S/D', 28, 'BD Consolidada Ahorradores '),
(16, 1, '00100016', '', 'CASTILLO CERON JOSE ANDRES', '100016', 0, 16705, 0, 0, 0, 0, 0, 16705, 11693.5, 11693.5, '6 Poniente num 8', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 29, 'BD Consolidada Ahorradores '),
(17, 1, '00100017', '', 'CASTILLO ROMERO JOSE GERONIMO AURELIO', '100017', 300, 60405.29, 0, 0, 0, 0, 0, 60705.29, 42493.7, 42493.7, 'Hermanos Serdan num 305', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 30, 'BD Consolidada Ahorradores '),
(18, 1, '00100018', '', 'CASTILLO SANCHEZ MARICELA AURORA', '100018', 0, 61984.31, 0, 0, 0, 0, 0, 61984.31, 43389.02, 43389.02, '7 Oriente num 2', 'Grajales', 'Rafael Lara Grajales', 'S/D', 31, 'BD Consolidada Ahorradores '),
(19, 1, '00100019', '', 'CAYETANO PAULINO ENEDINA', '100019', 600, 29428, 0, 0, 0, 0, 0, 30028, 21019.6, 21019.6, 'Del Monte s/n', 'Benito Juarez', 'Soltepec', 'S/D', 32, 'BD Consolidada Ahorradores '),
(20, 1, '00100020', '', 'CERVANTES MONTES JUAN', '100020', 300, 3813.5, 0, 0, 0, 0, 0, 4113.5, 2879.45, 2879.45, '5 Sur num 3', 'Centro', 'Rafael Lara Grajales', 'S/D', 33, 'BD Consolidada Ahorradores '),
(21, 1, '00100021', '', 'CRUZ DE LOS ANGELES MA GUADALUPE', '100021', 0, 12551.93, 0, 0, 0, 0, 0, 12551.93, 8786.35, 8786.35, 'Juan Sarabia num 7', 'Obrera', 'Rafael Lara Grajales', '4741025', 34, 'BD Consolidada Ahorradores '),
(22, 1, '00100022', '', 'CRUZ DOMINGUEZ MICAELA', '100022', 300, 100, 49600, 0, 0, 0, 0, 50000, 35000, 35000, '4 Sur num6', 'Allende', 'Cuyoaco', 'S/D', 35, 'BD Consolidada Ahorradores '),
(23, 1, '00100023', '', 'CRUZ TORRES CELSO VICTOR', '100023', 0, 46321.96, 0, 0, 0, 0, 0, 46321.96, 32425.37, 32425.37, 'Priv Los Naranjos num 18', 'San Miguel', 'Amozoc de Mota', 'S/D', 36, 'BD Consolidada Ahorradores '),
(24, 1, '00100024', '', 'CUELLAR MUÑOZ MARIA GUADALUPE', '100024', 0, 47333.93, 0, 0, 0, 0, 0, 47333.93, 33133.75, 33133.75, 'Av Progreso num 10', 'Centro', 'Rafael Lara Grajales', 'S/D', 37, 'BD Consolidada Ahorradores '),
(25, 1, '00100025', '', 'DE LA CRUZ HERNANDEZ JUANA', '100025', 0, 0, 73365, 0, 0, 0, 0, 73365, 51355.5, 51355.5, '2 Norte num 38', 'Centro', 'Rafael Lara Grajales', 'S/D', 38, 'BD Consolidada Ahorradores '),
(26, 1, '00100026', '', 'DEL CARMEN LOPEZ GUADALUPE', '100026', 0, 154762.67, 0, 0, 0, 0, 0, 154762.67, 108333.87, 108333.87, 'Salto del agua num 37', 'Salto del Agua', 'Rafael Lara Grajales', 'S/D', 39, 'BD Consolidada Ahorradores '),
(27, 1, '00100027', '', 'DIAZ BAUTISTA VICTORIA', '100027', 0, 7482, 0, 0, 0, 0, 0, 7482, 5237.4, 5237.4, '8 Oriente num 28', 'Barrio San Juan', 'Acajete', 'S/D', 40, 'BD Consolidada Ahorradores '),
(28, 1, '00100028', '', 'DIAZ HERNANDEZ MARCELINA', '100028', 0, 29500, 0, 0, 0, 0, 0, 29500, 20650, 20650, 'Camino a Obregon num 7', 'La Ermita', 'Soltepec', 'S/D', 41, 'BD Consolidada Ahorradores '),
(29, 1, '00100029', '', 'DIAZ VAZQUEZ MIGUEL', '100029', 0, 16096.61, 277.96, 0, 0, 0, 0, 16374.57, 11462.2, 11462.2, 'Principal 1', 'La Cañada', 'Libres', 'S/D', 42, 'BD Consolidada Ahorradores '),
(30, 1, '00100030', '', 'DURAN HERNANDEZ FABIOLA', '100030', 0, 213619.84, 0, 0, 0, 0, 0, 213619.84, 149533.89, 149533.89, '4 Norte s/n', 'Centro', 'San Jose Chiapa', 'S/D', 43, 'BD Consolidada Ahorradores '),
(31, 1, '00100031', '', 'DURAN LOPEZ ERASMO', '100031', 300, 16781.21, 0, 0, 0, 0, 0, 17081.21, 11956.85, 11956.85, '16 de Septiembre num 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 44, 'BD Consolidada Ahorradores '),
(32, 1, '00100032', '', 'DURAN MARTINEZ SEBASTIAN EVELINA', '100032', 300, 0, 0, 0, 0, 0, 0, 300, 210, 210, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 45, 'BD Consolidada Ahorradores '),
(33, 1, '00100033', '', 'FERNANDEZ HERNANDEZ SOLIRENE', '100033', 0, 85088.71, 0, 0, 0, 0, 0, 85088.71, 59562.1, 59562.1, 'Rubi num 8', 'La Joya', 'Rafael Lara Grajales', 'S/D', 46, 'BD Consolidada Ahorradores '),
(34, 1, '00100034', '', 'FLORES DIAZ MARGARITO', '100034', 0, 20466, 0, 0, 0, 0, 0, 20466, 14326.2, 14326.2, '12 Norte num 8', 'Barrio San Juan', 'Acajete', 'S/D', 47, 'BD Consolidada Ahorradores '),
(35, 1, '00100035', '', 'FLORES MOZO RODE', '100035', 0, 11704.59, 0, 0, 0, 0, 0, 11704.59, 8193.21, 8193.21, '11 Sur num 25', 'Centro', 'Rafael Lara Grajales', 'S/D', 48, 'BD Consolidada Ahorradores '),
(36, 1, '00100036', '', 'GARCIA MONTES VICENTA', '100036', 0, 19376.85, 0, 0, 0, 0, 0, 19376.85, 13563.8, 13563.8, '7 Sur num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 49, 'BD Consolidada Ahorradores '),
(37, 1, '00100037', '', 'GONZALEZ HERNANDEZ ALEJANDRO', '100037', 300, 144030.9, 0, 0, 0, 0, 0, 144330.9, 101031.63, 101031.63, '5 Oriente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 50, 'BD Consolidada Ahorradores '),
(38, 1, '00100038', '', 'GONZALEZ LOPEZ HILARIA', '100038', 300, 5703, 0, 0, 0, 0, 0, 6003, 4202.1, 4202.1, 'Plaza de la Gardenia Edif 19A DPTO 2', 'U Hab Lara Grajales', 'Nopalucan', 'S/D', 51, 'BD Consolidada Ahorradores '),
(39, 1, '00100039', '', 'GUEVARA LOPEZ ELIGIO', '100039', 300, 100, 195000, 0, 0, 0, 0, 195400, 136780, 136780, 'Avenida 16 de septiembre s/n', 'Tonalapa', 'Ixtacamaxtitlan', '4880221', 52, 'BD Consolidada Ahorradores '),
(40, 1, '00100040', '', 'HERNANDEZ CERON MARTHA', '100040', 0, 74815, 0, 0, 0, 0, 0, 74815, 52370.5, 52370.5, '3 Sur num 14', 'Grajales', 'Rafael Lara Grajales', 'S/D', 53, 'BD Consolidada Ahorradores '),
(41, 1, '00100041', '', 'HERNANDEZ LOPEZ ROSA', '100041', 300, 142597, 0, 0, 0, 0, 0, 142897, 100027.9, 100027.9, 'Hidalgo 404', 'La Granja', 'Nopalucan', 'S/D', 54, 'BD Consolidada Ahorradores '),
(42, 1, '00100042', '', 'HERNANDEZ PLATINI MARIA LUCINA', '100042', 300, 52698, 0, 0, 0, 0, 0, 52998, 37098.6, 37098.6, 'Av Del Trabajo num 20 Col Obrera', 'Grajales', 'S/D', 'S/D', 55, 'BD Consolidada Ahorradores '),
(43, 1, '00100043', '', 'HERNANDEZ RAMIREZ JOSE PORFIRIO PASCUAL', '100043', 0, 10243.63, 0, 0, 0, 0, 0, 10243.63, 7170.54, 7170.54, '7 Sur num 16', 'Centro', 'Rafael Lara Grajales', 'S/D', 56, 'BD Consolidada Ahorradores '),
(44, 1, '00100044', '', 'HERRERA HERNANDEZ JOSE ARMANDO', '100044', 300, 53743.62, 0, 0, 0, 0, 0, 54043.62, 37830.53, 37830.53, 'Iturbide num21', 'Barrio de San Miguel', 'Libres', '012764740102', 57, 'BD Consolidada Ahorradores '),
(45, 1, '00100045', '', 'HUERTA VEGA ESPERANZA', '100045', 300, 11700.77, 0, 0, 0, 0, 0, 12000.77, 8400.54, 8400.54, '2 dos norte num 51', 'Centro', 'Rafael Lara Grajales', 'S/D', 58, 'BD Consolidada Ahorradores '),
(46, 1, '00100046', '', 'JIMENEZ SANCHEZ SIXTA', '100046', 0, 0, 9726.56, 0, 0, 0, 0, 9726.56, 6808.59, 6808.59, '2 norte num 50', 'Barrio Sto Entierro', 'Acajete', 'S/D', 59, 'BD Consolidada Ahorradores '),
(47, 1, '00100047', '', 'JUAREZ DURAN JUAN', '100047', 300, 0, 39089.6, 0, 0, 0, 0, 39389.6, 27572.72, 27572.72, '4 Poniente num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 60, 'BD Consolidada Ahorradores '),
(48, 1, '00100048', '', 'JUAREZ JIMENEZ MARIA DE LOURDES', '100048', 0, 23408.15, 0, 0, 0, 0, 0, 23408.15, 16385.71, 16385.71, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 61, 'BD Consolidada Ahorradores '),
(49, 1, '00100049', '', 'JUAREZ JIMENEZ MARIA LAURA', '100049', 0, 23081.29, 0, 0, 0, 0, 0, 23081.29, 16156.9, 16156.9, '3 Sur num 715', 'Barrio la Virgen', 'Acajete', 'S/D', 62, 'BD Consolidada Ahorradores '),
(50, 1, '00100050', '', 'JUAREZ NERI MARIA DEL CARMEN', '100050', 0, 20000, 0, 0, 0, 0, 0, 20000, 14000, 14000, '6 Poniente num 310', 'Centro', 'Rafael Lara Grajales', 'S/D', 63, 'BD Consolidada Ahorradores '),
(51, 1, '00100051', '', 'LOBATO BAEZ MARIANA', '100051', 0, 5100, 0, 0, 0, 0, 0, 5100, 3570, 3570, '5 Poniente num 500', 'Loc Oriental', 'Oriental', 'S/D', 64, 'BD Consolidada Ahorradores '),
(52, 1, '00100052', '', 'LOPEZ MAZAPILA DALILA', '100052', 0, 18967.9, 0, 0, 0, 0, 0, 18967.9, 13277.53, 13277.53, 'Av Benito Juarez num 13', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 65, 'BD Consolidada Ahorradores '),
(53, 1, '00100053', '', 'LOPEZ MORALES MARGARITA', '100053', 0, 150006, 0, 0, 0, 0, 0, 150006, 105004.2, 105004.2, 'Cale 2 Pte num 13', 'Nopalucan', 'Nopalucan', 'S/D', 66, 'BD Consolidada Ahorradores '),
(54, 1, '00100054', '', 'LOZANO SALAZAR GUILLERMINA', '100054', 0, 0, 20096.73, 0, 0, 0, 0, 20096.73, 14067.71, 14067.71, 'S/D', 'S/D', 'S/D', 'S/D', 67, 'BD Consolidada Ahorradores '),
(55, 1, '00100055', '', 'MARQUEZ DURAN PEDRO ELOY', '100055', 0, 0, 290000, 0, 0, 0, 0, 290000, 203000, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 68, 'BD Consolidada Ahorradores '),
(56, 1, '00100056', '', 'MARQUEZ PEREZ ERICK', '100056', 0, 0, 289000, 0, 0, 0, 0, 289000, 202300, 167930, '4 Norte num 12', 'Centro', 'San Jose Chiapa', 'S/D', 69, 'BD Consolidada Ahorradores '),
(57, 1, '00100057', '', 'MARTINEZ GONZALEZ MARIBEL', '100057', 300, 3191.77, 0, 0, 0, 0, 0, 3491.77, 2444.24, 2444.24, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 70, 'BD Consolidada Ahorradores '),
(58, 1, '00100058', '', 'MARTINEZ LOPEZ JOSE EZEQUIEL', '100058', 0, 63192.05, 0, 0, 0, 0, 0, 63192.05, 44234.44, 44234.44, 'Allende num 14', 'Ignacio Zaragoza', 'Rafael Lara Grajales', 'S/D', 71, 'BD Consolidada Ahorradores '),
(59, 1, '00100059', '', 'MARTINEZ MARTINEZ ALEJANDRO', '100059', 0, 24494.18, 0, 0, 0, 0, 0, 24494.18, 17145.93, 17145.93, 'Colosio num 6', 'San Jose Ozumba', 'San Jose Chiapa', 'S/D', 72, 'BD Consolidada Ahorradores '),
(60, 1, '00100060', '', 'MARTINEZ TORRES ANGEL', '100060', 0, 1635.02, 24906.66, 0, 0, 0, 0, 26541.68, 18579.18, 18579.18, 'S/D', 'S/D', 'S/D', 'S/D', 73, 'BD Consolidada Ahorradores '),
(61, 1, '00100061', '', 'MAURICIO RODRIGUEZ FAUSTINO', '100061', 0, 1456.94, 0, 0, 0, 0, 0, 1456.94, 1019.86, 1019.86, '6 Sur num 705', 'B Virgen de la Luz', 'Acajete', 'S/D', 74, 'BD Consolidada Ahorradores '),
(62, 1, '00100062', '', 'MENDEZ ALCANTARA AURORA', '100062', 0, 7476.43, 0, 0, 0, 0, 0, 7476.43, 5233.5, 5233.5, '3 poniente num 1', 'Centro', 'Rafael Lara Grajales', 'S/D', 75, 'BD Consolidada Ahorradores '),
(63, 1, '00100063', '', 'MENDEZ ARMAS MARIA DE LOURDES', '100063', 0, 100, 10001, 0, 0, 0, 0, 10101, 7070.7, 7070.7, '3 Oriente s/n', 'San Jose Morelos', 'Libres', 'S/D', 76, 'BD Consolidada Ahorradores '),
(64, 1, '00100064', '', 'MENDEZ LOZANO EZEQUIEL', '100064', 0, 231326.3, 0, 0, 0, 0, 0, 231326.3, 161928.41, 161928.41, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 77, 'BD Consolidada Ahorradores '),
(65, 1, '00100065', '', 'MENDEZ LOZANO MARGARITA', '100065', 300, 0, 19292.91, 0, 0, 0, 0, 19592.91, 13715.04, 13715.04, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 78, 'BD Consolidada Ahorradores '),
(66, 1, '00100066', '', 'MENDEZ ROQUE AURELIO IGNACIO', '100066', 0, 164751, 0, 0, 0, 0, 0, 164751, 115325.7, 115325.7, '5 Norte num 203', 'Centro', 'Rafael Lara Grajales', 'S/D', 79, 'BD Consolidada Ahorradores '),
(67, 1, '00100067', '', 'MONTES MARTINEZ JESUS', '100067', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Adolfo Lopez Mateos num915', 'San Juan Negrete', 'Tepeaca', '2231031283', 80, 'BD Consolidada Ahorradores '),
(68, 1, '00100068', '', 'MORALES BONILLA FLORINA', '100068', 0, 24336.38, 0, 0, 0, 0, 0, 24336.38, 17035.47, 17035.47, '7 poniente s/n', 'B Virgen de la Luz', 'Acajete', 'S/D', 81, 'BD Consolidada Ahorradores '),
(69, 1, '00100069', '', 'MORALES HERNANDEZ AMBROCIO', '100069', 0, 54980, 0, 0, 0, 0, 0, 54980, 38486, 38486, 'Av Matamoros num 310', 'Juan de la Granja', 'Nopalucan', 'S/D', 82, 'BD Consolidada Ahorradores '),
(70, 1, '00100070', '', 'MORALES MENDOZA JOSE ROSENDO', '100070', 0, 69213.58, 0, 0, 0, 0, 0, 69213.58, 48449.51, 48449.51, '9 Pte num 45', 'Centro', 'Rafael Lara Grajales', 'S/D', 83, 'BD Consolidada Ahorradores '),
(71, 1, '00100071', '', 'NERI NICANOR RAUL JAVIER', '100071', 0, 292201.14, 0, 0, 0, 0, 0, 292201.14, 204540.8, 167930, 'Av Emiliano Carranza num 26', 'Centro', 'Rafael Lara Grajales', 'S/D', 84, 'BD Consolidada Ahorradores '),
(72, 1, '00100072', '', 'OCHOA SALAS JUAN', '100072', 0, 47042.94, 110000, 0, 0, 0, 0, 157042.94, 109930.06, 109930.06, 'Ayuntamiento num S/N', 'La Virgen de la Luz', 'Acajete', 'S/D', 85, 'BD Consolidada Ahorradores '),
(73, 1, '00100073', '', 'ORTEGA BECERRIL RAFAEL', '100073', 0, 2872.53, 0, 0, 0, 0, 0, 2872.53, 2010.77, 2010.77, '5 Oriente Edif D-5 Depto 4', 'Unid Hab Grajales', 'Rafael Lara Grajales', 'S/D', 86, 'BD Consolidada Ahorradores '),
(74, 1, '00100074', '', 'ORTEGA ROJAS ANGELA', '100074', 0, 8825.21, 0, 0, 0, 0, 0, 8825.21, 6177.65, 6177.65, 'Av Del Sol num 15', 'Fracc Los Olivos', 'Tijuana BC', 'S/D', 87, 'BD Consolidada Ahorradores '),
(75, 1, '00100075', '', 'ORTIZ PEREZ GABINO', '100075', 0, 28577.56, 0, 0, 0, 0, 0, 28577.56, 20004.29, 20004.29, '2 Norte num 73', 'Centro', 'Rafael Lara Grajales', 'S/D', 88, 'BD Consolidada Ahorradores '),
(76, 1, '00100076', '', 'OSORIO HUERTA ARTURO', '100076', 0, 288524.83, 0, 0, 0, 0, 0, 288524.83, 201967.38, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 89, 'BD Consolidada Ahorradores '),
(77, 1, '00100077', '', 'OSORIO SANTAMARIA EDUARDO', '100077', 0, 322648.46, 0, 0, 0, 0, 0, 322648.46, 225853.92, 167930, '5 Sur num 8', 'Centro', 'Rafael Lara Grajales', 'S/D', 90, 'BD Consolidada Ahorradores '),
(78, 1, '00100078', '', 'PEREZ DE LAZARO ISABEL', '100078', 0, 51337.4, 0, 0, 0, 0, 0, 51337.4, 35936.18, 35936.18, '6 Pte no 21', 'Centro', 'Rafael Lara Grajales', 'S/D', 91, 'BD Consolidada Ahorradores '),
(79, 1, '00100079', '', 'PEREZ LOZANO LUCRECIA', '100079', 0, 1330.1, 0, 0, 0, 0, 0, 1330.1, 931.07, 931.07, 'Av Lazaro Cardenas num 226', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 92, 'BD Consolidada Ahorradores '),
(80, 1, '00100080', '', 'PEREZ PARRA ENCARNACION', '100080', 0, 258064.3, 0, 0, 0, 0, 0, 258064.3, 180645.01, 167930, '11 Sur num 31', 'Centro', 'Rafael Lara Grajales', 'S/D', 93, 'BD Consolidada Ahorradores '),
(81, 1, '00100081', '', 'PEREZ VARGAS GABRIELA', '100081', 0, 148175, 916782.21, 0, 0, 0, 0, 1064957.21, 745470.05, 167930, 'Av Anastacio Torre Blanca S/N', 'Centro', 'San Jose Chiapa', 'S/D', 94, 'BD Consolidada Ahorradores '),
(82, 1, '00100082', '', 'PEREZ VARGAS ROMAN', '100082', 0, 0, 290000, 0, 0, 0, 0, 290000, 203000, 167930, '4 Norte no 1203', 'Centro', 'San Jose Chiapa', 'S/D', 95, 'BD Consolidada Ahorradores '),
(83, 1, '00100083', '', 'PROYLAN BAEZ ALEJANDRO', '100083', 0, 150704.28, 0, 0, 0, 0, 0, 150704.28, 105493, 105493, 'Av Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 96, 'BD Consolidada Ahorradores '),
(84, 1, '00100084', '', 'RAMIREZ BARRALES MARICELA', '100084', 0, 29858, 0, 0, 0, 0, 0, 29858, 20900.6, 20900.6, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 97, 'BD Consolidada Ahorradores '),
(85, 1, '00100085', '', 'RAMIREZ HERNANDEZ UBALDO', '100085', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, 'Cabo Franco num1299', 'Barrio Guadalupe', 'Libres', 'S/D', 98, 'BD Consolidada Ahorradores '),
(86, 1, '00100086', '', 'RAMIREZ MELENDEZ JAVIER', '100086', 0, 17806.61, 0, 0, 0, 0, 0, 17806.61, 12464.63, 12464.63, '2 norte num 28', 'Barrio Sto Entierro', 'Acajete', 'S/D', 99, 'BD Consolidada Ahorradores '),
(87, 1, '00100087', '', 'RAMIREZ TAPIA FERNANDO', '100087', 0, 78368.63, 0, 0, 0, 0, 0, 78368.63, 54858.04, 54858.04, 'Zacatecas num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 100, 'BD Consolidada Ahorradores '),
(88, 1, '00100088', '', 'REYES GONZALEZ GUADALUPE', '100088', 0, 32391.38, 0, 0, 0, 0, 0, 32391.38, 22673.97, 22673.97, '14 Poniente s/n', 'Centro', 'Nopalucan', 'S/D', 101, 'BD Consolidada Ahorradores '),
(89, 1, '00100089', '', 'ROCHA LOPEZ MOISES', '100089', 0, 13651.77, 0, 0, 0, 0, 0, 13651.77, 9556.24, 9556.24, '2 Norte num 48', 'Centro', 'Rafael Lara Grajales', 'S/D', 102, 'BD Consolidada Ahorradores '),
(90, 1, '00100090', '', 'RODRIGUEZ MENDOZA SILVIA', '100090', 0, 141704, 0, 0, 0, 0, 0, 141704, 99192.8, 99192.8, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 103, 'BD Consolidada Ahorradores '),
(91, 1, '00100091', '', 'ROMERO AVILA TERESA', '100091', 0, 26405.31, 0, 0, 0, 0, 0, 26405.31, 18483.72, 18483.72, 'Av 20 de Noviembre num 45', 'Grajales', 'Rafael Lara Grajales', 'S/D', 104, 'BD Consolidada Ahorradores '),
(92, 1, '00100092', '', 'ROMERO MORALES MIGUEL', '100092', 0, 51769.04, 0, 0, 0, 0, 0, 51769.04, 36238.33, 36238.33, '7 Sur num 43 Col Centro', 'Grajales', 'Rafael Lara Grajales', 'S/D', 105, 'BD Consolidada Ahorradores '),
(93, 1, '00100093', '', 'ROMERO MORALES SOLEDAD', '100093', 0, 40000, 0, 0, 0, 0, 0, 40000, 28000, 28000, '9 Poniente num 28', 'Centro', 'Rafael Lara Grajales', 'S/D', 106, 'BD Consolidada Ahorradores '),
(94, 1, '00100094', '', 'ROMERO PEREZ VICTORIA', '100094', 300, 250, 19818.5, 0, 0, 0, 0, 20368.5, 14257.95, 14257.95, 'Av Francisco I Madero num 410', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 107, 'BD Consolidada Ahorradores '),
(95, 1, '00100095', '', 'ROMERO SOSA MIGUEL', '100095', 0, 17067.96, 0, 0, 0, 0, 0, 17067.96, 11947.57, 11947.57, 'Francisco I Madero num 720', 'Maria Ixtiyucan', 'Nopalucan', 'S/D', 108, 'BD Consolidada Ahorradores '),
(96, 1, '00100096', '', 'SALAZAR VALENCIA MARIA OCOTLAN ENRIQUETA', '100096', 0, 94600, 0, 0, 0, 0, 0, 94600, 66220, 66220, '2 Pte no 52', 'Centro', 'Rafael Lara Grajales', 'S/D', 109, 'BD Consolidada Ahorradores '),
(97, 1, '00100097', '', 'SANCHEZ HERNANDEZ IRENE', '100097', 0, 84703.57, 0, 0, 0, 0, 0, 84703.57, 59292.5, 59292.5, 'San Francisco s/n', 'Benito Juarez', 'Soltepec', 'S/D', 110, 'BD Consolidada Ahorradores '),
(98, 1, '00100098', '', 'SANCHEZ HERNANDEZ RICARDA', '100098', 300, 4245.52, 405300, 0, 0, 0, 0, 409845.52, 286891.86, 167930, '20 de Noviembre num 47', 'Centro', 'Rafael Lara Grajales', 'S/D', 111, 'BD Consolidada Ahorradores '),
(99, 1, '00100099', '', 'SANCHEZ LEONARDO JOSE RODOLFO', '100099', 0, 8855.56, 0, 0, 0, 0, 0, 8855.56, 6198.89, 6198.89, 'Enrique Flores Magon num 7', 'Obrera', 'Rafael Lara Grajales', 'S/D', 112, 'BD Consolidada Ahorradores '),
(100, 1, '00100100', '', 'SANCHEZ LOMELI VENTURA', '100100', 0, 200, 20000, 0, 0, 0, 0, 20200, 14140, 14140, 'Miguel Hidalgo num 12', 'Isabel Tepetzala', 'Acajete', 'S/D', 113, 'BD Consolidada Ahorradores '),
(101, 1, '00100101', '', 'SANCHEZ PEREZ JOSE ANDRES', '100101', 0, 0, 100001, 0, 0, 0, 0, 100001, 70000.7, 70000.7, 'Cabo Franco num699', 'Barrio Guadalupe', 'Libres', '2764730574', 114, 'BD Consolidada Ahorradores '),
(102, 1, '00100102', '', 'SARMIENTO HUERTA EVELIA', '100102', 300, 24700, 0, 0, 0, 0, 0, 25000, 17500, 17500, '5 norte num 17', 'Centro', 'Rafael Lara Grajales', 'S/D', 115, 'BD Consolidada Ahorradores '),
(103, 1, '00100103', '', 'SARMIENTOS FERNANDEZ IRMA', '100103', 300, 100, 19600, 0, 0, 0, 0, 20000, 14000, 14000, 'Tonalapa s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 116, 'BD Consolidada Ahorradores '),
(104, 1, '00100104', '', 'SARMIENTOS LOPEZ OTILIO', '100104', 0, 0, 10284.48, 0, 0, 0, 0, 10284.48, 7199.14, 7199.14, 'Calle sin nombre s/n', 'Tonalapa', 'Ixtacamaxtitlan', 'S/D', 117, 'BD Consolidada Ahorradores '),
(105, 1, '00100105', '', 'SILVA BAUTISTA SEGIO', '100105', 0, 0, 430000, 0, 0, 0, 0, 430000, 301000, 167930, '3 Oriente no 30', 'Centro', 'Rafael Lara Grajales', 'S/D', 118, 'BD Consolidada Ahorradores '),
(106, 1, '00100106', '', 'TORRES CRUZ MARIBEL', '100106', 0, 300914.66, 0, 0, 0, 0, 0, 300914.66, 210640.26, 167930, '7 Sur num 33', 'Centro', 'Rafael Lara Grajales', 'S/D', 119, 'BD Consolidada Ahorradores '),
(107, 1, '00100107', '', 'UGARTE LOZANO JOSE LUIS', '100107', 300, 5868.3, 0, 0, 0, 0, 0, 6168.3, 4317.81, 4317.81, '9 Poniente num 9', 'Centro', 'Rafael Lara Grajales', 'S/D', 120, 'BD Consolidada Ahorradores '),
(108, 1, '00100108', '', 'VALDIVIA BARRALES CAROLINA', '100108', 0, 5068.62, 0, 0, 0, 0, 0, 5068.62, 3548.03, 3548.03, '7 poniente s/n', 'Barrio de Jesus', 'Acajete', 'S/D', 121, 'BD Consolidada Ahorradores '),
(109, 1, '00100109', '', 'VALENCIA BAEZ OSCAR', '100109', 0, 11768, 0, 0, 0, 0, 0, 11768, 8237.6, 8237.6, 'Emiliano Carranza num 12', 'Centro', 'Rafael Lara Grajales', 'S/D', 122, 'BD Consolidada Ahorradores '),
(110, 1, '00100110', '', 'VARGAS VELEZ MARIA DEL ROSARIO SOLEDAD', '100110', 0, 0, 200000, 0, 0, 0, 0, 200000, 140000, 140000, '5 norte num s/n', 'San Jose Chiapa', 'San Jose Chiapa', 'S/D', 123, 'BD Consolidada Ahorradores '),
(111, 1, '00100111', '', 'VAZQUEZ PEREZ ROSA', '100111', 0, 69385.85, 0, 0, 0, 0, 0, 69385.85, 48570.1, 48570.1, '2 Oriente num 213', 'Centro', 'Nopalucan', 'S/D', 124, 'BD Consolidada Ahorradores '),
(112, 1, '00100112', '', 'VEDE PEREZ JOSE FERNANDO TRINIDAD', '100112', 0, 0, 49640.14, 0, 0, 0, 0, 49640.14, 34748.1, 34748.1, '14 Oriente s/n', 'Centro', 'San Jose Chiapa', 'S/D', 125, 'BD Consolidada Ahorradores '),
(113, 1, '00100113', '', 'VILLEGAS BONILLA CLEMENCIA', '100113', 300, 1928.21, 0, 0, 0, 0, 0, 2228.21, 1559.75, 1559.75, 'S/D', 'San Bartolo Pinal', 'Acajete', 'S/D', 126, 'BD Consolidada Ahorradores '),
(114, 1, '00200001', '', 'ABUNDIO SANCHEZ ESTELA ROSA', '200001', 500, 0, 12000, 0, 0, 0, 0, 12500, 8750, 8750, 'Cuautilica s/n', 'Seccion tercera', 'Zoquitlan', 'S/D', 127, 'BD Consolidada Ahorradores '),
(115, 1, '00200002', '', 'ALTAMIRANO LOPEZ MARIO', '200002', 0, 0, 4336000, 0, 0, 0, 0, 4336000, 3035200, 167930, '2 Poniente num 201', 'Centro', 'Tehuacan', 'S/D', 128, 'BD Consolidada Ahorradores '),
(116, 1, '00200003', '', 'ALVAREZ ATILANO MARIA CATALINA', '200003', 500, 5625, 50000, 0, 0, 0, 0, 56125, 39287.5, 39287.5, 'Xicotencatl num219', 'Cuauhtemoc', 'Tehuacan', 'S/D', 129, 'BD Consolidada Ahorradores '),
(117, 1, '00200004', '', 'ANSELMO RAMOS JULIAN', '200004', 500, 0, 50712.5, 0, 0, 0, 0, 51212.5, 35848.75, 35848.75, 'Benito Juarez Sur s/n', 'Cuautotolapa', 'Ajalpan', 'S/D', 130, 'BD Consolidada Ahorradores '),
(118, 1, '00200005', '', 'ANSELMO RIVERA EVA', '200005', 500, 0, 29800, 0, 0, 0, 0, 30300, 21210, 21210, 'Zoquitlan s/n', 'Segunda Seccion', 'Tecpanzcoalco', 'S/D', 131, 'BD Consolidada Ahorradores '),
(119, 1, '00200006', '', 'ANSELMO RIVERA TERESA', '200006', 500, 0, 151700, 0, 0, 0, 0, 152200, 106540, 106540, 'Zoquitlan s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 132, 'BD Consolidada Ahorradores '),
(120, 1, '00200007', '', 'ARELLANO SANTIAGO MARGARITA', '200007', 500, 50000, 0, 0, 0, 0, 0, 50500, 35350, 35350, '26 Sur num 535', 'Venustiano Carranza', 'Tehuacan', '012383922524', 133, 'BD Consolidada Ahorradores '),
(121, 1, '00200008', '', 'ARIAS HERNANDEZ JESUS DELFINO', '200008', 500, 0, 8414.57, 0, 0, 0, 0, 8914.57, 6240.2, 6240.2, 'Camelia Oriente num 120', 'Francisco Sarabia', 'Tehuacan', 'S/D', 134, 'BD Consolidada Ahorradores '),
(122, 1, '00200009', '', 'ARJONA PAVIA FANNY MARIA DE JESUS', '200009', 500, 0, 555797.26, 0, 0, 0, 0, 556297.26, 389408.08, 167930, '14 Oriente num 111', 'Buenos Aires', 'Tehuacan', '2383832334', 135, 'BD Consolidada Ahorradores '),
(123, 1, '00200010', '', 'BACA LOPEZ FRANCISCO', '200010', 500, 0, 500500, 0, 0, 0, 0, 501000, 350700, 167930, 'Ramon Corona num315', 'Reforma', 'Tehuacan', '1075375', 136, 'BD Consolidada Ahorradores '),
(124, 1, '00200011', '', 'BAGLIETO MORA JUAN MANUEL', '200011', 50500, 0, 0, 0, 0, 0, 0, 50500, 35350, 35350, 'Privada 4 Norte 1825', 'Buenos Aires', 'Tehuacan', 'S/D', 137, 'BD Consolidada Ahorradores '),
(125, 1, '00200012', '', 'BARRIGUETE RAMIREZ CECILIO', '200012', 500, 0, 80340, 0, 0, 0, 0, 80840, 56588, 56588, 'Agustin Lara mza 132 Lote 1045', 'San Jose Tlahuac', 'Tehuacan', 'S/D', 138, 'BD Consolidada Ahorradores '),
(126, 1, '00200013', '', 'BARTOLO VALERIO BERTHA INES', '200013', 0, 0, 18380.85, 0, 0, 0, 0, 18380.85, 12866.6, 12866.6, 'Avenida Nacional s/n', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 139, 'BD Consolidada Ahorradores '),
(127, 1, '00200014', '', 'BARTOLO VALERIO CONCEPCION ROSARIO', '200014', 0, 0, 78584.92, 0, 0, 0, 0, 78584.92, 55009.44, 55009.44, '7 poniente num 303', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 140, 'BD Consolidada Ahorradores '),
(128, 1, '00200015', '', 'BAUTISTA SERRANO JOSE JOEL', '200015', 500, 0, 31000, 0, 0, 0, 0, 31500, 22050, 22050, 'Juarez num221', 'Seccion primera', 'Zinacatepec', 'S/D', 141, 'BD Consolidada Ahorradores '),
(129, 1, '00200016', '', 'BECERRA MACHADO FERNANDO Y/O HERNANDEZ HERNANDEZ VIRGINIA', '200016', 0, 0, 160000, 0, 0, 0, 0, 160000, 112000, 112000, '22 Norte num 619', 'San Rafael', 'Tehuacan', 'S/D', 142, 'BD Consolidada Ahorradores '),
(130, 1, '00200017', '', 'BELLO MARTINEZ CELESTINO', '200017', 500, 0, 193256.44, 0, 0, 0, 0, 193756.44, 135629.51, 135629.51, 'Av 22 de Feb 423 Sauce 205', 'San Marcos', 'Azcapotzalco', 'S/D', 143, 'BD Consolidada Ahorradores '),
(131, 1, '00200018', '', 'BENITEZ SAID JESUS', '200018', 0, 0, 10000, 0, 0, 0, 0, 10000, 7000, 7000, '16 Oriente num 109', 'Sarabia', 'Tehuacan', 'S/D', 144, 'BD Consolidada Ahorradores '),
(132, 1, '00200019', '', 'BIBIANO JERONIMO ARTEMIO', '200019', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Avenida Portes Gil num1022', 'San Nicolas', 'Tetitzintla', 'S/D', 145, 'BD Consolidada Ahorradores '),
(133, 1, '00200020', '', 'BOLAÑOS MOGUEL ALFREDO DAMIAN', '200020', 500, 0, 919500, 0, 0, 0, 0, 920000, 644000, 167930, '20 Poniente 110', 'El Eden', 'Tehuacan', 'S/D', 146, 'BD Consolidada Ahorradores '),
(134, 1, '00200021', '', 'BOLAÑOS MOGUEL FLOR VERONICA', '200021', 0, 0, 97000, 0, 0, 0, 0, 97000, 67900, 67900, 'Lazaro Cardenas num2418', 'Francisco Villa', 'Tehuacan', 'S/D', 147, 'BD Consolidada Ahorradores '),
(135, 1, '00200022', '', 'BONFIL MARTINEZ ROBERTA HERACLIA', '200022', 500, 832.87, 0, 0, 0, 0, 0, 1332.87, 933.01, 933.01, 'Zoquitlan s/n', 'Barrio 2', 'Zoquitlan', 'S/D', 148, 'BD Consolidada Ahorradores '),
(136, 1, '00200023', '', 'BUENABAD CASTILLA JOSEFA', '200023', 500, 0, 39919.23, 0, 0, 0, 0, 40419.23, 28293.46, 28293.46, 'San Sebastian Frontera S/N', 'Sebastian Frontera', 'Santiago Chazumba', 'S/D', 149, 'BD Consolidada Ahorradores '),
(137, 1, '00200024', '', 'CABRERA HERNANDEZ ELVIRA', '200024', 500, 0, 20248.38, 0, 0, 0, 0, 20748.38, 14523.87, 14523.87, 'Av Vicente Guerrero num 307', 'Santa Maria Monte', 'Vicente Guerrero', 'S/D', 150, 'BD Consolidada Ahorradores '),
(138, 1, '00200025', '', 'CACHO GARCIA BEATRIZ', '200025', 500, 0, 8500, 0, 0, 0, 0, 9000, 6300, 6300, 'Reforma num 6', 'Centro', 'San Jose Miahuatlan', 'S/D', 151, 'BD Consolidada Ahorradores '),
(139, 1, '00200026', '', 'CALDERON SOLIS REGINO', '200026', 0, 0, 10000, 0, 0, 0, 0, 10000, 7000, 7000, 'Venustiano Carranza num 24', 'Centro', 'Zinacatepec', 'S/D', 152, 'BD Consolidada Ahorradores '),
(140, 1, '00200027', '', 'CAMACHO ALONSO JOSE JUAN', '200027', 500, 36595.02, 0, 0, 0, 0, 0, 37095.02, 25966.51, 25966.51, '12 Sur num 1930', '16 de Marzo', 'Tehuacan', 'S/D', 153, 'BD Consolidada Ahorradores '),
(141, 1, '00200028', '', 'CARRANZA MARIN PABLO', '200028', 500, 0, 50333.33, 0, 0, 0, 0, 50833.33, 35583.33, 35583.33, 'Barrio Peña Blanca s/n', 'Peña Blanca', 'San Lucas Zoquiampan', 'S/D', 154, 'BD Consolidada Ahorradores '),
(142, 1, '00200029', '', 'CARRERA CARRERA CATARINA AMPARO', '200029', 0, 0, 187863.1, 0, 0, 0, 0, 187863.1, 131504.17, 131504.17, 'Josefa Ortiz de Dominguez num 547', 'Nicolas Bravo', 'Tehuacan', 'S/D', 155, 'BD Consolidada Ahorradores '),
(143, 1, '00200030', '', 'CARRERA LEZAMA FERNANDO MANUEL', '200030', 500, 0, 36228.61, 0, 0, 0, 0, 36728.61, 25710.03, 25710.03, '13 Poniente num 434', 'Benito Juarez', 'Tehuacan', 'S/D', 156, 'BD Consolidada Ahorradores '),
(144, 1, '00200031', '', 'CASTILLO ARCOS MODESTA', '200031', 0, 0, 1300000, 0, 0, 0, 0, 1300000, 910000, 167930, '2 norte num139', 'Zaragoza', 'Tehuacan', 'S/D', 157, 'BD Consolidada Ahorradores '),
(145, 1, '00200032', '', 'CASTILLO GOMEZ DANIEL', '200032', 500, 0, 2900000, 0, 0, 0, 0, 2900500, 2030350, 167930, 'Priv 5 num Edif 2012', 'Los Pinos', 'Tehuacan', 'S/D', 158, 'BD Consolidada Ahorradores '),
(146, 1, '00200033', '', 'CASTRO PANTZI ABEL ANDRES', '200033', 83000, 0, 0, 0, 0, 0, 0, 83000, 58100, 58100, '5 de febrero sur num 532', 'Coculco', 'Ajalpan', 'S/D', 159, 'BD Consolidada Ahorradores '),
(147, 1, '00200034', '', 'CERQUERA DE LA CRUZ CRISPIN', '200034', 500, 0, 11566.16, 0, 0, 0, 0, 12066.16, 8446.31, 8446.31, '5 sur num917', 'Nicolas Bravo', 'Tehuacan', 'S/D', 160, 'BD Consolidada Ahorradores '),
(148, 1, '00200035', '', 'CHAVEZ MARTINEZ MARIA LORENA', '200035', 0, 0, 93000, 0, 0, 0, 0, 93000, 65100, 65100, '9 Oriente num 905', 'La Purisima', 'Tehuacan', 'S/D', 161, 'BD Consolidada Ahorradores '),
(149, 1, '00200036', '', 'CORREA REYES LORENA', '200036', 500, 0, 12018.16, 0, 0, 0, 0, 12518.16, 8762.71, 8762.71, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 162, 'BD Consolidada Ahorradores '),
(150, 1, '00200037', '', 'CORREA REYES MATILDE', '200037', 500, 0, 70000, 0, 0, 0, 0, 70500, 49350, 49350, 'Jesus Carranza num140 4', 'Santa Maria Coapa', 'Tehuacan', 'S/D', 163, 'BD Consolidada Ahorradores '),
(151, 1, '00200038', '', 'CORREO JUAREZ EDUARDO', '200038', 0, 0, 8000, 0, 0, 0, 0, 8000, 5600, 5600, 'Mariano Matamoros no 177', 'Centro', 'San Gabriel Chilac', 'S/D', 164, 'BD Consolidada Ahorradores '),
(152, 1, '00200039', '', 'CORTES REYES ISRAEL', '200039', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Independencia num 6', 'San Juan Atzingo', 'San Gabriel Chilac', '012371052829', 165, 'BD Consolidada Ahorradores '),
(153, 1, '00200040', '', 'CORTES REYES PEDRO PASCUAL', '200040', 0, 0, 20700, 0, 0, 0, 0, 20700, 14490, 14490, 'Priv 15 norte num 22', 'Obreros Peñafiel', 'Teotitlan Flores', 'S/D', 166, 'BD Consolidada Ahorradores '),
(154, 1, '00200041', '', 'CORTES LOPEZ JOSE', '200041', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, '6 Poniente num 511', 'Santiago Miahuatlan', 'Tehuacan', 'S/D', 167, 'BD Consolidada Ahorradores '),
(155, 1, '00200042', '', 'CORTEZ COELLO CIRENIA', '200042', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Priv Maestro Aaron Joaquin num 2312', 'Mexico Sur', 'Coyomeapan', 'S/D', 168, 'BD Consolidada Ahorradores '),
(156, 1, '00200043', '', 'CRUZ AVENDAÑO GONZALO', '200043', 500, 0, 12000, 0, 0, 0, 0, 12500, 8750, 8750, '8 Norte 416', 'Serdan', 'Serdan', '012381085381', 169, 'BD Consolidada Ahorradores '),
(157, 1, '00200044', '', 'CRUZ PARRA PAULINA', '200044', 500, 0, 150000, 0, 0, 0, 0, 150500, 105350, 105350, '13 Oriente Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 170, 'BD Consolidada Ahorradores '),
(158, 1, '00200045', '', 'CUELLO MONTAL DIONISIA', '200045', 500, 0, 131400.66, 0, 0, 0, 0, 131900.66, 92330.46, 92330.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 171, 'BD Consolidada Ahorradores '),
(159, 1, '00200046', '', 'DE JESUS HERNANDEZ JUANA', '200046', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Telpatlan s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 172, 'BD Consolidada Ahorradores '),
(160, 1, '00200047', '', 'DE JESUS MACEDONIO FRANCISCO', '200047', 0, 0, 300000, 0, 0, 0, 0, 300000, 210000, 167930, 'Real num 203', 'Jose Maria Morelos', 'Tlachichuca', 'S/D', 173, 'BD Consolidada Ahorradores '),
(161, 1, '00200048', '', 'DE LOS SANTOS SALINAS JOSE', '200048', 0, 4000, 95000, 0, 0, 0, 0, 99000, 69300, 69300, '3 oriente num12', 'Centro', 'Atexcal', 'S/D', 174, 'BD Consolidada Ahorradores '),
(162, 1, '00200049', '', 'DIAZ OSORIO JUAN', '200049', 500, 0, 109765.77, 0, 0, 0, 0, 110265.77, 77186.04, 77186.04, 'Buena Vista s/n', 'Santa Maria Teopoxco', 'Santa Maria Teopoxco', 'S/D', 175, 'BD Consolidada Ahorradores '),
(163, 1, '00200050', '', 'DIEGO GAYTAN ALEJANDRO', '200050', 0, 0, 117500, 0, 0, 0, 0, 117500, 82250, 82250, 'Aeromexico num Lote 36', 'Aeropuerto', 'Tehuacan', 'S/D', 176, 'BD Consolidada Ahorradores '),
(164, 1, '00200051', '', 'DUARTE HUITZITL AGRIPINA ALICIA', '200051', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, 'Zoquitlan s/n', 'Zoquitlan', 'Zoquitlan', 'S/D', 177, 'BD Consolidada Ahorradores '),
(165, 1, '00200052', '', 'DUARTE OLMOS FIDENCIO', '200052', 0, 0, 50000, 0, 0, 0, 0, 50000, 35000, 35000, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 178, 'BD Consolidada Ahorradores '),
(166, 1, '00200053', '', 'DURAN AVENDAÑO LEOVIGILDA', '200053', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Republica Brazil num 2512', 'America', 'Tehuacan', 'S/D', 179, 'BD Consolidada Ahorradores '),
(167, 1, '00200054', '', 'DURAN LOPEZ FLORENCIO LAZARO', '200054', 500, 41508.73, 0, 0, 0, 0, 0, 42008.73, 29406.11, 29406.11, 'Guerrero num 13', 'Cuauhtemoc', 'San Juan B Cuicatlan', 'S/D', 180, 'BD Consolidada Ahorradores '),
(168, 1, '00200055', '', 'FERMIN HERNANDEZ ESTEBAN', '200055', 500, 8633.67, 0, 0, 0, 0, 0, 9133.67, 6393.57, 6393.57, '1RA Priv 9 nte 7', 'Observatorio', 'Tehuacan', 'S/D', 181, 'BD Consolidada Ahorradores '),
(169, 1, '00200056', '', 'FLORES ARCOS DOLORES', '200056', 0, 0, 175800, 0, 0, 0, 0, 175800, 123060, 123060, 'Reforma Sur 700', 'Centro', 'Tehuacan', 'S/D', 182, 'BD Consolidada Ahorradores '),
(170, 1, '00200057', '', 'FLORIAN COLMENARES DELIA', '200057', 500, 224843.19, 1600000, 0, 0, 0, 0, 1825343.19, 1277740.23, 167930, '3 era Privada de la 3 Oriente num10', 'El Mirador', 'Tehuacan', 'S/D', 183, 'BD Consolidada Ahorradores '),
(171, 1, '00200058', '', 'FLORIUK GONZALEZ MARIA EUGENIA', '200058', 900000, 0, 0, 0, 0, 0, 0, 900000, 630000, 167930, '3 Sur 313 y 3 oriente', 'Centro', 'Tehuacan', 'S/D', 184, 'BD Consolidada Ahorradores '),
(172, 1, '00200059', '', 'GALVAN RODRIGUEZ ADELA', '200059', 500, 7000, 16000, 0, 0, 0, 0, 23500, 16450, 16450, 'Pipila num2027', 'Aeropuerto', 'Tehuacan', 'S/D', 185, 'BD Consolidada Ahorradores '),
(173, 1, '00200060', '', 'GALVEZ GONZALEZ ELIA TRINIDAD', '200060', 500, 0, 19000, 0, 0, 0, 0, 19500, 13650, 13650, '4 Oriente num 717 4', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 186, 'BD Consolidada Ahorradores '),
(174, 1, '00200061', '', 'GALVEZ GONZALEZ MARIA DEL CARMEN', '200061', 0, 0, 90000, 0, 0, 0, 0, 90000, 63000, 63000, '3 Norte num 211', 'Centro', 'Tehuacan', 'S/D', 187, 'BD Consolidada Ahorradores '),
(175, 1, '00200062', '', 'GALVEZ GONZALEZ SOLEDAD', '200062', 0, 15424.16, 0, 0, 0, 0, 0, 15424.16, 10796.91, 10796.91, '3 norte num 211', 'Centro', 'Tehuacan', 'S/D', 188, 'BD Consolidada Ahorradores '),
(176, 1, '00200063', '', 'GARCIA BRETON MARIA JOSEFINA EVARISTA', '200063', 0, 0, 10892.55, 0, 0, 0, 0, 10892.55, 7624.79, 7624.79, 's/nombre s/n', 'Temaxcalapa', 'Cañada Morelos', 'S/D', 189, 'BD Consolidada Ahorradores '),
(177, 1, '00200064', '', 'GARCIA GARCIA MARCELINA', '200064', 500, 0, 36633.15, 0, 0, 0, 0, 37133.15, 25993.21, 25993.21, '13 Mza 103 LT 19', 'Valle de los Reyes', 'La Paz Mexico', 'S/D', 190, 'BD Consolidada Ahorradores '),
(178, 1, '00200065', '', 'GARCIA LOPEZ CONSUELO', '200065', 105000, 3030.38, 0, 0, 0, 0, 0, 108030.38, 75621.27, 75621.27, '11 oriente num 741', 'Nicolas Bravo', 'Tehuacan', 'S/D', 191, 'BD Consolidada Ahorradores '),
(179, 1, '00200066', '', 'GARCIA MARTINEZ JUANA', '200066', 500, 0, 10000, 0, 0, 0, 0, 10500, 7350, 7350, 'Lerdo de Tejada num 924 Galeana Y 11 Poniente', 'Benito Juarez', 'Tehuacan', 'S/D', 192, 'BD Consolidada Ahorradores '),
(180, 1, '00200067', '', 'GARCIA MARTINEZ RAYMUNDO', '200067', 500, 0, 15486.28, 0, 0, 0, 0, 15986.28, 11190.4, 11190.4, '26 Sur num 1936', 'Puebla', 'Tehuacan', 'S/D', 193, 'BD Consolidada Ahorradores '),
(181, 1, '00200068', '', 'GASPAR GONZALEZ GORGONIO', '200068', 500, 0, 25000, 0, 0, 0, 0, 25500, 17850, 17850, 'Puerto de angel s/n', 'Puerto san Angel', 'Ajalpan', 'S/D', 194, 'BD Consolidada Ahorradores '),
(182, 1, '00200069', '', 'GASPAR MONTALVO MAURA', '200069', 500, 0, 3000, 0, 0, 0, 0, 3500, 2450, 2450, 'Puerto de Angel s/n', 'Barrio Atempa', 'Ajalpan', 'S/D', 195, 'BD Consolidada Ahorradores '),
(183, 1, '00200070', '', 'GINEZ GINEZ ADRIAN', '200070', 500, 0, 123076.13, 0, 0, 0, 0, 123576.13, 86503.29, 86503.29, 'sin nombre s/n', 'Santa Maria Monte', 'Vicente Guerrero', '2361126582', 196, 'BD Consolidada Ahorradores '),
(184, 1, '00200071', '', 'GONZALEZ GARCIA CONRADO AUSENCIO', '200071', 0, 0, 51900, 0, 0, 0, 0, 51900, 36330, 36330, 'Xaltepec s/n', 'Xaltepec', 'Zoquitlan', 'S/D', 197, 'BD Consolidada Ahorradores '),
(185, 1, '00200072', '', 'GONZALEZ GIL MARIANO', '200072', 500, 0, 20869.24, 0, 0, 0, 0, 21369.24, 14958.47, 14958.47, 'Morelos num17', 'Barrio Gonzalisco', 'Ajalpan', 'S/D', 198, 'BD Consolidada Ahorradores '),
(186, 1, '00200073', '', 'GONZALEZ MONTALVO RIGOBERTO', '200073', 500, 0, 8500, 0, 0, 0, 0, 9000, 6300, 6300, '4 Oriente 117', 'Centro', 'Tehuacan', 'S/D', 199, 'BD Consolidada Ahorradores '),
(187, 1, '00200074', '', 'GORDILLO JIMENEZ VELINO', '200074', 500, 0, 500000, 0, 0, 0, 0, 500500, 350350, 167930, '16 de septiembre num913', 'Hidalgo', 'Tehuacan', 'S/D', 200, 'BD Consolidada Ahorradores '),
(188, 1, '00200075', '', 'HERNANDEZ ANASTACIO SERAFINA', '200075', 0, 0, 66817.38, 0, 0, 0, 0, 66817.38, 46772.17, 46772.17, 'Callejon Jacarandas num 12', 'Aeropuerto', 'Tehuacan', 'S/D', 201, 'BD Consolidada Ahorradores '),
(189, 1, '00200076', '', 'HERNANDEZ BENITEZ HERON REMIGIO', '200076', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Avenida 5 de mayo num11', 'Centro', 'Cañada Morelos', 'S/D', 202, 'BD Consolidada Ahorradores '),
(190, 1, '00200077', '', 'HERNANDEZ ESPINOZA ALBERTA', '200077', 500, 0, 26780, 0, 0, 0, 0, 27280, 19096, 19096, 'Cerrada de Amdo Nervo num8', 'La Purisima', 'Tehuacan', 'S/D', 203, 'BD Consolidada Ahorradores '),
(191, 1, '00200078', '', 'HERNANDEZ GONZALEZ JUANA', '200078', 0, 0, 90600, 0, 0, 0, 0, 90600, 63420, 63420, 'Vicente Guerrero s/n', 'Villa Nueva', 'Santa Maria Teopoxco', 'S/D', 204, 'BD Consolidada Ahorradores '),
(192, 1, '00200079', '', 'HERNANDEZ HERNANDEZ ARACELI', '200079', 500, 0, 18173.99, 0, 0, 0, 0, 18673.99, 13071.79, 13071.79, '5 norte num110', 'Centro', 'Tehuacan', 'S/D', 205, 'BD Consolidada Ahorradores '),
(193, 1, '00200080', '', 'HERNANDEZ HERNANDEZ MARIA MARGARITA', '200080', 500, 0, 4476.52, 0, 0, 0, 0, 4976.52, 3483.56, 3483.56, 'Priv Atlixco num 1913', 'San Juan Bautista', 'Cuicatlan', '1071257', 206, 'BD Consolidada Ahorradores '),
(194, 1, '00200081', '', 'HERNANDEZ OLAYA GUADALUPE DELFINA', '200081', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Benito Juarez 513', 'Centro', 'Zinacatepec', '012362811431', 207, 'BD Consolidada Ahorradores '),
(195, 1, '00200082', '', 'HERNANDEZ REYES MARIA AGUSTINA', '200082', 500, 36370, 0, 0, 0, 0, 0, 36870, 25809, 25809, 'Priv Miguel Hidalgo num 623 Int 1', 'San Lorenzo Teopilco', 'Tehuacan', 'S/D', 208, 'BD Consolidada Ahorradores '),
(196, 1, '00200083', '', 'HUERTA ALVAREZ ROSA', '200083', 260000, 0, 0, 0, 0, 0, 0, 260000, 182000, 167930, '2 Oriente num 712', 'Centro', 'Tehuacan', 'S/D', 209, 'BD Consolidada Ahorradores '),
(197, 1, '00200084', '', 'HUERTA ROMUALDO ISAAC', '200084', 50500, 0, 0, 0, 0, 0, 0, 50500, 35350, 35350, 'Pino Suarez num 327', 'Jesus Carranza', 'Zinacatepec', 'S/D', 210, 'BD Consolidada Ahorradores '),
(198, 1, '00200085', '', 'JIMENEZ RIVERA SIBILINA', '200085', 500, 0, 158555.13, 0, 0, 0, 0, 159055.13, 111338.59, 111338.59, 'Privada Nacional Lote 49', 'Vista hermosa', 'Teotipilco', 'S/D', 211, 'BD Consolidada Ahorradores '),
(199, 1, '00200086', '', 'JUANA GASPAR MONTALVO', '200086', 500, 0, 33100, 0, 0, 0, 0, 33600, 23520, 23520, 'El mirador s/n', 'El mirado', 'Ajalpan', 'S/D', 212, 'BD Consolidada Ahorradores '),
(200, 1, '00200087', '', 'JUAREZ SANCHEZ CLEMENCIA', '200087', 0, 0, 216500, 0, 0, 0, 0, 216500, 151550, 151550, 'Quinta Privada 6 Oriente num619', 'Quinta Guadalupe', 'Tehuacan', 'S/D', 213, 'BD Consolidada Ahorradores '),
(201, 1, '00200088', '', 'JULITA HERNANDEZ MAGDALENA', '200088', 0, 0, 20300, 0, 0, 0, 0, 20300, 14210, 14210, '16 de Septiembre num 101', 'Zentlapatl', 'Zinacatepec', '012361121232', 214, 'BD Consolidada Ahorradores '),
(202, 1, '00200089', '', 'LADINO GARCIA PATRICIA', '200089', 18815.97, 0, 0, 0, 0, 0, 0, 18815.97, 13171.18, 13171.18, 'Lazaro Cardenas num 904 B', 'El Riego', 'Tehuacan', 'S/D', 215, 'BD Consolidada Ahorradores '),
(203, 1, '00200090', '', 'LARA MARTINEZ GERMAN', '200090', 500, 0, 249547.79, 0, 0, 0, 0, 250047.79, 175033.45, 167930, 'Sor Juana Ines de la Cruz num 3512', 'Fracc Cultural', 'Tehuacan', '012383800433', 216, 'BD Consolidada Ahorradores '),
(204, 1, '00200091', '', 'LEYVA OLMOS CARMELA', '200091', 500, 6020.32, 0, 0, 0, 0, 0, 6520.32, 4564.22, 4564.22, 'Porfirio Diaz num1201', 'Centro', 'Zinacatepec', 'S/D', 217, 'BD Consolidada Ahorradores '),
(205, 1, '00200092', '', 'LEYVA PACHECO GREGORIO', '200092', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Privada Guerrero 806 int5', 'Centro', 'Zinacatepec', 'S/D', 218, 'BD Consolidada Ahorradores '),
(206, 1, '00200093', '', 'LEZAMA FERNANDEZ JUDITH SULLY', '200093', 500, 0, 149587.93, 0, 0, 0, 0, 150087.93, 105061.55, 105061.55, 'Privada de la 6 oriente num 19 int 6', 'Centro', 'Tehuacan', '012383821694', 219, 'BD Consolidada Ahorradores '),
(207, 1, '00200094', '', 'LEZAMA TOBON JOSE', '200094', 0, 0, 150000, 0, 0, 0, 0, 150000, 105000, 105000, 'Callejon Hidalgo no 520', 'La Pedrera', 'Tehuacan', 'S/D', 220, 'BD Consolidada Ahorradores '),
(208, 1, '00200095', '', 'LIMA LEON TEODORO', '200095', 500, 0, 652000, 0, 0, 0, 0, 652500, 456750, 167930, 'Priv 7 sur andador 3 56', 'La purisima', 'Tehuacan', '012383830713', 221, 'BD Consolidada Ahorradores '),
(209, 1, '00200096', '', 'LOPEZ GARCIA ROBERTO', '200096', 60500, 0, 0, 0, 0, 0, 0, 60500, 42350, 42350, '4 Sur num 1120', 'Benito Juarez', 'Tehuacan', 'S/D', 222, 'BD Consolidada Ahorradores '),
(210, 1, '00200097', '', 'LOPEZ GAYOSSO EZEQUIEL', '200097', 500, 5457.46, 0, 0, 0, 0, 0, 5957.46, 4170.22, 4170.22, 'Justo Sierra num3708', 'Cultural', 'Tehuacan', 'S/D', 223, 'BD Consolidada Ahorradores '),
(211, 1, '00200098', '', 'LOPEZ HERNANDEZ GERARDO', '200098', 500, 0, 56083.32, 0, 0, 0, 0, 56583.32, 39608.32, 39608.32, 'Gardenia num 4115', 'Villa Vista', 'Tehuacan', 'S/D', 224, 'BD Consolidada Ahorradores '),
(212, 1, '00200099', '', 'LOPEZ SANCHEZ PETRA', '200099', 50000, 0, 0, 0, 0, 0, 0, 50000, 35000, 35000, 'Puerto de Veracruz 2128', 'Revolucion', 'Tehuacan', 'S/D', 225, 'BD Consolidada Ahorradores '),
(213, 1, '00200100', '', 'LUCAS MORALES LEONARDO', '200100', 500, 2683.06, 8407.17, 0, 0, 0, 0, 11590.23, 8113.16, 8113.16, 'Privada 19 sur num 1913', 'Las Flores', 'Tehuacan', '012383838246', 226, 'BD Consolidada Ahorradores '),
(214, 1, '00200101', '', 'LUNA CARRETO SILVIA', '200101', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Privada Amado Nervo num 331', 'La Purisima', 'Tehuacan', 'S/D', 227, 'BD Consolidada Ahorradores '),
(215, 1, '00200102', '', 'MALCON OROZCO GUADALUPE', '200102', 500, 0, 193886.26, 0, 0, 0, 0, 194386.26, 136070.38, 136070.38, 'Privada la Paz num119', 'Centro', 'Tehuacan', '3823944', 228, 'BD Consolidada Ahorradores '),
(216, 1, '00200103', '', 'MALDONADO QUINTANA RAMON', '200103', 0, 0, 350000, 0, 0, 0, 0, 350000, 245000, 167930, 'De la 6 Oriente num 602', 'Francisco Sarabia', 'Tehuacan', 'S/D', 229, 'BD Consolidada Ahorradores '),
(217, 1, '00200104', '', 'MARCELINO HERNANDEZ CARMELITA JOAQUINA', '200104', 0, 0, 14500, 0, 0, 0, 0, 14500, 10150, 10150, 'Venustiano Carranza num 714', 'Sentlalpal', 'Zinacatepec', 'S/D', 230, 'BD Consolidada Ahorradores '),
(218, 1, '00200105', '', 'MARCELINO HERNANDEZ GORGONIO FELIPE', '200105', 500, 0, 12000, 0, 0, 0, 0, 12500, 8750, 8750, '16 de Septiembre num 504', 'Barr Zentlapatl', 'Zincatepec', 'S/D', 231, 'BD Consolidada Ahorradores '),
(219, 1, '00200106', '', 'MARTINEZ GARCIA CAROLINA', '200106', 150000, 0, 0, 0, 0, 0, 0, 150000, 105000, 105000, 'Hector Lezama Sur Roca 337', 'La Purisima', 'Tehuacan', 'S/D', 232, 'BD Consolidada Ahorradores '),
(220, 1, '00200107', '', 'MARTINEZ JIMENEZ DANIELA', '200107', 0, 0, 1500000, 0, 0, 0, 0, 1500000, 1050000, 167930, 'Biarritz num 116', 'Arcadia', 'Tehuacan', 'S/D', 233, 'BD Consolidada Ahorradores '),
(221, 1, '00200108', '', 'MARTINEZ MORFINEZ MARIA ANGELICA', '200108', 500, 0, 11007, 0, 0, 0, 0, 11507, 8054.9, 8054.9, 'C Matamoros num 10', 'Centro', 'San Gabriel Chilac', 'S/D', 234, 'BD Consolidada Ahorradores '),
(222, 1, '00200109', '', 'MARTINEZ VALERIO MIGUEL ANGEL GERMAN', '200109', 0, 0, 1000000, 0, 0, 0, 0, 1000000, 700000, 167930, 'Priv Biarritz num 116', 'Fracc Arcadia', 'Tehuacan', 'S/D', 235, 'BD Consolidada Ahorradores '),
(223, 1, '00200110', '', 'MENDOZA DIEGO MAGARITA INES', '200110', 500, 0, 9500, 0, 0, 0, 0, 10000, 7000, 7000, 'Venustiano Carranza num 1908', '16 de Marzo', 'Tehuacan', 'S/D', 236, 'BD Consolidada Ahorradores '),
(224, 1, '00200111', '', 'MIGUEL SANTIAGO OMEGA', '200111', 0, 0, 900000, 0, 0, 0, 0, 900000, 630000, 167930, 'Macario Gaxiola edif 27 202', 'U Hab las Armas', 'Azcapotzalco', 'S/D', 237, 'BD Consolidada Ahorradores '),
(225, 1, '00200112', '', 'MOLINA GOMEZ LUCIO', '200112', 442443.53, 0, 0, 0, 0, 0, 0, 442443.53, 309710.47, 167930, '5 sur esq con 11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', '012383830001', 238, 'BD Consolidada Ahorradores '),
(226, 1, '00200113', '', 'MOLINA LOPEZ JULIA AMALIA', '200113', 306928.88, 0, 0, 0, 0, 0, 0, 306928.88, 214850.22, 167930, '11 oriente num 500', 'Nicolas Bravo', 'Tehuacan', '012383830001', 239, 'BD Consolidada Ahorradores '),
(227, 1, '00200114', '', 'MONTALVO ANSELMO AMBROCIO', '200114', 0, 0, 325500, 0, 0, 0, 0, 325500, 227850, 167930, 'Tepexilotla s/n', 'Seccion Tercera', 'Zoquitlan', '2365962097', 240, 'BD Consolidada Ahorradores '),
(228, 1, '00200115', '', 'MORAL CANO GONZALO', '200115', 0, 0, 36600, 0, 0, 0, 0, 36600, 25620, 25620, 'Primera Seccion', 'Barrio Zacapechco', 'Zoquitlan', 'S/D', 241, 'BD Consolidada Ahorradores '),
(229, 1, '00200116', '', 'MORALES JIMENEZ HERMINIA', '200116', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Guadalupe Victoria num1640', 'Aeropuerto', 'Tehuacan', '2381133641', 242, 'BD Consolidada Ahorradores '),
(230, 1, '00200117', '', 'MORALES ROJAS ALFREDO VICTOR', '200117', 500, 238300.12, 0, 0, 0, 0, 0, 238800.12, 167160.08, 167160.08, '12 poniente num617', 'Lazaro Cardena Norte', 'Tehuacan', 'S/D', 243, 'BD Consolidada Ahorradores '),
(231, 1, '00200118', '', 'MORENO ANGELA', '200118', 500, 20000, 159117.63, 0, 0, 0, 0, 179617.63, 125732.34, 125732.34, 'Privada Nacional LT 49A', 'Vista Hermosa', 'Tehuacan', 'S/D', 244, 'BD Consolidada Ahorradores '),
(232, 1, '00200119', '', 'OLAYA ROMERO SOCORRO', '200119', 500, 0, 162900, 0, 0, 0, 0, 163400, 114380, 114380, 'Benito Juarez num513', 'Centro', 'Zinacatepec', 'S/D', 245, 'BD Consolidada Ahorradores '),
(233, 1, '00200120', '', 'OLMOS DORANTES DULCE MARIA', '200120', 500, 0, 50000, 0, 0, 0, 0, 50500, 35350, 35350, 'Juquilita Lote 5', 'Maldonado Colosio', 'Tehuacan', 'S/D', 246, 'BD Consolidada Ahorradores ');
INSERT INTO `consolidadasTemporales` (`idconsolidadasTemporales`, `revisionesTemporales_idrevisionesTemporales`, `nuevoFolioIdentificador`, `folioIdentificadorAnterior`, `nombreAhorrador`, `curp`, `parteSocial`, `cuentasAhorro`, `cuentasInversion`, `depositosGarantia`, `chequesNoCobrados`, `otrosDepositos`, `prestamosACargo`, `saldoNeto100`, `saldoNeto70`, `montoMaximoPago`, `calleYNumero`, `colonia`, `delegacionMunicipio`, `telefono`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(234, 1, '00200121', '', 'OLMOS VALENCIA LEONARDO', '200121', 500, 0, 150000, 0, 0, 0, 0, 150500, 105350, 105350, 'Ocotlamanic s/n', 'Ocotla', 'Coxcatlan', 'S/D', 247, 'BD Consolidada Ahorradores '),
(235, 1, '00200122', '', 'ORTIZ JIMENEZ VIRGINIA ORTENCIA', '200122', 500, 0, 35400, 0, 0, 0, 0, 35900, 25130, 25130, 'Av 5 de mayo num 5', 'Seccion cuarta', 'Zoquitlan', 'S/D', 248, 'BD Consolidada Ahorradores '),
(236, 1, '00200123', '', 'OSORIO GUZMAN HERLINDA', '200123', 0, 0, 350000, 0, 0, 0, 0, 350000, 245000, 167930, 'Del panteon s/n', 'San Juan Atzingo', 'San Gabriel Chilac', 'S/D', 249, 'BD Consolidada Ahorradores '),
(237, 1, '00200124', '', 'PARRA GARRERA MARTHA', '200124', 500, 0, 60000, 0, 0, 0, 0, 60500, 42350, 42350, '13 Oriente num 106', 'Hidalgo', 'Tehuacan', 'S/D', 250, 'BD Consolidada Ahorradores '),
(238, 1, '00200125', '', 'PASTRANA SOLIS FROYLAN', '200125', 500, 3006.44, 0, 0, 0, 0, 0, 3506.44, 2454.51, 2454.51, '18 Poniente num 818', 'Tetizintla', 'Tehuacan', 'S/D', 251, 'BD Consolidada Ahorradores '),
(239, 1, '00200126', '', 'PEREZ MENDEZ MATEO', '200126', 0, 0, 10557652, 0, 0, 0, 0, 10557652, 7390356.4, 167930, 'Reforma norte num 127', 'Centro', 'Tehuacan', 'S/D', 252, 'BD Consolidada Ahorradores '),
(240, 1, '00200127', '', 'PEREZ NAVA ADRIANA', '200127', 500, 0, 31500, 0, 0, 0, 0, 32000, 22400, 22400, 'Corregidora num2', 'San Jose Tilapa', 'Coxcatlan', 'S/D', 253, 'BD Consolidada Ahorradores '),
(241, 1, '00200128', '', 'QUIXTIANO COGQUE MIGUEL', '200128', 0, 0, 410989, 0, 0, 0, 0, 410989, 287692.3, 167930, 'Revolucion num 415', 'Guadalupe', 'Ajalpan', 'S/D', 254, 'BD Consolidada Ahorradores '),
(242, 1, '00200129', '', 'QUIXTIANO TEMAXTE SOFIA', '200129', 500, 0, 68501, 0, 0, 0, 0, 69001, 48300.7, 48300.7, 'Revolucion Poniente num17', 'Centro', 'Ajalpan', 'S/D', 255, 'BD Consolidada Ahorradores '),
(243, 1, '00200130', '', 'RABAGO BALBUENA MARIA CONCEPCION JOSEFINA', '200130', 0, 0, 3650262.43, 0, 0, 0, 0, 3650262.43, 2555183.7, 167930, 'Av Reforma Sur num 317', 'Centro', 'Tehuacan', 'S/D', 256, 'BD Consolidada Ahorradores '),
(244, 1, '00200131', '', 'RAMIREZ BAUTISTA OLGA', '200131', 500, 0, 26050, 0, 0, 0, 0, 26550, 18585, 18585, 'Manuel Hernandez num 804', 'Xaltepec', 'Altepexi', 'S/D', 257, 'BD Consolidada Ahorradores '),
(245, 1, '00200132', '', 'RAMIREZ CABRERA CONCEPCION', '200132', 0, 0, 100000, 0, 0, 0, 0, 100000, 70000, 70000, '10 Poniente num 405', 'Cerritos', 'Tehuacan', 'S/D', 258, 'BD Consolidada Ahorradores '),
(246, 1, '00200133', '', 'RAMIREZ CARRERA MARIA DEL SOCORRO', '200133', 500, 0, 115000, 0, 0, 0, 0, 115500, 80850, 80850, '10 Poniente num407', 'Cerritos', 'Tehuacan', 'S/D', 259, 'BD Consolidada Ahorradores '),
(247, 1, '00200134', '', 'RAMIREZ CORDOVA EULALIA', '200134', 500, 0, 8500, 0, 0, 0, 0, 9000, 6300, 6300, 'Zoquitlan s/n', 'Tercera Seccion', 'Tecpanzcoalco', 'S/D', 260, 'BD Consolidada Ahorradores '),
(248, 1, '00200135', '', 'RAMIREZ DOMINGUEZ GRECIA CAROLINA', '200135', 0, 0, 220000, 0, 0, 0, 0, 220000, 154000, 154000, 'Avenida Ramon Caballero num641', 'San Rafael', 'Tehuacan', 'S/D', 261, 'BD Consolidada Ahorradores '),
(249, 1, '00200136', '', 'RAMIREZ GARCIA NORBERTO', '200136', 500, 0, 100000, 0, 0, 0, 0, 100500, 70350, 70350, 'Seccion seguda num', 'Loma Ixmicapa', 'Zoquitlan', 'S/D', 262, 'BD Consolidada Ahorradores '),
(250, 1, '00200137', '', 'RAMIREZ PAZOS JORGE', '200137', 500, 689335.31, 200000, 0, 0, 0, 0, 889835.31, 622884.72, 167930, 'Prol 1 poniente 3000', 'Fracc Reforma', 'Tehuacan', 'S/D', 263, 'BD Consolidada Ahorradores '),
(251, 1, '00200138', '', 'RAMIREZ VAQUERO ROMUALDO', '200138', 0, 0, 160000, 0, 0, 0, 0, 160000, 112000, 112000, 'Ramon Caballero num 611', 'San Rafael', 'Tehuacan', 'S/D', 264, 'BD Consolidada Ahorradores '),
(252, 1, '00200139', '', 'RCHING RAMIREZ SOCORRO SOLEDAD', '200139', 500, 0, 421223.78, 0, 0, 0, 0, 421723.78, 295206.65, 167930, 'Avenida Reforma Sur sn', 'Guadalupe Hidalgo', 'Tehuacan', '3717275', 265, 'BD Consolidada Ahorradores '),
(253, 1, '00200140', '', 'REYES VENTURA ANGELICA', '200140', 500, 0, 36122.21, 0, 0, 0, 0, 36622.21, 25635.55, 25635.55, 'Independencia num 32', 'Centro', 'Tehuacan', 'S/D', 266, 'BD Consolidada Ahorradores '),
(254, 1, '00200141', '', 'RODRIGUEZ ARCE RICARDA', '200141', 500, 0, 15261.4, 0, 0, 0, 0, 15761.4, 11032.98, 11032.98, 'Ocotlamanic s/n', 'Ocotlamanic', 'Coxcatlan', 'S/D', 267, 'BD Consolidada Ahorradores '),
(255, 1, '00200142', '', 'RODRIGUEZ ARCE TAURINO ANGELES', '200142', 0, 0, 116420.65, 0, 0, 0, 0, 116420.65, 81494.46, 81494.46, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 268, 'BD Consolidada Ahorradores '),
(256, 1, '00200143', '', 'RODRIGUEZ CUELLO ROLANDO', '200143', 0, 0, 147000, 0, 0, 0, 0, 147000, 102900, 102900, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 269, 'BD Consolidada Ahorradores '),
(257, 1, '00200144', '', 'RODRIGUEZ MOLINA ROSA', '200144', 542483.28, 0, 542483.28, 0, 0, 0, 0, 1084966.56, 759476.59, 167930, '11 Ote num 500 Esquina con 5 Sur', 'Nicolas Bravo', 'Tehuacan', 'S/D', 270, 'BD Consolidada Ahorradores '),
(258, 1, '00200145', '', 'ROMERO CID MARIA', '200145', 500, 0, 12200, 0, 0, 0, 0, 12700, 8890, 8890, 'Nacional num 83 1A Secc', 'Nicolas Bravo', 'Tehuacan', 'S/D', 271, 'BD Consolidada Ahorradores '),
(259, 1, '00200146', '', 'ROMERO DUARTE TAURINO CARLOS', '200146', 0, 0, 73651.32, 0, 0, 0, 0, 73651.32, 51555.92, 51555.92, 'Av Rafael Avila Camacho num 227', 'Centro', 'San Gabriel Chilac', 'S/D', 272, 'BD Consolidada Ahorradores '),
(260, 1, '00200147', '', 'ROSALES VILLANUEVA ROSARIO', '200147', 500, 0, 370000, 0, 0, 0, 0, 370500, 259350, 167930, 'Heroes de Nacozari Norte num 124 Int 1', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 273, 'BD Consolidada Ahorradores '),
(261, 1, '00200148', '', 'RUIZ FLORES MARTHA NANCY Y/O FLORES GARCIA PAULINA', '200148', 500, 30000, 38000, 0, 0, 0, 0, 68500, 47950, 47950, 'Av Nicolas Bravo num 702', 'Nicolas Bravo', 'Tehuacan', 'S/D', 274, 'BD Consolidada Ahorradores '),
(262, 1, '00200149', '', 'SAENZ ESCALANTE GUSTAVO', '200149', 12770000, 0, 1500000, 0, 0, 0, 0, 14270000, 9989000, 167930, 'Bould Ingeniero Pastor Rouaix num 700', 'Benito Juarez', 'Tehuacan', 'S/D', 275, 'BD Consolidada Ahorradores '),
(263, 1, '00200150', '', 'SALINAS FLORES HERIBERTO CARLOS', '200150', 500, 61310.56, 54000, 0, 0, 0, 0, 115810.56, 81067.39, 81067.39, '5 norte num642', 'Cerritos', 'Tehuacan', 'S/D', 276, 'BD Consolidada Ahorradores '),
(264, 1, '00200151', '', 'SANCHEZ COELLO CATALINA JAQUELINA', '200151', 500, 0, 17900, 0, 0, 0, 0, 18400, 12880, 12880, 'Zoquitlan s/n', 'Tecpantzacualco', 'Zoquitlan', 'S/D', 277, 'BD Consolidada Ahorradores '),
(265, 1, '00200152', '', 'SANCHEZ HERNANDEZ CARLOS', '200152', 500, 5141.7, 0, 0, 0, 0, 0, 5641.7, 3949.19, 3949.19, 'Republica de Panama num 2325', 'America', 'Cuicatlan', 'S/D', 278, 'BD Consolidada Ahorradores '),
(266, 1, '00200153', '', 'SANCHEZ MENDEZ FAUSTINO', '200153', 500, 0, 50500, 0, 0, 0, 0, 51000, 35700, 35700, 'Ocotlamanic s/n', 'Ocotlomanic', 'Coxcatlan', 'S/D', 279, 'BD Consolidada Ahorradores '),
(267, 1, '00200154', '', 'SANCHEZ MONTALVO CATALINA', '200154', 500, 12006.58, 0, 0, 0, 0, 0, 12506.58, 8754.61, 8754.61, 'Salinas num 28', 'Chalma', 'Tehuacan', 'S/D', 280, 'BD Consolidada Ahorradores '),
(268, 1, '00200155', '', 'SANCHEZ MONTALVO FLORENCIO', '200155', 500, 0, 25540.41, 0, 0, 0, 0, 26040.41, 18228.29, 18228.29, '7 Sur 1106 Santa Maria 1106', 'Centro', 'Tehuacan', 'S/D', 281, 'BD Consolidada Ahorradores '),
(269, 1, '00200156', '', 'SANCHEZ RAMOS LETICIA', '200156', 500, 0, 31000, 0, 0, 0, 0, 31500, 22050, 22050, 'Callejon Pachuca num 5', 'Hidalgo Tehuantepec', 'Tehuacan', 'S/D', 282, 'BD Consolidada Ahorradores '),
(270, 1, '00200157', '', 'SANCHEZ ROMERO ARCENIO IGNACIO', '200157', 0, 0, 15975, 0, 0, 0, 0, 15975, 11182.5, 11182.5, 'Vicente Guerrero lt-6', '21 de Marzo', 'Tehuacan', 'S/D', 283, 'BD Consolidada Ahorradores '),
(271, 1, '00200158', '', 'SANCHEZ SANCHEZ LEOPOLDO', '200158', 500000, 0, 0, 0, 0, 0, 0, 500000, 350000, 167930, 'Nicolas Bravo num 19 A', 'Loc San Jose Ixtapa', 'Cañada Morelos', 'S/D', 284, 'BD Consolidada Ahorradores '),
(272, 1, '00200159', '', 'SANDOVAL ATILANO GILBERTO', '200159', 500, 0, 35000, 0, 0, 0, 0, 35500, 24850, 24850, 'Tepeaca de Zaragoza s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 285, 'BD Consolidada Ahorradores '),
(273, 1, '00200160', '', 'SANDOVAL GONZALEZ EMILIANO', '200160', 500, 0, 36000, 0, 0, 0, 0, 36500, 25550, 25550, 'Domicilio conocido s/n', 'Tepeaca de Zaragoza', 'Ajalpan', 'S/D', 286, 'BD Consolidada Ahorradores '),
(274, 1, '00200161', '', 'SANDOVAL QUIAHUA LEONARDO', '200161', 90500, 0, 0, 0, 0, 0, 0, 90500, 63350, 63350, 'San Bartolo s/n', 'Telpatlan', 'Vicente Guerrero', 'S/D', 287, 'BD Consolidada Ahorradores '),
(275, 1, '00200162', '', 'SANTIAGO LOPEZ EMMA MARIA', '200162', 0, 0, 643500, 0, 0, 0, 0, 643500, 450450, 167930, 'Andador 3/1', 'La Purisima', 'Tehuacan', 'S/D', 288, 'BD Consolidada Ahorradores '),
(276, 1, '00200163', '', 'SERAFIN MONTALVO EMMA', '200163', 500, 0, 35000, 0, 0, 0, 0, 35500, 24850, 24850, 'Playa Vicente s/n', 'Playa Vicente', 'Ajalpan', 'S/D', 289, 'BD Consolidada Ahorradores '),
(277, 1, '00200164', '', 'TAPIA HERNANDEZ FILADELFIA', '200164', 500, 0, 22253.42, 0, 0, 0, 0, 22753.42, 15927.39, 15927.39, 'Reforma num 89', 'San Jose del Chilar', 'Cuicatlan', 'S/D', 290, 'BD Consolidada Ahorradores '),
(278, 1, '00200165', '', 'TEMOXTLE GARCIA EUFEMIA', '200165', 500, 15003.28, 0, 0, 0, 0, 0, 15503.28, 10852.3, 10852.3, 'Av Morelos num 2', 'Zacapanga', 'Vicente Guerrero', '23610445555', 291, 'BD Consolidada Ahorradores '),
(279, 1, '00200166', '', 'TENORIO CARRILLO LUZ MARIA', '200166', 500, 0, 93990, 0, 0, 0, 0, 94490, 66143, 66143, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', '012383831718', 292, 'BD Consolidada Ahorradores '),
(280, 1, '00200167', '', 'TENORIO GARCIA SANDRA LUCY', '200167', 500, 0, 21145, 0, 0, 0, 0, 21645, 15151.5, 15151.5, 'Av Miguel Hidalgo num 209', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 293, 'BD Consolidada Ahorradores '),
(281, 1, '00200168', '', 'TORRES ALVA GUILLERMO', '200168', 500, 0, 26122.21, 0, 0, 0, 0, 26622.21, 18635.55, 18635.55, 'Dom Conocido s/n', 'Seccion Cuarta', 'Zoquitlan', 'S/D', 294, 'BD Consolidada Ahorradores '),
(282, 1, '00200169', '', 'TRUJILLO MORENO RAFAELA', '200169', 0, 0, 43812.4, 0, 0, 0, 0, 43812.4, 30668.68, 30668.68, '2 Poniente num 1617', 'Aquiles Serdan', 'Tehuacan', 'S/D', 295, 'BD Consolidada Ahorradores '),
(283, 1, '00200170', '', 'VALENCIA PEREZ ANGELA', '200170', 500, 0, 14591, 0, 0, 0, 0, 15091, 10563.7, 10563.7, 'Centenario num 42', 'Centro', 'San Jeronimo Teocatl', 'S/D', 296, 'BD Consolidada Ahorradores '),
(284, 1, '00200171', '', 'VALERIO FUENTES CAMILA MARINA', '200171', 0, 0, 159000, 0, 0, 0, 0, 159000, 111300, 111300, 'Av 7 sur num 205', 'Cristo Rey', 'Santiago Miahuatlan', 'S/D', 297, 'BD Consolidada Ahorradores '),
(285, 1, '00200172', '', 'VARELA ROMAN MARCO ANTONIO', '200172', 500, 0, 162000, 0, 0, 0, 0, 162500, 113750, 113750, '8 Pte num Edficio 404 Int DTO 303', 'Fovisst Garci Crespo', 'Tehuacan', 'S/D', 298, 'BD Consolidada Ahorradores '),
(286, 1, '00200173', '', 'VARELA ROMAN MARIA TERESA', '200173', 500, 0, 1101000, 0, 0, 0, 0, 1101500, 771050, 167930, '3 oriente', 'Centro', 'Tehuacan', '3835231', 299, 'BD Consolidada Ahorradores '),
(287, 1, '00200174', '', 'VARELA ROMAN SERAFINA ENCARNACION', '200174', 500, 350188.4, 346071.06, 0, 0, 0, 0, 696759.46, 487731.62, 167930, '3 Norte num 1612', 'Francisco Sarabia', 'Tehuacan', 'S/D', 300, 'BD Consolidada Ahorradores '),
(288, 1, '00200175', '', 'VARILLAS CASTRO JOSE EDUARDO FAUSTO', '200175', 0, 0, 230994.82, 0, 0, 0, 0, 230994.82, 161696.37, 161696.37, 'Independencia num 4', 'San Jose Buena Vista', 'Tlacotepec', 'S/D', 301, 'BD Consolidada Ahorradores '),
(289, 1, '00200176', '', 'VEGA COELLO ANDRES ELEAZAR', '200176', 500, 0, 30000, 0, 0, 0, 0, 30500, 21350, 21350, 'Obregon s/n', 'Segunda Seccion', 'Zoquitlan', 'S/D', 302, 'BD Consolidada Ahorradores '),
(290, 1, '00200177', '', 'VIVEROS MONTALVO JORGIN ALICIA', '200177', 500, 0, 5000, 0, 0, 0, 0, 5500, 3850, 3850, 'Av Nacional num 12', 'Segunda Seccion', 'Zoquitlan', 'S/D', 303, 'BD Consolidada Ahorradores '),
(291, 1, '00200178', '', 'ZAQUEROS COELLO ERASTO', '200178', 0, 0, 15000, 0, 0, 0, 0, 15000, 10500, 10500, 'Cacaloc s/n', 'Xala', 'Zoquitlan', 'S/D', 304, 'BD Consolidada Ahorradores '),
(292, 1, '00200179', '', 'ZARATE BARRAGAN EPIGMENIO', '200179', 0, 0, 330767.75, 0, 0, 0, 0, 330767.75, 231537.43, 167930, '7 Oriente num112', 'Francisco I Madero', 'Tepanco de Lopez', 'S/D', 305, 'BD Consolidada Ahorradores '),
(293, 1, '00200180', '', 'ZARATE RAMOS MARGARITA', '200180', 500, 15000, 37874, 0, 0, 0, 0, 53374, 37361.8, 37361.8, 'Nuevo Leon Sur num1914', 'Mexico', 'Tehuacan', 'S/D', 306, 'BD Consolidada Ahorradores '),
(294, 1, '00300001', '', 'AGUIRRE MORALES ERIKA', '300001', 500, 1939.79, 0, 0, 0, 0, 0, 2439.79, 1707.85, 1707.85, '5 de Mayo 91', 'Monte Chiquito', 'Santiago Miahuatlan', 'S/D', 307, 'BD Consolidada Ahorradores '),
(295, 1, '00300002', '', 'ALTA ARANDIA LEONOR', '300002', 500, 0, 3000, 0, 0, 0, 0, 3500, 2450, 2450, '28 Oriente 534', 'Santiago Tula', 'Tehuacan', 'S/D', 308, 'BD Consolidada Ahorradores '),
(296, 1, '00300003', '', 'ALTA MARTINEZ TERESA', '300003', 500, 0, 15826.12, 0, 0, 0, 0, 16326.12, 11428.28, 11428.28, 'Agua Axoxopan 2100 B', 'Villas Agua Blanca', 'Tehuacan', 'S/D', 309, 'BD Consolidada Ahorradores '),
(297, 1, '00300004', '', 'ALVARADO SOLANO MANUELA HORTENCIA', '300004', 500, 0, 222000, 0, 0, 0, 0, 222500, 155750, 155750, '3 Sur 1301', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 310, 'BD Consolidada Ahorradores '),
(298, 1, '00300005', '', 'ANASTACIO ALFONSO HERMELINDO', '300005', 500, 0, 351386.26, 0, 0, 0, 0, 351886.26, 246320.38, 167930, '17 de Septiembre 28', 'Hidalgo', 'Teotitlan', 'S/D', 311, 'BD Consolidada Ahorradores '),
(299, 1, '00300006', '', 'ANDRADE JUSTINIANO MINERVA', '300006', 500, 10383.63, 0, 0, 0, 0, 0, 10883.63, 7618.54, 7618.54, '4 Sur 702', 'Centro', 'Tecamachalco', 'S/D', 312, 'BD Consolidada Ahorradores '),
(300, 1, '00300007', '', 'APOLINAR PACHECO PABLO', '300007', 500, 0, 97500, 0, 0, 0, 0, 98000, 68600, 68600, 'Vicente Guerrero 1108', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 313, 'BD Consolidada Ahorradores '),
(301, 1, '00300008', '', 'ARISTA HERNANDEZ CRISTINA', '300008', 500, 0, 186824.73, 0, 0, 0, 0, 187324.73, 131127.31, 131127.31, 'Nahoas 17', 'Ancon', 'La Paz Mexico', 'S/D', 314, 'BD Consolidada Ahorradores '),
(302, 1, '00300009', '', 'ARISTA HERNANDEZ HERLINDA', '300009', 500, 0, 179713.06, 0, 0, 0, 0, 180213.06, 126149.14, 126149.14, 'Buena Vista 2512', 'El Humilladero', 'Tehuacan', 'S/D', 315, 'BD Consolidada Ahorradores '),
(303, 1, '00300010', '', 'ATENOGENEZ GUERRERO MICAELA', '300010', 500, 0, 8796.31, 0, 0, 0, 0, 9296.31, 6507.42, 6507.42, 'Casa Blanca 1', 'San Pedro Acoquiaco', 'Tehuacan', 'S/D', 316, 'BD Consolidada Ahorradores '),
(304, 1, '00300011', '', 'BARRAGAN GERALDO HIPOLITO', '300011', 500, 11464.94, 0, 0, 0, 0, 0, 11964.94, 8375.46, 8375.46, '6 Sur', 'Marcos Necoxtla', 'Tehuacan', 'S/D', 317, 'BD Consolidada Ahorradores '),
(305, 1, '00300012', '', 'BARRAGAN RIVERA CELIA CONCEPCION', '300012', 500, 10737.08, 0, 0, 0, 0, 0, 11237.08, 7865.96, 7865.96, 'Av Nacional Oriente 111', 'Maria Pinosuarez', 'Tehuacan', 'S/D', 318, 'BD Consolidada Ahorradores '),
(306, 1, '00300013', '', 'BAUTISTA OLIVARES CATALINA AVERTINA', '300013', 500, 52000, 0, 0, 0, 0, 0, 52500, 36750, 36750, 'San Luis Temalacayuca', 'Luis Temalacayuca', 'Tepanco de Lopez', 'S/D', 319, 'BD Consolidada Ahorradores '),
(307, 1, '00300014', '', 'BOLAÑOS CORTES CLAUDIA', '300014', 500, 2879.15, 0, 0, 0, 0, 0, 3379.15, 2365.41, 2365.41, 'Miguel Hidalgo 14', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 320, 'BD Consolidada Ahorradores '),
(308, 1, '00300015', '', 'BRAVO HERNANDEZ RICARDA', '300015', 500, 0, 95000, 0, 0, 0, 0, 95500, 66850, 66850, '25 Oriente 923', 'Nicolas Bravo 3ra Se', 'Tehuacan', 'S/D', 321, 'BD Consolidada Ahorradores '),
(309, 1, '00300016', '', 'CAMACHO TORRES JUAN FRANCISCO', '300016', 500, 0, 70000, 0, 0, 0, 0, 70500, 49350, 49350, 'Prol 4 Sur 2100', 'Industrial', 'Santa Maria Coapan', 'S/D', 322, 'BD Consolidada Ahorradores '),
(310, 1, '00300017', '', 'CARPINTEYRO DE JESUS HORTENCIA', '300017', 500, 0, 11479.4, 0, 0, 0, 0, 11979.4, 8385.58, 8385.58, 'Av 15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 323, 'BD Consolidada Ahorradores '),
(311, 1, '00300018', '', 'CARRERA JUAREZ IVON', '300018', 500, 218.43, 30000, 0, 0, 0, 0, 30718.43, 21502.9, 21502.9, 'Iturbide 124', 'Tepanco de Lopez', 'Tlacotepec', 'S/D', 324, 'BD Consolidada Ahorradores '),
(312, 1, '00300019', '', 'CASTAÑEDA MENDEZ CATALINA', '300019', 500, 3794.79, 0, 0, 0, 0, 0, 4294.79, 3006.35, 3006.35, 'Dalia 4605', 'Antonio Viveros', 'Tehuacan', 'S/D', 325, 'BD Consolidada Ahorradores '),
(313, 1, '00300020', '', 'CASTAÑEDA VALENCIA GREGORIO', '300020', 500, 2134, 38500, 0, 0, 0, 0, 41134, 28793.8, 28793.8, 'Av Hidalgo 45', 'Cuayucatepec', 'Tehuacan', 'S/D', 326, 'BD Consolidada Ahorradores '),
(314, 1, '00300021', '', 'CASTILLO PEREZ CARLOS', '300021', 500, 12249.93, 0, 0, 0, 0, 0, 12749.93, 8924.95, 8924.95, 'Sagrado Corazon de Jesus 7', 'Zentlapatl', 'Zinacatepec', 'S/D', 327, 'BD Consolidada Ahorradores '),
(315, 1, '00300022', '', 'CECILIO EUSEVIO GENOVEVA', '300022', 500, 24777.18, 0, 0, 0, 0, 0, 25277.18, 17694.03, 17694.03, 'Juarez Poniente 138', 'Maria Coapan', 'Tehuacan', 'S/D', 328, 'BD Consolidada Ahorradores '),
(316, 1, '00300023', '', 'CLEMENTE ROMERO GUADALUPE CARMEN', '300023', 500, 0, 11557.5, 0, 0, 0, 0, 12057.5, 8440.25, 8440.25, '7 Oriente 4', 'San Miguel', 'Santiago Miahuatlan', 'S/D', 329, 'BD Consolidada Ahorradores '),
(317, 1, '00300024', '', 'CONTRERAS PACHECO CATALINA', '300024', 500, 0, 100001, 0, 0, 0, 0, 100501, 70350.7, 70350.7, '25 de Febrero 919', 'Observatorio', 'Tepanco de Lopez', '2381272213', 330, 'BD Consolidada Ahorradores '),
(318, 1, '00300025', '', 'CONTRERAS VAZQUEZ OCOTLAN', '300025', 500, 966.51, 29837.17, 0, 0, 0, 0, 31303.68, 21912.58, 21912.58, 'Leon Guzman 334', 'Reforma', 'Tehuacan', 'S/D', 331, 'BD Consolidada Ahorradores '),
(319, 1, '00300026', '', 'CORTES DOLORES MARCELA RAQUEL', '300026', 500, 2268.41, 0, 0, 0, 0, 0, 2768.41, 1937.89, 1937.89, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 332, 'BD Consolidada Ahorradores '),
(320, 1, '00300027', '', 'CORTEZ PEREZ ALBERTINA', '300027', 500, 6497.61, 0, 0, 0, 0, 0, 6997.61, 4898.33, 4898.33, 'Viente Guerrero 155', 'San Lorezno Teopilco', 'Tehuacan', 'S/D', 333, 'BD Consolidada Ahorradores '),
(321, 1, '00300028', '', 'CORTEZ RAMIREZ ROSA', '300028', 500, 6030.52, 0, 0, 0, 0, 0, 6530.52, 4571.36, 4571.36, '7 Poniente 230', 'La Pedrera', 'Tehuacan', 'S/D', 334, 'BD Consolidada Ahorradores '),
(322, 1, '00300029', '', 'CRUZ DE LA CRUZ JOSE ALFREDO', '300029', 500, 5494.6, 0, 0, 0, 0, 0, 5994.6, 4196.22, 4196.22, 'Centenario 500', 'Hidalgo', 'Tehuacan', 'S/D', 335, 'BD Consolidada Ahorradores '),
(323, 1, '00300030', '', 'CRUZ VILLEGAS ERNESTINA LEONOR', '300030', 500, 0, 46000, 0, 0, 0, 0, 46500, 32550, 32550, 'Privada 25 dur 123', 'El Rosario', 'Tehuacan', 'S/D', 336, 'BD Consolidada Ahorradores '),
(324, 1, '00300031', '', 'DE JESUS MENDOZA GENOVEBA MARGARITA', '300031', 500, 0, 99500, 0, 0, 0, 0, 100000, 70000, 70000, '15 de Septiembre 36', 'Santa Clara', 'Santiago Miahuatlan', 'S/D', 337, 'BD Consolidada Ahorradores '),
(325, 1, '00300032', '', 'DE LA CRUZ ZUÑIGA EDITH', '300032', 0, 23280.54, 0, 0, 0, 0, 0, 23280.54, 16296.38, 16296.38, '17 Sur 703', 'San Sebastian', 'Tecamachalco', 'S/D', 338, 'BD Consolidada Ahorradores '),
(326, 1, '00300033', '', 'DOMINGUEZ LUCAS ROSALIA', '300033', 500, 8980.8, 0, 0, 0, 0, 0, 9480.8, 6636.56, 6636.56, '22 Poniente 2416', 'San Rafael', 'Ahuatempan', '2383922537', 339, 'BD Consolidada Ahorradores '),
(327, 1, '00300034', '', 'ENRIQUE BRAVO CECILIA', '300034', 0, 0, 15500, 0, 0, 0, 0, 15500, 10850, 10850, 'Isabel la catolica 725', 'Morelos', 'Tehuacan', 'S/D', 340, 'BD Consolidada Ahorradores '),
(328, 1, '00300035', '', 'ESPINOZA PACHECO FRANCISCO CONSTANTINO', '300035', 500, 0, 21000, 0, 0, 0, 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 341, 'BD Consolidada Ahorradores '),
(329, 1, '00300036', '', 'FLORES RODRIGUEZ ELIAS', '300036', 0, 0, 179184.99, 0, 0, 0, 0, 179184.99, 125429.49, 125429.49, '11 Norte 113', 'Independencia', 'Tehuacan', 'S/D', 342, 'BD Consolidada Ahorradores '),
(330, 1, '00300037', '', 'FLORES RODRIGUEZ JAVIER', '300037', 0, 0, 600000, 0, 0, 0, 0, 600000, 420000, 167930, '7 Norte 2000', 'Emiliano Zapata', 'Tehuacan', 'S/D', 343, 'BD Consolidada Ahorradores '),
(331, 1, '00300038', '', 'FLORES VERA PATRICIA', '300038', 500, 9096.22, 26660.81, 0, 0, 0, 0, 36257.03, 25379.92, 25379.92, 'Av Zacatecas 4', 'Tlacuitlapan', 'Tlacotepec', 'S/D', 344, 'BD Consolidada Ahorradores '),
(332, 1, '00300039', '', 'FLORES VERA RUFINA', '300039', 0, 34467.4, 0, 0, 0, 0, 0, 34467.4, 24127.18, 24127.18, '6 Sur 3', 'Seccion Tercera', 'Tlacotepec', 'S/D', 345, 'BD Consolidada Ahorradores '),
(333, 1, '00300040', '', 'FUENTES GONZALEZ ABELINO NICOLAS', '300040', 500, 500, 400, 0, 0, 0, 0, 1400, 980, 980, 'Mariano Matamoros 120', 'Centro', 'San Gabriel Chilac', 'S/D', 346, 'BD Consolidada Ahorradores '),
(334, 1, '00300041', '', 'FUENTES NARVAEZ JULIANA', '300041', 500, 1613.51, 0, 0, 0, 0, 0, 2113.51, 1479.46, 1479.46, 'Sonora Sur 1504', 'Mexico Sur', 'Tehuacan', '3921107', 347, 'BD Consolidada Ahorradores '),
(335, 1, '00300042', '', 'GARCIA CHAVEZ DIANA ASUNCION', '300042', 500, 10579.71, 0, 0, 0, 0, 0, 11079.71, 7755.8, 7755.8, 'Priv Las Dalias 8', 'El Eden', 'Tehuacan', '2381027787', 348, 'BD Consolidada Ahorradores '),
(336, 1, '00300043', '', 'GARCIA CRUZ EUFEMIA', '300043', 0, 1620.14, 0, 0, 0, 0, 0, 1620.14, 1134.1, 1134.1, '14 Pte 807 Int A', 'SanRafael', 'Tehuacan', 'S/D', 349, 'BD Consolidada Ahorradores '),
(337, 1, '00300044', '', 'GARCIA DE LA LUZ XOCHITL', '300044', 500, 3007.33, 0, 0, 0, 0, 0, 3507.33, 2455.13, 2455.13, 'Alvaro Obregon 50', 'Centro', 'Coxcatlan', 'S/D', 350, 'BD Consolidada Ahorradores '),
(338, 1, '00300045', '', 'GARCIA FLORES ANTONINA TEODULA', '300045', 0, 25000, 0, 0, 0, 0, 0, 25000, 17500, 17500, '15 Norte 108', 'Obrero Peñafiel', 'Tehuacan', 'S/D', 351, 'BD Consolidada Ahorradores '),
(339, 1, '00300046', '', 'GARCIA GARCIA CLAUDIA', '300046', 500, 8024.18, 2229.68, 0, 0, 0, 0, 10753.86, 7527.7, 7527.7, 'Miguel Hidalgo 2331', 'America', 'Tehuacan', 'S/D', 352, 'BD Consolidada Ahorradores '),
(340, 1, '00300047', '', 'GARCIA GONZALEZ MARIA ALICIA SOTERA', '300047', 500, 50420.38, 0, 0, 0, 0, 0, 50920.38, 35644.27, 35644.27, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 353, 'BD Consolidada Ahorradores '),
(341, 1, '00300048', '', 'GARCIA HERNANDEZ MARIO', '300048', 500, 0, 156557.48, 0, 0, 0, 0, 157057.48, 109940.24, 109940.24, '11 Sur 511', 'La Purisima', 'Tehuacan', 'S/D', 354, 'BD Consolidada Ahorradores '),
(342, 1, '00300049', '', 'GARCIA MARTINEZ FELICITAS', '300049', 500, 0, 5000, 0, 0, 0, 0, 5500, 3850, 3850, '15 Sur 318', 'La Purisima', 'Tehuacan', 'S/D', 355, 'BD Consolidada Ahorradores '),
(343, 1, '00300050', '', 'GARCIA REYES ELENA', '300050', 500, 0, 1867.84, 0, 0, 0, 0, 2367.84, 1657.49, 1657.49, '26 Sur 2526', '3 de Mayo', 'Tehuacan', 'S/D', 356, 'BD Consolidada Ahorradores '),
(344, 1, '00300051', '', 'GARCIA REYES ZEFERINO', '300051', 500, 0, 7315, 0, 0, 0, 0, 7815, 5470.5, 5470.5, '3A priv De la 26 sur 2604', '3 de Mayo', 'Tehuacan', 'S/D', 357, 'BD Consolidada Ahorradores '),
(345, 1, '00300052', '', 'GARCIA RODRIGUEZ IGNACIO FRANCISCO', '300052', 500, 0, 61000, 0, 0, 0, 0, 61500, 43050, 43050, 'Oriente', 'Lomas de Romero', 'Tecamachalco', 'S/D', 358, 'BD Consolidada Ahorradores '),
(346, 1, '00300053', '', 'GARCIA SORCIA ENRIQUETA', '300053', 500, 0, 17132.71, 0, 0, 0, 0, 17632.71, 12342.9, 12342.9, 'Alvaro Obregon 817', 'Francisco Sarabia', 'Tehuacan', 'S/D', 359, 'BD Consolidada Ahorradores '),
(347, 1, '00300054', '', 'GIL ALVARADO MERCEDES', '300054', 500, 7424.63, 10000, 0, 0, 0, 0, 17924.63, 12547.24, 12547.24, 'Adolfo Lopez Mateos 804', '16 de Marzo', 'Tehuacan', 'S/D', 360, 'BD Consolidada Ahorradores '),
(348, 1, '00300055', '', 'GOMEZ RODRIGUEZ SERGIO', '300055', 0, 0, 50001, 0, 0, 0, 0, 50001, 35000.7, 35000.7, '23 Sur 2314', 'Granjas de Oriente', 'Tehuacan', 'S/D', 361, 'BD Consolidada Ahorradores '),
(349, 1, '00300056', '', 'GONZALES MORALES MOISES LUIS', '300056', 500, 0, 15000, 0, 0, 0, 0, 15500, 10850, 10850, 'Allende Poniente 104', 'Maria Coapan', 'Tehuacan', 'S/D', 362, 'BD Consolidada Ahorradores '),
(350, 1, '00300057', '', 'GONZALEZ BAUTISTA FRANCISCO', '300057', 500, 10962.28, 0, 0, 0, 0, 0, 11462.28, 8023.6, 8023.6, 'Priv 2 sur 5', 'Nativitas Cuautempan', 'Coyotepec', 'S/D', 363, 'BD Consolidada Ahorradores '),
(351, 1, '00300058', '', 'GONZALEZ VAZQUEZ MARIA YOLANDA', '300058', 500, 0, 86592.13, 0, 0, 0, 0, 87092.13, 60964.49, 60964.49, '3 Oriente 506 Int 6', 'Centro', 'Tehuacan', 'S/D', 364, 'BD Consolidada Ahorradores '),
(352, 1, '00300059', '', 'GUZMAN MENDEZ FLOR DE MARIA', '300059', 500, 21106.66, 0, 0, 0, 0, 0, 21606.66, 15124.66, 15124.66, 'San Luis Potosi 4', 'Tlacotepec', 'Tlacotepec', 'S/D', 365, 'BD Consolidada Ahorradores '),
(353, 1, '00300060', '', 'HERNANDEZ ANGEL LETICIA', '300060', 500, 5000, 0, 0, 0, 0, 0, 5500, 3850, 3850, 'Guerrero 700', 'Francisco I Madero', 'Chapulco', 'S/D', 366, 'BD Consolidada Ahorradores '),
(354, 1, '00300061', '', 'HERNANDEZ CRUZ JUAN', '300061', 0, 0, 1345000, 0, 0, 0, 0, 1345000, 941500, 167930, 'Lerdo de Tejada 3', 'Tilapa', 'Coxcatlan', 'S/D', 367, 'BD Consolidada Ahorradores '),
(355, 1, '00300062', '', 'HERNANDEZ GARCI CATALINA', '300062', 500, 13402.91, 0, 0, 0, 0, 0, 13902.91, 9732.04, 9732.04, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 368, 'BD Consolidada Ahorradores '),
(356, 1, '00300063', '', 'HERNANDEZ MARISCAL GLORIA', '300063', 500, 2584.99, 0, 0, 0, 0, 0, 3084.99, 2159.49, 2159.49, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 369, 'BD Consolidada Ahorradores '),
(357, 1, '00300064', '', 'HERNANDEZ MARISCAL GUADALUPE', '300064', 500, 0, 24173.06, 0, 0, 0, 0, 24673.06, 17271.14, 17271.14, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 370, 'BD Consolidada Ahorradores '),
(358, 1, '00300065', '', 'HERNANDEZ MARISCAL JUAN MANUEL', '300065', 500, 632.63, 2435.69, 0, 0, 0, 0, 3568.32, 2497.82, 2497.82, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 371, 'BD Consolidada Ahorradores '),
(359, 1, '00300066', '', 'IBAÑEZ DURAN RUPERTO', '300066', 500, 17700, 0, 0, 0, 0, 0, 18200, 12740, 12740, 'Conocido ', 'Catarina Otzolotepec', 'Tehuacan', 'S/D', 372, 'BD Consolidada Ahorradores '),
(360, 1, '00300067', '', 'INIESTRA HERRERA AMELIA', '300067', 500, 0, 60000, 0, 0, 0, 0, 60500, 42350, 42350, '16 Poniente 2809', 'San Rafael', 'Tehuacan', '3922425', 373, 'BD Consolidada Ahorradores '),
(361, 1, '00300068', '', 'JIMENEZ HUERTA NORBERTA', '300068', 500, 7835.87, 0, 0, 0, 0, 0, 8335.87, 5835.11, 5835.11, 'Venustiano Carranza no 1316', 'Libertad', 'Tehuacan', 'S/D', 374, 'BD Consolidada Ahorradores '),
(362, 1, '00300069', '', 'JIMENEZ PEREZ MELITON', '300069', 500, 41054.1, 0, 0, 0, 0, 0, 41554.1, 29087.87, 29087.87, '15 de Mayo 52', 'San Isidro', 'Santiago Miahuatlan', 'S/D', 375, 'BD Consolidada Ahorradores '),
(363, 1, '00300070', '', 'JUAREZ MARTINEZ ROSA MARIA', '300070', 500, 50264.83, 0, 0, 0, 0, 0, 50764.83, 35535.38, 35535.38, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 376, 'BD Consolidada Ahorradores '),
(364, 1, '00300071', '', 'LEINES ANDRADE CRISTINA', '300071', 0, 5840.36, 24735.9, 0, 0, 0, 0, 30576.26, 21403.38, 21403.38, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 377, 'BD Consolidada Ahorradores '),
(365, 1, '00300072', '', 'LEYNES HERNANDEZ FRANCISCA', '300072', 0, 0, 6922.72, 0, 0, 0, 0, 6922.72, 4845.9, 4845.9, 'Melchor Ocampo', 'Cuayucatepec', 'Tehuacan', 'S/D', 378, 'BD Consolidada Ahorradores '),
(366, 1, '00300073', '', 'LEYVA ROMERO RUTILD ANGELES', '300073', 500, 0, 30000, 0, 0, 0, 0, 30500, 21350, 21350, 'Av Guerrero 806 Int 7', 'Centro', 'Zinacatepec', 'S/D', 379, 'BD Consolidada Ahorradores '),
(367, 1, '00300074', '', 'LOPEZ GIL MARIO MIGUEL', '300074', 0, 0, 750000, 0, 0, 0, 0, 750000, 525000, 167930, 'Centenario 902', 'Guadalupe Hidalgo', 'Tehuacan', 'S/D', 380, 'BD Consolidada Ahorradores '),
(368, 1, '00300075', '', 'LOPEZ LOPEZ GENARO', '300075', 500, 10543.42, 0, 0, 0, 0, 0, 11043.42, 7730.39, 7730.39, 'La paz 1913', 'La Paz', 'S/D', 'S/D', 381, 'BD Consolidada Ahorradores '),
(369, 1, '00300076', '', 'LOPEZ MENDEZ GUADALUPE', '300076', 500, 14346.14, 0, 0, 0, 0, 0, 14846.14, 10392.3, 10392.3, '4 Poniente 1614 Int 4A', 'Aquiles Serdan', 'Tehuacan', 'S/D', 382, 'BD Consolidada Ahorradores '),
(370, 1, '00300077', '', 'LOPEZ VALERIO DOLORES AUREA TERESA', '300077', 500, 13958.05, 10000, 0, 0, 0, 0, 24458.05, 17120.64, 17120.64, '8 Oriente 1307', 'Paseo de San Pedro', 'Tehuacan', 'S/D', 383, 'BD Consolidada Ahorradores '),
(371, 1, '00300078', '', 'LOPEZ VALERIO SOCORRO AIDA', '300078', 500, 0, 15369.57, 0, 0, 0, 0, 15869.57, 11108.7, 11108.7, '4 Poniente 415', 'Ignacio Zaragoza', 'Tehuacan', 'S/D', 384, 'BD Consolidada Ahorradores '),
(372, 1, '00300079', '', 'LORENZINI JUAREZ MARIA TERESA', '300079', 0, 0, 165000, 0, 0, 0, 0, 165000, 115500, 115500, 'Vicente Guerrero y 33 Sur', 'San Sebastian', 'Tecamachalco', 'S/D', 385, 'BD Consolidada Ahorradores '),
(373, 1, '00300080', '', 'LOZANO TRUJILLO SABINA', '300080', 500, 7681.71, 0, 0, 0, 0, 0, 8181.71, 5727.2, 5727.2, 'Vicente Guerrero Poniente 131', 'Maria Cuaupan', 'Tehuacan', 'S/D', 386, 'BD Consolidada Ahorradores '),
(374, 1, '00300081', '', 'MARIA RODRIGUEZ ROSA', '300081', 500, 0, 9831, 0, 0, 0, 0, 10331, 7231.7, 7231.7, '2 Oriente 928', 'Moctezuma', 'Tehuacan', 'S/D', 387, 'BD Consolidada Ahorradores '),
(375, 1, '00300082', '', 'MARIN MORENO MAXIMINO', '300082', 500, 2000, 0, 0, 0, 0, 0, 2500, 1750, 1750, 'Ignacio Allende LT 54', 'Aviacion', 'Tehuacan', 'S/D', 388, 'BD Consolidada Ahorradores '),
(376, 1, '00300083', '', 'MARISCAL SANDOVAL ANTONIA', '300083', 500, 2191.68, 0, 0, 0, 0, 0, 2691.68, 1884.18, 1884.18, '21 Poniente 1410', 'Esmeralda', 'Tehuacan', 'S/D', 389, 'BD Consolidada Ahorradores '),
(377, 1, '00300084', '', 'MARTINEZ ALTA GERMAN', '300084', 500, 0, 20000, 0, 0, 0, 0, 20500, 14350, 14350, 'Zoquitlan s/n', 'Seccion I Xicala', 'Zoquitlan', 'S/D', 390, 'BD Consolidada Ahorradores '),
(378, 1, '00300085', '', 'MARTINEZ ANTONIO JUAN', '300085', 500, 13359.27, 0, 0, 0, 0, 0, 13859.27, 9701.49, 9701.49, '24 de Diciembre 26', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 391, 'BD Consolidada Ahorradores '),
(379, 1, '00300086', '', 'MARTINEZ CORTEZ HERMELINDA', '300086', 0, 727.58, 39841.36, 0, 0, 0, 0, 40568.94, 28398.26, 28398.26, 'Buena Vista 2', 'El Progreso', 'Tehuacan', 'S/D', 392, 'BD Consolidada Ahorradores '),
(380, 1, '00300087', '', 'MARTINEZ ESPIDIO LETICIA', '300087', 500, 8873.25, 84000, 0, 0, 0, 0, 93373.25, 65361.28, 65361.28, 'Independencia 5', 'Cristobal Tepeteopan', 'Tehuacan', 'S/D', 393, 'BD Consolidada Ahorradores '),
(381, 1, '00300088', '', 'MARTINEZ LOPEZ UBALDA LETICIA', '300088', 500, 0, 591078.09, 0, 0, 0, 0, 591578.09, 414104.66, 167930, '13 Oriente 334', 'Nicolas Bravo', 'Tehuacan', 'S/D', 394, 'BD Consolidada Ahorradores '),
(382, 1, '00300089', '', 'MARTINEZ NUÑEZ ANTONIETA', '300089', 500, 9967.31, 0, 0, 0, 0, 0, 10467.31, 7327.12, 7327.12, 'Juan Ruiz Alarcon 3908', 'Cultural', 'Tehuacan', 'S/D', 395, 'BD Consolidada Ahorradores '),
(383, 1, '00300090', '', 'MARTINEZ RIVERA PAULINA INOCENCIA', '300090', 0, 0, 224000, 0, 0, 0, 0, 224000, 156800, 156800, 'Av Nacional 69', 'Olleras Bustamante', 'Tehuacan', 'S/D', 396, 'BD Consolidada Ahorradores '),
(384, 1, '00300091', '', 'MENDEZ CATALINA', '300091', 0, 0, 5000, 0, 0, 0, 0, 5000, 3500, 3500, 'Insurgentes 3406', 'La Soledad', 'Tehuacan', 'S/D', 397, 'BD Consolidada Ahorradores '),
(385, 1, '00300092', '', 'MENDOZA CRUZ ELIZABETH', '300092', 500, 3450.16, 96140.48, 0, 0, 0, 0, 100090.64, 70063.45, 70063.45, 'Miguel Hidalgo', 'Guadalupe', 'Zapotitlan', 'S/D', 398, 'BD Consolidada Ahorradores '),
(386, 1, '00300093', '', 'MERINO MERINO SUSANA', '300093', 500, 18000, 0, 0, 0, 0, 0, 18500, 12950, 12950, '19 sur 709', 'La Purisima', 'Tehuacan', 'S/D', 399, 'BD Consolidada Ahorradores '),
(387, 1, '00300094', '', 'MEXICANO ORTIZ ESPERANZA', '300094', 500, 275.78, 17190.93, 0, 0, 0, 0, 17966.71, 12576.7, 12576.7, 'Republica de Nicaragua 803', 'America', 'Tehuacan', 'S/D', 400, 'BD Consolidada Ahorradores '),
(388, 1, '00300095', '', 'MIRAMON OLMOS MARTHA', '300095', 0, 0, 12396.07, 0, 0, 0, 0, 12396.07, 8677.25, 8677.25, 'Morelos sn', 'San Jose Miahuatlan', 'San Jose Miahuatlan', 'S/D', 401, 'BD Consolidada Ahorradores '),
(389, 1, '00300096', '', 'MIRAMON SEBASTIAN JUAN', '300096', 0, 0, 2997.71, 0, 0, 0, 0, 2997.71, 2098.4, 2098.4, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 402, 'BD Consolidada Ahorradores '),
(390, 1, '00300097', '', 'MONTALVO ROQUE CIRILA', '300097', 500, 0, 192820.55, 0, 0, 0, 0, 193320.55, 135324.39, 135324.39, '11 Oriente 1117', 'La Purisima', 'Tehuacan', 'S/D', 403, 'BD Consolidada Ahorradores '),
(391, 1, '00300098', '', 'MONTAÑO HUERTA SILDIA HAYDEE', '300098', 500, 3507.39, 0, 0, 0, 0, 0, 4007.39, 2805.17, 2805.17, 'Fresno 2316 A', 'Rancho Grande', 'Tehuacan', 'S/D', 404, 'BD Consolidada Ahorradores '),
(392, 1, '00300099', '', 'MORALES VAZQUEZ FRANCISCO', '300099', 500, 14550, 0, 0, 0, 0, 0, 15050, 10535, 10535, 'San Agustin 106-7', 'Maria Coapan', 'Tehuacan', 'S/D', 405, 'BD Consolidada Ahorradores '),
(393, 1, '00300100', '', 'MORAN CORTES CECILIA MICAELA', '300100', 0, 0, 40501.6, 0, 0, 0, 0, 40501.6, 28351.12, 28351.12, '25 Norte 203', 'El Rosario', 'Tehuacan', 'S/D', 406, 'BD Consolidada Ahorradores '),
(394, 1, '00300101', '', 'MORENO MORALES ABRAHAM', '300101', 0, 0, 250000, 0, 0, 0, 0, 250000, 175000, 167930, 'Granada LT 124', 'Los Olivos', 'Tehuacan', 'S/D', 407, 'BD Consolidada Ahorradores '),
(395, 1, '00300102', '', 'MORENO MORALES JOSUE', '300102', 0, 135166.89, 750000, 0, 0, 0, 0, 885166.89, 619616.82, 167930, '2 Sur 128', 'Centro', 'Tehuacan', 'S/D', 408, 'BD Consolidada Ahorradores '),
(396, 1, '00300103', '', 'MOSQUEDA MARTINEZ MARIA ISABEL', '300103', 0, 0, 27500, 0, 0, 0, 0, 27500, 19250, 19250, '2da Privada de Ahuehuetes 49', 'Ahuehuetes', 'Gustavo AMadero', 'S/D', 409, 'BD Consolidada Ahorradores '),
(397, 1, '00300104', '', 'OLMOS CAMPOS ANDREA', '300104', 0, 0, 9000, 0, 0, 0, 0, 9000, 6300, 6300, 'Heroes de Chapultepec 18', 'Centro', 'San Jose Miahuatlan', 'S/D', 410, 'BD Consolidada Ahorradores '),
(398, 1, '00300105', '', 'OROZCO GARCIA JOSE', '300105', 500, 1408.36, 5000, 0, 0, 0, 0, 6908.36, 4835.85, 4835.85, 'Privada de Chalma 4-12', 'San Diego Chalma', 'Tehuacan', 'S/D', 411, 'BD Consolidada Ahorradores '),
(399, 1, '00300106', '', 'ORTIZ MENDEZ ALVARO', '300106', 0, 101196.72, 0, 0, 0, 0, 0, 101196.72, 70837.7, 70837.7, '31 norte ', 'San Sebastian', 'Tecamachalco', 'S/D', 412, 'BD Consolidada Ahorradores '),
(400, 1, '00300107', '', 'OSORIO REYES AMALIA', '300107', 500, 0, 15558.84, 0, 0, 0, 0, 16058.84, 11241.19, 11241.19, 'Av Libertad 11', 'Bartolo Teontepec', 'Tepanco de Lopez', 'S/D', 413, 'BD Consolidada Ahorradores '),
(401, 1, '00300108', '', 'PACHECO RODRIGUEZ TOMAS', '300108', 500, 61.14, 1750.5, 0, 0, 0, 0, 2311.64, 1618.15, 1618.15, 'Sedesol lt 7', 'Dr Miguel Romero', 'Teotihuacan', 'S/D', 414, 'BD Consolidada Ahorradores '),
(402, 1, '00300109', '', 'PAQUE PEREZ ALFREDO', '300109', 0, 21269.23, 0, 0, 0, 0, 0, 21269.23, 14888.46, 14888.46, '23 Sur 152', 'La Concepcion', 'Tehuacan', 'S/D', 415, 'BD Consolidada Ahorradores '),
(403, 1, '00300110', '', 'PEREDA HERNANDEZ BONIFACIO', '300110', 500, 0, 0, 0, 0, 0, 0, 500, 350, 350, 'Guadalupe Victoria 1902', '16 de Marzo', 'Tehuacan', 'S/D', 416, 'BD Consolidada Ahorradores '),
(404, 1, '00300111', '', 'PEREZ BAUTISTA ERNESTINA', '300111', 500, 0, 21000, 0, 0, 0, 0, 21500, 15050, 15050, 'Adolfo Lopez Mateos 7', 'Antonio Texcala', 'Zapotitlan', 'S/D', 417, 'BD Consolidada Ahorradores '),
(405, 1, '00300112', '', 'PEREZ JIMENEZ MARGARITO BALENTIN', '300112', 500, 17082.06, 0, 0, 0, 0, 0, 17582.06, 12307.44, 12307.44, '4 Poniente 68', 'Santa Mariala Alta', 'Tlacotepec', 'S/D', 418, 'BD Consolidada Ahorradores '),
(406, 1, '00300113', '', 'PIEDRA GONZALEZ NORMA', '300113', 500, 0, 8000, 0, 0, 0, 0, 8500, 5950, 5950, 'Allende Oriente 126', 'Maria Coapan', 'Tehuacan', 'S/D', 419, 'BD Consolidada Ahorradores '),
(407, 1, '00300114', '', 'PORRAS CHAVEZ SERVANDO PEDRO LAZARO', '300114', 500, 46744.92, 1200000, 0, 0, 0, 0, 1247244.92, 873071.44, 167930, 'Carmen Serdan 106', 'Centro', 'Tehuacan', '23821957', 420, 'BD Consolidada Ahorradores '),
(408, 1, '00300115', '', 'QUIÑONES HERNANDEZ EFREN', '300115', 0, 25.19, 0, 0, 0, 0, 0, 25.19, 17.63, 17.63, 'San Bernardino Lagunas', 'Bernardino Lagunas', 'Vicente Guerrero', 'S/D', 421, 'BD Consolidada Ahorradores '),
(409, 1, '00300116', '', 'RAMIREZ SANCHEZ MARCELA', '300116', 1000, 7545.58, 0, 0, 0, 0, 0, 8545.58, 5981.91, 5981.91, '6 Poniente 602 A', 'Constituyentes', 'Tehuacan', 'S/D', 422, 'BD Consolidada Ahorradores '),
(410, 1, '00300117', '', 'REYES JIMENEZ MARICELA', '300117', 500, 2019.45, 0, 0, 0, 0, 0, 2519.45, 1763.62, 1763.62, '17 poniente 2007', 'El Riego', 'Tehuacan', 'S/D', 423, 'BD Consolidada Ahorradores '),
(411, 1, '00300118', '', 'REYES MERINO EDITH', '300118', 500, 5112.9, 15000, 0, 0, 0, 0, 20612.9, 14429.03, 14429.03, '5 de Mayo', 'Jose Buena Vista', 'Ajalpan', 'S/D', 424, 'BD Consolidada Ahorradores '),
(412, 1, '00300119', '', 'RIOS DIAZ PASCUALA', '300119', 0, 11072.31, 0, 0, 0, 0, 0, 11072.31, 7750.62, 7750.62, 'Benito Juarez 405', 'Lorenzo Teotipilco', 'Tehuacan', 'S/D', 425, 'BD Consolidada Ahorradores '),
(413, 1, '00300120', '', 'ROJAS CHAVEZ PRAXEDES', '300120', 500, 0, 10000, 0, 0, 0, 0, 10500, 7350, 7350, 'Guadalupe Victoria 1425', 'El Riego', 'Tehuacan', 'S/D', 426, 'BD Consolidada Ahorradores '),
(414, 1, '00300121', '', 'ROSALES ROJAS IGNACIA', '300121', 500, 26230.67, 0, 0, 0, 0, 0, 26730.67, 18711.47, 18711.47, '17 Oriente 1123 B', 'Los Pinos', 'Zoquitlan', 'S/D', 427, 'BD Consolidada Ahorradores '),
(415, 1, '00300122', '', 'SALVADOR FLORES SERAPIO', '300122', 500, 0, 8000, 0, 0, 0, 0, 8500, 5950, 5950, 'Av Nacional', 'El Molino', 'Chapulco', 'S/D', 428, 'BD Consolidada Ahorradores '),
(416, 1, '00300123', '', 'SANCHEZ ADAME GREGORIO', '300123', 500, 0, 8000, 0, 0, 0, 0, 8500, 5950, 5950, 'Juan Diego Lote 41', 'Paraiso de Jesus', 'Tehuacan', 'S/D', 429, 'BD Consolidada Ahorradores '),
(417, 1, '00300124', '', 'SANCHEZ ELEJO LAURANEO', '300124', 0, 0, 174000, 0, 0, 0, 0, 174000, 121800, 121800, 'Conocido', 'Tlaxitla', 'Ajalpan', 'S/D', 430, 'BD Consolidada Ahorradores '),
(418, 1, '00300125', '', 'SANCHEZ GARCIA ARMANDO', '300125', 500, 5399.87, 0, 0, 0, 0, 0, 5899.87, 4129.91, 4129.91, '12 Sur 2128', '16 de Marzo', 'Tehuacan', 'S/D', 431, 'BD Consolidada Ahorradores '),
(419, 1, '00300126', '', 'SORIANO FIGUEROA SILVINO LEONCIO', '300126', 500, 21300, 0, 0, 0, 0, 0, 21800, 15260, 15260, '21 Oriente 919', 'Nias Bravo', 'Tehuacan', 'S/D', 432, 'BD Consolidada Ahorradores '),
(420, 1, '00300127', '', 'TEHUACANERO JIMENEZ JOSEFINA MARTHA', '300127', 500, 10125.47, 0, 0, 0, 0, 0, 10625.47, 7437.83, 7437.83, 'Boulevard Ing Pastor Rouaix 713', 'Hidalgo', 'Tehuacan', 'S/D', 433, 'BD Consolidada Ahorradores '),
(421, 1, '00300128', '', 'TEHUINTLE CALIHUA EUSEBIO', '300128', 500, 11590.84, 15900, 0, 0, 0, 0, 27990.84, 19593.59, 19593.59, 'Coxcatepachapa', 'Coxcatepachapa', 'Vicente Guerrero', 'S/D', 434, 'BD Consolidada Ahorradores '),
(422, 1, '00300129', '', 'TENORIO HERNANDEZ MARTHA AMELIA', '300129', 500, 5678.99, 54000, 0, 0, 0, 0, 60178.99, 42125.29, 42125.29, 'Alamo 716', 'Morelos', 'Tehuacan', 'S/D', 435, 'BD Consolidada Ahorradores '),
(423, 1, '00300130', '', 'TOMAS VENTURA DOLORES GUADALUPE', '300130', 500, 12772.27, 0, 0, 0, 0, 0, 13272.27, 9290.59, 9290.59, 'Alvarez 700', 'Centro', 'Zinacatepec', 'S/D', 436, 'BD Consolidada Ahorradores '),
(424, 1, '00300131', '', 'VAZQUEZ MARTINEZ FRANCISCO JAVIER', '300131', 500, 4771.91, 0, 0, 0, 0, 0, 5271.91, 3690.34, 3690.34, '26 Oriente 300', 'Lomas de la Soledad', 'Tehuacan', 'S/D', 437, 'BD Consolidada Ahorradores '),
(425, 1, '00300132', '', 'VEGA HERNANDEZ RUFINO', '300132', 500, 4198.6, 0, 0, 0, 0, 0, 4698.6, 3289.02, 3289.02, 'Jose Maria Morelos 5408', 'San Angel', 'Tehuacan', 'S/D', 438, 'BD Consolidada Ahorradores '),
(426, 1, '00300133', '', 'VELEZ GONZALEZ ISABEL PATRICIA', '300133', 500, 13434.17, 80000, 0, 0, 0, 0, 93934.17, 65753.92, 65753.92, 'Sedesol 16', 'Mig Romero Sanchez', 'Tehuacan', 'S/D', 439, 'BD Consolidada Ahorradores '),
(427, 1, '00300134', '', 'VIVEROS JUAREZ CLETO JOEL', '300134', 500, 1000, 20387.03, 0, 0, 0, 0, 21887.03, 15320.92, 15320.92, 'Colombia 308 A', 'El Riego', 'Tehuacan', 'S/D', 440, 'BD Consolidada Ahorradores '),
(428, 1, '427', '', 'TOTAL', '', 16498771.66, 8816877.93, 60511763.9, 0, 0, 0, 0, 85827413.49, 60079189.55, 22539554.41, '', '', '', '', 441, 'BD Consolidada Ahorradores ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `idconvenio` int(11) NOT NULL,
  `statusConvenio_idstatusConvenio` int(11) NOT NULL DEFAULT '1',
  `usuarios_idusuarios` int(11) NOT NULL,
  `estado_idestado` int(11) NOT NULL,
  `revisionesTemporales_idrevisionesTemporales` int(11) NOT NULL,
  `bancos_idbancos` int(11) NOT NULL,
  `fechaFirma` date DEFAULT NULL,
  `fechaDOF` date DEFAULT NULL,
  `cuentaBancaria` varchar(90) DEFAULT NULL,
  `clabe` varchar(18) DEFAULT NULL,
  `porcentajeContingencia` int(11) NOT NULL,
  `fechaFinRegistro` date DEFAULT NULL,
  `fechaFinPago` date DEFAULT NULL,
  `montoMaximoPagoTotal` double NOT NULL,
  `montoMaximoPagoEstado` double NOT NULL,
  `montoMaximoPagoFipago` double NOT NULL,
  `montoContingenciaTotal` double NOT NULL,
  `montoContingenciaEstado` double NOT NULL,
  `montoContingenciaFipago` double NOT NULL,
  `montoTotalConvenio` double NOT NULL,
  `montoTotalEstado` double NOT NULL,
  `montoTotalFipago` double NOT NULL,
  `fechaSesion` date NOT NULL,
  `sesion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `convenio`
--

INSERT INTO `convenio` (`idconvenio`, `statusConvenio_idstatusConvenio`, `usuarios_idusuarios`, `estado_idestado`, `revisionesTemporales_idrevisionesTemporales`, `bancos_idbancos`, `fechaFirma`, `fechaDOF`, `cuentaBancaria`, `clabe`, `porcentajeContingencia`, `fechaFinRegistro`, `fechaFinPago`, `montoMaximoPagoTotal`, `montoMaximoPagoEstado`, `montoMaximoPagoFipago`, `montoContingenciaTotal`, `montoContingenciaEstado`, `montoContingenciaFipago`, `montoTotalConvenio`, `montoTotalEstado`, `montoTotalFipago`, `fechaSesion`, `sesion`) VALUES
(1, 3, 1, 29, 1, 55, '2017-04-06', '2017-04-12', '2342342342', '876543210987654321', 15, '2017-06-11', '2017-10-09', 22539554.41, 8196201.6, 14343352.81, 3380933.16, 1229430.24, 2151502.92, 25920487.57, 9425631.84, 16494855.73, '2017-04-04', 'XII');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio_has_ahorrador`
--

CREATE TABLE `convenio_has_ahorrador` (
  `convenio_idconvenio` int(11) NOT NULL,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `convenio_has_ahorrador`
--

INSERT INTO `convenio_has_ahorrador` (`convenio_idconvenio`, `ahorrador_idahorrador`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 150),
(1, 151),
(1, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 170),
(1, 171),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(1, 185),
(1, 186),
(1, 187),
(1, 188),
(1, 189),
(1, 190),
(1, 191),
(1, 192),
(1, 193),
(1, 194),
(1, 195),
(1, 196),
(1, 197),
(1, 198),
(1, 199),
(1, 200),
(1, 201),
(1, 202),
(1, 203),
(1, 204),
(1, 205),
(1, 206),
(1, 207),
(1, 208),
(1, 209),
(1, 210),
(1, 211),
(1, 212),
(1, 213),
(1, 214),
(1, 215),
(1, 216),
(1, 217),
(1, 218),
(1, 219),
(1, 220),
(1, 221),
(1, 222),
(1, 223),
(1, 224),
(1, 225),
(1, 226),
(1, 227),
(1, 228),
(1, 229),
(1, 230),
(1, 231),
(1, 232),
(1, 233),
(1, 234),
(1, 235),
(1, 236),
(1, 237),
(1, 238),
(1, 239),
(1, 240),
(1, 241),
(1, 242),
(1, 243),
(1, 244),
(1, 245),
(1, 246),
(1, 247),
(1, 248),
(1, 249),
(1, 250),
(1, 251),
(1, 252),
(1, 253),
(1, 254),
(1, 255),
(1, 256),
(1, 257),
(1, 258),
(1, 259),
(1, 260),
(1, 261),
(1, 262),
(1, 263),
(1, 264),
(1, 265),
(1, 266),
(1, 267),
(1, 268),
(1, 269),
(1, 270),
(1, 271),
(1, 272),
(1, 273),
(1, 274),
(1, 275),
(1, 276),
(1, 277),
(1, 278),
(1, 279),
(1, 280),
(1, 281),
(1, 282),
(1, 283),
(1, 284),
(1, 285),
(1, 286),
(1, 287),
(1, 288),
(1, 289),
(1, 290),
(1, 291),
(1, 292),
(1, 293),
(1, 294),
(1, 295),
(1, 296),
(1, 297),
(1, 298),
(1, 299),
(1, 300),
(1, 301),
(1, 302),
(1, 303),
(1, 304),
(1, 305),
(1, 306),
(1, 307),
(1, 308),
(1, 309),
(1, 310),
(1, 311),
(1, 312),
(1, 313),
(1, 314),
(1, 315),
(1, 316),
(1, 317),
(1, 318),
(1, 319),
(1, 320),
(1, 321),
(1, 322),
(1, 323),
(1, 324),
(1, 325),
(1, 326),
(1, 327),
(1, 328),
(1, 329),
(1, 330),
(1, 331),
(1, 332),
(1, 333),
(1, 334),
(1, 335),
(1, 336),
(1, 337),
(1, 338),
(1, 339),
(1, 340),
(1, 341),
(1, 342),
(1, 343),
(1, 344),
(1, 345),
(1, 346),
(1, 347),
(1, 348),
(1, 349),
(1, 350),
(1, 351),
(1, 352),
(1, 353),
(1, 354),
(1, 355),
(1, 356),
(1, 357),
(1, 358),
(1, 359),
(1, 360),
(1, 361),
(1, 362),
(1, 363),
(1, 364),
(1, 365),
(1, 366),
(1, 367),
(1, 368),
(1, 369),
(1, 370),
(1, 371),
(1, 372),
(1, 373),
(1, 374),
(1, 375),
(1, 376),
(1, 377),
(1, 378),
(1, 379),
(1, 380),
(1, 381),
(1, 382),
(1, 383),
(1, 384),
(1, 385),
(1, 386),
(1, 387),
(1, 388),
(1, 389),
(1, 390),
(1, 391),
(1, 392),
(1, 393),
(1, 394),
(1, 395),
(1, 396),
(1, 397),
(1, 398),
(1, 399),
(1, 400),
(1, 401),
(1, 402),
(1, 403),
(1, 404),
(1, 405),
(1, 406),
(1, 407),
(1, 408),
(1, 409),
(1, 410),
(1, 411),
(1, 412),
(1, 413),
(1, 414),
(1, 415),
(1, 416),
(1, 417),
(1, 418),
(1, 419),
(1, 420),
(1, 421),
(1, 422),
(1, 423),
(1, 424),
(1, 425),
(1, 426),
(1, 427);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio_has_sociedad`
--

CREATE TABLE `convenio_has_sociedad` (
  `convenio_idconvenio` int(11) NOT NULL,
  `sociedad_idsociedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `convenio_has_sociedad`
--

INSERT INTO `convenio_has_sociedad` (`convenio_idconvenio`, `sociedad_idsociedad`) VALUES
(1, 138),
(1, 139),
(1, 140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentosIdentidad`
--

CREATE TABLE `documentosIdentidad` (
  `iddocumentosIdentidad` int(11) NOT NULL,
  `nombre` varchar(90) NOT NULL,
  `convenio_idconvenio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentosValor`
--

CREATE TABLE `documentosValor` (
  `iddocumentosValor` int(11) NOT NULL,
  `nombre` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documentosValor`
--

INSERT INTO `documentosValor` (`iddocumentosValor`, `nombre`) VALUES
(1, 'Libreta de ahorro'),
(2, 'Certificado de aportación'),
(3, 'Certificado de ahorro'),
(4, 'Libreta de ahorro - préstamo'),
(5, 'Libreta de ahorro - normal'),
(6, 'Depósito a plazo fijo'),
(7, 'Depósito de ahorro'),
(8, 'N/D'),
(9, 'Partes sociales'),
(10, 'Ahorro infantil'),
(11, 'S/D'),
(12, 'Ficha de depósito'),
(13, 'Inversión a plazo fijo'),
(14, 'Recibo de depósito'),
(15, 'Ficha universal'),
(16, 'Comprobante de caja'),
(17, 'Pagaré'),
(18, 'Parte social'),
(19, 'Ficha de deposito'),
(20, 'Aportacion social'),
(21, 'Pagare de aportacion'),
(22, 'Tarjeta de ahorro'),
(23, 'Estado de cuenta'),
(24, 'Aportacion voluntario'),
(25, 'Deposito plazo fijo'),
(26, 'Escrito con sello'),
(27, 'Inversion plazo fijo'),
(28, 'Inversion plazo fijo'),
(29, 'Adicion al capital'),
(30, 'Recibo de deposito'),
(31, 'Certificacion de Aportacion'),
(32, 'Libreta de Ahorro - Prestamo'),
(33, 'Sello Certificado de Aportacion'),
(34, 'Deposito de Ahorro Opcional'),
(35, 'Deposito de Ahorro Normal'),
(36, 'Cuenta Corriente'),
(37, 'Ahorro Normal'),
(38, 'Movimientos Socio'),
(39, 'Ahorro'),
(40, 'Ahorro Opcional'),
(41, 'Deposito Infantil'),
(42, 'Deposito de Cuenta Corriente'),
(43, 'Ahorro Deposito Normal'),
(44, 'Depositos de Ahorro'),
(45, 'Deposito A Plazo Fijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `erroresCertificadas`
--

CREATE TABLE `erroresCertificadas` (
  `iderroresCertificadas` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `basesCertificadas_idbasesCertificadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `erroresMinistracionesTemporales`
--

CREATE TABLE `erroresMinistracionesTemporales` (
  `iderroresMinistracionesTemporales` int(11) NOT NULL,
  `ministracionesTemporales_idmodificacionesTemporales` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `erroresModificaciones`
--

CREATE TABLE `erroresModificaciones` (
  `iderroresModificaciones` int(11) NOT NULL,
  `modificaciones_idmodificaciones` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `erroresRevisiones`
--

CREATE TABLE `erroresRevisiones` (
  `iderroresRevisiones` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `revisionesTemporales_idrevisionesTemporales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombre`, `clave`) VALUES
(1, 'Aguascalientes', '01'),
(2, 'Baja California', '02'),
(3, 'Baja California Sur', '32'),
(4, 'Campeche', '04'),
(5, 'Chiapas', '07'),
(6, 'Chihuahua', '08'),
(7, 'Ciudad de México', '33'),
(8, 'Coahuila', '05'),
(9, 'Colima', '06'),
(10, 'Durango', '09'),
(11, 'Estado de México', '14'),
(12, 'Guanajuato	', '10'),
(13, 'Guerrero', '11'),
(14, 'Hidalgo', '12'),
(15, 'Jalisco', '13'),
(16, 'Michoacán', '15'),
(17, 'Morelos	', '16'),
(18, 'Nayarit', '17'),
(19, 'Nuevo León', '18'),
(20, 'Oaxaca	', '19'),
(21, 'Puebla', '20'),
(22, 'Querétaro', '21'),
(23, 'Quintana Roo', '22'),
(24, 'San Luis Potosí', '23'),
(25, 'Sinaloa', '24'),
(26, 'Sonora	', '03'),
(27, 'Tabasco', '26'),
(28, 'Tamaulipas', '27'),
(29, 'Tlaxcala', '28'),
(30, 'Veracruz', '29'),
(31, 'Yucatán', '30'),
(32, 'Zacatecas', '31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorrador`
--

CREATE TABLE `historicoAhorrador` (
  `folioIdentificador` varchar(20) NOT NULL,
  `nombre` text NOT NULL,
  `direccion` text,
  `montoAl100` double NOT NULL,
  `montoAl70` double NOT NULL,
  `montoMaximo` double NOT NULL,
  `sca` double DEFAULT NULL,
  `sci` double DEFAULT NULL,
  `sps` double DEFAULT NULL,
  `sdg` double DEFAULT NULL,
  `scnc` double DEFAULT NULL,
  `spc` double DEFAULT NULL,
  `sod` double DEFAULT NULL,
  `baja` int(11) NOT NULL DEFAULT '0',
  `folioBaseDatos` varchar(45) DEFAULT NULL,
  `fechaCambio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorrador_idahorrador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorChequesNoCobrados`
--

CREATE TABLE `historicoAhorradorChequesNoCobrados` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorChequesNoCobrados_idahorradorChequesNoCobrados` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorCuentasAhoroo`
--

CREATE TABLE `historicoAhorradorCuentasAhoroo` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorCuentasAhorro_idahorradorCuentasAhorro` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorCuentasInversion`
--

CREATE TABLE `historicoAhorradorCuentasInversion` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fecah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorCuentasInversion_idahorradorCuentasInversion` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorDepositosGarantia`
--

CREATE TABLE `historicoAhorradorDepositosGarantia` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorDepositosGarantia_idahorradorDepositosGarantia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorOtrosDepositos`
--

CREATE TABLE `historicoAhorradorOtrosDepositos` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorOtrosDepositos_idahorradorOtrosDepositos` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorParteSocial`
--

CREATE TABLE `historicoAhorradorParteSocial` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorParteSocial_idahorradorParteSocial` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoAhorradorPrestamosCargo`
--

CREATE TABLE `historicoAhorradorPrestamosCargo` (
  `tipoDocumento` text,
  `folio` varchar(45) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ahorradorPrestamosCargo_idahorradorPrestamosCargo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `idlog` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tabla` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `usuarios_idusuarios` int(11) NOT NULL,
  `actividades_idactividades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`idlog`, `fecha`, `tabla`, `id`, `usuarios_idusuarios`, `actividades_idactividades`) VALUES
(1, '2017-04-13 14:56:21', 'revisionesTemporales', 1, 1, 2),
(2, '2017-04-13 14:58:47', 'convenio', 1, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ministracionesTemporales`
--

CREATE TABLE `ministracionesTemporales` (
  `idministracionesTemporales` int(11) NOT NULL,
  `archivo` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `convenio_idconvenio` int(11) NOT NULL,
  `totalErrores` int(11) NOT NULL DEFAULT '1',
  `statusMinistracion_idstatusMinistracion` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificaciones`
--

CREATE TABLE `modificaciones` (
  `idmodificaciones` int(11) NOT NULL,
  `convenio_idconvenio` int(11) NOT NULL,
  `archivo` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `errores` int(11) NOT NULL DEFAULT '1',
  `fechaSolicitud` date NOT NULL,
  `folioSolicitud` text NOT NULL,
  `aplicada` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificacionesAnalitica`
--

CREATE TABLE `modificacionesAnalitica` (
  `idmodificacionesAnalitica` int(11) NOT NULL,
  `modificaciones_idmodificaciones` int(11) NOT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `folioIdentificador` varchar(45) DEFAULT NULL,
  `nombreAhorrador` varchar(45) DEFAULT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `folioPS` varchar(45) DEFAULT NULL,
  `tipoDocumentoPS` varchar(45) DEFAULT NULL,
  `importePS` double DEFAULT NULL,
  `folioCA` varchar(45) DEFAULT NULL,
  `tipoDocumentoCA` varchar(45) DEFAULT NULL,
  `importeCA` double DEFAULT NULL,
  `folioCI` varchar(45) DEFAULT NULL,
  `tipoDocumentoCI` varchar(45) DEFAULT NULL,
  `importeCI` double DEFAULT NULL,
  `folioDG` varchar(45) DEFAULT NULL,
  `tipoDocumentoDG` varchar(45) DEFAULT NULL,
  `importeDG` double DEFAULT NULL,
  `folioCNC` varchar(45) DEFAULT NULL,
  `tipoDocumentoCNC` varchar(45) DEFAULT NULL,
  `importeCNC` double DEFAULT NULL,
  `folioOD` varchar(45) DEFAULT NULL COMMENT '		',
  `tipoDocumentoOD` varchar(45) DEFAULT NULL,
  `importeOD` double DEFAULT NULL,
  `folioPC` varchar(45) DEFAULT NULL,
  `tipoDocumentoPC` varchar(45) DEFAULT NULL,
  `importePC` double DEFAULT NULL,
  `saldoNeto100` double DEFAULT NULL,
  `saldoNeto70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `observaciones` text,
  `filaOriginalDocumento` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificacionesConsolidada`
--

CREATE TABLE `modificacionesConsolidada` (
  `idmodificacionesConsolidada` int(11) NOT NULL,
  `modificaciones_idmodificaciones` int(11) NOT NULL,
  `folioIdentificador` varchar(20) NOT NULL,
  `nombreAhorradorDice` text,
  `nombreAhorradorDebeDecir` text,
  `curpDice` varchar(45) NOT NULL,
  `curpDebeDecir` varchar(45) NOT NULL,
  `parteSocialDice` double DEFAULT NULL,
  `parteSocialDebeDecir` double DEFAULT NULL,
  `cuentasDeAhorroDice` double DEFAULT NULL,
  `cuentasDeAhorroDebeDecir` double DEFAULT NULL,
  `cuentaDeInversionDice` double DEFAULT NULL,
  `cuentaDeInversionDebeDecir` double DEFAULT NULL,
  `depositosEnGarantiaDice` double DEFAULT NULL,
  `depositosEnGarantiaDebeDecir` double DEFAULT NULL,
  `chequesNoCobradosDice` double DEFAULT NULL,
  `chequesNoCobradosDebeDecir` double DEFAULT NULL,
  `otrosDepositosDice` double DEFAULT NULL,
  `otrosDepositosDebeDecir` double DEFAULT NULL,
  `prestamosACargoDice` double DEFAULT NULL,
  `prestamosACargoDebeDecir` double DEFAULT NULL,
  `saldoNeto100Dice` double DEFAULT NULL,
  `saldoNeto100DebeDecir` double DEFAULT NULL,
  `saldoNeto70Dice` double DEFAULT NULL,
  `saldoNeto70DebeDecir` double DEFAULT NULL,
  `montoMaximoPagoDice` double DEFAULT NULL,
  `montoMaximoPagoDebeDecir` double DEFAULT NULL,
  `observacionesDice` text,
  `observacionesDebeDecir` text,
  `filaOriginalDocumento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `idmodulos` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `directorio` varchar(45) DEFAULT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`idmodulos`, `nombre`, `directorio`, `orden`) VALUES
(1, 'Revisión base de datos inicial', 'bdinicial', 1),
(2, 'Usuarios', 'users', 10),
(3, 'Roles', 'roles', 11),
(4, 'Módulos', 'mods', 12),
(5, 'Convenios', 'conv', 3),
(6, 'Estados', 'estados', 13),
(7, 'Log', 'logs', 17),
(8, 'Sociedades', 'socs', 4),
(9, 'Documentos de indentidad', 'docs', 7),
(10, 'Status de convenios', 'stsConv', 9),
(11, 'Bancos', 'bancos', 14),
(12, 'Padrón de ahorradores', 'ahrs', 5),
(13, 'Variables del sistema', 'vars', 16),
(14, 'Capacitaciones', 'caps', 15),
(15, 'Modificaciones a la base de datos', 'modBas', 2),
(16, 'Ministraciones', 'mins', 6),
(17, 'Documentos de valor', 'docsVal', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrosMinistraciones`
--

CREATE TABLE `registrosMinistraciones` (
  `idregistrosMinistraciones` int(11) NOT NULL,
  `ministracionesTemporales_idministracionesTemporales` int(11) NOT NULL,
  `folioIdentificador` varchar(20) DEFAULT NULL,
  `nombreAhorrador` text,
  `representanteAlbacea` text,
  `parteSocial` double DEFAULT NULL,
  `cuentasAhorro` double DEFAULT NULL,
  `cuentasInversion` double DEFAULT NULL,
  `depositosGarantia` double DEFAULT NULL,
  `chequesNoCobrados` double DEFAULT NULL,
  `otrosDepositos` double DEFAULT NULL,
  `prestamosCargo` double DEFAULT NULL,
  `saldoTotal` double DEFAULT NULL,
  `montoMinistrar` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumenCertificadas`
--

CREATE TABLE `resumenCertificadas` (
  `idresumenCertificadas` int(11) NOT NULL,
  `descripcion` text,
  `noAhorradores` text,
  `parteSocial` double DEFAULT NULL,
  `cuentaAhorro` double DEFAULT NULL,
  `cuentaInversion` double DEFAULT NULL,
  `depositosGarantia` double DEFAULT NULL,
  `chequesNoCobrados` double DEFAULT NULL,
  `otrosDepositos` double DEFAULT NULL,
  `prestamosCargo` double DEFAULT NULL,
  `saldoNetoAhorro100` double DEFAULT NULL,
  `saldoNetoAhorro70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `filaDocumentoOriginal` int(45) NOT NULL,
  `hojaDocumentoOriginal` varchar(45) NOT NULL,
  `basesCertificadas_idbasesCertificadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resumenCertificadas`
--

INSERT INTO `resumenCertificadas` (`idresumenCertificadas`, `descripcion`, `noAhorradores`, `parteSocial`, `cuentaAhorro`, `cuentaInversion`, `depositosGarantia`, `chequesNoCobrados`, `otrosDepositos`, `prestamosCargo`, `saldoNetoAhorro100`, `saldoNetoAhorro70`, `montoMaximoPago`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`, `basesCertificadas_idbasesCertificadas`) VALUES
(1, '', 'MENORES A 239,900.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 'Cuadro Resumen BD', 1),
(2, 'Inversiones de Tlaxcala S.C. de R.L.', '100', 8300, 3811911.45, 1426405.85, 0, 0, 0, 0, 5246617.3, 3672632.17, 3672632.17, 17, 'Cuadro Resumen BD', 1),
(3, 'Caja de Ahorro y Servicios BAMPECO, S.C. de A.P. de R.L. de C.V.', '146', 708315.97, 622949.35, 7996587.2, 0, 0, 0, 0, 9327852.52, 6529496.77, 6529496.77, 18, 'Cuadro Resumen BD', 1),
(4, 'Caja Popular del Sureste, S.C de R.L de C.V.', '126', 52000, 920963.51, 3457429.94, 0, 0, 0, 0, 4430393.45, 3101275.47, 3101275.47, 19, 'Cuadro Resumen BD', 1),
(5, 'TOTAL', '372', 768615.97, 5355824.31, 12880422.99, 0, 0, 0, 0, 19004863.27, 13303404.41, 13303404.41, 20, 'Cuadro Resumen BD', 1),
(6, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 'Cuadro Resumen BD', 1),
(7, '', 'MAYORES O IGUALES A 239,900.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 'Cuadro Resumen BD', 1),
(8, 'Inversiones de Tlaxcala S.C. de R.L.', '13', 300, 2014774.91, 3481082.21, 0, 0, 0, 0, 5496157.12, 3847309.98, 2183090, 23, 'Cuadro Resumen BD', 1),
(9, 'Caja de Ahorro y Servicios BAMPECO, S.C. de A.P. de R.L. de C.V.', '34', 15728355.69, 1264366.9, 38312794.35, 0, 0, 0, 0, 55305516.94, 38713861.86, 5709620, 24, 'Cuadro Resumen BD', 1),
(10, 'Caja Popular del Sureste, S.C de R.L de C.V.', '8', 1500, 181911.81, 5837464.35, 0, 0, 0, 0, 6020876.16, 4214613.3, 1343440, 25, 'Cuadro Resumen BD', 1),
(11, 'TOTAL', '55', 15730155.69, 3461053.62, 47631340.91, 0, 0, 0, 0, 66822550.22, 46775785.14, 9236150, 26, 'Cuadro Resumen BD', 1),
(12, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 'Cuadro Resumen BD', 1),
(13, 'TOTAL', '427', 16498771.66, 8816877.93, 60511763.9, 0, 0, 0, 0, 85827413.49, 60079189.55, 22539554.41, 28, 'Cuadro Resumen BD', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumenTemporales`
--

CREATE TABLE `resumenTemporales` (
  `idresumenTemporales` int(11) NOT NULL,
  `revisionesTemporales_idrevisionesTemporales` int(11) NOT NULL,
  `descripcion` text,
  `noAhorradores` text,
  `parteSocial` double DEFAULT NULL,
  `cuentaAhorro` double DEFAULT NULL,
  `cuentaInversion` double DEFAULT NULL,
  `depositosGarantia` double DEFAULT NULL,
  `chequesNoCobrados` double DEFAULT NULL,
  `otrosDepositos` double DEFAULT NULL,
  `prestamosCargo` double DEFAULT NULL,
  `saldoNetoAhorro100` double DEFAULT NULL,
  `saldoNetoAhorro70` double DEFAULT NULL,
  `montoMaximoPago` double DEFAULT NULL,
  `filaDocumentoOriginal` int(45) NOT NULL,
  `hojaDocumentoOriginal` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resumenTemporales`
--

INSERT INTO `resumenTemporales` (`idresumenTemporales`, `revisionesTemporales_idrevisionesTemporales`, `descripcion`, `noAhorradores`, `parteSocial`, `cuentaAhorro`, `cuentaInversion`, `depositosGarantia`, `chequesNoCobrados`, `otrosDepositos`, `prestamosCargo`, `saldoNetoAhorro100`, `saldoNetoAhorro70`, `montoMaximoPago`, `filaDocumentoOriginal`, `hojaDocumentoOriginal`) VALUES
(1, 1, '', 'MENORES A 239,900.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 'Cuadro Resumen BD'),
(2, 1, 'Inversiones de Tlaxcala S.C. de R.L.', '100', 8300, 3811911.45, 1426405.85, 0, 0, 0, 0, 5246617.3, 3672632.17, 3672632.17, 17, 'Cuadro Resumen BD'),
(3, 1, 'Caja de Ahorro y Servicios BAMPECO, S.C. de A.P. de R.L. de C.V.', '146', 708315.97, 622949.35, 7996587.2, 0, 0, 0, 0, 9327852.52, 6529496.77, 6529496.77, 18, 'Cuadro Resumen BD'),
(4, 1, 'Caja Popular del Sureste, S.C de R.L de C.V.', '126', 52000, 920963.51, 3457429.94, 0, 0, 0, 0, 4430393.45, 3101275.47, 3101275.47, 19, 'Cuadro Resumen BD'),
(5, 1, 'TOTAL', '372', 768615.97, 5355824.31, 12880422.99, 0, 0, 0, 0, 19004863.27, 13303404.41, 13303404.41, 20, 'Cuadro Resumen BD'),
(6, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 'Cuadro Resumen BD'),
(7, 1, '', 'MAYORES O IGUALES A 239,900.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 'Cuadro Resumen BD'),
(8, 1, 'Inversiones de Tlaxcala S.C. de R.L.', '13', 300, 2014774.91, 3481082.21, 0, 0, 0, 0, 5496157.12, 3847309.98, 2183090, 23, 'Cuadro Resumen BD'),
(9, 1, 'Caja de Ahorro y Servicios BAMPECO, S.C. de A.P. de R.L. de C.V.', '34', 15728355.69, 1264366.9, 38312794.35, 0, 0, 0, 0, 55305516.94, 38713861.86, 5709620, 24, 'Cuadro Resumen BD'),
(10, 1, 'Caja Popular del Sureste, S.C de R.L de C.V.', '8', 1500, 181911.81, 5837464.35, 0, 0, 0, 0, 6020876.16, 4214613.3, 1343440, 25, 'Cuadro Resumen BD'),
(11, 1, 'TOTAL', '55', 15730155.69, 3461053.62, 47631340.91, 0, 0, 0, 0, 66822550.22, 46775785.14, 9236150, 26, 'Cuadro Resumen BD'),
(12, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 'Cuadro Resumen BD'),
(13, 1, 'TOTAL', '427', 16498771.66, 8816877.93, 60511763.9, 0, 0, 0, 0, 85827413.49, 60079189.55, 22539554.41, 28, 'Cuadro Resumen BD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisionesTemporales`
--

CREATE TABLE `revisionesTemporales` (
  `idrevisionesTemporales` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarios_idusuarios` int(11) NOT NULL,
  `totalErrores` int(11) DEFAULT '1',
  `archivo` varchar(99) NOT NULL,
  `estado_idestado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `revisionesTemporales`
--

INSERT INTO `revisionesTemporales` (`idrevisionesTemporales`, `fecha`, `usuarios_idusuarios`, `totalErrores`, `archivo`, `estado_idestado`) VALUES
(1, '2017-04-13 14:56:21', 1, 0, '../tmpFiles/pruebaEnVivoZc.xlsx', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisionesTemporales_has_documentosValor`
--

CREATE TABLE `revisionesTemporales_has_documentosValor` (
  `revisionesTemporales_idrevisionesTemporales` int(11) NOT NULL,
  `documentosValor_iddocumentosValor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `revisionesTemporales_has_documentosValor`
--

INSERT INTO `revisionesTemporales_has_documentosValor` (`revisionesTemporales_idrevisionesTemporales`, `documentosValor_iddocumentosValor`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idroles` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idroles`, `nombre`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_has_modulos`
--

CREATE TABLE `roles_has_modulos` (
  `roles_idroles` int(11) NOT NULL,
  `modulos_idmodulos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles_has_modulos`
--

INSERT INTO `roles_has_modulos` (`roles_idroles`, `modulos_idmodulos`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sociedad`
--

CREATE TABLE `sociedad` (
  `idsociedad` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `clave` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sociedad`
--

INSERT INTO `sociedad` (`idsociedad`, `nombre`, `clave`) VALUES
(1, 'CAJA POPULAR DEL ESTADO NUEVO LEÓN, S.C. DE R.L', '01'),
(2, 'CAJA POPULAR LA NUMERO 1 DE OAXACA, S.C. DE R.L.', '01'),
(3, 'CAJA POPULAR LA NUMERO UNO DE AGUASCALIENTES, S.C.L.', '01'),
(4, 'CAJA POPULAR LA NUMERO UNO DE PUEBLA, S.C.L.', '01'),
(5, 'COOPERATIVA CAJA POPULAR DE MICHOACÁN, S.C.L.', '01'),
(6, 'COOPERATIVA CAJA POPULAR DE QUERÉTARO, S.C.L.', '01'),
(7, 'COOPERATIVA CAJA POPULAR DE VERACRUZ, S.C.L.', '01'),
(8, 'COOPERATIVA CAJA POPULAR DEL ESTADO DE CAMPECHE, S.C. DE R.L.', '01'),
(9, 'COOPERATIVA CAJA POPULAR DEL ESTADO DE CHIAPAS, S.C. DE R.L.', '01'),
(10, 'COOPERATIVA CAJA POPULAR DEL ESTADO DE CHIHUAHUA, S.C. DE R.L.', '01'),
(11, 'COOPERATIVA CAJA POPULAR DEL PACÍFICO, S.C.L.', '01'),
(12, 'COOPERATIVA CAJA POPULAR GUERRERENSE, S.C.L.', '01'),
(13, 'COOPERATIVA CAJA POPULAR INSURGENTES, S.C.L.', '01'),
(14, 'COOPERATIVA CAJA POPULAR LA AUTÉNTICA DE TABASCO, S.C.L.', '01'),
(15, 'COOPERATIVA CAJA POPULAR LA NUMERO 1 DE HIDALGO, S.C.L.', '01'),
(16, 'COOPERATIVA CAJA POPULAR LA NUMERO UNO DE DURANGO, S.C.L.', '01'),
(17, 'COOPERATIVA CAJA POPULAR LA NUMERO UNO DEL ESTADO DE MÉXICO, S.C.L.', '01'),
(18, 'COOPERATIVA CAJA POPULAR NAYARITA, S.C.L.', '01'),
(19, 'COOPERATIVA CAJA POPULAR PUERTO VALLARTA, S.C.L.', '01'),
(20, 'COOPERATIVA CAJA POPULAR ZACATECANA, S.C.L.', '01'),
(21, 'SOCIEDAD COOPERATIVA CAJA POPULAR LA MORELENSE, S.C.L.', '01'),
(22, 'SOCIEDAD COOPERATIVA CAJA POPULAR LA NUMERO 1 DE TLAXCALA, S.C.L.', '01'),
(23, 'SOCIEDAD COOPERATIVA CAJA POPULAR LA NUMERO UNO DE SINALOA, S.C.L.', '01'),
(24, 'COOPERATIVA CAJA POPULAR DEL SOL, S.C.L. DE C.V.', '02'),
(25, 'CRÉDITO Y AHORRO DEL NOROESTE, SOCIEDAD DE AHORRO Y PRÉSTAMO', '03'),
(26, 'COOPERATIVA POPULAR PREMIER, S.C. DE R.L.', '04'),
(27, 'COOPERATIVA CAJA POPULAR DEL VESTIDO, S.C. DE R.L. DE C.V.', '05'),
(28, 'COOPERATIVA CAJA POPULAR DEL ÁNGEL, S.C. DE R.L. DE C.V.', '06'),
(29, 'COOPERATIVA CAJA POPULAR DEL BOSQUE, S.C. DE R.L.', '07'),
(30, 'MULTICAJA, SOCIEDAD DE AHORRO Y PRÉSTAMO', '08'),
(31, 'CAJA VILLA GRANDE, S.C.L.', '09'),
(32, 'CAJA POPULAR REAL SAN SEBASTIÁN, S.C.L.', '10'),
(33, 'COMERCIALIZADORA PANAMERICANA CAPRICORNIO, S.A. DE C.V.', '11'),
(34, 'ALIANZA DE CAPITAL SOCIAL, S.C. DE R.L. DE C.V.', '12'),
(35, 'COOPERATIVA DE CONSUMO CAJA POPULAR NUEVA UNIÓN, S.C.L.', '13'),
(36, 'COOPERATIVA DE CONSUMO AHORRO Y PRÉSTAMO CRISTO REY, S.C.L.', '14'),
(37, 'SEMILLAS DEL SOL, S.A.', '15'),
(38, 'CAJA REGRECE, A.C.', '16'),
(39, 'ORGANIZACION GREMIAL NACIONAL PRO-FONDO DE RETIRO, S.C.', '17'),
(40, 'COOPERATIVA Y PREVISIÓN ECONÓMICA VENCEREMOS, S.C.L. DE C.V.', '18'),
(41, 'COOPERATIVA DE PREVISIÓN ECONÓMICA GÉNESIS, S.C.L. DE C.V.', '19'),
(42, 'SERVICAJA, SOCIEDAD DE AHORRO Y PRÉSTAMO', '20'),
(43, 'FOMENTO LATINOAMERICANO, S.A.P.', '21'),
(44, 'ATLAN, S.C.', '22'),
(45, 'UNIVERSAL FOMENTO Y DESARROLLO, A.C.', '23'),
(46, 'CAJA POPULAR HUICHAPAN, A.C.', '24'),
(47, 'SOCIEDAD COOPERATIVA DE FOMENTO REGIONAL PINOS, S.C.L', '25'),
(48, 'CAJA POPULAR LA ROCA DE ORO, A.C.', '26'),
(49, 'CAJA POPULAR DE MAZAMITLA, A.C.', '27'),
(50, 'CAJA POPULAR MASCOTA, A.C.', '28'),
(51, 'CAJA DE AHORRO DEL GRUPO JHONNY, A.C.', '29'),
(52, 'DEL MINERAL DE FRESNILLO, S.C. DE R.L.', '30'),
(53, 'CAJA POPULAR EL PUENTE, S.C. DE C.V. Y R.L.', '31'),
(54, 'UTLAXPAN, S.C.', '32'),
(55, 'CAJA POPULAR TEPEJI, S.C.L. DE C.V.', '33'),
(56, 'PRODUCCION DE BIENES Y SERVICIOS LA MEXIQUENSE, S.C. DE R.L.', '34'),
(57, 'COOPERATIVA DE VIVIENDA POPULAR JUNTOS ORGANIZADOS VENCEREMOS, S.C. DE R.L.', '35'),
(58, 'FINANCIERA COOFIA, S.C. DE R.L.', '36'),
(59, 'GRUPO DE BIENESTAR SOCIAL LA PAZ, S.C.', '37'),
(60, 'CAJA POPULAR CASANDOO, S.A. DE C.V.', '38'),
(61, 'SACRIPUTLA, S.C. DE R.L.', '39'),
(62, 'COOP. CRISTIANA DE AHORRO Y PRÉSTAMO, INV. Y CRÉD. UN NUEVO MILENIO DE SANTIAGO JUXTLAHUACA, S.C. DE R.L. DE C.V.', '40'),
(63, 'SOCIEDAD COOPERATIVA CAJA DE AHORRO DEL MUNICIPIO DE ATLZAYANCA Y/O CAJA DE AHORRO ESTRADA', '41'),
(64, 'COOPERATIVA CENTENARIO, S.C. DE R.L. DE C.V.', '42'),
(65, 'SISTEMA COOPERATIVO DEL VALLE, S.C. DE R.L.', '43'),
(66, 'CAJA SOLIDARIA LA MIXTECA, S.C.', '44'),
(67, 'CAJA POPULAR EL PARAISO, S.C. DE R.L. DE C.V.', '45'),
(68, 'CAJA POPULAR DR. PEDRO ESCOBEDO, S.C.L.', '46'),
(69, 'CAJA 30 DE AGOSTO, S.C. DE A.P. DE R.L. DE C.V.', '47'),
(70, 'INVERSIONES DE TLAXCALA, S.C. DE R.L.', '48'),
(71, 'CAJA SOLIDARIA TZACUALTITLA SANCTORUM, S.C. DE A. P. DE R.L. DE C.V.', '49'),
(72, 'SERFINSO, S.C. DE R.L.', '50'),
(73, 'CAJA PROGRESA, S.C. DE R.L. DE C.V.', '51'),
(74, 'CAJA PIONEROS, S.C.L.', '52'),
(75, 'COOPERATIVA DEL SURESTE, S.C DE R.L.', '54'),
(76, 'KAXA TAON S.C DE A.P. DE R.L DE C.V.', '56'),
(77, 'SERFIR, S.C. DE R.L. DE C.V', '57'),
(138, 'Inversiones de Tlaxcala S.C. de R.L.', '58'),
(139, 'Caja de Ahorro y Servicios BAMPECO, S.C. de A.P. de R.L. de C.V.', '59'),
(140, 'Caja Popular del Sureste, S.C de R.L de C.V.', '60');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statusConvenio`
--

CREATE TABLE `statusConvenio` (
  `idstatusConvenio` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `statusConvenio`
--

INSERT INTO `statusConvenio` (`idstatusConvenio`, `descripcion`) VALUES
(1, 'Autorizado no firmado'),
(2, 'Firmado'),
(3, 'En operación (Publicado en DOF)'),
(4, 'En proceso'),
(5, 'En conciliación'),
(6, 'Cerrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statusMinistracion`
--

CREATE TABLE `statusMinistracion` (
  `idstatusMinistracion` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `statusMinistracion`
--

INSERT INTO `statusMinistracion` (`idstatusMinistracion`, `descripcion`) VALUES
(1, 'En revisión'),
(2, 'Aprobada'),
(3, 'Rechazada'),
(4, 'Ministrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statusUsuarios`
--

CREATE TABLE `statusUsuarios` (
  `idstatusUsuarios` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `statusUsuarios`
--

INSERT INTO `statusUsuarios` (`idstatusUsuarios`, `descripcion`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `pss` varchar(45) DEFAULT NULL,
  `roles_idroles` int(11) NOT NULL,
  `statusUsuarios_idstatusUsuarios` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `nombre`, `user`, `pss`, `roles_idroles`, `statusUsuarios_idstatusUsuarios`) VALUES
(1, 'Zahit Rios', 'admin', 'd2c11a8fa833b73f4a516a4da5c298a8', 1, 1),
(5, 'Armando Leroux', 'aleroux', '583aa10259776b280ab75e666bfcf9e7', 1, 1),
(6, 'Iván Gallardo', 'gallardo', '27c8a29deaeedad914e93624389fc1d4', 1, 1),
(7, 'Nolasco Gonzalez Luis', 'lnolasco@fipago.org.mx', '7326b5b0a4d6197ef2f5c4685177a11a', 1, 1),
(8, 'Krauss Paredes María Teresa', 'mkrauss@fipago.org.mx', 'e6092e2a03835b73f842e4ec89536c6d', 1, 1),
(9, 'Rodriguez Zarza Brenda Fabiola', 'brodriguez@fipago.org.mx', 'b5bdc9cb24721147a9f2b541617a7fdf', 1, 1),
(10, 'Andrade Ramos Vicente Rodrigo', 'vandrade@fipago.org.mx', '7cc308450b691dd29d3d69f1d80fe1c3', 1, 1),
(11, 'Cuellar Perez Rea Fernando', 'fcperez@fipago.org.mx', '6221ef9a67e52533dc6d329dab2b12d9', 1, 1),
(12, 'Daniel Ayala', 'dayala@fipago.org.mx', '07e25d7eeddda23f151599c315d47f8a', 1, 1),
(13, 'Denise', 'denise', 'f09d212da7dee11b2f2d3bc823732d61', 1, 2),
(14, 'Sandra Unzaga', 'sandy', '6916712ea888006d7d863df810e362ec', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variables`
--

CREATE TABLE `variables` (
  `idvariables` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `valor` text NOT NULL,
  `vigenciaInicial` date NOT NULL,
  `vigenciaFinal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variables`
--

INSERT INTO `variables` (`idvariables`, `nombre`, `valor`, `vigenciaInicial`, `vigenciaFinal`) VALUES
(1, 'Procentaje de contingencia por default', '15', '2015-09-01', '2024-12-31'),
(2, 'Monto máximo de pago al 70%', '167930.00', '2015-04-05', '2022-10-01'),
(3, 'Monto máximo de pago al 100%', '239900.00', '2015-10-01', '2022-10-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`idactividades`);

--
-- Indices de la tabla `ahorrador`
--
ALTER TABLE `ahorrador`
  ADD PRIMARY KEY (`idahorrador`);

--
-- Indices de la tabla `ahorradorChequesNoCobrados`
--
ALTER TABLE `ahorradorChequesNoCobrados`
  ADD PRIMARY KEY (`idahorradorChequesNoCobrados`);

--
-- Indices de la tabla `ahorradorCuentasAhorro`
--
ALTER TABLE `ahorradorCuentasAhorro`
  ADD PRIMARY KEY (`idahorradorCuentasAhorro`);

--
-- Indices de la tabla `ahorradorCuentasInversion`
--
ALTER TABLE `ahorradorCuentasInversion`
  ADD PRIMARY KEY (`idahorradorCuentasInversion`);

--
-- Indices de la tabla `ahorradorDepositosGarantia`
--
ALTER TABLE `ahorradorDepositosGarantia`
  ADD PRIMARY KEY (`idahorradorDepositosGarantia`);

--
-- Indices de la tabla `ahorradorOtrosDepositos`
--
ALTER TABLE `ahorradorOtrosDepositos`
  ADD PRIMARY KEY (`idahorradorOtrosDepositos`);

--
-- Indices de la tabla `ahorradorParteSocial`
--
ALTER TABLE `ahorradorParteSocial`
  ADD PRIMARY KEY (`idahorradorParteSocial`);

--
-- Indices de la tabla `ahorradorPrestamosCargo`
--
ALTER TABLE `ahorradorPrestamosCargo`
  ADD PRIMARY KEY (`idahorradorPrestamosCargo`);

--
-- Indices de la tabla `ahorrador_has_documentosIdentidad`
--
ALTER TABLE `ahorrador_has_documentosIdentidad`
  ADD PRIMARY KEY (`ahorrador_idahorrador`,`documentosIdentidad_iddocumentosIdentidad`);

--
-- Indices de la tabla `analiticasCertificadas`
--
ALTER TABLE `analiticasCertificadas`
  ADD PRIMARY KEY (`idanaliticasCertificadas`),
  ADD KEY `nuevoFolioIdentificador` (`nuevoFolioIdentificador`),
  ADD KEY `folioIdentificadorAnterior` (`folioIdentificadorAnterior`),
  ADD KEY `filaDocumentoOriginal` (`filaDocumentoOriginal`),
  ADD KEY `hojaDocumentoOriginal` (`hojaDocumentoOriginal`),
  ADD KEY `curp` (`curp`);

--
-- Indices de la tabla `analiticasTemporales`
--
ALTER TABLE `analiticasTemporales`
  ADD PRIMARY KEY (`idanaliticasTemporales`),
  ADD KEY `nuevoFolioIdentificador` (`nuevoFolioIdentificador`),
  ADD KEY `folioIdentificadorAnterior` (`folioIdentificadorAnterior`),
  ADD KEY `filaDocumentoOriginal` (`filaDocumentoOriginal`),
  ADD KEY `hojaDocumentoOriginal` (`hojaDocumentoOriginal`),
  ADD KEY `curp` (`curp`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`idbancos`);

--
-- Indices de la tabla `basesCertificadas`
--
ALTER TABLE `basesCertificadas`
  ADD PRIMARY KEY (`idbasesCertificadas`);

--
-- Indices de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD PRIMARY KEY (`idcapacitacion`);

--
-- Indices de la tabla `consolidadasCertificadas`
--
ALTER TABLE `consolidadasCertificadas`
  ADD PRIMARY KEY (`idconsolidadasCertificadas`),
  ADD KEY `nuevoFolioIdentificador` (`nuevoFolioIdentificador`),
  ADD KEY `folioIdentificadorAnterior` (`folioIdentificadorAnterior`),
  ADD KEY `filaDocumentoOriginal` (`filaDocumentoOriginal`),
  ADD KEY `hojaDocumentoOriginal` (`hojaDocumentoOriginal`),
  ADD KEY `curp` (`curp`);

--
-- Indices de la tabla `consolidadasTemporales`
--
ALTER TABLE `consolidadasTemporales`
  ADD PRIMARY KEY (`idconsolidadasTemporales`),
  ADD KEY `nuevoFolioIdentificador` (`nuevoFolioIdentificador`),
  ADD KEY `folioIdentificadorAnterior` (`folioIdentificadorAnterior`),
  ADD KEY `filaDocumentoOriginal` (`filaDocumentoOriginal`),
  ADD KEY `hojaDocumentoOriginal` (`hojaDocumentoOriginal`),
  ADD KEY `curp` (`curp`);

--
-- Indices de la tabla `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`idconvenio`);

--
-- Indices de la tabla `convenio_has_ahorrador`
--
ALTER TABLE `convenio_has_ahorrador`
  ADD PRIMARY KEY (`convenio_idconvenio`,`ahorrador_idahorrador`);

--
-- Indices de la tabla `convenio_has_sociedad`
--
ALTER TABLE `convenio_has_sociedad`
  ADD PRIMARY KEY (`convenio_idconvenio`,`sociedad_idsociedad`);

--
-- Indices de la tabla `documentosIdentidad`
--
ALTER TABLE `documentosIdentidad`
  ADD PRIMARY KEY (`iddocumentosIdentidad`);

--
-- Indices de la tabla `documentosValor`
--
ALTER TABLE `documentosValor`
  ADD PRIMARY KEY (`iddocumentosValor`);

--
-- Indices de la tabla `erroresCertificadas`
--
ALTER TABLE `erroresCertificadas`
  ADD PRIMARY KEY (`iderroresCertificadas`);

--
-- Indices de la tabla `erroresMinistracionesTemporales`
--
ALTER TABLE `erroresMinistracionesTemporales`
  ADD PRIMARY KEY (`iderroresMinistracionesTemporales`);

--
-- Indices de la tabla `erroresModificaciones`
--
ALTER TABLE `erroresModificaciones`
  ADD PRIMARY KEY (`iderroresModificaciones`);

--
-- Indices de la tabla `erroresRevisiones`
--
ALTER TABLE `erroresRevisiones`
  ADD PRIMARY KEY (`iderroresRevisiones`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`);

--
-- Indices de la tabla `ministracionesTemporales`
--
ALTER TABLE `ministracionesTemporales`
  ADD PRIMARY KEY (`idministracionesTemporales`);

--
-- Indices de la tabla `modificaciones`
--
ALTER TABLE `modificaciones`
  ADD PRIMARY KEY (`idmodificaciones`);

--
-- Indices de la tabla `modificacionesAnalitica`
--
ALTER TABLE `modificacionesAnalitica`
  ADD PRIMARY KEY (`idmodificacionesAnalitica`);

--
-- Indices de la tabla `modificacionesConsolidada`
--
ALTER TABLE `modificacionesConsolidada`
  ADD PRIMARY KEY (`idmodificacionesConsolidada`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`idmodulos`);

--
-- Indices de la tabla `registrosMinistraciones`
--
ALTER TABLE `registrosMinistraciones`
  ADD PRIMARY KEY (`idregistrosMinistraciones`);

--
-- Indices de la tabla `resumenCertificadas`
--
ALTER TABLE `resumenCertificadas`
  ADD PRIMARY KEY (`idresumenCertificadas`);

--
-- Indices de la tabla `resumenTemporales`
--
ALTER TABLE `resumenTemporales`
  ADD PRIMARY KEY (`idresumenTemporales`);

--
-- Indices de la tabla `revisionesTemporales`
--
ALTER TABLE `revisionesTemporales`
  ADD PRIMARY KEY (`idrevisionesTemporales`);

--
-- Indices de la tabla `revisionesTemporales_has_documentosValor`
--
ALTER TABLE `revisionesTemporales_has_documentosValor`
  ADD PRIMARY KEY (`revisionesTemporales_idrevisionesTemporales`,`documentosValor_iddocumentosValor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idroles`);

--
-- Indices de la tabla `roles_has_modulos`
--
ALTER TABLE `roles_has_modulos`
  ADD PRIMARY KEY (`roles_idroles`,`modulos_idmodulos`);

--
-- Indices de la tabla `sociedad`
--
ALTER TABLE `sociedad`
  ADD PRIMARY KEY (`idsociedad`);

--
-- Indices de la tabla `statusConvenio`
--
ALTER TABLE `statusConvenio`
  ADD PRIMARY KEY (`idstatusConvenio`);

--
-- Indices de la tabla `statusMinistracion`
--
ALTER TABLE `statusMinistracion`
  ADD PRIMARY KEY (`idstatusMinistracion`);

--
-- Indices de la tabla `statusUsuarios`
--
ALTER TABLE `statusUsuarios`
  ADD PRIMARY KEY (`idstatusUsuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`);

--
-- Indices de la tabla `variables`
--
ALTER TABLE `variables`
  ADD PRIMARY KEY (`idvariables`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `idactividades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `ahorrador`
--
ALTER TABLE `ahorrador`
  MODIFY `idahorrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=428;
--
-- AUTO_INCREMENT de la tabla `ahorradorChequesNoCobrados`
--
ALTER TABLE `ahorradorChequesNoCobrados`
  MODIFY `idahorradorChequesNoCobrados` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ahorradorCuentasAhorro`
--
ALTER TABLE `ahorradorCuentasAhorro`
  MODIFY `idahorradorCuentasAhorro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT de la tabla `ahorradorCuentasInversion`
--
ALTER TABLE `ahorradorCuentasInversion`
  MODIFY `idahorradorCuentasInversion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;
--
-- AUTO_INCREMENT de la tabla `ahorradorDepositosGarantia`
--
ALTER TABLE `ahorradorDepositosGarantia`
  MODIFY `idahorradorDepositosGarantia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ahorradorOtrosDepositos`
--
ALTER TABLE `ahorradorOtrosDepositos`
  MODIFY `idahorradorOtrosDepositos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ahorradorParteSocial`
--
ALTER TABLE `ahorradorParteSocial`
  MODIFY `idahorradorParteSocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;
--
-- AUTO_INCREMENT de la tabla `ahorradorPrestamosCargo`
--
ALTER TABLE `ahorradorPrestamosCargo`
  MODIFY `idahorradorPrestamosCargo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `analiticasCertificadas`
--
ALTER TABLE `analiticasCertificadas`
  MODIFY `idanaliticasCertificadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;
--
-- AUTO_INCREMENT de la tabla `analiticasTemporales`
--
ALTER TABLE `analiticasTemporales`
  MODIFY `idanaliticasTemporales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;
--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `idbancos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT de la tabla `basesCertificadas`
--
ALTER TABLE `basesCertificadas`
  MODIFY `idbasesCertificadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  MODIFY `idcapacitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `consolidadasCertificadas`
--
ALTER TABLE `consolidadasCertificadas`
  MODIFY `idconsolidadasCertificadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;
--
-- AUTO_INCREMENT de la tabla `consolidadasTemporales`
--
ALTER TABLE `consolidadasTemporales`
  MODIFY `idconsolidadasTemporales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;
--
-- AUTO_INCREMENT de la tabla `convenio`
--
ALTER TABLE `convenio`
  MODIFY `idconvenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `documentosIdentidad`
--
ALTER TABLE `documentosIdentidad`
  MODIFY `iddocumentosIdentidad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `documentosValor`
--
ALTER TABLE `documentosValor`
  MODIFY `iddocumentosValor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `erroresCertificadas`
--
ALTER TABLE `erroresCertificadas`
  MODIFY `iderroresCertificadas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `erroresMinistracionesTemporales`
--
ALTER TABLE `erroresMinistracionesTemporales`
  MODIFY `iderroresMinistracionesTemporales` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `erroresModificaciones`
--
ALTER TABLE `erroresModificaciones`
  MODIFY `iderroresModificaciones` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `erroresRevisiones`
--
ALTER TABLE `erroresRevisiones`
  MODIFY `iderroresRevisiones` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `idlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ministracionesTemporales`
--
ALTER TABLE `ministracionesTemporales`
  MODIFY `idministracionesTemporales` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `modificaciones`
--
ALTER TABLE `modificaciones`
  MODIFY `idmodificaciones` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `modificacionesAnalitica`
--
ALTER TABLE `modificacionesAnalitica`
  MODIFY `idmodificacionesAnalitica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `modificacionesConsolidada`
--
ALTER TABLE `modificacionesConsolidada`
  MODIFY `idmodificacionesConsolidada` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `idmodulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `registrosMinistraciones`
--
ALTER TABLE `registrosMinistraciones`
  MODIFY `idregistrosMinistraciones` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `resumenCertificadas`
--
ALTER TABLE `resumenCertificadas`
  MODIFY `idresumenCertificadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `resumenTemporales`
--
ALTER TABLE `resumenTemporales`
  MODIFY `idresumenTemporales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `revisionesTemporales`
--
ALTER TABLE `revisionesTemporales`
  MODIFY `idrevisionesTemporales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idroles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sociedad`
--
ALTER TABLE `sociedad`
  MODIFY `idsociedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT de la tabla `statusConvenio`
--
ALTER TABLE `statusConvenio`
  MODIFY `idstatusConvenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `statusMinistracion`
--
ALTER TABLE `statusMinistracion`
  MODIFY `idstatusMinistracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `statusUsuarios`
--
ALTER TABLE `statusUsuarios`
  MODIFY `idstatusUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `variables`
--
ALTER TABLE `variables`
  MODIFY `idvariables` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
