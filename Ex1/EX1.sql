CREATE TABLE instrutores (
	id_instrutor SERIAL PRIMARY KEY,
	nome VARCHAR(150),
	email VARCHAR(100) UNIQUE NOT NULL,
	biografia TEXT,
	especialidade VARCHAR(255)
);

CREATE TABLE cursos (
	id_curso SERIAL PRIMARY KEY,
	titulo VARCHAR(255) NOT NULL,
	descricao TEXT,
	preco NUMERIC(10,2) NOT NULL,
	nivel VARCHAR(20) NOT NULL,
	id_instrutor INT NOT NULL,
	
	FOREIGN KEY (id_instrutor)
		REFERENCES instrutores(id_instrutor)
);

CREATE TABLE aulas (
	id_aula SERIAL PRIMARY KEY,
	titulo VARCHAR(255),
	descricao TEXT,
	link_video VARCHAR(255) NOT NULL,
	duracao INT,
	id_curso INT NOT NULL,
	
	FOREIGN KEY (id_curso)
		REFERENCES cursos(id_curso)
);

CREATE TABLE alunos (
	id_aluno SERIAL PRIMARY KEY,
	nome VARCHAR(150) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	nascimento DATE NOT NULL,
	rua VARCHAR(255),
	cidade VARCHAR(255),
	estado VARCHAR(100),
	cep VARCHAR(20)
);

CREATE TABLE matriculas (
	id_matricula SERIAL PRIMARY KEY,
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	data_matricula TIMESTAMP NOT NULL,

	FOREIGN KEY (id_aluno)
		REFERENCES alunos(id_aluno),

	FOREIGN KEY (id_curso)
		REFERENCES cursos(id_curso),

	UNIQUE (id_aluno, id_curso)
);

CREATE TABLE progresso (
	id_progresso SERIAL PRIMARY KEY,
	id_aluno INT NOT NULL,
	id_aula INT NOT NULL,
	data_conclusao TIMESTAMP NOT NULL,

	FOREIGN KEY (id_aluno)
		REFERENCES alunos(id_aluno),
		
	FOREIGN KEY (id_aula)
		REFERENCES aulas(id_aula),

	UNIQUE (id_aluno, id_aula)
);
