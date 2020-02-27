DROP DATABASE IF EXISTS OPORCTUNITE;
CREATE DATABASE OPORCTUNITE;
USE OPORCTUNITE;

DROP USER IF EXISTS 'admin'@'%';
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT all privileges on OPORCTUNITE.* to 'admin'@'%';
#Ajouter les users eleveur et veterinaire
#Modifier les droits de l'admin (droit de ban, ajout de fiches, ...)


DROP TABLE IF EXISTS donnerAvis;
DROP TABLE IF EXISTS consulter;
DROP TABLE IF EXISTS mettreFavoris;
DROP TABLE IF EXISTS suivre;
DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS notes_gc;
DROP TABLE IF EXISTS notes_pc;

DROP TABLE IF EXISTS fiche;
DROP TABLE IF EXISTS libelle;
DROP TABLE IF EXISTS categorie_P;

DROP TABLE IF EXISTS elevage;
DROP TABLE IF EXISTS veterinaire;
DROP TABLE IF EXISTS categorie_G;
DROP TABLE IF EXISTS utilisateur;


##############################################################################################################################################################

CREATE TABLE utilisateur(
   idutilisateur INT AUTO_INCREMENT,
   email VARCHAR(50),
   telephone INT,
   login VARCHAR(50),
   password VARCHAR(50),
   utilisateurPhoto LONGBLOB,
   dateInscription DATE,
   dateConnexion DATETIME,
   PRIMARY KEY(idutilisateur)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Elevage(
   numEleveur VARCHAR(7),
   nomElevage VARCHAR(50),
   departement VARCHAR(50),
   adresse VARCHAR(50),
   tailleElevage INT,
   idutilisateur INT,
   PRIMARY KEY(numEleveur),
   FOREIGN KEY(idutilisateur) REFERENCES utilisateur(idutilisateur)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Veterinaire(
   numVeterinaire INT(5),
   nomCabinet VARCHAR(50),
   codePostal INT,
   adresseCabinet VARCHAR(50),
   idutilisateur INT,
   PRIMARY KEY(numVeterinaire),
   FOREIGN KEY(idutilisateur) REFERENCES utilisateur(idutilisateur)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE categorie_G(
	nomCategorieG VARCHAR(30),
    PRIMARY KEY(nomCategorieG)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE categorie_P(
	nomCategorieP VARCHAR(100),
    nomCategorieG VARCHAR(30),
    PRIMARY KEY(nomCategorieP),
    FOREIGN KEY(nomCategorieG) REFERENCES categorie_G(nomCategorieG)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Fiche(
   idFiche INT AUTO_INCREMENT,
   titreFiche VARCHAR(50),
   imageFiche LONGBLOB,
   nomCategorieG VARCHAR(30),
   PRIMARY KEY(idFiche),
   FOREIGN KEY(nomCategorieG) REFERENCES categorie_G(nomCategorieG)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Libelle(
nomLibelle VARCHAR(50),
description VARCHAR(200),
nomCategorieP VARCHAR(100),
PRIMARY KEY(nomLibelle),
FOREIGN KEY(nomCategorieP) REFERENCES categorie_P(nomCategorieP)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE suivre(
   numEleveur VARCHAR(7),
   numVeterinaire INT(5),
   PRIMARY KEY(numEleveur, numVeterinaire),
   FOREIGN KEY(numEleveur) REFERENCES Elevage(numEleveur),
   FOREIGN KEY(numVeterinaire) REFERENCES Veterinaire(numVeterinaire)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE Test(
   idTest INT AUTO_INCREMENT,
   valeur INT,
   dateT DATETIME,
   nbTruies INT,
   numEleveur VARCHAR(7),
   nomLibelle VARCHAR(30),
   PRIMARY KEY(idTest),
   FOREIGN KEY (nomLibelle) REFERENCES libelle(nomLibelle),
   FOREIGN KEY (numEleveur) REFERENCES elevage(numEleveur)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE notes_gc(
	idNoteGC INT AUTO_INCREMENT,
	dateN DATE, 
    noteGC INT, 
    numEleveur VARCHAR(7),
    nomCategorieG VARCHAR(30),
    PRIMARY KEY(idNoteGC),
    FOREIGN KEY (numEleveur) REFERENCES elevage(numEleveur),
   FOREIGN KEY (nomCategorieG) REFERENCES Categorie_G(nomCategorieG)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE notes_pc(
	idNotePC INT AUTO_INCREMENT,
	dateN DATE, 
    notePC INT, 
    numEleveur VARCHAR(7),
    nomCategorieP VARCHAR(100),
    PRIMARY KEY(idNotePC),
    FOREIGN KEY (numEleveur) REFERENCES elevage(numEleveur),
   FOREIGN KEY (nomCategorieP) REFERENCES Categorie_P(nomCategorieP)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE donnerAvis(
   idutilisateur INT,
   idFiche INT,
   noteAvis INT,
   commentaireAvis VARCHAR(250),
   dateAvis VARCHAR(50),
   PRIMARY KEY(idutilisateur, idFiche),
   FOREIGN KEY(idutilisateur) REFERENCES utilisateur(idutilisateur),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE consulter(
   idutilisateur INT,
   idFiche INT,
   dateConsultation DATETIME,
   PRIMARY KEY(idutilisateur, idFiche, dateConsultation),
   FOREIGN KEY(idutilisateur) REFERENCES utilisateur(idutilisateur),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;

CREATE TABLE mettreFavoris(
   idutilisateur INT,
   idFiche INT,
   dateFavoris DATETIME,
   PRIMARY KEY(idutilisateur, idFiche, dateFavoris),
   FOREIGN KEY(idutilisateur) REFERENCES utilisateur(idutilisateur),
   FOREIGN KEY(idFiche) REFERENCES Fiche(idFiche)
)ENGINE=InnoDB CHARACTER SET utf8;


##################################################################################################################################################
INSERT INTO utilisateur(email, telephone, login, password, utilisateurPhoto, dateInscription, dateConnexion) VALUES ('azerty123@gmail.com', 0678452112, 'azertyer', 'slofaislia2', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-02-13');
INSERT INTO utilisateur(email, telephone, login, password, utilisateurPhoto, dateInscription, dateConnexion) VALUES ('azert124@hotmail.com', 0778453210, 'azergfty', 'sloZAailia3', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-01-09');
INSERT INTO utilisateur(email, telephone, login, password, utilisateurPhoto, dateInscription, dateConnexion) VALUES ('azertyg125@sfr.com', 0678454913, 'alnzerty', 'sloafalia4', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-02-10');
INSERT INTO utilisateur(email, telephone, login, password, utilisateurPhoto, dateInscription, dateConnexion) VALUES ('azertyj126@orange.fr', 0778853219, 'azersfty', 'sloaGRslia5', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-01-01');
INSERT INTO utilisateur(email, telephone, login, password, utilisateurPhoto, dateInscription, dateConnexion) VALUES ('azety127@gmail.com', 0648410518, 'azertgre', 'sloaf_isfTa6', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/pig-3986310_640.jpg'), CURRENT_DATE(), '2020-02-20');

#A l'envoi du formulaire d'inscription, créee le user, puis invoquer une procédure qui passe l'idUser en paramètre et
#Elevage ou Véterinaire, permettant de créer un profil eleveur ou véto
INSERT INTO veterinaire(numVeterinaire, nomCabinet, codePostal, adresseCabinet, idUtilisateur) VALUES ('12345', 'Super véto', 31000, '99, Place du Jeu de Paume', 1);
INSERT INTO veterinaire(numVeterinaire, nomCabinet, codePostal, adresseCabinet, idUtilisateur) VALUES ('34940', 'Véto Blagnac', 65000, '8, boulevard Bryas', 2);

INSERT INTO elevage(numEleveur, nomElevage, departement, adresse, tailleElevage, idUtilisateur) VALUES ('FR312D1', 'Jean Viens', 'Haute-Garonne', '98, Chemin des Bateliers', 100, 3);
INSERT INTO elevage(numEleveur, nomElevage, departement, adresse, tailleElevage, idUtilisateur) VALUES ('FR312D2', 'Jean Pars', 'Lot-Et-Garonne', '40, Chemin des Batons', 40, 4);
INSERT INTO elevage(numEleveur, nomElevage, departement, adresse, tailleElevage, idUtilisateur) VALUES ('FR312D3', 'Jean Reviens', 'Tarn', '34, rue de la Mare aux Carats', 150, 5);

INSERT INTO Categorie_G(nomCategorieG) VALUES ('Hébergement approprié');
INSERT INTO Categorie_G(nomCategorieG) VALUES ('nourriture convenable');
INSERT INTO Categorie_G(nomCategorieG) VALUES ('Bonne santé');
INSERT INTO Categorie_G(nomCategorieG) VALUES ('comportement approprié');

#La note sera attribué une fois l'ensemble des tests d'une catégorie réalisés au moins une fois
#Peut être créer un bouton pour obtenir la note avec erreur si tests incomplets
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Absence de faim prolongée', 'nourriture convenable');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Absence de soif prolongée', 'nourriture convenable');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Confort au repos', 'Hébergement approprié');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Confort de temperature', 'Hébergement approprié');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Facilité de mouvement', 'Hébergement approprié');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Absence de blessures', 'Bonne santé');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Absence de maladies', 'Bonne santé');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Absence de blessures causées par certaines pratiques d\'elevage', 'Bonne santé');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Expression du comportement social', 'comportement approprié');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Expression d\'autres comportements','comportement approprié');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Bonne relation homme-animal', 'comportement approprié');
INSERT INTO Categorie_P(nomCategorieP, nomCategorieG) VALUES ('Emotions positives', 'comportement approprié');


INSERT INTO fiche(titreFiche, imageFiche, nomCategorieG) VALUES ('Aménagement de la case maternité', LOAD_FILE('/Users/stepanov/Desktop/O-porc-tunite/img/fiche_conseil_exemple.pdf'), 'Hébergement approprié');


#Vérifier les valeurs en front et en back :
#le post c'est pas hyper secure, donc faut vérifier les valeurs avant
#de préparer la requête
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('halètement', 'chrono associé', 'Confort de temperature');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Condition corporelle', 'maigre, normal, grosse', 'Absence de faim prolongée');
#Comment on fait ça? : modèle d'abreuvoir
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Apport en eau', 'mesures des abreuvoirs (largeur,longueur, type, hauteur, propreté) et cela retourne si c’est adéquat ou non', 'Absence de soif prolongée');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Nombre de bursites', 'présence de photo. Absence, une ou plusieurs petites sur le même membre, ou une grosse, plusieurs grosses sur le même membre…', 'Confort au repos');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Absence de lisier sur le corps', 'présence de photo. Absence, une ou plusieurs petites sur le même membre, ou une grosse, plusieurs grosses sur le même membre…', 'Confort au repos');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Nombre de plaies à l’épaule', 'présence de photo. Absence, Vieilles lésion ou récente blessure en voie de guérison, lésion ouverte', 'Confort au repos');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Blotissement', 'oui/non', 'Confort de temperature');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('espace alloué', 'm²/truie', 'Facilité de mouvement');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('cases de mise bas', 'oui/non', 'Facilité de mouvement');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('boiterie', 'présence de photo (normale, sévère, sévère +++)', 'Absence de blessures');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('blessure corps', 'moins de 4, 5-10, 11-15', 'Absence de blessures');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('lésions vulve', 'absence, moyenne, sévère', 'Absence de blessures');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Mortalité', 'Pourcentage', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Toux', 'chrono associé', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('Éternuement', 'chrono associé', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('pompage', 'chrono associé', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('prolapsus rectal', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('diarrhée', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('constipation', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('métrite', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('mammite', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('prolapsus utérin', 'oui/non', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('condition de la peau', 'pas d’inflammation, moins de 10%, plus de 10%', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('ruptures et hernies', 'pas de mise en évidence, petites, grandes', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('infections locales', 'rien, moyennes, sévères', 'Absence de maladies');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('coupes de queue', 'non faites, anesth, sans anesth', 'Absence de blessures causées par certaines pratiques d\'elevage');
#rajout de l227, nose ringing
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('bourdonnement de nez', 'non faites, anesth, sans anesth', 'Absence de blessures causées par certaines pratiques d\'elevage');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('comportement social', 'positif, négatif', 'Expression du comportement social');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('stéréotypies', 'oui/non', 'Expression d\'autres comportements');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('exploration individuelle', 'explorant enclos, explorant matériel', 'Expression d\'autres comportements');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('peur de l’homme', 'niveau 1, niveau 2, niveau 3', 'Bonne relation homme-animal');
INSERT INTO Libelle(nomLibelle, description, nomCategorieP) VALUES ('évaluation qualitative du comportement', 'présence de photo', 'Emotions positives');

INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('FR312D1', '34940');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('FR312D1', '12345');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('FR312D2', '12345');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('FR312D2', '34940');
INSERT INTO suivre(numEleveur, numVeterinaire) VALUES ('FR312D3', '34940');

INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (0, '2020-01-17', 4, 'FR312D1', 'diarrhée');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (1, '2020-01-18', 6, 'FR312D1', 'diarrhée');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (23, '2020-01-17', 2, 'FR312D2', 'Mortalité');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (1, '2020-01-17', 1, 'FR312D3', 'prolapsus utérin');
INSERT INTO test(valeur, dateT, nbTruies, numEleveur, nomLibelle) VALUES (2, '2020-01-17', 4, 'FR312D3', 'Nombre de bursites');

INSERT INTO notes_gc(dateN, noteGC, numEleveur, nomCategorieG) VALUES ('2020-01-17', 2, 'FR312D1', 'Hébergement approprié');
INSERT INTO notes_gc(dateN, noteGC, numEleveur, nomCategorieG) VALUES ('2020-01-18', 1, 'FR312D1', 'comportement approprié');
INSERT INTO notes_gc(dateN, noteGC, numEleveur, nomCategorieG) VALUES ('2020-01-10', 4, 'FR312D2', 'Bonne santé');
INSERT INTO notes_gc(dateN, noteGC, numEleveur, nomCategorieG) VALUES ('2020-02-15', 3, 'FR312D3', 'nourriture convenable');

INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-02-17', 2, 'FR312D1', 'Confort de temperature');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-01-20', 2, 'FR312D2', 'Absence de faim prolongée');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-02-25', 3, 'FR312D1', 'Absence de maladies');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-01-23', 2, 'FR312D1', 'Absence de blessures causées par certaines pratiques d\'elevage');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-01-02', 4, 'FR312D2', 'Absence de blessures causées par certaines pratiques d\'elevage');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-02-01', 2, 'FR312D2', 'Bonne relation homme-animal');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-01-17', 2, 'FR312D3', 'Emotions positives');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-01-11', 1, 'FR312D3', 'Facilité de mouvement');
INSERT INTO notes_pc(dateN, notePC, numEleveur, nomCategorieP) VALUES ('2020-01-18', 1, 'FR312D3', 'Confort au repos');


#noteAvis : 1 à 5?
INSERT INTO donnerAvis(idutilisateur, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (1, 1, 4, 'Excellente fiche, je recommande', '2020-01-02');
INSERT INTO donnerAvis(idutilisateur, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (2, 1, 3, 'Super fiche, cela m\'a beaucoup aidé', '2020-01-03');
INSERT INTO donnerAvis(idutilisateur, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (3, 1, 5, 'Je n\'ai rien compris', '2020-02-03');
INSERT INTO donnerAvis(idutilisateur, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (4, 1, 4, 'Bonjour', '2020-01-11');
INSERT INTO donnerAvis(idutilisateur, idfiche, noteAvis, commentaireAvis, dateAvis) VALUES (5, 1, 4, 'Il faudrait d\'autres fiches sur le même thème', '2020-01-02');

INSERT INTO consulter(idutilisateur, idFiche, dateConsultation) VALUES (1, 1, '2020-02-02');
INSERT INTO consulter(idutilisateur, idFiche, dateConsultation) VALUES (2, 1, '2020-02-02');
INSERT INTO consulter(idutilisateur, idFiche, dateConsultation) VALUES (3, 1, '2020-02-02');
INSERT INTO consulter(idutilisateur, idFiche, dateConsultation) VALUES (1, 1, '2020-02-03');
INSERT INTO consulter(idutilisateur, idFiche, dateConsultation) VALUES (1, 1, '2020-01-27');

INSERT INTO mettreFavoris(idUtilisateur, idFiche, dateFavoris) VALUES (1, 1, '2020-02-04');
INSERT INTO mettreFavoris(idUtilisateur, idFiche, dateFavoris) VALUES (4, 1, '2020-02-01');
