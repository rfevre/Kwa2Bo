DROP TABLE IF EXISTS Kwa2Bo_utilisateur CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_contacts CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_profil CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_groupe CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_message CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_appartient CASCADE;


CREATE TABLE IF NOT EXISTS Kwa2Bo_profil(
	idProfil SERIAL,
	nom TEXT,
	prenom TEXT,
	photo TEXT NOT NULL DEFAULT '/ressources/default.jpg',
	CONSTRAINT pk_profil
	PRIMARY KEY(idProfil)
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_utilisateur(
	mail TEXT NOT NULL,
	mdp TEXT NOT NULL,
	pseudo TEXT NOT NULL,
	role TEXT NOT NULL DEFAULT 'undef',
	codeVerif TEXT,
	idProfil INTEGER,
	CONSTRAINT pk_utilisateur
	PRIMARY KEY(mail),
	CONSTRAINT fk_utilisateur FOREIGN KEY(idProfil)
	REFERENCES Kwa2Bo_profil(idProfil)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_contacts(
	mail1 TEXT,
	mail2 TEXT,
	status INTEGER,
	CONSTRAINT pk_contacts
	PRIMARY KEY(mail1,mail2),
	CONSTRAINT fk_contacts FOREIGN KEY(mail1)
	REFERENCES Kwa2Bo_utilisateur (mail)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	CONSTRAINT fk_contacts2 FOREIGN KEY(mail2)
	REFERENCES Kwa2Bo_utilisateur (mail)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_groupe (
	idGroupe SERIAL,
	nomGroupe TEXT,
	CONSTRAINT pk_groupe
	PRIMARY KEY(idGroupe)
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_appartient(
	mail TEXT,
	idGroupe INTEGER,
	CONSTRAINT pk_appartient
	PRIMARY KEY(mail, idGroupe),
	CONSTRAINT fk_appartient FOREIGN KEY(mail)
	REFERENCES Kwa2Bo_utilisateur(mail)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	CONSTRAINT fk_appartient2 FOREIGN KEY(idGroupe)
	REFERENCES Kwa2Bo_groupe(idGroupe)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_message(
	idMessage SERIAL,
	idGroupe INTEGER,
	mail TEXT,
	dateMessage TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	image TEXT,
	texte TEXT,
	CONSTRAINT pk_message
	PRIMARY KEY(idMessage),
	CONSTRAINT fk_message FOREIGN KEY(idGroupe)
	REFERENCES Kwa2Bo_groupe(idGroupe)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	CONSTRAINT fk_message2 FOREIGN KEY(mail)
	REFERENCES Kwa2Bo_utilisateur(mail)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

INSERT INTO Kwa2Bo_profil (nom,prenom) VALUES ('Ferro','Thomas');
INSERT INTO Kwa2Bo_profil (nom,prenom) VALUES ('Fevre','Rémy');
INSERT INTO Kwa2Bo_profil (nom,prenom) VALUES ('Leleu','Julien');
INSERT INTO Kwa2Bo_profil (nom,prenom) VALUES ('Cattez','Edouard');

INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo,idProfil,role,codeVerif) VALUES ('ferrot@gmail.com',md5('rocher'),'Ferrot',1,'logged',md5('Ferrot'));
INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo,idProfil,role,codeVerif) VALUES ('fevrer@gmail.com',md5('rocher'),'Psycos',2,'logged',md5('Psycos'));
INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo,idProfil,role,codeVerif) VALUES ('leleu@gmail.com',md5('rocher'),'A-La-Queue',3,'logged',md5('A-La-Queue'));
INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo,idProfil,role,codeVerif) VALUES ('catez@gmail.com',md5('rocher'),'Le_Maboule',4,'logged',md5('Le_Maboule'));

INSERT INTO Kwa2Bo_contacts VALUES ('ferrot@gmail.com','fevrer@gmail.com',0);
INSERT INTO Kwa2Bo_contacts VALUES ('ferrot@gmail.com','leleu@gmail.com',0);

INSERT INTO Kwa2Bo_groupe (nomGroupe) VALUES ('Le paradis sur Terre');
INSERT INTO Kwa2Bo_groupe (nomGroupe) VALUES ('Ici c est Paris');

INSERT INTO Kwa2Bo_appartient VALUES ('ferrot@gmail.com',1);
INSERT INTO Kwa2Bo_appartient VALUES ('fevrer@gmail.com',1);
INSERT INTO Kwa2Bo_appartient VALUES ('ferrot@gmail.com',2);
INSERT INTO Kwa2Bo_appartient VALUES ('fevrer@gmail.com',2);
INSERT INTO Kwa2Bo_appartient VALUES ('leleu@gmail.com',2);

INSERT INTO Kwa2Bo_message(idGroupe,mail,texte) VALUES (1,'fevrer@gmail.com','Thomas tu pue');
INSERT INTO Kwa2Bo_message(idGroupe,mail,texte) VALUES (1,'ferrot@gmail.com','Non c est toi qui pue');
INSERT INTO Kwa2Bo_message(idGroupe,mail,texte) VALUES (2,'ferrot@gmail.com','Bonjour');
INSERT INTO Kwa2Bo_message(idGroupe,mail,texte) VALUES (2,'leleu@gmail.com','Oui bonjour ?');
INSERT INTO Kwa2Bo_message(idGroupe,mail,texte) VALUES (2,'ferrot@gmail.com','Non toi bonjour!');