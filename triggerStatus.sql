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
        SELECt @verif = COUNT(*)
        FROM tache
        WHERE noProjet = @ 



	END;
	CLOSE  cStatusUpdate;
	DEALLOCATE cStatusUPdate;
END;