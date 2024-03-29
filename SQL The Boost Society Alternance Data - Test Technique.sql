--Q1
SELECT *
FROM CoronaProject..Joueurs JS
JOIN CoronaProject..Attributs att1 ON JS.[attribut1_id ] = att1.[id ]
JOIN CoronaProject..Attributs att2 ON JS.attribut2_id = att2.[id ]
WHERE (att1.[nom ] = 'vitesse ' AND att1.description = 'élevé')
and (att2.[nom ] = 'agilité ' AND att2.description = 'excellent')

--Q2

CREATE VIEW DétailsJoueurs AS
SELECT Js.nom AS NomJoueur, Ps.nom AS Position, att.description AS DescriptionAttribut
FROM CoronaProject..Joueurs Js
JOIN CoronaProject..Positions Ps ON Js.id = Ps.id
JOIN CoronaProject..Attributs att ON Js.id = att.id

SELECT *
FROM DétailsJoueurs;

--Q3

SELECT Js.id, Js.nom
FROM CoronaProject..Joueurs Js
JOIN CoronaProject..Positions ON Js.position_id = Positions.id
JOIN CoronaProject..Attributs AS att1 ON Js.attribut1_id = att1.id
JOIN CoronaProject..Attributs AS att2 ON Js.attribut2_id = att2.id
JOIN CoronaProject..Attributs AS att3 ON Js.id = att3.id
WHERE Positions.nom = 'Attaquant'
AND (att1.nom = 'vitesse' AND att1.description = 'élevé')
AND (att2.nom = 'précision' AND att2.description = 'excellent')
AND (att3.nom = 'endurance' AND att3.description != 'en dessous de la moyenne');

SELECT Js.id, Js.nom
FROM CoronaProject..Joueurs Js
JOIN CoronaProject..Positions ON Js.position_id = Positions.id
JOIN CoronaProject..Attributs AS att1 ON Js.attribut1_id = att1.id
JOIN CoronaProject..Attributs AS att2 ON Js.attribut2_id = att2.id
-- un attribut qui correspond aux exigences à la fois d'un Milieu de terrain et d'un Défenseur : endurance excellent
WHERE ( att1.nom = 'endurance' AND att1.description = 'excellent' ) 
OR ( att2.nom = 'endurance' AND att2.description = 'excellent' )

--Q4:
--Créez des tables temporaires pour éviter d'utiliser des jointures à chaque fois, pour accélérer le processus et éviter les erreurs