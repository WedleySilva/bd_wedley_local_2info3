-- Introdução MySql--

/*
select * from logradouro;

select * from logradouro where cep = "89209193";

select * from bairros where cd_bairro = "14047";

select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_nome, ds_uf_sigla
from logradouro, bairros, cidades, uf
where cep = "14045" and
bairros_cd_bairro = cd_bairro and 
cidade_cd_cidade = cd_cidade and
uf_cd_uf = cd_uf;

select * from cad_usuario;

select nome,ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_nome, ds_uf_sigla
from logradouro, bairros, cidades, uf, cad_usuario
where
bairros_cd_bairro = cd_bairro and 
cidade_cd_cidade = cd_cidade and
uf_cd_uf = cd_uf and
log_cd_logradouro = cd_logradouro;

select * from pedidos;

select cod_pedido, nome
from pedidos, cad_usuario
where
cad_usuario.cpf = pedidos.cad_usuario_cpf;

select * from cad_usuario;

select nome, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos, itemped, produto
where
cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto;

select nome, cpf, descricao_tipo, ds_logradouro_nome 
from cad_usuario, tipo_usuario, logradouro
where 
cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user and
cad_usuario.log_cd_logradouro = logradouro.cd_logradouro;
*/

select * from logradouro;

						-- Exercicios Aula --

-- Exercicio 1 --

/*
select nome, email, tel, cod_pedido, dtped, qtditem, descricao, preco_unit  
from cad_usuario, pedidos, itemped, produto
where
cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
produto.cod_produto = itemped.prod_cod_produto and
cad_usuario.cpf = 98736485912;
*/

-- Exercicio 2 --

/*
select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome 
from logradouro, bairros,cidades,tipo_logradouro
where
logradouro.bairros_cd_bairro = bairros.cd_bairro and
bairros.cidade_cd_cidade = cidades.cd_cidade and
logradouro.log_cd_tip_log = tipo_logradouro.cd_tipo_logradouro and
tipo_logradouro.desc_tip_log = 'praça' and
cidades.ds_cidade_nome = 'joinville';
*/

-- Exercicio 3 --

/*
select cod_pedido,cad_usuario_cpf,dtped, faturado, naofaturado, dtentrega, qtditem, descricao, preco_unit
from itemped, produto, pedidos
where
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
produto.preco_unit >= 1.20 and
produto.preco_unit <= 8.00;
*/

		-- Utilizando operadores de aritimetica, logicos, comparação, update--

/*
select * from produto;

select descricao, preco_unit, preco_emb, qtd_emb, 
preco_unit * qtd_emb preco_embalagem from produto;

select  cod_produto, descricao, preco_unit, preco_emb, qtd_emb, 
preco_unit * qtd_emb preco_embalagem from produto where cod_produto = 22;

update produto set preco_emb = preco_unit * qtd_emb where cod_produto = 22;

update produto set preco_emb = preco_unit * qtd_emb
where preco_emb <> preco_unit * qtd_emb;
*/
