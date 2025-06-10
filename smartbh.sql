-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 10 juin 2025 à 05:30
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `smartbh`
--

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`email`, `name`, `password`) VALUES
('aziz@gmail.com', NULL, 'aziz07'),
('dheker@gmail.com', NULL, 'dheker123'),
('louayafli5@gmail.com', 'louay', 'louay07'),
('medanas44@gmail.com', 'anas', 'medanas07'),
('slimenbouthour123@gmail.com', 'slimane', 'slimane123');

-- --------------------------------------------------------

--
-- Structure de la table `apiarysite`
--

CREATE TABLE `apiarysite` (
  `altitude` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `closingDate` datetime(6) DEFAULT NULL,
  `farm_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `implementationDate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `apiarysite`
--

INSERT INTO `apiarysite` (`altitude`, `latitude`, `longitude`, `closingDate`, `farm_id`, `id`, `implementationDate`) VALUES
(10, 30, 63, NULL, 3, 3, '2025-07-05 23:00:00.000000'),
(2, 35, 48, NULL, 3, 4, '2025-06-11 23:00:00.000000'),
(2, 50, 59, NULL, 5, 5, '2025-06-26 23:00:00.000000');

-- --------------------------------------------------------

--
-- Structure de la table `beehive`
--

CREATE TABLE `beehive` (
  `apiarySite_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `beehive`
--

INSERT INTO `beehive` (`apiarySite_id`, `id`, `name`) VALUES
(3, 2, 'appeile'),
(5, 3, 'appeile1'),
(3, 4, 'appeile4'),
(3, 5, 'appeile5'),
(3, 6, 'appeile6');

-- --------------------------------------------------------

--
-- Structure de la table `farm`
--

CREATE TABLE `farm` (
  `id` bigint(20) NOT NULL,
  `farmer_email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `farm`
--

INSERT INTO `farm` (`id`, `farmer_email`, `name`) VALUES
(3, 'hg@hg.cc', 'abeille'),
(4, 'hg@hg.cc', 'test'),
(5, 'ahmedyassineafli94@gmail.com', 'abeille');

-- --------------------------------------------------------

--
-- Structure de la table `farmer`
--

CREATE TABLE `farmer` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `farmer`
--

INSERT INTO `farmer` (`email`, `name`, `password`) VALUES
('ahmedyassineafli94@gmail.com', 'Ahmed', 'yassine123'),
('hg@hg.cc', 'sami', '12345678'),
('medamineafli44@gmail.com', 'Med Amine', 'amine123'),
('yasin@admin.com', 'Yassine Afli', 'yassine112');

-- --------------------------------------------------------

--
-- Structure de la table `frame`
--

CREATE TABLE `frame` (
  `slotNumber` int(11) NOT NULL,
  `weight` double NOT NULL,
  `component_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `frame`
--

INSERT INTO `frame` (`slotNumber`, `weight`, `component_id`, `id`) VALUES
(1, 15, 1, 2),
(0, 12, 2, 3),
(1, 15, 2, 4),
(1, 20, 1, 6),
(0, 12, 5, 8);

-- --------------------------------------------------------

--
-- Structure de la table `hivecomponent`
--

CREATE TABLE `hivecomponent` (
  `position` int(11) NOT NULL,
  `beehive_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hivecomponent`
--

INSERT INTO `hivecomponent` (`position`, `beehive_id`, `id`, `type`) VALUES
(0, 2, 1, 'base'),
(0, 3, 2, 'base'),
(0, 6, 5, 'base');

-- --------------------------------------------------------

--
-- Structure de la table `inspection`
--

CREATE TABLE `inspection` (
  `healthRating` int(11) NOT NULL,
  `populationRating` int(11) NOT NULL,
  `productivityRating` int(11) NOT NULL,
  `beehive_id` bigint(20) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `actionsTaken` varchar(255) DEFAULT NULL,
  `agent_email` varchar(255) DEFAULT NULL,
  `findings` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `recommendations` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inspection`
--

INSERT INTO `inspection` (`healthRating`, `populationRating`, `productivityRating`, `beehive_id`, `date`, `id`, `actionsTaken`, `agent_email`, `findings`, `reason`, `recommendations`) VALUES
(2, 3, 1, 2, '2025-06-09 23:00:00.000000', 1, 'Nettoyage de la ruche, changement de la reine, ajout de nourrisseur', 'medanas44@gmail.com', 'Présence de moisissure sur les cadres, faible activité des abeilles', 'Retard', 'Vérifier la ventilation, surveiller la ponte, ajouter une source de pollen'),
(2, 3, 1, 3, '2025-06-09 23:00:00.000000', 2, 'Nettoyage de la ruche, changement de la reine, ajout de nourrisseur', 'louayafli5@gmail.com', 'Présence de moisissure sur les cadres, faible activité des abeilles', 'Retard', 'Vérifier la ventilation, surveiller la ponte, ajouter une source de pollen'),
(2, 3, 2, 6, '2025-06-08 23:00:00.000000', 3, 'Nettoyage de la ruche, changement de la reine, ajout de nourrisseur', 'dheker@gmail.com', 'Présence de moisissure sur les cadres, faible activité des abeilles', 'Retard', 'Vérifier la ventilation, surveiller la ponte, ajouter une source de pollen');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `apiarysite`
--
ALTER TABLE `apiarysite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKeb296ntjctsodw677xa97u2nl` (`farm_id`);

--
-- Index pour la table `beehive`
--
ALTER TABLE `beehive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1fd0dl9hc09r9iraqca8oxldq` (`apiarySite_id`);

--
-- Index pour la table `farm`
--
ALTER TABLE `farm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKstrasdqgn0onv16qgg77b36y5` (`farmer_email`);

--
-- Index pour la table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `frame`
--
ALTER TABLE `frame`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlurl18gk6pxhntoai5xn2vbn2` (`component_id`);

--
-- Index pour la table `hivecomponent`
--
ALTER TABLE `hivecomponent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbhf8ao6edd39ssjr3m7dwei3s` (`beehive_id`);

--
-- Index pour la table `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKff3r5vk9aoxgnkg5koc73ojdq` (`agent_email`),
  ADD KEY `FK8pjrj3w90dubded2v7y9lx8qy` (`beehive_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `apiarysite`
--
ALTER TABLE `apiarysite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `beehive`
--
ALTER TABLE `beehive`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `farm`
--
ALTER TABLE `farm`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `frame`
--
ALTER TABLE `frame`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `hivecomponent`
--
ALTER TABLE `hivecomponent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `inspection`
--
ALTER TABLE `inspection`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `apiarysite`
--
ALTER TABLE `apiarysite`
  ADD CONSTRAINT `FKeb296ntjctsodw677xa97u2nl` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`id`);

--
-- Contraintes pour la table `beehive`
--
ALTER TABLE `beehive`
  ADD CONSTRAINT `FK1fd0dl9hc09r9iraqca8oxldq` FOREIGN KEY (`apiarySite_id`) REFERENCES `apiarysite` (`id`);

--
-- Contraintes pour la table `farm`
--
ALTER TABLE `farm`
  ADD CONSTRAINT `FKstrasdqgn0onv16qgg77b36y5` FOREIGN KEY (`farmer_email`) REFERENCES `farmer` (`email`);

--
-- Contraintes pour la table `frame`
--
ALTER TABLE `frame`
  ADD CONSTRAINT `FKlurl18gk6pxhntoai5xn2vbn2` FOREIGN KEY (`component_id`) REFERENCES `hivecomponent` (`id`);

--
-- Contraintes pour la table `hivecomponent`
--
ALTER TABLE `hivecomponent`
  ADD CONSTRAINT `FKbhf8ao6edd39ssjr3m7dwei3s` FOREIGN KEY (`beehive_id`) REFERENCES `beehive` (`id`);

--
-- Contraintes pour la table `inspection`
--
ALTER TABLE `inspection`
  ADD CONSTRAINT `FK8pjrj3w90dubded2v7y9lx8qy` FOREIGN KEY (`beehive_id`) REFERENCES `beehive` (`id`),
  ADD CONSTRAINT `FKff3r5vk9aoxgnkg5koc73ojdq` FOREIGN KEY (`agent_email`) REFERENCES `agent` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
