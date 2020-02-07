DROP DATABASE IF EXISTS OPORCTUNITE;
CREATE DATABASE OPORCTUNITE;
USE OPORCTUNITE;

DROP USER IF EXISTS 'admin'@'%';
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT all privileges on OPORCTUNITE.* to 'admin'@'%';


DROP TABLE IF EXISTS posseder;
DROP TABLE IF EXISTS avis;
DROP TABLE IF EXISTS consulter;
DROP TABLE IF EXISTS favoris;
DROP TABLE IF EXISTS suivre;
DROP TABLE IF EXISTS realiser;
DROP TABLE IF EXISTS Appartenir;

DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS Historique_Notes;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS elevage;
DROP TABLE IF EXISTS fiche;
DROP TABLE IF EXISTS Veterinaire;
DROP TABLE IF EXISTS CategorieT;
DROP TABLE IF EXISTS Categorie;


CREATE TABLE Users(
   idUsers INT,
   email VARCHAR(50),
   telephone INT,
   login VARCHAR(50),
   password VARCHAR(50),
   nomPhoto VARCHAR(50),
   dateInscription VARCHAR(50),
   dateConnexion VARCHAR(50),
   PRIMARY KEY(idUsers)
);

CREATE TABLE Elevage(
   numEleveur VARCHAR(50),
   nomElevage VARCHAR(50),
   Departement INT,
   tailleElevage INT,
   idUsers INT NOT NULL,
   PRIMARY KEY(numEleveur),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers)
);

CREATE TABLE Fiche(
   idFiche INT,
   titreFiche VARCHAR(50),
   PRIMARY KEY(idFiche)
);

CREATE TABLE Veterinaire(
   numVeterinaire VARCHAR(50),
   nomCabinet VARCHAR(50),
   adresseCabinet VARCHAR(50),
   idUsers INT NOT NULL,
   PRIMARY KEY(numVeterinaire),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers)
);

CREATE TABLE CategorieT(
   idCatTest INT,
   libelléT VARCHAR(50),
   PRIMARY KEY(idCatTest)
);

CREATE TABLE Categorie(
   idCat INT,
   nomCat VARCHAR(50),
   PRIMARY KEY(idCat)
);

CREATE TABLE Historique_Notes(
   idHistoriqueNote INT,
   dateN VARCHAR(50),
   note INT,
   numEleveur VARCHAR(50),
   PRIMARY KEY(idHistoriqueNote),
   FOREIGN KEY(numEleveur) REFERENCES Elevage(numEleveur)
);

CREATE TABLE Test(
   idTest INT,
   Libellé VARCHAR(50),
   unité VARCHAR(50),
   idHistoriqueNote INT NOT NULL,
   PRIMARY KEY(idTest),
   FOREIGN KEY(idHistoriqueNote) REFERENCES Historique_Notes(idHistoriqueNote)
);

CREATE TABLE Posseder(
   idFiche INT,
   idCat INT,
   PRIMARY KEY(idFiche, idCat),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche),
   FOREIGN KEY(idCat) REFERENCES Categorie(idCat)
);

CREATE TABLE Avis(
   idUsers INT,
   idFiche INT,
   noteAvis INT,
   commentaireAvis VARCHAR(100),
   dateAvis VARCHAR(50),
   PRIMARY KEY(idUsers, idFiche),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
);

CREATE TABLE consulter(
   idUsers INT,
   idFiche INT,
   dateConsultation VARCHAR(50),
   PRIMARY KEY(idUsers, idFiche),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
);

CREATE TABLE Favoris(
   idUsers INT,
   idFiche INT,
   dateFavoris VARCHAR(50),
   PRIMARY KEY(idUsers, idFiche),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
);

CREATE TABLE suivre(
   numEleveur VARCHAR(50),
   numVeterinaire VARCHAR(50),
   PRIMARY KEY(numEleveur, numVeterinaire),
   FOREIGN KEY(numEleveur) REFERENCES Elevage(numEleveur),
   FOREIGN KEY(numVeterinaire) REFERENCES Veterinaire(numVeterinaire)
);

CREATE TABLE realiser(
   numEleveur VARCHAR(50),
   idTest INT,
   dateTest VARCHAR(50),
   nbTruies INT,
   valeurObservée INT,
   PRIMARY KEY(numEleveur, idTest),
   FOREIGN KEY(numEleveur) REFERENCES Elevage(numEleveur),
   FOREIGN KEY(idTest) REFERENCES Test(idTest)
);

CREATE TABLE Appartenir(
   idTest INT,
   idCatTest INT,
   PRIMARY KEY(idTest, idCatTest),
   FOREIGN KEY(idTest) REFERENCES Test(idTest),
   FOREIGN KEY(idCatTest) REFERENCES CategorieT(idCatTest)
);
