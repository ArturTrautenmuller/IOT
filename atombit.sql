-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Nov-2018 às 16:51
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atombit`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ar`
--

CREATE TABLE `ar` (
  `n` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `work` int(11) NOT NULL,
  `temp` float NOT NULL,
  `operation` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ar`
--

INSERT INTO `ar` (`n`, `state`, `work`, `temp`, `operation`) VALUES
(1, 0, 0, 18, 'scda1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lampada`
--

CREATE TABLE `lampada` (
  `n` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `red` int(11) NOT NULL,
  `green` int(11) NOT NULL,
  `blue` int(11) NOT NULL,
  `operation` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lampada`
--

INSERT INTO `lampada` (`n`, `state`, `red`, `green`, `blue`, `operation`) VALUES
(1, 0, 200, 200, 2, 'scd1'),
(2, 0, 200, 200, 200, 'scd2'),
(3, 0, 200, 200, 200, 'scd3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `portao`
--

CREATE TABLE `portao` (
  `n` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `portao`
--

INSERT INTO `portao` (`n`, `state`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `scd1`
--

CREATE TABLE `scd1` (
  `n` int(11) NOT NULL,
  `ligar_s` int(11) NOT NULL,
  `ligar_h` int(11) NOT NULL,
  `ligar_m` int(11) NOT NULL,
  `desligar_s` int(11) NOT NULL,
  `desligar_h` int(11) NOT NULL,
  `desligar_m` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `scd1`
--

INSERT INTO `scd1` (`n`, `ligar_s`, `ligar_h`, `ligar_m`, `desligar_s`, `desligar_h`, `desligar_m`) VALUES
(1, 2, 7, 0, 2, 7, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `scd2`
--

CREATE TABLE `scd2` (
  `n` int(11) NOT NULL,
  `ligar_s` int(11) NOT NULL,
  `ligar_h` int(11) NOT NULL,
  `ligar_m` int(11) NOT NULL,
  `desligar_s` int(11) NOT NULL,
  `desligar_h` int(11) NOT NULL,
  `desligar_m` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `scd2`
--

INSERT INTO `scd2` (`n`, `ligar_s`, `ligar_h`, `ligar_m`, `desligar_s`, `desligar_h`, `desligar_m`) VALUES
(1, 0, 7, 0, 0, 7, 30),
(2, 2, 9, 10, 2, 9, 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `scd3`
--

CREATE TABLE `scd3` (
  `n` int(11) NOT NULL,
  `ligar_s` int(11) NOT NULL,
  `ligar_h` int(11) NOT NULL,
  `ligar_m` int(11) NOT NULL,
  `desligar_s` int(11) NOT NULL,
  `desligar_h` int(11) NOT NULL,
  `desligar_m` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `scd3`
--

INSERT INTO `scd3` (`n`, `ligar_s`, `ligar_h`, `ligar_m`, `desligar_s`, `desligar_h`, `desligar_m`) VALUES
(1, 0, 8, 0, 0, 8, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `scda1`
--

CREATE TABLE `scda1` (
  `n` int(11) NOT NULL,
  `ligar_s` int(11) NOT NULL,
  `ligar_h` int(11) NOT NULL,
  `ligar_m` int(11) NOT NULL,
  `desligar_s` int(11) NOT NULL,
  `desligar_h` int(11) NOT NULL,
  `desligar_m` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `scda1`
--

INSERT INTO `scda1` (`n`, `ligar_s`, `ligar_h`, `ligar_m`, `desligar_s`, `desligar_h`, `desligar_m`) VALUES
(1, 2, 4, 0, 2, 6, 0),
(2, 4, 16, 56, 4, 16, 57);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sensor`
--

CREATE TABLE `sensor` (
  `n` int(11) NOT NULL,
  `temp` float NOT NULL,
  `umid` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sensor`
--

INSERT INTO `sensor` (`n`, `temp`, `umid`) VALUES
(1, 23, 49);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar`
--
ALTER TABLE `ar`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `lampada`
--
ALTER TABLE `lampada`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `portao`
--
ALTER TABLE `portao`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `scd1`
--
ALTER TABLE `scd1`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `scd2`
--
ALTER TABLE `scd2`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `scd3`
--
ALTER TABLE `scd3`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `scda1`
--
ALTER TABLE `scda1`
  ADD PRIMARY KEY (`n`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`n`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ar`
--
ALTER TABLE `ar`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lampada`
--
ALTER TABLE `lampada`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `portao`
--
ALTER TABLE `portao`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scd1`
--
ALTER TABLE `scd1`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scd2`
--
ALTER TABLE `scd2`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scd3`
--
ALTER TABLE `scd3`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scda1`
--
ALTER TABLE `scda1`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
