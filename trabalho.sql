create table funcionarios(
	id varchar(13) not null primary key,
	nome varchar(255) not null,
	cpf varchar(11) not null unique,
	email varchar(255) not null unique,
	telefones text[] not null,
	data_nascimento date not null,
	logradouro varchar(255) not null,
	numero integer null,
	complemento varchar(255) null,
	uf varchar(2) not null,
	cargo varchar(100) not null,
	salario numeric(8, 2) not null,
	data_contratacao date not null,
	escala text[] not null,
	codigo varchar(10) not null unique,
	senha varchar(10) not null,
	perfis_acesso text[] null
);

create table candidatos(
	id varchar(13) not null primary key,
	nome varchar(255) not null,
	cpf varchar(11) not null unique,
	email varchar(255) not null unique,
	telefones text[] not null,
	data_nascimento date not null,
	logradouro varchar(255) not null,
	numero integer null,
	complemento varchar(255) null,
	uf varchar(2) not null,
	codigo varchar(10) not null unique,
	senha varchar(10) not null,
	perfis_acesso text[] null
);

create table processos_seletivos(
	id varchar(13) not null primary key,
	descricao text not null,
	data_criacao date not null,
	status varchar(50) not null,
	id_responsavel varchar(13) not null,
	constraint fk_processo_seletivo_responsavel foreign key (id_responsavel) references funcionarios (id)
);

create table candidaturas(
	id varchar(13) not null primary key,
	data_criacao date not null,
	status varchar(50) not null,
	curriculo text not null,
	id_candidato varchar(13) not null,
	id_processo_seletivo varchar(13) not null,
	constraint fk_candidatura_candidato foreign key (id_candidato) references candidatos (id),
	constraint fk_candidatura_processo_seletivo foreign key (id_processo_seletivo) references processos_seletivos (id)
);

create table agendas(
	id varchar(13) not null primary key,
	inicio timestamp not null,
	termino timestamp not null,
	descricao text null,
	cancelada boolean default false not null,
	id_organizador varchar(13) not null,
	constraint fk_agenda_organizador foreign key (id_organizador) references funcionarios (id)
);

create table liderados_liderancas(
	ativa boolean not null,
	id_liderado varchar(13) not null,
	id_lideranca varchar(13) not null,
	constraint fk_liderado_liderancas foreign key (id_liderado) references funcionarios (id),
	constraint fk_lideranca_liderados foreign key (id_lideranca) references funcionarios (id)
);

create table agendas_convidados(
	presente boolean null,
	nome varchar(255) not null,
	email varchar(255) not null,
	id_agenda varchar(13) not null,
	id_convidado varchar(13) not null,
	constraint fk_agenda_convidados foreign key (id_agenda) references agendas (id)
);