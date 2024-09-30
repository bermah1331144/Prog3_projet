CREATE TRIGGER update_statusProjet ON tache

AFTER UPDATE AS

IF UPDATE (statusTache) BEGIN
	DECLARE @nbrTaches AS int
	DECLARE @cpt AS int
	DECLARE @noProjet AS int
	DECLARE @status AS varchar(50)
	DECLARE @toutStatusTaches AS varchar(50)
	DECLARE cStatusUpdate CURSOR FOR-- Ce curceur vérifie si la premiere tache est terminer
	SELECT statusTache, noProjet FROM inserted;
	OPEN cStatusUpdate;     
	SET @cpt = 0;
	FETCH cStatusUpdate INTO @status, @noProjet;
	WHILE (@@FETCH_STATUS = 0) BEGIN
		IF(@status='Terminer')
		BEGIN 
			DECLARE cTacheProjet CURSOR FOR
				SELECT statusTache FROM tache WHERE noProjet = @noProjet;
			OPEN  cTacheProjet;     -- Ce curceur vérifie si les autres taches du projet sont a terminer
			FETCH cTacheProjet  INTO @toutStatusTaches; 
			WHILE (@@FETCH_STATUS = 0) BEGIN -- peut etre optiminer 
				IF (@toutStatusTaches = 'Terminer')
				BEGIN 
					SET @cpt +=1;
				END;
                FETCH cTacheProjet  INTO @toutStatusTaches; 
			END;
			CLOSE cTacheProjet;
			DEALLOCATE cTacheProjet;
            FETCH cStatusUpdate INTO @status, @noProjet;
		END;
	END;
	SELECT @nbrTaches = COUNT(*) FROM tache WHERE noProjet = @noProjet;
	IF(@cpt = @nbrTaches)
	BEGIN
		UPDATE Projet SET statusPojet = 'Terminer'
		WHERE noProjet = @noProjet;
	END;
	CLOSE  cStatusUpdate;
	DEALLOCATE cStatusUPdate;
END;