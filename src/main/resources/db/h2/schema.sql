DROP TABLE contrat IF EXISTS;
DROP TABLE departement IF EXISTS;
DROP TABLE departement_employes IF EXISTS;
DROP TABLE employe IF EXISTS;
DROP TABLE entreprise IF EXISTS;
DROP TABLE mission IF EXISTS;
DROP TABLE timesheet IF EXISTS;

CREATE TABLE  employe  (
   id  int(11) NOT NULL AUTO_INCREMENT,
   actif  bit(1) NOT NULL,
   email  varchar(255) DEFAULT NULL,
   nom  varchar(255) DEFAULT NULL,
   password  varchar(255) DEFAULT NULL,
   prenom  varchar(255) DEFAULT NULL,
   role  varchar(255) DEFAULT NULL,
  PRIMARY KEY ( id )
);

CREATE TABLE  contrat  (
   reference  int(11) NOT NULL AUTO_INCREMENT,
   date_debut  date DEFAULT NULL,
   salaire  float NOT NULL,
   telephone  float NOT NULL,
   type_contrat  varchar(255) DEFAULT NULL,
   employe_id  int(11) DEFAULT NULL,
  PRIMARY KEY ( reference )
);
ALTER TABLE contrat ADD CONSTRAINT fk_contrat_employe FOREIGN KEY (employe_id) REFERENCES employe (id);

CREATE TABLE  entreprise  (
   id  int(11) NOT NULL AUTO_INCREMENT,
   name  varchar(255) DEFAULT NULL,
   raison_social  varchar(255) DEFAULT NULL,
  PRIMARY KEY ( id )
);

CREATE TABLE  departement  (
   id  int(11) NOT NULL AUTO_INCREMENT,
   name  varchar(255) DEFAULT NULL,
   entreprise_id  int(11) DEFAULT NULL,
  PRIMARY KEY ( id )
);
ALTER TABLE departement ADD CONSTRAINT fk_departement_entreprise FOREIGN KEY (entreprise_id) REFERENCES entreprise (id);

CREATE TABLE  departement_employes  (
   departements_id  int(11) NOT NULL,
   employes_id  int(11) NOT NULL
);
ALTER TABLE departement_employes ADD CONSTRAINT fk_departement_employes_emp FOREIGN KEY (employes_id) REFERENCES employe (id);
ALTER TABLE departement_employes ADD CONSTRAINT fk_departement_employes_dep FOREIGN KEY (departements_id) REFERENCES departement (id);


CREATE TABLE  mission  (
   dtype  varchar(31) NOT NULL,
   id  int(11) NOT NULL AUTO_INCREMENT,
   description  varchar(255) DEFAULT NULL,
   name  varchar(255) DEFAULT NULL,
   email_facturation  varchar(255) DEFAULT NULL,
   taux_journalier_moyen  float DEFAULT NULL,
   departement_id  int(11) DEFAULT NULL,
  PRIMARY KEY ( id )
);
ALTER TABLE mission ADD CONSTRAINT fk_mission_departement FOREIGN KEY (departement_id) REFERENCES departement (id);

CREATE TABLE  timesheet  (
   date_debut  date NOT NULL,
   date_fin  date NOT NULL,
   id_employe  int(11) NOT NULL,
   id_mission  int(11) NOT NULL,
   is_valide  bit(1) NOT NULL,
  PRIMARY KEY ( date_debut , date_fin , id_employe , id_mission )
);
ALTER TABLE timesheet ADD CONSTRAINT fk_timesheet_employe FOREIGN KEY (id_employe) REFERENCES employe (id);
ALTER TABLE timesheet ADD CONSTRAINT fk_timesheet_mission FOREIGN KEY (id_mission) REFERENCES mission (id);