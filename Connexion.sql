--cette procédure vérifie si un utilisateur existe dans la bd avant de le connecté
-- elle rehash le mot de passe avec le sel stocké lors de l'inscription
-- PROCÉDURE STOCKÉE DE CONNEXION

CREATE PROCEDURE dbo.connexion (@couriel VARCHAR(50), @motPasse VARCHAR(50), @noUser INT OUTPUT) AS
BEGIN
    SET NOCOUNT ON 
    IF EXISTS (SELECT TOP 1 noUtilisateur FROM [dbo].[utilisateur] WHERE [email] = @couriel)
    BEGIN 
        SET @noUser = (SELECT noUtilisateur FROM [dbo].[utilisateur] WHERE [email] = @couriel AND [motDepasse] = HASHBYTES('SHA2_512',@motPasse + CAST(salage AS NVARCHAR(36))));
        IF(@noUser IS NULL)
            RETURN -1;
        ELSE 
            RETURN @noUser; 
    END
    ELSE
        RETURN -1;
END