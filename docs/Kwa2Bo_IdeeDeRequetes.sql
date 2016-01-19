-- Insertion d'un utilisateur :
INSERT INTO Kwa2Bo_utilisateur(login,mdp,pseudo) VALUES ('moi','123','Pseudo_moi');

-- Connexion d'un utilisateur :
SELECT pseudo,idProfil FROM Kwa2Bo_utilisateur WHERE login='moi' AND mdp='123';

-------------------------------------------------------------------------------

-- Ajout d'un contact, 1ère façon, en dupliquant l'information :
INSERT INTO Kwa2Bo_contacts VALUES ('moi','fevrer');
INSERT INTO Kwa2Bo_contacts VALUES ('fevrer','moi');

-- Selection de sa liste de contact plus simple pour l'affichage:
SELECT login2 FROM Kwa2Bo_contacts WHERE login1='moi' ;

-- Ajout d'un contact, 2nd façon, en une seul fois :
INSERT INTO Kwa2Bo_contacts VALUES ('moi','fevrer');
INSERT INTO Kwa2Bo_contacts VALUES ('leleu','moi');

-- Selection de sa liste de contact plus difficile pour l'affichage :
SELECT * FROM Kwa2Bo_contacts WHERE login1='moi' OR login2='moi' ;

-------------------------------------------------------------------------------

-- Créer un groupe (avec un nom par defaut):
INSERT INTO Kwa2Bo_groupe(nomGroupe) VALUES ('Conversation');

-- Ajouter une personne au groupe précédement créer :
INSERT INTO Kwa2Bo_appartient VALUES ('moi',(SELECT max(idGroupe) FROM Kwa2Bo_groupe));

-- Insertion d'un message dans un groupe (A revoir):
INSERT INTO Kwa2Bo_message(idGroupe,login,texte) VALUES ((SELECT idGroupe FROM Kwa2Bo_groupe WHERE nomGroupe='nomDuGroupe'),'moi','Bonjour');

-- Selection de tous les messages d'un groupe (A revoir) :
SELECT login,dateMessage,texte,image FROM Kwa2Bo_message WHERE idGroupe=(SELECT idGroupe FROM Kwa2Bo_groupe WHERE nomGroupe='nomDuGroupe') ORDER BY dateMessage DESC;

-- Selection de tous les groupes dont fait parti un utilisateur :
SELECT groupe.idGroupe,groupe.nomGroupe FROM Kwa2Bo_appartient AS appartient INNER JOIN Kwa2Bo_groupe AS groupe ON appartient.idGroupe = groupe.idGroupe WHERE login ='moi';
