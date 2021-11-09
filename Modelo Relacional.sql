CREATE TABLE DEPARTAMENTOS (
id INTEGER PRIMARY KEY,
nome VARCHAR(100),
qtde_func INTEGER
);

CREATE TABLE FUNICIONARIOS (
cpf VARCHAR(25),
nome VARCHAR(100),
vaga VARCHAR(200),
id_departamento INTEGER,
PRIMARY KEY(cpf, id_departamento),
FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTOS (id) 
);



CREATE TABLE FORNECEDORES (
cnpj VARCHAR (30) PRIMARY KEY,
nome_fantasia VARCHAR(100),
razao_social VARCHAR(45)
);

CREATE TABLE MARCAS (
id INTEGER PRIMARY KEY,
nome VARCHAR(100),
situacao CHAR(1)
);

CREATE TABLE CLIENTE (
cpf VARCHAR(25) PRIMARY KEY,
nome VARCHAR(100),
data_nascimento DATE
);

CREATE TABLE TIPO_PRODUTOS (
id INTEGER PRIMARY KEY,
descricao VARCHAR(100),
categoria VARCHAR(50)
);

CREATE TABLE PRODUTOS (
id_produto INTEGER,
nome VARCHAR(100),
cor VARCHAR(30),
quantidade INTEGER,
valor FLOAT,
tipo_produto INTEGER,
id_marca INTEGER,
FOREIGN KEY (tipo_produto) REFERENCES TIPO_PRODUTOS (id),  
FOREIGN KEY (id_marca) REFERENCES MARCAS (id),
PRIMARY KEY(id_produto, tipo_produto, id_marca)
);

CREATE TABLE TRANSPORTADORA (
cnpj VARCHAR(30) PRIMARY KEY,
nome_fantasia VARCHAR(100),
razao_social VARCHAR(45)
);

CREATE TABLE RESIDE_END_CLIENTE (
logradouro VARCHAR (100),
numero INTEGER,
cidade VARCHAR (100),
uf VARCHAR (2),
cep INTEGER,
cpf_cliente VARCHAR(25),
PRIMARY KEY (logradouro, cpf_cliente),
FOREIGN KEY (cpf_cliente) REFERENCES CLIENTE (cpf) ON DELETE CASCADE
);

CREATE TABLE ENDERECO_FORNECEDOR (
logradouro VARCHAR (100),
numero INTEGER,
cidade VARCHAR (100),
uf VARCHAR (2),
cep INTEGER,
cnpj_forne VARCHAR(30),
PRIMARY KEY (logradouro, cnpj_forne),
FOREIGN KEY (cnpj_forne) REFERENCES FORNECEDORES (cnpj) ON DELETE CASCADE
);



CREATE TABLE FORNE_PRODUTOS (
cnpj_forne VARCHAR(30),
id_produto INTEGER,
FOREIGN KEY (cnpj_forne) REFERENCES FORNECEDORES (cnpj),
FOREIGN KEY (id_produto) REFERENCES PRODUTOS (id_produto),
PRIMARY KEY (cnpj_forne, id_produto)
);

CREATE TABLE ENTREGA (
cnpj_trans VARCHAR(30),
id_produto INTEGER,
cpf_cliente VARCHAR(25),
data_entrega DATE,
data_envio DATE,
FOREIGN KEY (cnpj_trans) REFERENCES TRANSPORTADORA (cnpj),
FOREIGN KEY (id_produto) REFERENCES PRODUTOS (id_produto),
FOREIGN KEY (cpf_cliente) REFERENCES CLIENTE (cpf),
PRIMARY KEY (cnpj_trans, id_produto, cpf_cliente)
);

CREATE TABLE COMPRA (
id_produto INTEGER,
cpf_cliente VARCHAR(25),
data_compra DATE,
FOREIGN KEY (id_produto) REFERENCES PRODUTOS (id_produto),
FOREIGN KEY (cpf_cliente) REFERENCES CLIENTE (cpf),
PRIMARY KEY (id_produto, cpf_cliente)
);

