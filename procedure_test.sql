-- Programa: procedure_test.sql
-- Objetivo: aprendizado
-- Programador: Cleiton Lima
-- Data de criação: 06/03/2018

CREATE OR REPLACE FUNCTION procedure_test(float) RETURNS  SETOF type_livro AS $$
DECLARE

	 -- parametro autenticacao aplicativo e log
    _percentual ALIAS FOR $1;
    
    

	-- Linhas tipo registro
    linha_local RECORD;
    linha_retorno type_livro;

BEGIN
	

	FOR linha_local IN SELECT autor, titulo, ano_lanc, quantidade, preco_custo FROM 
         livros
     
      LOOP
             linha_retorno.result:= 0;
             linha_retorno.autor:=linha_local.autor;
             linha_retorno.titulo:=linha_local.titulo;
             linha_retorno.ano_lanc:=linha_local.ano_lanc;
             linha_retorno.quantidade:=linha_local.quantidade;
             linha_retorno.preco_custo:=linha_local.preco_custo;
             linha_retorno.preco_venda:=(linha_local.preco_custo*(_percentual/100))+linha_local.preco_custo;

             RETURN NEXT linha_retorno;
       END LOOP;

END;
$$ LANGUAGE 'plpgsql';


