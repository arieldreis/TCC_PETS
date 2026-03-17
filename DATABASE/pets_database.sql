-- Criação de conta do cliente
create table clientPets_account(
	id_clientAccount int auto_increment primary key,
	nome varchar(200),
	email varchar(250),
	senha varchar(70),
	cpf varchar(25), 
	localizacao point,
);
-- Ong's
create table pets_ongs(
	id_pets_ongs int auto_increment primary key,
	nome_ong varchar(150),
	chave_pix varchar(40),
	cnpj varchar(20),
	telefone varchar(30),
	WhatsApp varchar(20),
	rede_instagram varchar(50),
	senha varchar(60), -- Colocar a senha de no minímo de 60 caractéres. 
	localizacao point -- O valor point tem como função armazenar fotos. 
);
-- Denúncia de animais perdidos
create table animal_perdido_denuncia(
	id_denuncia int auto_increment primary key,
	tipo_animal enum("Cachorro", "Gato", "Passaro", "Ave", "Outros"),
	urgencia enum("Baixa", "Média", "Alta", "Crítica - Risco de vida");
	descricao text,
	latitude decimal(9, 6),
	longitude decimal(9, 6),
	cidade varchar(50),
	telefone varchar(30),
	foto bytea -- This kinda of data storage a photo.
);
-- Serviço de adoção
create table adocao(
	id_animal int auto_increment primary key,
	name_animal varchar(100),
	raca_animal varchar(),
	idade_animal enum("Filhote", "Jovem", "Adulto", "Idoso"),
	sexo enum("Macho", "Fêmea"),
	catastracao enum("Castrado", "Não-castrado"),
	vacinacao enum("Vacinado", "Não-vacinado"),
	porte varchar("Pequeno", "Médio", "Grande"),
	descricao text,
	estado varchar(150),
	telefone varchar(30),
	localizacao point,
);
-- Serviços oferecidos 
create table cuidador(
	id_cuidador int auto_increment primary key,
	cpf varchar(),
	senha varchar(),
	
);
create table passeador(
	id_passeador int auto_increment primary key,
	nome_passeador varchar(150),
	descricao text,
	estado varchar(100),
	categoria enum("Econômico", "Moderado", "Premium"),
	telefone varchar(30),
	senha varchar(),
	cpf varchar(),
);
create table hospedagem(
	id_hospedagem int auto_increment primary key,
	tempo_estadia -- Colocar o valor em dd/MM/YYYY
);
create table hotel_pet(
	id_hotelPet int auto_increment primary key,
	nome_hotel varchar(150),
	descricao text,
	categoria enum("Econômico", "Moderado", "Premium"),
	telefone varchar(30),
	cnpj varchar(20),
	senha varchar(60)
);
create table creche(
	id_creche int auto_increment primary key,
	cnpj varchar(20),
	senha varchar(60)
);
create table veterinario(
	id_veterinario int auto_increment primary key,
	nome_medico varchar(100)
	senha varchar(60),
);
create table petShop(
	id_petShop int auto_increment primary key,
	latitude decimal(9, 6)
	longitude decimal(9, 6)
	senha varchar(60),
);
create table adestrador(
	id_adestrador int auto_increment primary key,
	nome_adestrador varchar(100),
	senha varchar(60),
);
-- Outros dados