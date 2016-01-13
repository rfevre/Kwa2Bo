DROP TABLE IF EXISTS Kwa2Bo_profil CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_utilisateur CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_contacts CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_groupe CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_appartient CASCADE;
DROP TABLE IF EXISTS Kwa2Bo_message CASCADE;

CREATE TABLE IF NOT EXISTS Kwa2Bo_profil(
	idProfil SERIAL,
	nom TEXT,
	prenom TEXT,
	photo TEXT NOT NULL DEFAULT './ressources/default.jpg',
	CONSTRAINT pk_profil
	PRIMARY KEY(idProfil)
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_utilisateur(
	mail TEXT NOT NULL,
	mdp TEXT NOT NULL,
	pseudo TEXT NOT NULL,
	role TEXT NOT NULL DEFAULT 'undef',
	idProfil INTEGER,
	CONSTRAINT pk_utilisateur
	PRIMARY KEY(mail),
	CONSTRAINT fk_utilisateur FOREIGN KEY(idProfil)
	REFERENCES Kwa2Bo_profil(idProfil)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_contacts(
	mail1 VARCHAR(16),
	mail2 VARCHAR(16),
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
	mail VARCHAR(16),
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
	mail VARCHAR(16),
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

INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo,idProfil) VALUES ('ferrot@gmail.com','rocher','Ferrot',1);
INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo,idProfil) VALUES ('fevrer@gmail.com','rocher','Psycos',2);
INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo) VALUES ('leleu@gmail.com','rocher','A-La-Queue');
INSERT INTO Kwa2Bo_utilisateur(mail,mdp,pseudo) VALUES ('catez@gmail.com','rocher','Le_Maboule');

INSERT INTO Kwa2Bo_contacts VALUES ('ferrot@gmail.com','fevrer@gmail.com');
INSERT INTO Kwa2Bo_contacts VALUES ('ferrot@gmail.com','leleu@gmail.com');

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
