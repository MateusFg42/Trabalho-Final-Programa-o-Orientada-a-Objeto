Create  database AA;
use AA;

Create table Fornecedor(
codFornecedor int NOT NULL AUTO_INCREMENT,
nome varchar(255) NOT NULL,
telefone varchar(255) NULL,
email varchar(255) NULL,
dataCad DATE NOT NULL,
cnpj varchar(255) NOT NULL,
nomeContato varchar(255) NOT NULL,
PRIMARY KEY(codFornecedor)
);

Create table Vendedor(
codVendedor int NOT NULL AUTO_INCREMENT,
nome varchar(255) NOT NULL,
telefone varchar(255) NULL,
email varchar(255) NULL,
dataCad DATE NOT NULL,
cpf varchar(255) NOT NULL,
metaMensal double NOT NULL,
PRIMARY KEY(codVendedor)
);

Create table Cliente(
codCliente int NOT NULL AUTO_INCREMENT,
nome varchar(255) NOT NULL,
telefone varchar(255) NULL,
email varchar(255) NULL,
dataCad DATE NOT NULL,
cpf varchar(255) NOT NULL,
limiteCredito double NOT NULL,
PRIMARY KEY(codCliente)
);

Create table Produto(
codProduto int NOT NULL AUTO_INCREMENT,
nome varchar(255) NOT NULL,
precoUnitario double NOT NULL,
estoque int NULL,
estoqueMinimo int NULL,
dataCad DATE NOT NULL,
PRIMARY KEY(codProduto)
);

Create table formaPagamento(
codFormaPagamento int NOT NULL AUTO_INCREMENT,
nome varchar(255) NOT NULL,
PRIMARY KEY(codFormaPagamento)
);
insert into formaPagamento values(null, 'á Vista');
insert into formaPagamento values(null, 'Pagto a prazo cheque pré-datado');


Create table Venda(
numVenda int NOT NULL AUTO_INCREMENT,
dataVenda DATE NOT NULL,
codVendedor int NOT NULL,
codCliente int NOT NULL,
codFormaPagamento int NOT NULL,
PRIMARY KEY(numVenda),
FOREIGN KEY(codVendedor) REFERENCES Vendedor(codVendedor),
FOREIGN KEY(codCliente) REFERENCES Cliente(codCliente),
FOREIGN KEY(codFormaPagamento) REFERENCES formaPagamento(codFormaPagamento)
);

Create table Compra(
numCompra int NOT NULL AUTO_INCREMENT,
dataCompra DATE NOT NULL,
codFornecedor int NOT NULL,
PRIMARY KEY(numCompra),
FOREIGN KEY(codFornecedor) REFERENCES Fornecedor(codFornecedor)
);

Create table itemCompra(
codItemCompra int NOT NULL AUTO_INCREMENT,
quantCompra int NOT NULL,
valorUnitario double NOT NULL,
numCompra int NOT NULL,
codProduto int NOT NULL,
PRIMARY KEY(codItemCompra),
FOREIGN KEY(numCompra) REFERENCES Compra(numCompra),
FOREIGN KEY(codProduto) REFERENCES Produto(codProduto)
);

Create table itemVenda(
codItemVenda int NOT NULL AUTO_INCREMENT,
quantVenda int NOT NULL,
valorVenda double NOT NULL,
numVenda int NOT NULL,
codProduto int NOT NULL,
PRIMARY KEY(codItemVenda),
FOREIGN KEY(numVenda) REFERENCES venda(numVenda),
FOREIGN KEY(codProduto) REFERENCES Produto(codProduto)
);

