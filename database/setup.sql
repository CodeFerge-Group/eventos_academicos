-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/04/2026 às 13:18
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `workshopbd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento`
--

CREATE TABLE `evento` (
  `id_Evento` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `moderador` varchar(100) NOT NULL,
  `datainicio` datetime DEFAULT NULL CHECK (`datainicio` < `datafim`),
  `datafim` datetime DEFAULT NULL CHECK (`datafim` > `datainicio`),
  `localevento` varchar(100) NOT NULL DEFAULT 'Angola' CHECK (octet_length(`localevento`) >= 5),
  `capacidade` int(11) DEFAULT NULL,
  `precoinscricao` decimal(10,2) DEFAULT 0.00 CHECK (`precoinscricao` >= 0),
  `foto` varchar(255) DEFAULT 'default.webp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `evento`
--

INSERT INTO `evento` (`id_Evento`, `nome`, `moderador`, `datainicio`, `datafim`, `localevento`, `capacidade`, `precoinscricao`, `foto`) VALUES
(2, 'Workshop: APRESENTAÇÃO DE PROJSCTOS TECNOLÓGICOS', 'Cândido Kuiluando', '2026-04-04 09:03:00', '2026-04-04 14:30:00', 'Unikiv Uige, Angola', 100, 0.00, 'default.webp'),
(3, 'Conferência: Tecnologia e Ética', 'manuel Vieira', '2026-05-16 10:00:00', '2026-05-17 15:30:00', 'Ispu Uige, Angola', 150, 3000.00, 'default.webp'),
(4, 'Palestra: Mulheres na Tecnologia', 'Manuel Vieira', '2026-06-05 08:30:00', '2026-06-05 13:30:00', 'Ispu Uige, Angola', 80, 2000.00, 'default.webp'),
(5, 'Seminário: Trenamento Pedagógigo', 'Maria Tumba', '2026-06-10 10:00:00', '2026-06-10 15:30:00', 'Kimpa Vita Uige, Angola', 100, 0.00, 'default.webp'),
(6, 'Palestra: Empreendedorismo em Angola', 'António Afonso', '2026-05-07 08:30:00', '2026-05-07 12:00:00', 'IMAG Uige, Angola', 150, 1500.00, 'default.webp'),
(7, 'Workshop: APRESENTAÇÃO DE PROJSCTOS de Economia', 'Cândido Kuiluando', '2026-04-28 12:00:00', '2026-04-28 16:00:00', 'Kimpa Vita Uige, Angola', 160, 0.00, 'default.webp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `id_inscricao` int(11) NOT NULL,
  `comprovativo` varchar(200) DEFAULT NULL,
  `datainscricao` date DEFAULT NULL,
  `tipo_inscricao` enum('Gratuita','Paga') NOT NULL,
  `status_pagamento` enum('Pendente','Confirmado','Cancelado','Isento') DEFAULT 'Pendente',
  `valor_pago` decimal(10,2) DEFAULT 0.00 CHECK (`valor_pago` >= 0),
  `id_Evento` int(11) DEFAULT NULL,
  `id_participante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `inscricao`
--

INSERT INTO `inscricao` (`id_inscricao`, `comprovativo`, `datainscricao`, `tipo_inscricao`, `status_pagamento`, `valor_pago`, `id_Evento`, `id_participante`) VALUES
(6, NULL, '2026-04-04', 'Gratuita', 'Isento', 0.00, 2, 12),
(7, NULL, '2026-04-04', 'Paga', 'Pendente', 0.00, 3, 13),
(8, '14_20260404104025_Captura_de_Tela_295.png', '2026-04-04', 'Paga', 'Confirmado', 3000.00, 3, 14),
(9, NULL, '2026-04-04', 'Gratuita', 'Isento', 0.00, 2, 15),
(10, NULL, '2026-04-06', 'Paga', 'Pendente', 0.00, 4, 16),
(11, NULL, '2026-04-07', 'Gratuita', 'Isento', 0.00, 5, 17),
(12, '18_20260407100631_Captura_de_Tela_324.png', '2026-04-07', 'Paga', 'Confirmado', 0.00, 4, 18);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orador`
--

CREATE TABLE `orador` (
  `id_orador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `datanasc` date DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `telefone` varchar(20) DEFAULT '+244 ' CHECK (`telefone` like '+244 %' and octet_length(`telefone`) = 14),
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `bio` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `orador`
--

INSERT INTO `orador` (`id_orador`, `nome`, `datanasc`, `genero`, `telefone`, `email`, `endereco`, `especialidade`, `bio`) VALUES
(2, 'Maria joão', '2002-01-31', 'F', '+244 921346654', 'tumbagmail.com', 'Mbema Ngangu', 'Engenheira hidráulica', 'desenhadora tecnica '),
(3, 'Ariel Alfredo', '2002-08-21', 'F', '+244 932654092', 'ariel@gmal.com', 'Cetralidade de Kilumonso', 'professora de Mat e  Fisica', 'Ensino médio em formação de professores'),
(4, 'Matondo Kuanzambi', '2000-02-03', 'M', '+244 934521123', 'kuanzambi@gmail.com', 'Papelão', 'engenheiro informatico', 'licenciatura TI e professor de mat'),
(5, 'Ana Vangawete', '2002-08-21', 'F', '+244 954321123', 'vanga@gmail.com', NULL, 'professora de Mat e  Fisica', 'ensino medio: mat e fisica'),
(6, 'bem vindo', '1997-10-07', 'M', '+244 954213456', 'bem@gmail.com', '14', 'engenheiro informatica', 'licenciado engenharia informática '),
(7, 'Domingas Manuel', '2000-06-20', 'F', '+244 961432123', 'domi@gmail.com', 'Papelão', 'engenharia hidráulica', 'licenciada em engenharioa hidráulica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `participante`
--

CREATE TABLE `participante` (
  `id_participante` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `datanasc` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT '+244 ' CHECK (`telefone` like '+244 %' and octet_length(`telefone`) = 14),
  `genero` enum('M','F') DEFAULT NULL,
  `instituicao` varchar(100) DEFAULT NULL,
  `curso` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `participante`
--

INSERT INTO `participante` (`id_participante`, `nome`, `datanasc`, `email`, `telefone`, `genero`, `instituicao`, `curso`) VALUES
(12, 'Madalena Carlos', '2004-04-23', 'madalena@gmail.com', '+244 954678321', 'F', 'Isede', 'Ingles'),
(13, 'Suzana Diasivi Nicolau', '2000-06-03', 'suzanadiasivinicolau@gmail.com', '+244 932919940', 'F', 'kimpa Vita', 'Engeriaria Informática'),
(14, 'Kiassisua S. Pedro', '2002-03-12', 'kiassisua@gmail.com', '+244 932657321', 'M', 'kimpa Vita', 'engenharia informática'),
(15, 'Ana Vangawete', '2005-02-28', 'vanga@gmail.com', '+244 975257835', 'F', 'Mandogex', 'Enfermagem'),
(16, 'Pedro Matias', '2010-10-29', 'matias@gmail.com', '+244 945321789', 'M', 'zenzu', 'contabilidade'),
(17, 'Moyo Kanivengidio', '1979-05-03', 'moyo@gmail.com', '+244 923456768', 'M', 'kimpa Vita', 'Engeriaria Informática'),
(18, 'Kiese Pedro', '1998-11-04', 'kiese@gmail.com', '+244 954321678', 'F', 'kimpa Vita', 'agronomia');

--
-- Acionadores `participante`
--
DELIMITER $$
CREATE TRIGGER `validar_data_nascimento` BEFORE INSERT ON `participante` FOR EACH ROW BEGIN
    IF NEW.datanasc >= CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Data de nascimento invalida! Nao pode ser no futuro.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessao`
--

CREATE TABLE `sessao` (
  `id_sessao` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `datahora` datetime DEFAULT NULL,
  `sala` varchar(100) DEFAULT NULL,
  `id_Evento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessao`
--

INSERT INTO `sessao` (`id_sessao`, `descricao`, `datahora`, `sala`, `id_Evento`) VALUES
(2, 'O impacto de IA na sociedade', '2026-04-04 10:00:00', 'nº 4', NULL),
(4, 'Mulheres na Tecnologia', '2026-06-05 09:00:00', 'nº 10', NULL),
(5, 'Ética na tenologia', '2000-06-05 09:00:00', '3', NULL),
(6, 'Como transmitir conhecimento de Mat', '2026-05-10 10:00:00', 'nº 10', NULL),
(7, 'Como transmitir conhecimento de Mat', '2026-06-10 11:30:00', 'nº 10', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessao_orador`
--

CREATE TABLE `sessao_orador` (
  `id_sessao` int(11) NOT NULL,
  `id_orador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessao_orador`
--

INSERT INTO `sessao_orador` (`id_sessao`, `id_orador`) VALUES
(2, 3),
(2, 5),
(4, 2),
(7, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_Evento`);

--
-- Índices de tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id_inscricao`),
  ADD KEY `id_Evento` (`id_Evento`),
  ADD KEY `id_participante` (`id_participante`);

--
-- Índices de tabela `orador`
--
ALTER TABLE `orador`
  ADD PRIMARY KEY (`id_orador`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`);

--
-- Índices de tabela `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`id_participante`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`);

--
-- Índices de tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id_sessao`),
  ADD KEY `id_Evento` (`id_Evento`);

--
-- Índices de tabela `sessao_orador`
--
ALTER TABLE `sessao_orador`
  ADD PRIMARY KEY (`id_sessao`,`id_orador`),
  ADD KEY `id_orador` (`id_orador`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `evento`
--
ALTER TABLE `evento`
  MODIFY `id_Evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id_inscricao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `orador`
--
ALTER TABLE `orador`
  MODIFY `id_orador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `participante`
--
ALTER TABLE `participante`
  MODIFY `id_participante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `sessao`
--
ALTER TABLE `sessao`
  MODIFY `id_sessao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`id_Evento`) REFERENCES `evento` (`id_Evento`),
  ADD CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`id_participante`) REFERENCES `participante` (`id_participante`);

--
-- Restrições para tabelas `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`id_Evento`) REFERENCES `evento` (`id_Evento`);

--
-- Restrições para tabelas `sessao_orador`
--
ALTER TABLE `sessao_orador`
  ADD CONSTRAINT `sessao_orador_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessao` (`id_sessao`) ON DELETE CASCADE,
  ADD CONSTRAINT `sessao_orador_ibfk_2` FOREIGN KEY (`id_orador`) REFERENCES `orador` (`id_orador`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
