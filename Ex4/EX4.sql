CREATE TABLE projetos (
    id_projeto SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim_prevista DATE,
    status VARCHAR(20) NOT NULL,

    CHECK (status IN ('planejando', 'em andamento', 'concluido', 'cancelado'))
);

CREATE TABLE equipes (
    id_equipe SERIAL PRIMARY KEY,
    nome_equipe VARCHAR(150) NOT NULL,
    id_projeto INT NOT NULL,

    FOREIGN KEY (id_projeto)
        REFERENCES projetos(id_projeto)
);

CREATE TABLE tarefas (
    id_tarefa SERIAL PRIMARY KEY,
    nome_tarefa VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim_prevista DATE,
    status VARCHAR(20) NOT NULL,
    prioridade VARCHAR(10) NOT NULL,
    id_projeto INT NOT NULL,

    FOREIGN KEY (id_projeto)
        REFERENCES projetos(id_projeto),

    CHECK (status IN ('a fazer', 'em progresso', 'concluida', 'bloqueada')),
    CHECK (prioridade IN ('baixa', 'media', 'alta'))
);

CREATE TABLE colaboradores (
    id_colaborador SERIAL PRIMARY KEY,
    matricula VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cargo VARCHAR(30) NOT NULL,

    CHECK (cargo IN ('Desenvolvedor', 'QA', 'Gerente de Projeto'))
);

CREATE TABLE atribuicoes_tarefas (
    id_atribuicao SERIAL PRIMARY KEY,
    id_tarefa INT NOT NULL,
    id_colaborador INT NOT NULL,
    data_atribuicao TIMESTAMP NOT NULL,

    FOREIGN KEY (id_tarefa)
        REFERENCES tarefas(id_tarefa),

    FOREIGN KEY (id_colaborador)
        REFERENCES colaboradores(id_colaborador),

    UNIQUE (id_tarefa, id_colaborador)
);