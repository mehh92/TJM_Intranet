drop database if exists depannage_sd_23;
create database depannage_sd_23;

use depannage_sd_23;

create table Personne (
	idpers int(3) not null auto_increment,
	nom varchar(50),
	prenom varchar(50),
	email varchar(50),
	mdp varchar(50),
	primary key (idpers)
);

create table client (
	idpers int(3) not null,
	adresse varchar(50),
	primary key(idpers),
	foreign key(idpers) references personne(idpers)
	);

create table technicien (
	idpers int(3) not null,
	qualification varchar(50),
	primary key(idpers),
	foreign key(idpers) references personne(idpers)
	);

create table intervention (
	idinter int(3) not null auto_increment,
	materiel varchar(50),
	prix float,
	dateinter date,
	idclient int(3) not null,
	idtechnicien int(3) not null,
	primary key(idinter),
	foreign key(idclient) references client(idpers),
	foreign key(idtechnicien) references technicien(idpers)
	);


delimiter $
create procedure insertClient (IN p_nom varchar(50), IN p_prenom varchar(50), IN p_email varchar(50), IN p_mdp varchar(50), IN p_adresse varchar(50))
Begin
	declare p_idPers int(3);
	insert into personne values (null, p_nom, p_prenom, p_email, p_mdp);
	select idpers into p_idPers from personne
	where email = p_email;
	insert into client values (p_idPers, p_adresse);
End $
delimiter ;

delimiter $
create procedure insertTechnicien (IN p_nom varchar(50), IN p_prenom varchar(50), IN p_email varchar(50), IN p_mdp varchar(50), IN p_qualification varchar(50))
Begin
	declare p_idPers int(3);
	insert into personne values (null, p_nom, p_prenom, p_email, p_mdp);
	select idpers into p_idPers from personne
	where email = p_email;
	insert into technicien values (p_idPers, p_qualification);
End $
delimiter ;