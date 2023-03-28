-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 mars 2023 à 12:57
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `users`
--

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `orderStatus` varchar(255) NOT NULL DEFAULT 'Complete',
  `id_produit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `num`, `orderStatus`, `id_produit`, `id_user`) VALUES
(1, 0, 'Complete', 2, 7),
(2, 0, 'Complete', 1, 7),
(3, 1, 'Complete', 2, 42),
(4, 0, 'Complete', 1, 7),
(5, 1, 'Complete', 1, 42),
(6, 2, 'Complete', 2, 7);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `nom`, `prix`, `description`, `path`) VALUES
(1, 'coffee noir', 25, 'un café délicieux', 'coffee_1'),
(2, 'Nescafé', 150, 'une marque de café connu. ', 'coffee_2');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `mdp`, `isAdmin`) VALUES
(1, 'test@test.com', '', 'test', 0),
(7, 'yvesmarcelin21@gmail.com', 'Yves Marcelin', '$2y$10$54Dc7S7h8nZR8b4DKQ.Iq.zBGuDXXrtOvtbjSjrqtXbC7J4mitc4e', 0),
(8, 'aimenaimen45678@gmail.com', '', '$2y$10$rrgxdYUEVJH98Cynlveyu.AO.a.vv8VF0dViQY6hB88NBOSs7HYN2', 0),
(9, 'aimenaimen45678@gmail.com', '', '$2y$10$tsnX6b/TOrx6cCpZ5/6aA.XyQMfMdwv1KiEFNA8CBKUVyCdygPXia', 0),
(10, 'aimenaimen45678@gmail.com', '', '$2y$10$aKWAgxffTW4CIYGJ8C5GfeVfrgMwp.YAsxa0A5ESYnCKXSxsyuXq6', 0),
(40, 'admin@admin.com', 'Admin', '$2y$10$54Dc7S7h8nZR8b4DKQ.Iq.zBGuDXXrtOvtbjSjrqtXbC7J4mitc4e', 1),
(42, 'midobomi@gmail.com', 'mahdu', '$2y$10$GL9wSNJ1NNRBTVqcjW7nH.HGyNrCyG3rej/tAK1NpN2KeL.SqgpN2', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `id_produit` FOREIGN KEY (`id_produit`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
