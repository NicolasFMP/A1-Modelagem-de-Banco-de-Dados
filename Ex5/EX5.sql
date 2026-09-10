CREATE TABLE restaurantes (
    id_restaurante SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    tipo_culinaria VARCHAR(100)
);

CREATE TABLE mesas (
    id_mesa SERIAL PRIMARY KEY,
    numero_mesa INT NOT NULL,
    capacidade INT NOT NULL,
    id_restaurante INT NOT NULL,

    FOREIGN KEY (id_restaurante)
        REFERENCES restaurantes(id_restaurante),

    UNIQUE (id_restaurante, numero_mesa),

    CHECK (capacidade > 0)
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    numero_pessoas INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    id_mesa INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_mesa)
        REFERENCES mesas(id_mesa),

    UNIQUE (id_mesa, data_hora),

    CHECK (numero_pessoas > 0),
    CHECK (status IN ('confirmada', 'cancelada', 'concluida'))
);