DROP TABLE IF EXISTS lojas;

CREATE TABLE lojas (
  codLoja varchar(10) NOT NULL,
  cidade varchar(50) NOT NULL,
  telefone varchar(50) NOT NULL,
  enderecoLinha1 varchar(50) NOT NULL,
  enderecoLinha2 varchar(50) DEFAULT NULL,
  estado varchar(50) DEFAULT NULL,
  pais varchar(50) NOT NULL,
  CEP varchar(15) NOT NULL,
  territorio varchar(10) NOT NULL,
  PRIMARY KEY (codLoja)
);

DROP TABLE IF EXISTS linhasProduto;

CREATE TABLE linhasProduto (
  linhaProduto varchar(50) NOT NULL,
  descricao varchar(4000) DEFAULT NULL,
  descricaoHTML text,
  imagem text,
  PRIMARY KEY (linhaProduto)
);

DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
  codProduto varchar(15) NOT NULL,
  nomeProduto varchar(70) NOT NULL,
  linhaProduto varchar(50) REFERENCES linhasProduto (linhaProduto),
  escalaProduto varchar(10) NOT NULL,
  representanteProduto varchar(50) NOT NULL,
  descricaoProduto text NOT NULL,
  qtdEstoque smallint NOT NULL,
  precoCompra decimal(10,2) NOT NULL,
  precoSugerido decimal(10,2) NOT NULL,
  PRIMARY KEY (codProduto)
);

DROP TABLE IF EXISTS funcionarios;

CREATE TABLE funcionarios (
  numFuncionario int NOT NULL,
  sobrenome varchar(50) NOT NULL,
  nome varchar(50) NOT NULL,
  extensao varchar(10) NOT NULL,
  email varchar(100) NOT NULL,
  codLoja varchar(10) NOT NULL REFERENCES lojas (codLoja),
  reportaA int DEFAULT NULL REFERENCES funcionarios (numFuncionario),
  cargo varchar(50) NOT NULL,
  PRIMARY KEY (numFuncionario)
);

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
  numCliente int NOT NULL,
  nomeCliente varchar(50) NOT NULL,
  sobrenomeContato varchar(50) NOT NULL,
  nomeContato varchar(50) NOT NULL,
  telefone varchar(50) NOT NULL,
  enderecoLinha1 varchar(50) NOT NULL,
  enderecoLinha2 varchar(50) DEFAULT NULL,
  cidade varchar(50) NOT NULL,
  estado varchar(50) DEFAULT NULL,
  CEP varchar(15) DEFAULT NULL,
  pais varchar(50) NOT NULL,
  numFuncionarioReprVendas int DEFAULT NULL REFERENCES funcionarios (numFuncionario),
  limiteCredito decimal DEFAULT NULL,
  PRIMARY KEY (numCliente)
);

DROP TABLE IF EXISTS pagamentos;

CREATE TABLE pagamentos (
  numCliente int NOT NULL REFERENCES clientes (numCliente),
  codTransacao varchar(50) NOT NULL,
  dataPagamento date NOT NULL,
  valor decimal(10,2) NOT NULL,
  PRIMARY KEY (numCliente,codTransacao)
);

DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
  numPedido int NOT NULL,
  dataPedido date NOT NULL,
  dataPrevista date NOT NULL,
  dataEnvio date DEFAULT NULL,
  status varchar(15) NOT NULL,
  comentarios text,
  numCliente int NOT NULL REFERENCES clientes (numCliente),
  PRIMARY KEY (numPedido)
);

DROP TABLE IF EXISTS detalhesPedidos;

CREATE TABLE detalhesPedidos (
  numPedido int NOT NULL REFERENCES pedidos (numPedido),
  codProduto varchar(15) NOT NULL REFERENCES produtos (codProduto),
  quantidadePedida int NOT NULL,
  precoUnitario decimal(10,2) NOT NULL,
  numLinhaPedido smallint NOT NULL,
  PRIMARY KEY (numPedido,codProduto)
);



