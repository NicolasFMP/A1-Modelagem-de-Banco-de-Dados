CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_registro TIMESTAMP NOT NULL
);

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(100) NOT NULL,
    preco NUMERIC(10,2) NOT NULL,

    CHECK (preco >= 0)
);

CREATE TABLE avaliacoes (
    id_avaliacao SERIAL PRIMARY KEY,
    comentario TEXT,
    nota INT NOT NULL,
    data_avaliacao TIMESTAMP NOT NULL,
    id_usuario INT NOT NULL,
    id_produto INT NOT NULL,

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CHECK (nota BETWEEN 1 AND 5)
);

CREATE TABLE likes (
    id_like SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_avaliacao INT NOT NULL,
    data_curtida TIMESTAMP NOT NULL,

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_avaliacao)
        REFERENCES avaliacoes(id_avaliacao),

    UNIQUE (id_usuario, id_avaliacao)
);