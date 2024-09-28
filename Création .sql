--creation de la bd
 CREATE DATABASE BDgestionProjet;

--utilisation de la bd
  USE  BDgestionProjet;

-- table utilisateur

CREATE TABLE utilisateur
(
    noUtilisateur            INT				IDENTITY(1,1)                        NOT NULL,
    prenom                   VARCHAR(50)                                             NOT NULL,
    nom                      VARCHAR(50)                                             NOT NULL,
    motDePasse               VARCHAR(50)                                             NOT NULL, --Avant le salage 
    noTelephone              INT		                                             NOT NULL,
    email                    VARCHAR(50)                                             NOT NULL,
    horaire                  VARCHAR(255)                                            NOT NULL,
    noEquipe                 INT		                                                 NULL
);

CREATE TABLE dbo.[utilisateur]
(
    noUtilisateur           INT                 IDENTITY(1,1)                        NOT NULL,
    prenom                  NVARCHAR(50)                                             NOT NULL, -- Après salage
    nom                     NVARCHAR(50)                                             NOT NULL,
    horaire                 VARCHAR(255)                                             NOT NULL,
    noTelephone             INT		                                                 NOT NULL,
    email                   NVARCHAR(50)                                             NOT NULL,
    motDePasse              BINARY(100)                                              NOT NULL,
    salage                  UNIQUEIDENTIFIER,
    noEquipe                INT		                                                     NULL,
    CONSTRAINT [PK_noUtilisateur]  PRIMARY KEY CLUSTERED(noUtilisateur ASC)
);

-- table tâche

CREATE TABLE tache
(
    noTache                  INT				IDENTITY(1,1)                        NOT NULL,
    titre                    VARCHAR(50)                                             NOT NULL,
    descriptionTache         VARCHAR(255)                                            NOT NULL,
    nomBranche               VARCHAR(50)                                             NOT NULL, 
    statusTache              VARCHAR(50)                                             NOT NULL,
    commentaire              VARCHAR(255)                                            NOT NULL,
    priorite                 VARCHAR(50)                                             NOT NULL,
    dateDebut                DATE                                                    NOT NULL,
    dateFin                  DATE                                                    NOT NULL,
    noProjet                 INT                                                     NOT NULL
);

-- table utilisateurTache

CREATE TABLE utilisateurTache
(
    noUtilisateur            INT		                                             NOT NULL,
    noTache                  INT			                                         NOT NULL,
    description              VARCHAR(255)                                            NOT NULL,
    nbreHeure                INT		                                             NOT NULL,
);

-- table projet 
CREATE TABLE projet
(
    noProjet                 INT		         IDENTITY(1,1)                       NOT NULL,
    titre                    VARCHAR(50)                                             NOT NULL,
    descriptionProjet        VARCHAR(255)                                            NOT NULL,
    lienDepot                VARCHAR(50)                                             NOT NULL, 
    statusPojet              VARCHAR(50)                                             NOT NULL,
    commentaire              VARCHAR(255)                                            NOT NULL,
    dateLivraison            DATE                                                    NOT NULL,
    dateDebut                DATE                                                    NOT NULL,
    dateFin                  DATE                                                    NOT NULL,
);


-- table equipe

CREATE TABLE equipe
(
    noEquipe                 INT		         IDENTITY (1,1)                      NOT NULL,
    nom                      VARCHAR(50)                                             NOT NULL,
    descriptionEquipe        VARCHAR(255)                                            NOT NULL,
    noProjet                 INT                                                     NOT NULL                    
);
