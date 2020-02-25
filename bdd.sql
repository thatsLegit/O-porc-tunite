DROP DATABASE IF EXISTS OPORCTUNITE;
CREATE DATABASE OPORCTUNITE;
USE OPORCTUNITE;

DROP USER IF EXISTS 'admin'@'%';
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT all privileges on OPORCTUNITE.* to 'admin'@'%';
#Ajouter les users eleveur et veterinaire
#Modifier les droits de l'admin (droit de ban, ajout de fiches, ...)


DROP TABLE IF EXISTS posseder;
DROP TABLE IF EXISTS avis;
DROP TABLE IF EXISTS consulter;
DROP TABLE IF EXISTS favoris;
DROP TABLE IF EXISTS suivre;
DROP TABLE IF EXISTS test;
#Suppression de la table réaliser
#Suppression de la table Appartenir, modification du schéma

DROP TABLE IF EXISTS Historique_Notes;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS elevage;
DROP TABLE IF EXISTS fiche;
DROP TABLE IF EXISTS Veterinaire;
DROP TABLE IF EXISTS Libelle;
DROP TABLE IF EXISTS CategorieT;
DROP TABLE IF EXISTS Categorie;

##############################################################################################################################################################

#photo type BLOB, binaire
CREATE TABLE Users(
   idUsers INT AUTO_INCREMENT,
   email VARCHAR(50),
   telephone INT,
   login VARCHAR(50),
   password VARCHAR(50),
   userPhoto LONGBLOB,
   dateInscription DATE,
   dateConnexion DATETIME,
   PRIMARY KEY(idUsers)
)ENGINE=InnoDB CHARACTER SET utf8;

#Rajout de l'addresse de l'elevage
CREATE TABLE Elevage(
   numEleveur VARCHAR(50),
   nomElevage VARCHAR(50),
   departement VARCHAR(50),
   adresse VARCHAR(50),
   tailleElevage INT,
   idUsers INT,
   PRIMARY KEY(numEleveur),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers)
)ENGINE=InnoDB CHARACTER SET utf8;

