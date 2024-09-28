-- spécification de la bd utilisée

USE BDgestionProjet;

-- clé primaire
ALTER TABLE utilisateur 
ADD CONSTRAINT PK_Utilisateur
PRIMARY KEY (noUtilisateur); 

ALTER TABLE tache 
ADD CONSTRAINT PK_Tache
PRIMARY KEY (noTache);

ALTER TABLE projet
ADD CONSTRAINT PK_Projet
PRIMARY KEY (noProjet);

ALTER TABLE equipe
ADD CONSTRAINT PK_Equipe
PRIMARY KEY (noEquipe);

ALTER TABLE  utilisateurTache
ADD CONSTRAINT PK_UtilisateurTache
PRIMARY KEY (noUtilisateur, noTache);

-- clé étrangère
ALTER TABLE utilisateur 
ADD CONSTRAINT FK_Equipe 
FOREIGN KEY (noEquipe) REFERENCES equipe(noEquipe);

ALTER TABLE utilisateurTache
ADD CONSTRAINT FK_UtilisateurTache_Utilisateur
FOREIGN KEY (noUtilisateur) REFERENCES utilisateur (noUtilisateur);

ALTER TABLE utilisateurTache
ADD CONSTRAINT FK_UtilisateurTache_Tache
FOREIGN KEY (noTache) REFERENCES tache(noTache);

ALTER TABLE equipe 
ADD CONSTRAINT FK_ProjetEquipe 
FOREIGN KEY (noProjet) REFERENCES projet(noProjet);

ALTER TABLE tache
ADD CONSTRAINT FK_ProjetTache 
FOREIGN KEY (noProjet) REFERENCES projet(noProjet);

-- unique mot de passe
ALTER TABLE utilisateur 
ADD CONSTRAINT UC_Mdp
UNIQUE (motDePasse);

-- unique email
ALTER TABLE utilisateur 
ADD CONSTRAINT UC_Email
UNIQUE (email);

-- contrainte sur les différentes dates dans la table tache
ALTER TABLE tache
ADD CONSTRAINT CHK_Tache        
CHECK (dateDebut < dateFin);

-- unique titre pour les tache
ALTER TABLE tache
ADD CONSTRAINT UC_Titre UNIQUE (titre);

-- unique nom de branche pour chaque tache
ALTER TABLE tache
ADD CONSTRAINT UC_NomBranche 
UNIQUE (nomBranche);

-- status par défaut en cours
ALTER TABLE tache
ADD CONSTRAINT DF_Status
DEFAULT 'En cours' FOR statusTache;

-- préorité par défaut moyen
ALTER TABLE tache
ADD CONSTRAINT DF_Priorite
DEFAULT 'Moyen' FOR priorite; 

--contrainte sur les différentes dates projet
ALTER TABLE projet
ADD CONSTRAINT CHK_Projet_LivraisonFin        
CHECK (dateLivraison < dateFin);

ALTER TABLE projet
ADD CONSTRAINT CHK_Projet_DebutFin        
CHECK (dateDebut < dateFin);

ALTER TABLE projet
ADD CONSTRAINT CHK_Projet_LivraisonDebut        
CHECK (dateLivraison > dateDebut); 

-- contrainte sur les titres unique projet
ALTER TABLE projet
ADD CONSTRAINT UC_Projet_Titre   
UNIQUE (titre);

-- contrainte sur les lien de dépôt unique
ALTER TABLE projet
ADD CONSTRAINT UC_Depot 
UNIQUE (lienDepot);




