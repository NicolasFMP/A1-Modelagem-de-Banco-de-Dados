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
	duracao INTERVAL,
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

INSERT INTO instrutores (nome, email, biografia, especialidade)
VALUES ('Nicolas', 'nicolas@email.com', 'instrutor bem legal', 'linguagem C'),
('Vitoria', 'vitoria@email.com', 'instrutora', 'linguagem python');

INSERT INTO cursos (titulo, descricao, preco, nivel, id_instrutor)
VALUES ('Matematica', 'Aula de matematica', 500.00, 'medio', 1),
('Física', 'Aula de física', 700.00, 'alto', 2),
('PostgreSQL', 'Aula de PostgreSQL', 450.00, 'medio', 1);

INSERT INTO aulas (titulo, descricao, link_video, duracao, id_curso)
VALUES ('Aula 1 Matematica', 'Primeira aula de matematica', 'www.aula.com.br','02:30:00', 1),
('Aula 2 Matematica', 'Segunda aula de matematica', 'www.aula.com.br','02:00:00', 1),
('Aula 1 Física', 'Primeira aula de física', 'www.aula.com.br','02:00:00', 2),
('Aula 2 Física', 'Segunda aula de física', 'www.aula.com.br','02:20:00', 2),
('Aula 1 PostgreSQL', 'Primeira aula de PostgreSQL', 'www.aula.com.br','03:00:00', 3),
('Aula 2 PostgreSQL', 'Segunda aula de PostgreSQL', 'www.aula.com.br','02:40:00', 3);

INSERT INTO alunos (nome, email, nascimento, rua, cidade, estado, cep)
VALUES ('Pedro', 'pedro@email.com', '2009-05-20', 'alameda', 'palhoca', 'SC', '85485-999'),
('Amanda', 'amanda@email.com', '2000-10-02', 'rua do limao', 'palhoca', 'SC', '67676-767'),
('Roberto', 'roberto@email.com', '1997-07-10', 'elza lucchi', 'palhoca', 'SC', '55555-555');

INSERT INTO matriculas (id_aluno, id_curso, data_matricula)
VALUES (1, 3, '2024-06-12 09:17:33'),
(1, 1, '2024-06-12 09:19:27'),
(2, 2, '2023-02-14 10:20:03'),
(3, 3, '2025-03-04 08:44:29');

INSERT INTO progresso (id_aluno, id_aula, data_conclusao)
VALUES (1, 5, '2024-07-18 10:30:00'),
(1, 1, '2024-07-20 14:20:00'),
(1, 2, '2024-07-22 16:45:00'),
(2, 3, '2023-03-10 09:30:00'),
(3, 5, '2025-03-15 11:00:00');
