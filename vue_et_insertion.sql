--utilisation de la bd
  USE [BDgestionProjet]
GO

-- Données de la table projet

INSERT INTO [dbo].[projet] (titre,descriptionProjet,lienDepot , [statusPojet], commentaire, dateLivraison, dateDebut,dateFin) VALUES
('Site Web E-commerce', 'Développement d"un site web pour la vente en ligne.', 'https://github.com/entreprise/ecommerce', 'En cours', 'Front-end presque terminé.', '2024-12-01', '2024-09-01', '2024-12-15'),
('Application Mobile', 'Création d"une application mobile pour iOS et Android.', 'https://github.com/entreprise/mobile-app', 'À faire', 'Besoin de définir les spécifications.', '2024-11-01', '2024-09-15', '2024-11-30'),
('Logiciel de Gestion', 'Développement d"un logiciel de gestion des stocks.', 'https://github.com/entreprise/gestion-stock', 'En cours', 'Intégration de l’API en cours.', '2024-10-15', '2024-08-15', '2024-10-31'), 
('Migration Serveur', 'Migration des données vers un nouveau serveur sécurisé.', 'https://github.com/entreprise/server-migration', 'À faire', 'Planification de la maintenance nécessaire.', '2024-09-30', '2024-09-20', '2024-10-05'),
('Campagne Marketing', 'Lancement d"une nouvelle campagne marketing en ligne.', 'https://github.com/entreprise/marketing-campaign', 'En cours', 'Stratégie en cours d’élaboration.', '2024-11-10', '2024-09-10', '2024-11-20'),
('Refonte UX/UI', 'Amélioration de l"interface utilisateur du site web existant.', 'https://github.com/entreprise/ui-ux-redesign', 'En cours', 'Maquettes validées par l’équipe.', '2024-09-25', '2024-08-25', '2024-10-10'), 
('Plateforme E-learning', 'Développement d"une plateforme de formation en ligne.', 'https://github.com/entreprise/elearning-platform', 'À faire', 'Contenu à finaliser.', '2024-12-05', '2024-09-25', '2024-12-20'), 
('Implémentation CRM', 'Mise en place d"un système de gestion de la relation client.', 'https://github.com/entreprise/crm-implementation', 'En cours', 'Phase de test utilisateur.', '2024-10-01', '2024-08-30', '2024-10-15'), 
('Optimisation SEO', 'Optimisation du site web pour améliorer le référencement naturel.', 'https://github.com/entreprise/seo-optimization', 'À faire', 'Recherche de mots-clés terminée.', '2024-09-20', '2024-09-05', '2024-09-30'),
('Application de Chat', 'Création d"une application de chat en temps réel pour les clients.', 'https://github.com/entreprise/chat-app', 'En cours', 'Fonctionnalités de base implémentées.', '2024-10-20', '2024-09-12', '2024-11-05');

-- Données de la table tache

INSERT INTO tache (titre, [descriptionTache], nomBranche, statusTache, commentaire ,priorite, dateDebut,dateFin,noProjet) VALUES
('Préparation des rapports', 'Compiler les rapports mensuels pour l"équipe.', 'fea_Finance1', 'En cours', 'Nécessite des données du département ventes.', 'Haute', '2024-09-01', '2024-09-10',1),
('Mise à jour du site web', 'Actualiser le contenu de la page d"accueil.', 'fea_Marketing1', 'À faire', 'Besoin de nouvelles images.', 'Moyenne', '2024-09-05', '2024-09-15',2), 
('Test de l"application', 'Effectuer des tests QA sur la nouvelle version.', 'fea_Développement1', 'En cours', 'Tests unitaires terminés.', 'Haute', '2024-09-03', '2024-09-12',3), 
('Formation des employés', 'Organiser une séance de formation sur les nouvelles politiques RH.', 'fea_Ressources Humaines1', 'À faire', 'Prévoir une salle de réunion.', 'Basse', '2024-09-10', '2024-09-20',4), 
('Audit de sécurité', 'Réviser les protocoles de sécurité informatique.', 'fea_IT1', 'En cours', 'Risque élevé détecté.', 'Critique', '2024-09-02', '2024-09-18',5), 
('Campagne publicitaire', 'Lancer la nouvelle campagne publicitaire sur les réseaux sociaux.', 'fea_Marketing2', 'En cours', 'Contenu en cours de création.', 'Haute', '2024-09-04', '2024-09-14',6),
('Révision budgétaire', 'Analyser les dépenses du dernier trimestre.', 'fea_Finance2', 'À faire', 'Vérifier les rapports de chaque département.', 'Moyenne', '2024-09-06', '2024-09-16',7), 
('Mise à jour logicielle', 'Installer les dernières mises à jour sur tous les postes.', 'fea_IT2', 'À faire', 'Prévoir une interruption de service.', 'Basse', '2024-09-08', '2024-09-20',9),
('Amélioration UX/UI', 'Apporter des améliorations à l"interface utilisateur.', 'fea_Développement2', 'En cours', 'Feedback des utilisateurs intégré.', 'Haute', '2024-09-07', '2024-09-17',8), 
('Planification d"événement', 'Organiser le séminaire annuel de l"entreprise.', 'fea_Ressources Humaines2', 'À faire', 'Trouver un lieu approprié.', 'Moyenne', '2024-09-09', '2024-09-30',10), 
('Optimisation SEO', 'Optimiser le contenu du site pour le référencement.', 'fea_Marketing3', 'En cours', 'Analyse des mots-clés effectuée.', 'Moyenne', '2024-09-11', '2024-09-21',1), 
('Maintenance du réseau', 'Vérifier et réparer les équipements réseau.', 'fea_IT3', 'À faire', 'Prévoir une maintenance programmée.', 'Haute', '2024-09-12', '2024-09-22',2),
('Rédaction du manuel', 'Rédiger le manuel d"utilisation pour le nouveau logiciel.', 'fea_Documentation1', 'En cours', 'Chapitres en cours de relecture.', 'Basse', '2024-09-13', '2024-09-25',3), 
('Enquête de satisfaction', 'Lancer une enquête de satisfaction auprès des clients.', 'fea_Service Client1', 'À faire', 'Questions en cours d’élaboration.', 'Moyenne', '2024-09-14', '2024-09-24',4), 
('Mise en place d"une sauvegarde', 'Configurer un système de sauvegarde automatique des données.', 'fea_IT4', 'À faire', 'Tester le système avant le déploiement.', 'Critique', '2024-09-15', '2024-09-27',5);


