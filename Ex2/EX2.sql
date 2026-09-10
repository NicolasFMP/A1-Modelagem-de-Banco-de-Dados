CREATE TABLE veiculos (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    capacidade_carga_kg FLOAT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,

    CHECK (tipo IN ('carro', 'moto', 'van')),
    CHECK (status IN ('disponivel', 'em manutencao', 'em rota')),
    CHECK (capacidade_carga_kg > 0)
);

CREATE TABLE motoristas (
    id_motorista SERIAL PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    nascimento DATE NOT NULL,
    cnh VARCHAR(30) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    id_veiculo_atual INT UNIQUE,

    FOREIGN KEY (id_veiculo_atual)
        REFERENCES veiculos(id_veiculo)
);

CREATE TABLE entregas (
    id_entrega SERIAL PRIMARY KEY,
    data_hora_pedido TIMESTAMP NOT NULL,
    endereco_coleta VARCHAR(255) NOT NULL,
    endereco_entrega VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    id_motorista INT NOT NULL,

    FOREIGN KEY (id_motorista)
        REFERENCES motoristas(id_motorista),

    CHECK (status IN ('pendente', 'em rota', 'entregue', 'cancelada')),
    CHECK (valor >= 0)
);

CREATE TABLE itens_entrega (
    id_item SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    peso_kg FLOAT NOT NULL,
    id_entrega INT NOT NULL,

    FOREIGN KEY (id_entrega)
        REFERENCES entregas(id_entrega),

    CHECK (quantidade > 0),
    CHECK (peso_kg > 0)
);