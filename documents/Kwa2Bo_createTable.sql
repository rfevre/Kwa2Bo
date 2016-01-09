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
	login VARCHAR(16) NOT NULL,
	mdp TEXT NOT NULL,
	pseudo TEXT NOT NULL,
	idProfil INTEGER,
	CONSTRAINT pk_utilisateur
	PRIMARY KEY(login),
	CONSTRAINT fk_utilisateur FOREIGN KEY(idProfil)
	REFERENCES Kwa2Bo_profil(idProfil)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Kwa2Bo_contacts(
	login1 VARCHAR(16),
	login2 VARCHAR(16),
	CONSTRAINT pk_contacts
	PRIMARY KEY(login1,login2),
	CONSTRAINT fk_contacts FOREIGN KEY(login1)
	REFERENCES Kwa2Bo_utilisateur (login)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	CONSTRAINT fk_contacts2 FOREIGN KEY(login2)
	REFERENCES Kwa2Bo_utilisateur (login)
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
	login VARCHAR(16),
	idGroupe INTEGER,
	CONSTRAINT pk_appartient
	PRIMARY KEY(login, idGroupe),
	CONSTRAINT fk_appartient FOREIGN KEY(login)
	REFERENCES Kwa2Bo_utilisateur(login)
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
	login VARCHAR(16),
	dateMessage TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	image TEXT,
	texte TEXT,
	CONSTRAINT pk_message
	PRIMARY KEY(idMessage),
	CONSTRAINT fk_message FOREIGN KEY(idGroupe)
	REFERENCES Kwa2Bo_groupe(idGroupe)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	CONSTRAINT fk_message2 FOREIGN KEY(login)
	REFERENCES Kwa2Bo_utilisateur(login)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);

INSERT INTO Kwa2Bo_profil (nom,prenom) VALUES ('Ferro','Thomas');
INSERT INTO Kwa2Bo_profil (nom,prenom) VALUES ('Fevre','Rémy');

INSERT INTO Kwa2Bo_utilisateur VALUES ('ferrot','rocher','Ferrot',1);
INSERT INTO Kwa2Bo_utilisateur VALUES ('fevrer','rocher','Psycos',2);
INSERT INTO Kwa2Bo_utilisateur VALUES ('leleu','rocher','A-La-Queue');
INSERT INTO Kwa2Bo_utilisateur VALUES ('catez','rocher','Gros-Connard');

INSERT INTO Kwa2Bo_contacts VALUES ('ferrot','fevrer');
INSERT INTO Kwa2Bo_contacts VALUES ('ferrot','leleu');

INSERT INTO Kwa2Bo_groupe (nomGroupe) VALUES ('Le paradis sur Terre');
INSERT INTO Kwa2Bo_groupe (nomGroupe) VALUES ('Ici c est Paris');

INSERT INTO Kwa2Bo_appartient VALUES ('ferrot',1);
INSERT INTO Kwa2Bo_appartient VALUES ('fevrer',1);
INSERT INTO Kwa2Bo_appartient VALUES ('ferrot',2);
INSERT INTO Kwa2Bo_appartient VALUES ('fevrer',2);
INSERT INTO Kwa2Bo_appartient VALUES ('leleu',2);

INSERT INTO Kwa2Bo_message(idGroupe,login,texte) VALUES (1,'fevrer','Thomas tu pue');
INSERT INTO Kwa2Bo_message(idGroupe,login,texte) VALUES (1,'ferrot','Non c est toi qui pue');
INSERT INTO Kwa2Bo_message(idGroupe,login,texte) VALUES (2,'ferrot','Bonjour');
INSERT INTO Kwa2Bo_message(idGroupe,login,texte) VALUES (2,'leleu','Oui bonjour ?');
INSERT INTO Kwa2Bo_message(idGroupe,login,texte) VALUES (2,'ferrot','Non toi bonjour!');