-- Données de la table equipe
INSERT INTO equipe (nom,descriptionEquipe,noProjet) VALUES
('Développement Backend', 'Équipe chargée du développement et de la maintenance des services backend', 1), 
('Développement Frontend', 'Équipe responsable de la création et de l"amélioration de l"interface utilisateur', 2),
('Tests et Qualité', 'Équipe dédiée aux tests unitaires, d"intégration et à l"assurance qualité', 4),
('Intégration Continue', 'Équipe en charge de la mise en place et de la gestion du pipeline CI/CD', 6), 
('Déploiement et Maintenance', 'Équipe responsable du déploiement sur les différents environnements et de la maintenance post-déploiement', 7);


--- Données pour la table utilisateur

INSERT INTO utilisateur(prenom, nom, motDePasse,noTelephone, email, horaire, noEquipe) VALUES
('Alice','Dupont','SunnyDay123',0123456789,'alice.dupont@example.com','Du lundi au vendredi , 09h00-17h00',1),
('Bob','Martin','BlueSky456',0123456790,'bob.martin@example.com','Du lundi au vendredi, 10h00-18h00',2),
('Clara','Dubois','BleuOiseau123',0123456791,'clara.dubois@example.com','Du mardi au vendredi, 08h00-16h00',3),
('David','Lefevre','GreenTree789',0123456792,'david.lefevre@example.com','Du lundi au jeudi, 09h30-17h30',1),
('Emma','Moreau','HappyCat01',0123456793,'emma.moreau@example.com','Du lundi au jeudi, 11h00-19h00',4),
('Felix','Lambert','RedApple99',0123456794,'felix.lambert@example.com','Du lundi au jeudi, 09h00-17h00',2),
('Grace','Simon','OceanWave22',0123456795,'grace.simon@example.com','Du mardi au vendredi, 10h30-18h30',3),
('Hugo','Rousseau',' BrightStar7',0123456796,'hugo.rousseau@example.com','Du mercredi au vendredi, 08h30-16h30',4),
('Isabelle','Petit',' GoldenSun5',0123456797,'isabelle.petit@example.com','Du lundi au jeudi, 09h00-17h00',1),
('Julien','Giraud','LuckyCharm8',0123456798,'julien.giraud@example.com','Du lundi au vendredi, 10h00-18h00',2);

-- Données de la table utilisateurTache

INSERT INTO utilisateurTache(noUtilisateur,noTache,[description],nbreHeure) VALUES
(1, 4, 'Développement des end points de l"API', 30), 
(2, 2, 'Collecte des exigences pour l"interface utilisateur', 20),
(3, 6, 'Écriture des tests unitaires pour le module de paiement', 15),
(4, 9, 'Déploiement sur l"environnement de staging', 12),
(5, 5, 'Création des maquettes pour l"interface utilisateur', 25),
(6, 1, 'Préparation de la documentation initiale du projet', 10), 
(7, 3, 'Conception de l"architecture du backend', 40), 
(8, 7, 'Mise en place du pipeline CI/CD pour le projet', 18), 
(9, 8, 'Tests d"intégration entre les modules frontend et backend', 22), 
(10, 10, 'Planification et exécution des tests utilisateurs finaux', 35);
