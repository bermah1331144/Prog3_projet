CREATE TRIGGER update_statusProjet ON tache

AFTER UPDATE AS

IF UPDATE (statusTache) BEGIN
	DECLARE @nbrTaches AS int
	DECLARE @verif AS int
	DECLARE @noProjet AS int
	DECLARE @status AS varchar(50)
	DECLARE cStatusUpdate CURSOR FOR-- Ce curceur vérifie si la premiere tache est terminer
	SELECT statusTache, noProjet FROM inserted;
	OPEN cStatusUpdate;     
	FETCH cStatusUpdate INTO @status, @noProjet;
	WHILE (@@FETCH_STATUS = 0) BEGIN
		IF(@status='Terminer')
		BEGIN 
        SELECT @verif = COUNT(*)
        FROM tache
        WHERE noProjet = @noProjet AND @status <> 'Terminer' 
			IF(@verif <> 0)
			SELECT titre FROM tache WHERE noProjet = @noProjet;
				IF(@status = 'Terminer')
				BEGIN
					SELECT @verif = COUNT(*) - 1
					IF(@verif = 0)
						BEGIN
							UPDATE tache SET statusTache='Terminer'
							WHERE noProjet = @noProjet
							FETCH cStatusUpdate INTO @status, @noProjet;
						END;
				END;

		END;
		CLOSE  cStatusUpdate;
		DEALLOCATE cStatusUPdate;
	END;
END;