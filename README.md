# Stored Procedure

## Criação de funções com Stored Procedure usando Postgresql (PL/pgSQL)

* Instalar o Postgresql  
```$ sudo apt-get install postgresql ```

* Configurar o Postgresql
<p>Após a instalação do Postgresql, configure o login para ter acesso ao banco  </p>

```$ sudo su postgres ```

```$ psql ```

```=# ALTER USER postgres WITH PASSWORD 'sua_senha'; ```

```=# \q ```

* Criar o banco de dados
-- Faça login no postgres  

```$ sudo su postgres  ```

-- Crie o banco

```$ createdb -U seuUsuario nomeBanco  ```

-- Logue no banco

```$ psql -U seuUsuario nomeBanco  ```

<p> Crie as tabelas e os tipos.  </p>

```
CREATE TABLE livros 
(
  autor varchar(30),
  titulo varchar(30),
  ano_lanc integer,
  quantidade integer,
  preco_custo numeric(10, 2)
);
```
-- Criando o tipo

```
CREATE TYPE type_livro AS 
(
	result integer,
	autor varchar(255),
	titulo varchar(255),
	ano_lanc integer,
	quantidade integer,
	preco_custo numeric(10, 2),
	preco_venda numeric(10, 2)
);

```
-- Criando mais uma tabela

```
CREATE TABLE exemplo
(
  id integer,
  livro type_livro
);

```
* Crie a função procedure

* Execute a função

<p>Para executar a função, é aconselhável entrar no diretórios em que os arquivos estão
e fazer login no postgres a partir de lá. </p>

``` projeto@procedure:~$ psql -U usuarioBanco -h localhost nomeBanco ```

<p>Quando estiver logado, execute o seguinte:  </p>
 
 ```nomeBanco=# \i nomeFuncao.sql ```

