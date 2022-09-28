select * from logradouro;

select * from logradouro where cep = "89233050";

select * from bairros where cd_bairro = 14054;

select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_nome, ds_uf_sigla
from logradouro, bairros, cidades, uf
where cep = "89245000" and
bairros_cd_bairro = cd_bairro and 
cidade_cd_cidade = cd_cidade and 
uf_cd_uf = cd_uf;

select * from cad_usuario;
select * from pedidos;

select nome, cod_pedido 
from cad_usuario, pedidos
where cad_usuario.cpf = pedidos.cad_usuario_cpf;

select nome, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos, itemped, produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto;

select nome, cpf, descricao_tipo, ds_logradouro_nome
from cad_usuario, tipo_usuario, logradouro
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user and
cad_usuario.log_cd_logradouro = logradouro.cd_logradouro;

select nome, cpf, descricao_tipo, ds_logradouro_nome
from cad_usuario, tipo_usuario, logradouro
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user and
cad_usuario.log_cd_logradouro = logradouro.cd_logradouro;
select nome, ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_nome, ds_uf_sigla
from logradouro, bairros, cidades, uf, cad_usuario
where bairros_cd_bairro = cd_bairro and 
cidade_cd_cidade = cd_cidade and 
uf_cd_uf = cd_uf and
log_cd_logradouro = cd_logradouro;

select * from pedidos;

select nome, cod_pedido 
from cad_usuario, pedidos
where cad_usuario.cpf = pedidos.cad_usuario_cpf;

select nome, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos, itemped, produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto;

select nome, cpf, descricao_tipo, ds_logradouro_nome
from cad_usuario, tipo_usuario, logradouro
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user and
cad_usuario.log_cd_logradouro = logradouro.cd_logradouro;

select nome, cpf, descricao_tipo, ds_logradouro_nome
from cad_usuario, tipo_usuario, logradouro
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user and
cad_usuario.log_cd_logradouro = logradouro.cd_logradouro;
