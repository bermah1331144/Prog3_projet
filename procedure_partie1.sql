

/*Cette procédure fait 2 choses
    1. Vérifie si utilisateur existe si oui RETURN -1
    2. Si client n'existe PAS, le créer et retourne le table avec les nouvelles valeurs
*/

DECLARE @noUtilisateur INT;
DECLARE @prenom varchar(50), @nom varchar(50),@noTelephone varchar(50), email varchar(50), @motDePase varchar(50),@horaire varchar(255), @noEquipe INT;

CREATE PROCEDURE creerUtilisateur (@noUtilisateur INT,@prenom varchar(50), @nom varchar(50),@noTelephone varchar(50), email varchar(50), @motDePase varchar(50),@horaire varchar(255), @noEquipe INT) AS
BEGIN
    IF EXISTS(SELECT * FROM utilisateur WHERE email=@email)
    BEGIN
        RETURN -1;
    END;
    IF NOT EXISTS(SELECT * FROM utilisateur WHERE email=@email)
    RETURN @utilisateur TABLE(email varchar, motDePasse varchar)
    BEGIN
        SET NouveauUtilisateur();
        RETURN;
    END;


/*
    Cette fonction creer un nouvelle utilisateur.
    Il sera appeler dans ma procedure creerUtilisateur

*/

CREATE FUNCTION NouveauUtilisateur(@noUtilisateur INT,  @prenom varchar(50), @nom varchar(50),@noTelephone varchar(50), email varchar(50), @motDePase varchar(50),@horaire varchar(255), @noEquipe INT)
RETURN @utilisateur TABLE() 
AS
BEGIN
    INSERT INTO @utilisateur; 
    VALUES ('Prenom',dbo.prenom(@prenom) AND 'Nom',dbo.nom(@nom) AND 'noTelephone', dbo.noTelephone(@noTelephone) AND 'email', dbo.motDePasse(@motDePasse) AND 'horaire',dbo.horaire(@horaire) AND  'noEquipe',dbo.noEquipe(@noEquipe));
    RETURN;
END;   



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
    CONSTRAINT [PK_noUtilisateur]  PRIMARY KEY CLUSTERED
    --- Je ne sais pas quoi mettre dans la primary key. Je vais regarder 
    --  avec coéquipier
)
GO


-- CREATION DU SALAGE 

CREATE PROCEDURE dbo.ajoutUtilisateur
    @noUtilisateur INT,
    @prenom NVARCHAR(50),
    @nom NVARCHAR(50),
    @email NVARCHAR(50),
    @motDePasse NVARCHAR(20),
    @noTelephone INT,
    @horaire VARCHAR(255),
    @noEquipe INT,
    @reponse NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @sel UNIQUEIDENTIFIER=NEWID();
    BEGIN TRY
        INSERT INTO bdo.[utilisateur](prenom,nom,email,motDePasse,sel)
        VALUES(@email ,HASHBYTES(@prenom,@nom,@motDePasse + CAST(@sel AS NVARCHAR(30))),@noTelephone,@horaire,@noEquipe, @sel);
        SET @reponse = "Connexion Réussi";
    END TRY
    BEGIN CATCH
        SET @reponse = ERROR_MESSAGE();
    END CATCH
END