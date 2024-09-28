
-- procédure d'inscription
CREATE PROCEDURE dbo.ajoutUtilisateur
    @noUtilisateur INT,
    @prenom NVARCHAR(50),
    @nom NVARCHAR(50),
    @email NVARCHAR(50),
    @motDePasse NVARCHAR(20),
    @noTelephone INT,
    @horaire VARCHAR(255),
    @noEquipe INT,
    @noUtilisateur INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @sel UNIQUEIDENTIFIER=NEWID();
    IF NOT EXISTS (SELECT TOP 1 noUtilisateur FROM [dbo].[utilisateur] WHERE [email] = @email)
    BEGIN
        BEGIN TRY
            INSERT INTO dbo.[utilisateur](prenom,nom,email,motDePasse,horaire,noTelephone,noEquipe,salage)
            VALUES(@prenom, @nom, @email, HASHBYTES('SHA2_512',@motDePasse + CAST(@sel AS NVARCHAR(36))),@horaire,@noTelephone,@noEquipe, @sel);
            SET @noUtilisateur = (SELECT noUtilisateur FROM [dbo].[utilisateur] WHERE [email] = @email);
            RETURN @noUtilisateur;
        END TRY
        BEGIN CATCH
            SET @noUtilisateur = -1;
        END CATCH
    END
    ELSE
        SET @noUtilisateur = -1;
END