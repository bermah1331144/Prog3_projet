

/*Cette procédure fait 2 choses
    1. Vérifie si utilisateur existe si oui RETURN -1
    2. Si client n'existe PAS, le créer et retourne le table avec les nouvelles valeurs
*/
CREATE PROCEDURE creerUtilisateur (@prenom varchar, @nom varchar,@email varchar,@motDePasse varchar) AS
BEGIN
    IF EXISTS(SELECT * FROM utilisateur WHERE email=@email)
    BEGIN
        RETURN -1;
    END;
    IF NOT EXISTS(SELECT * FROM utilisateur WHERE email=@email)
    RETURN @utilisateur TABLE(email varchar, motDePasse varchar)
    BEGIN
        INSERT INTO @utilisateur 
        VALUES ('Prénom',dbo.prenom(@prenom) AND 'Nom',dbo.nom(@nom));
        INSERT INTO @utilisateur
        VALUES ('email',dbo.email(@email) AND 'Mot de passe',dbo.motDePasse(@motDePasse));
        RETURN;
    END;


/*

Je n'est pas sur si j'utilisais la bonne facon pour créer une procedure. 
J'ai donc commencer une procedure avec une fonction pour tenter de retourne
les donnee du nouveau utilisateur et retourner la table

CREATE FUNCTION NouveauUtilisateur(@email varchar, @motDePasse varchar)
RETURN @utilisateur TABLE() 
    AS
RETURN(SELECT * FROM utilisateur WHERE email=@email AND motDePasse=@motDePasse); */   



/* 

    CREATION DU SALAGE 

*/
-- Table de salage
CREATE TABLE dbo.[utilisateur]
(
    noUtilisateur       INT IDENTITY(1,1)     NOT NULL,
    prenom              NVARCHAR(50)          NOT NULL,
    nom                 NVARCHAR(50)          NOT NULL,
    email               NVARCHAR(50)          NOT NULL,
    motDePasse          BINARY(100)           NOT NULL,
    salage              UNIQUEIDENTIFIER,
    CONSTRAINT [noUtilisateur]  PRIMARY KEY 
    --- Je ne sais pas quoi mettre dans la primary key. Je vais regarder 
    --  avec coéquipier
)
GO


-- CREATION DU SALAGE 

CREATE PROCEDURE dbo.ajoutUtilisateur
    @prenom NVARCHAR(50),
    @nom NVARCHAR(50),
    @email NVARCHAR(50),
    @motDePasse NVARCHAR(20),
    @reponse NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @sel UNIQUEIDENTIFIER=NEWID();
    BEGIN TRY
        INSERT INTO bdo.[utilisateur](prenom,nom,email,motDePasse,sel)
        VALUES(,HASHBYTES(@prenom,@nom,@email,@motDePasse + CAST(@sel AS NVARCHAR(30))), @sel);
        SET @reponse = "Connexion Réussi";
    END TRY
    BEGIN CATCH
        SET @reponse = ERROR_MESSAGE();
    END CATCH
END