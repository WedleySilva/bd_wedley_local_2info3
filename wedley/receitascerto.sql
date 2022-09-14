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

select nome, ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_nome, ds_uf_sigla
from logradouro, bairros, cidades, uf, cad_usuario
where 
bairros_cd_bairro = cd_bairro and 
cidade_cd_cidade = cd_cidade and 
uf_cd_uf = cd_uf and
log_cd_logradouro = cd_logradouro;
