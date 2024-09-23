CREATE PROCEDURE creerUtilisateur (@prenom varchar, @nom varchar,@email varchar,@motDePasse varchar) AS
BEGIN
    IF EXISTS(SELECT * FROM utilisateur WHERE email=@email)
    BEGIN
        RETURN -1;
    END;
    IF NOT EXISTS(SELECT * FROM utilisateur WHERE email=@email) 