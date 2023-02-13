drop database if exists tjm;

create database tjm;

use tjm;

create table utilisateur (
	id_user int(5) auto_increment,
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	mdp varchar(30),
	role enum ('candidat', 'client', 'employe', 'vendeur', 'recruteur', 'mecanicien', 'manager'),
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table employe (
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	adresse varchar(50),
	mdp varchar(30),
	role enum ('vendeur', 'recruteur', 'mecanicien', 'manager'),
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table client (
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	mdp varchar(30),
	role varchar(30) default 'client',
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table candidat(
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	mdp varchar(30),
	role varchar(30) default 'candidat',
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table manager (
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	adresse varchar(50),
	mdp varchar(30),
	role varchar(30) default 'manager',
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table mecanicien (
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	adresse varchar(50),
	mdp varchar(30),
	role varchar(30) default 'mecanicien',
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table vendeur (
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	adresse varchar(50),
	mdp varchar(30),
	role varchar(30) default 'vendeur',
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table recruteur (
	id_user int(5),
	nom varchar(10),
	prenom varchar(10),
	email varchar(30),
	tel varchar(30),
	adresse varchar(50),
	mdp varchar(30),
	role varchar(30) default 'recruteur',
	PRIMARY KEY (id_user)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table offre(
	id_offre int(5) auto_increment,
	titre varchar(30),
	lieux varchar(30),
	secteur varchar(30),
	salaire varchar(30),
	contrat varchar(30),
	date_offre varchar(30),
	description_personne longtext,
	description_travail longtext,
	description_mission longtext,
	PRIMARY KEY (id_offre)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table candidature (
	id_candidature int(5) auto_increment,
	nom varchar(20),
	prenom varchar(20),
	email varchar(30),
	tel varchar(30),
	date_candidature varchar(30),
	experience int(2),
	diplome varchar(30),
	message longtext,
	statut varchar(30) default 'En cour de traitement',
	id_user int(5),
	id_offre int(5),
	PRIMARY KEY (id_candidature),
	FOREIGN KEY (id_user) references candidat (id_user),
	FOREIGN KEY (id_offre) references offre (id_offre)
	on update cascade
	on delete cascade
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table paie (
    id_paie int(5) auto_increment,
    id_user int(5),
    montant float(7,2),
    date_versement varchar(20),
    description varchar(100),
    objet varchar(30),
    PRIMARY KEY (id_paie),
    FOREIGN KEY (id_user) references employe (id_user)
    on update cascade
    on delete cascade
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table absence (
	id_absence int(5) auto_increment,
	id_user int(5),
	date_absence varchar(70),
	type_absence enum ('conge paye', 'maladie', 'conge sans solde', 'formation'),
	PRIMARY KEY (id_absence),
	FOREIGN KEY (id_user) references employe (id_user)
	on update cascade
	on delete cascade
)
ENGINE=innodb DEFAULT CHARSET=latin1;


create table tache (
	id_tache int(5) auto_increment,
	id_user int(5),
	date_heure_tache varchar(70),
	lieu varchar(50),
	motif varchar(50),
	PRIMARY KEY (id_tache),
	FOREIGN KEY (id_user) references employe (id_user)
	on update cascade
	on delete cascade
)
ENGINE=innodb DEFAULT CHARSET=latin1;


create table piece(
	id_piece int(5) auto_increment,
	categorie varchar(20),
	prix float(7,2),
	PRIMARY KEY (id_piece)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table voiture(
	id_voiture int(5) auto_increment,
	modele varchar(20),
	couleur varchar(20),
	immatriculation varchar(20),
	prix float(7,2),
	PRIMARY KEY (id_voiture)
)
ENGINE=innodb DEFAULT CHARSET=latin1;


create table facture(
	id_facture int(5) auto_increment,
	date_facture varchar(30),
	titre varchar(20),
	prix float (7,2),
	detail varchar(50),
	PRIMARY KEY (id_facture)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table categorie(
	id_categorie int(5) auto_increment,
	nom varchar(20),
	description varchar(50),
	date_creation varchar(30),
	PRIMARY KEY (id_categorie)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table sujet(
	id_sujet int(5) auto_increment,
	titre varchar(20),
	contenu varchar(30),
	date_creation varchar(30),
	PRIMARY KEY (id_sujet)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

create table commentaire(
	id_commentaire int(5) auto_increment,
	contenu varchar(30),
	date_envoi varchar(30),
	PRIMARY KEY (id_commentaire)
)
ENGINE=innodb DEFAULT CHARSET=latin1;

/*VIEWS*/

create or replace view VuelesCandidatures as (
select c.id_candidature, o.id_offre, o.titre, o.lieux, o.contrat,
c.nom, c.prenom, c.email, c.tel, c.date_candidature, c.experience,
c.diplome, c.message, c.statut, c.id_user
from offre o, candidature c
where o.id_offre = c.id_offre
);

create or replace view VuelesAbsences as (
select e.id_user, e.nom, e.prenom, e.role, a.date_absence, a.type_absence
from employe e, absence a
where e.id_user = a.id_user
);

create or replace view VuelesTaches as (
select e.id_user, e.nom, e.prenom, e.role, t.date_heure_tache, t.lieu, t.motif
from employe e, tache t
where e.id_user = t.id_user
);

/*TRIGGERS*/

drop trigger if exists InsertUtilisateurToCandidatOrClient;
delimiter //
CREATE TRIGGER InsertUtilisateurToCandidatOrClient
 after insert on utilisateur
 for each row
 begin
	if (new.role = 'candidat')
		then
        insert into candidat (id_user, nom, prenom, email, tel, mdp, role) values (new.id_user, new.nom, new.prenom, new.email, new.tel, new.mdp, new.role);
	elseif (new.role = 'client')
		then
		insert into client (id_user, nom, prenom, email, tel, mdp, role) values (new.id_user, new.nom, new.prenom, new.email, new.tel, new.mdp, new.role);
    end if;
 END //
Delimiter ;

drop trigger if exists InsertEmployeToOther;
delimiter //
CREATE TRIGGER InsertEmployeToOther
 after insert on employe
 for each row
 begin
	if (new.role = 'vendeur')
		then
        insert into vendeur (id_user, nom, prenom, email, tel, adresse, mdp, role) values (new.id_user, new.nom, new.prenom, new.email, new.tel, new.adresse, new.mdp, new.role);
	elseif (new.role = 'recruteur')
		then
		insert into recruteur (id_user, nom, prenom, email, tel, adresse, mdp, role) values (new.id_user, new.nom, new.prenom, new.email, new.tel, new.adresse, new.mdp, new.role);
	elseif (new.role = 'mecanicien')
		then
		insert into mecanicien (id_user, nom, prenom, email, tel, adresse, mdp, role) values (new.id_user, new.nom, new.prenom, new.email, new.tel, new.adresse, new.mdp, new.role);
	elseif (new.role = 'manager')
		then
		insert into manager (id_user, nom, prenom, email, tel, adresse, mdp, role) values (new.id_user, new.nom, new.prenom, new.email, new.tel, new.adresse, new.mdp, new.role);
    end if;
 END //
Delimiter ;

/*PROCEDURE*/

/*employe*/
delimiter $
create procedure insertEmploye (IN e_nom varchar(50), IN e_prenom varchar(50), IN e_email varchar(50), IN e_tel varchar(50), IN e_adresse varchar(50), IN e_mdp varchar(50), IN e_role varchar(50))
Begin
	declare e_id_user int(3);
	select max(id_user)+1 into e_id_user from utilisateur;

	insert into employe values (e_id_user, e_nom, e_prenom, e_email, e_tel, e_adresse, e_mdp, e_role);

	insert into utilisateur values (null, e_nom, e_prenom, e_email, e_tel, e_mdp, e_role);
End $
delimiter ;

delimiter $
create procedure deleteEmploye (IN e_id_user int(3))
BEGIN
    delete from employe
    where id_user = e_id_user;
END $
delimiter ;

delimiter $
create procedure updateEmploye (IN e_id_user int(3), IN e_nom varchar(50), IN e_prenom varchar(50), IN e_email varchar(50), IN e_tel varchar(50), IN e_adresse varchar(50), IN e_mdp varchar(50), IN e_role varchar(50))
BEGIN
    update employe
    set nom = e_nom, prenom = e_prenom, email = e_email, tel = e_tel, mdp = e_mdp, role = e_role, adresse = e_adresse
    where id_user = e_id_user;

	update utilisateur
    set nom = e_nom, prenom = e_prenom, email = e_email, tel = e_tel, mdp = e_mdp, role = e_role
    where id_user = e_id_user;
END $
delimiter ;

/*absence*/

delimiter $
create procedure insertAbsence (IN a_id_user int(3), IN a_date_absence varchar(70), IN a_type_absence varchar(50))
Begin
	insert into absence values (null, a_id_user, a_date_absence, a_type_absence);
End $
delimiter ;

delimiter $
create procedure deleteAbsence (IN a_id_absence int(3))
BEGIN
    delete from absence
    where id_absence = a_id_absence;
END $
delimiter ;

delimiter $
create procedure updateAbsence (IN a_id_absence int(3), IN a_id_user int(3), IN a_date_absence varchar(70), IN a_type_absence varchar(50))
BEGIN
    update absence
    set id_user = a_id_user, date_absence = a_date_absence, type_absence = a_type_absence
    where id_absence = a_id_absence;
END $
delimiter ;

/*tache*/

delimiter $
create procedure insertTache (IN t_id_user int(3), IN t_date_heure_tache varchar(70), IN t_lieu varchar(50), IN t_motif varchar(50))
Begin
	insert into tache values (null, t_id_user, t_date_heure_tache, t_lieu, t_motif);
End $
delimiter ;

delimiter $
create procedure deleteTache (IN t_id_tache int(3))
BEGIN
    delete from tache
    where id_tache = t_id_tache;
END $
delimiter ;


delimiter $
create procedure updateTache (IN t_id_tache int(3), IN t_id_user int(3), IN t_date_heure_tache varchar(70), IN t_lieu varchar(50), IN t_motif varchar(50))
BEGIN
    update tache
    set id_user = t_id_user, date_heure_tache = t_date_heure_tache, lieu = t_lieu, motif = t_motif
    where id_tache = t_id_tache;
END $
delimiter ;

/*paie*/

delimiter $
create procedure insertPaie (IN p_id_user int(3), IN p_montant float(8,2), IN p_date_versement varchar(50), IN p_description varchar(100), IN p_objet varchar(50))
Begin
	insert into paie values (null, p_id_user, p_montant, p_date_versement, p_description, p_objet);
End $
delimiter ;

delimiter $
create procedure deletePaie (IN p_id_paie int(3))
BEGIN
    delete from paie
    where id_paie = p_id_paie;
END $
delimiter ;

delimiter $
create procedure updatePaie (IN p_id_paie int(3), IN p_id_user int(3), IN p_montant float(8,2), IN p_date_versement varchar(50), IN p_description varchar(100), IN p_objet varchar(50))
BEGIN
    update paie
    set id_user = p_id_user, montant = p_montant, date_versement = p_date_versement, description = p_description, objet = p_objet
    where id_paie = p_id_paie;
END $
delimiter ;


/*INSERT*/

insert into utilisateur values (null,'chiche','mehdi','mehh92350@gmail.com','0650409399','123','client');

call insertEmploye ('test', 'test', 'test', 'test', 'test', 'test', 'manager');

call insertEmploye ('test', 'test', 'test', 'test', '123', '123', 'mecanicien');