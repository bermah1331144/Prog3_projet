
----Requetes VUE pour les tables utilisateur/Equipe/Projet

CREATE VIEW vueUtilisateurEquipeProjet AS
SELECT 
    u.noUtilisateur, 
    e.noEquipe, 
    p.noProjet, 
    u.prenom AS prenomUtilisateur, 
    u.nom AS nomUtilisateur, 
    u.horaire AS horaireUtilisateur, 
    e.nom, 
    p.titre AS titreProjet, 
    p.dateDebut AS dateDebutProjet, 
    p.dateFin AS dateFinProjet, 
    p.dateLivraison
FROM 
    utilisateur AS u
JOIN 
    utilisateurTache AS ut ON u.noUtilisateur = ut.noUtilisateur
JOIN 
    equipe AS e ON e.noEquipe = u.noEquipe
JOIN 
    projet AS p ON e.noProjet = p.noProjet;



--- Requete VUE pour les tables Utilisateur/Tache/Projet


CREATE VIEW vueUtilisateurTacheProjet AS
SELECT 
    u.noUtilisateur,
    t.noTache,
    p.noProjet,
    u.prenom AS prenomUtilisateur,
    u.nom AS nomUtilisateur,
    u.horaire AS horaireUtilisateur,
    t.dateDebut AS dateDebutTache,
	t.titre	AS titreTache,
	t.nomBranche AS nomBranche,
	t.statusTache AS statusTache,
    p.titre AS titreProjet,
    p.dateDebut AS dateDebutProjet,
    p.dateFin AS dateFinProjet,
    p.dateLivraison AS dateLivraison,
	p.statusPojet AS statusProjet,
	p.lienDepot	 AS lienDepot
FROM 
    utilisateur AS u
JOIN 
    utilisateurTache AS ut ON u.noUtilisateur = ut.noUtilisateur
JOIN 
    tache AS t ON ut.noTache = t.noTache
JOIN 
    projet AS p ON t.noProjet = p.noProjet