#Fiche conseil de type BLOB (image, binaire)
CREATE TABLE Fiche(
   idFiche INT AUTO_INCREMENT,
   titreFiche VARCHAR(50),
   imageFiche LONGBLOB,
   PRIMARY KEY(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;

#Ajout du CP
CREATE TABLE Veterinaire(
   numVeterinaire VARCHAR(50),
   nomCabinet VARCHAR(50),
   codePostal INT,
   adresseCabinet VARCHAR(50),
   idUsers INT,
   PRIMARY KEY(numVeterinaire),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE CategorieT(
   nomCategorie VARCHAR(150),
   PRIMARY KEY(nomCategorie)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Categorie(
   idCat INT AUTO_INCREMENT,
   nomCat VARCHAR(50),
   PRIMARY KEY(idCat)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Historique_Notes(
   dateN DATETIME,
   note INT,
   numEleveur VARCHAR(50),
   PRIMARY KEY(dateN, numEleveur),
   FOREIGN KEY(numEleveur) REFERENCES Elevage(numEleveur)
)ENGINE=InnoDB CHARACTER SET utf8;

#Ajout de la table Libelle
CREATE TABLE Libelle(
nomLibelle VARCHAR(50),
description VARCHAR(200),
nomCategorie VARCHAR(150),
PRIMARY KEY(nomLibelle),
FOREIGN KEY(nomCategorie) REFERENCES CategorieT(nomCategorie)
)ENGINE=InnoDB CHARACTER SET utf8;

#suppression de la clé étrangère historique_notes
#dateT != dateN
CREATE TABLE Test(
   idTest INT AUTO_INCREMENT,
   valeur INT,
   dateT DATETIME,
   nbTruies INT,
   numEleveur VARCHAR(50),
   nomLibelle VARCHAR(30),
   PRIMARY KEY(idTest),
   FOREIGN KEY (nomLibelle) REFERENCES libelle(nomLibelle),
   FOREIGN KEY (numEleveur) REFERENCES elevage(numEleveur)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Posseder(
   idFiche INT,
   idCat INT,
   PRIMARY KEY(idFiche, idCat),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche),
   FOREIGN KEY(idCat) REFERENCES Categorie(idCat)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Avis(
   idUsers INT,
   idFiche INT,
   noteAvis INT,
   commentaireAvis VARCHAR(250),
   dateAvis VARCHAR(50),
   PRIMARY KEY(idUsers, idFiche),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE consulter(
   idConsultation INT AUTO_INCREMENT,
   idUsers INT,
   idFiche INT,
   dateConsultation DATETIME,
   PRIMARY KEY(idConsultation),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Favoris(
   idUsers INT,
   idFiche INT,
   dateFavoris DATETIME,
   PRIMARY KEY(idUsers, idFiche),
   FOREIGN KEY(idUsers) REFERENCES Users(idUsers),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE suivre(
   numEleveur VARCHAR(50),
   numVeterinaire VARCHAR(50),
   PRIMARY KEY(numEleveur, numVeterinaire),
   FOREIGN KEY(numEleveur) REFERENCES Elevage(numEleveur),
   FOREIGN KEY(numVeterinaire) REFERENCES Veterinaire(numVeterinaire)
)ENGINE=InnoDB CHARACTER SET utf8;



##################################################################################################################################################
INSERT INTO users(email, telephone, login, password, userPhoto, dateInscription, dateConnexion) VALUES ('azerty123@gmail.com', 0678452112, 'azertyer', 'slofaislia2', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-02-13');
INSERT INTO users(email, telephone, login, password, userPhoto, dateInscription, dateConnexion) VALUES ('azert124@hotmail.com', 0778453210, 'azergfty', 'sloZAailia3', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-01-09');
INSERT INTO users(email, telephone, login, password, userPhoto, dateInscription, dateConnexion) VALUES ('azertyg125@sfr.com', 0678454913, 'alnzerty', 'sloafalia4', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-02-10');
INSERT INTO users(email, telephone, login, password, userPhoto, dateInscription, dateConnexion) VALUES ('azertyj126@orange.fr', 0778853219, 'azersfty', 'sloaGRslia5', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-01-01');
INSERT INTO users(email, telephone, login, password, userPhoto, dateInscription, dateConnexion) VALUES ('azety127@gmail.com', 0648410518, 'azertgre', 'sloaf_isfTa6', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-02-20');

#A l'envoi du formulaire d'inscription, créee le user, puis invoquer une procédure qui passe l'idUser en paramètre et
#Elevage ou Véterinaire, permettant de créer un profil eleveur ou véto.
INSERT INTO veterinaire(numVeterinaire, nomCabinet, codePostal, adresseCabinet, idUsers) VALUES ('123ABC5646737GF', 'Super véto', 31000, '99, Place du Jeu de Paume', 1);
INSERT INTO veterinaire(numVeterinaire, nomCabinet, codePostal, adresseCabinet, idUsers) VALUES ('DSVBRH537737GBB', 'Véto Blagnac', 65000, '8, boulevard Bryas', 2);

INSERT INTO elevage(numEleveur, nomElevage, departement, adresse, tailleElevage, idUsers) VALUES ('URMC7774NVLDP32', 'Jean Viens', 'Haute-Garonne', '98, Chemin des Bateliers', 100, 3);
INSERT INTO elevage(numEleveur, nomElevage, departement, adresse, tailleElevage, idUsers) VALUES ('URMC7774NVLDP33', 'Jean Pars', 'Lot-Et-Garonne', '40, Chemin des Batons', 40, 4);
INSERT INTO elevage(numEleveur, nomElevage, departement, adresse, tailleElevage, idUsers) VALUES ('URMC7774NVLDP34', 'Jean Reviens', 'Tarn', '34, rue de la Mare aux Carats', 150, 5);

INSERT INTO fiche(titreFiche, imageFiche) VALUES ('Aménagement de la case maternité', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/fiche_conseil_exemple.pdf'));

#J'ai mis un nom de cat au hasard faudra demander à Laura
INSERT INTO Categorie(nomCat) VALUES ('Maternité');

#Pareil, j'ai mis des notes au hasard
#La note sera attribué une fois l'ensemble des tests réalisés au moins une fois
#Peut être créer un bouton pour obtenir la note avec erreur si tests incomplets
INSERT INTO Historique_Notes(dateN, note, numEleveur) VALUES ('2020-02-22', 3.5, 'URMC7774NVLDP32');
INSERT INTO Historique_Notes(dateN, note, numEleveur) VALUES ('2020-01-19', 4.5, 'URMC7774NVLDP33');

#J'ai traduit de l'anglais mais faut vérifier avec Laura
INSERT INTO CategorieT(nomCategorie) VALUES ('Absence de faim prolongée');
INSERT INTO CategorieT(nomCategorie) VALUES ('Absence de soif prolongée');
INSERT INTO CategorieT(nomCategorie) VALUES ('Confort au repos');
INSERT INTO CategorieT(nomCategorie) VALUES ('Confort de temperature');
INSERT INTO CategorieT(nomCategorie) VALUES ('Facilité de mouvement');
INSERT INTO CategorieT(nomCategorie) VALUES ('Absence de blessures');
INSERT INTO CategorieT(nomCategorie) VALUES ('Absence de maladies');
INSERT INTO CategorieT(nomCategorie) VALUES ('Absence de blessures causées par des procédures de gestion');
INSERT INTO CategorieT(nomCategorie) VALUES ('Expression du comportement social');
INSERT INTO CategorieT(nomCategorie) VALUES ('Expression d\'autres comportements');
INSERT INTO CategorieT(nomCategorie) VALUES ('Bonne relation humain-animal');
INSERT INTO CategorieT(nomCategorie) VALUES ('Emotions positives');

#Créer les libellés
#Vérifier les valeurs en front et en back :
#le post c'est pas hyper secure, donc faut vérifier les valeurs avant
#de préparer la requête
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('halètement', 'chrono associé', 'Confort de temperature');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Condition corporelle', 'maigre, normal, grosse', 'Absence de faim prolongée');
#Comment on fait ça? :
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Apport en eau', 'mesures des abreuvoirs (largeur,longueur, type, hauteur, propreté) et cela retourne si c’est adéquat ou non', 'Absence de soif prolongée');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Nombre de bursites', 'présence de photo. Absence, une ou plusieurs petites sur le même membre, ou une grosse, plusieurs grosses sur le même membre…', 'Confort au repos');
#Ajout de la l202, absence of manure on the body
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Absence de fumier sur le corps', 'présence de photo. Absence, une ou plusieurs petites sur le même membre, ou une grosse, plusieurs grosses sur le même membre…', 'Confort au repos');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Nombre de plaies à l’épaule', 'présence de photo. Absence, Vieilles lésion ou récente blessure en voie de guérison, lésion ouverte', 'Confort au repos');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Blotissement', 'oui/non', 'Confort de temperature');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('espace alloué', 'm²/truie', 'Facilité de mouvement');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('cases de mise bas', 'oui/non', 'Facilité de mouvement');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('boiterie', 'présence de photo (normale, sévère, sévère +++)', 'Absence de blessures');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('blessure corps', 'moins de 4, 5-10, 11-15', 'Absence de blessures');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('lésions vulve', 'absence, moyenne, sévère', 'Absence de blessures');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Mortalité', 'Pourcentage', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Toux', 'chrono associé', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('Éternuement', 'chrono associé', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('pompage', 'chrono associé', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('prolapsus rectal', 'oui/non', 'Absence de maladies');
#Rajout de l216, scouring
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('récurage', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('diarrhée', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('constipation', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('métrite', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('mammite', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('prolapsus utérin', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('condition de la peau', 'pas d’inflammation, moins de 10%, plus de 10%', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('ruptures et hernies', 'pas de mise en évidence, petites, grandes', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('infections locales', 'rien, moyennes, sévères', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('coupes de queue', 'non faites, anesth, sans anesth', 'Absence de blessures causées par des procédures de gestion');
#rajout de l227, nose ringing
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('bourdonnement de nez', 'non faites, anesth, sans anesth', 'Absence de blessures causées par des procédures de gestion');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('comportement social', 'positif, négatif', 'Expression du comportement social');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('stéréotypies', 'oui/non', 'Expression d\'autres comportements');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('exploration individuelle', 'explorant enclos, explorant matériel', 'Expression d\'autres comportements');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('peur de l’homme', 'niveau 1, niveau 2, niveau 3', 'Bonne relation humain-animal');
INSERT INTO Libelle(nomLibelle, description, nomCategorie) VALUES ('évaluation qualitative du comportement', 'présence de photo', 'Emotions positives');

INSERT INTO Posseder(idfiche, idcat) VALUES (1, 1);

#Note avis?
INSERT INTO Avis(idUsers, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (1, 1, 4, 'Excellente fiche, je recommande', '2020-01-02');
INSERT INTO Avis(idUsers, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (2, 1, 3, 'Super fiche, cela m\'a beaucoup aidé', '2020-01-03');
INSERT INTO Avis(idUsers, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (3, 1, 5, 'Je n\'ai rien compris', '2020-02-03');
INSERT INTO Avis(idUsers, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (4, 1, 4, 'Bonjour', '2020-01-11');
INSERT INTO Avis(idUsers, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (5, 1, 4, 'Il faudrait d\'autres fiches sur le même thème', '2020-01-02');

INSERT INTO consulter(idUsers, idFiche, dateConsultation) VALUES (1, 1, '2020-02-02');
INSERT INTO consulter(idUsers, idFiche, dateConsultation) VALUES (2, 1, '2020-02-02');
INSERT INTO consulter(idUsers, idFiche, dateConsultation) VALUES (3, 1, '2020-02-02');
INSERT INTO consulter(idUsers, idFiche, dateConsultation) VALUES (1, 1, '2020-02-03');
INSERT INTO consulter(idUsers, idFiche, dateConsultation) VALUES (1, 1, '2020-02-04');

INSERT INTO favoris(idUsers, idFiche, dateFavoris) VALUES (1, 1, '2020-02-04');
INSERT INTO favoris(idUsers, idFiche, dateFavoris) VALUES (4, 1, '2020-02-01');

INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('URMC7774NVLDP32', '123ABC5646737GF');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('URMC7774NVLDP32', 'DSVBRH537737GBB');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('URMC7774NVLDP33', 'DSVBRH537737GBB');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('URMC7774NVLDP33', '123ABC5646737GF');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('URMC7774NVLDP34', '123ABC5646737GF');

INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (0, '2020-01-17', 4, 'URMC7774NVLDP32', 'diarrhée');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (1, '2020-01-18', 4, 'URMC7774NVLDP33', 'diarrhée');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (23, '2020-01-17', 4, 'URMC7774NVLDP32', 'Mortalité');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (1, '2020-01-17', 4, 'URMC7774NVLDP32', 'prolapsus utérin');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (2, '2020-01-17', 4, 'URMC7774NVLDP32', 'Nombre de bursites');
