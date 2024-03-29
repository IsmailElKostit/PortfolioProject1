--Q1
SELECT *
FROM CoronaProject..Joueurs JS
JOIN CoronaProject..Attributs att1 ON JS.[attribut1_id ] = att1.[id ]
JOIN CoronaProject..Attributs att2 ON JS.attribut2_id = att2.[id ]
WHERE (att1.[nom ] = 'vitesse ' AND att1.description = '�lev�')
and (att2.[nom ] = 'agilit� ' AND att2.description = 'excellent')

--Q2

CREATE VIEW D�tailsJoueurs AS
SELECT Js.nom AS NomJoueur, Ps.nom AS Position, att.description AS DescriptionAttribut
FROM CoronaProject..Joueurs Js
JOIN CoronaProject..Positions Ps ON Js.id = Ps.id
JOIN CoronaProject..Attributs att ON Js.id = att.id

SELECT *
FROM D�tailsJoueurs;

--Q3

SELECT Js.id, Js.nom
FROM CoronaProject..Joueurs Js
JOIN CoronaProject..Positions ON Js.position_id = Positions.id
JOIN CoronaProject..Attributs AS att1 ON Js.attribut1_id = att1.id
JOIN CoronaProject..Attributs AS att2 ON Js.attribut2_id = att2.id
JOIN CoronaProject..Attributs AS att3 ON Js.id = att3.id
WHERE Positions.nom = 'Attaquant'
AND (att1.nom = 'vitesse' AND att1.description = '�lev�')
AND (att2.nom = 'pr�cision' AND att2.description = 'excellent')
AND (att3.nom = 'endurance' AND att3.description != 'en dessous de la moyenne');

SELECT Js.id, Js.nom
FROM CoronaProject..Joueurs Js
JOIN CoronaProject..Positions ON Js.position_id = Positions.id
JOIN CoronaProject..Attributs AS att1 ON Js.attribut1_id = att1.id
JOIN CoronaProject..Attributs AS att2 ON Js.attribut2_id = att2.id
-- un attribut qui correspond aux exigences � la fois d'un Milieu de terrain et d'un D�fenseur : endurance excellent
WHERE ( att1.nom = 'endurance' AND att1.description = 'excellent' ) 
OR ( att2.nom = 'endurance' AND att2.description = 'excellent' )

--Q4:
--Cr�ez des tables temporaires pour �viter d'utiliser des jointures � chaque fois, pour acc�l�rer le processus et �viter les erreurs