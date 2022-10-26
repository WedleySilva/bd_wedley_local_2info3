-- Introdução MySql--


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


select * from logradouro;

						-- Exercicios Aula --

-- Exercicio 1 --


select nome, email, tel, cod_pedido, dtped, qtditem, descricao, preco_unit  
from cad_usuario, pedidos, itemped, produto
where
cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
produto.cod_produto = itemped.prod_cod_produto and
cad_usuario.cpf = 98736485912;


-- Exercicio 2 --


select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome 
from logradouro, bairros,cidades,tipo_logradouro
where
logradouro.bairros_cd_bairro = bairros.cd_bairro and
bairros.cidade_cd_cidade = cidades.cd_cidade and
logradouro.log_cd_tip_log = tipo_logradouro.cd_tipo_logradouro and
tipo_logradouro.desc_tip_log = 'praça' and
cidades.ds_cidade_nome = 'joinville';


-- Exercicio 3 --


select cod_pedido,cad_usuario_cpf,dtped, faturado, naofaturado, dtentrega, qtditem, descricao, preco_unit
from itemped, produto, pedidos
where
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
produto.preco_unit >= 1.20 and
produto.preco_unit <= 8.00;


		-- Utilizando operadores de aritimetica, logicos, comparação, update--


select * from produto;

select descricao, preco_unit, preco_emb, qtd_emb, 
preco_unit * qtd_emb preco_embalagem from produto;

select  cod_produto, descricao, preco_unit, preco_emb, qtd_emb, 
preco_unit * qtd_emb preco_embalagem from produto where cod_produto = 22;

update produto set preco_emb = preco_unit * qtd_emb;

update produto set preco_emb = preco_unit * qtd_emb
where preco_emb <> preco_unit * qtd_emb;


		-- Exercicios dia 05/10 --
        
-- Atividade 1 - Cruc que retorne: descricao, preco_unit acrescido de R$ 0.75 --

select descricao, preco_unit + 0.75 from produto; 

-- Atividade 2 - Cruc que retorne: descricao, preco_unit, preco_emb, dos produtos com qtd_emb menor igual a 12 --

select descricao, preco_unit, preco_emb from produto where qtd_emb <= 12;

-- Atividade 3 - Cruc que retorne descricao, preco_unit e preco_unit acrescido de 0.5% --

select descricao, preco_unit, preco_unit, ((preco_unit + preco_unit / 100) * 0.5) as preco_somado from produto;

		-- Conteúdo dia 19/10 --

 -- Funções de Agregação --

-- max( ) --

select * from produto;

select max(preco_unit) from produto;

-- min( ) --

select min(preco_unit) from produto;

-- avg( ) --

select avg(preco_unit) from produto;

-- count( ) --

select count(cod_produto) from produto;

-- sum( ) --

select sum(preco_unit) from produto;

-- group by --

select descricao_tipo as Tipo_Usuario, count(tipuser_cd) numero
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user
group by descricao_tipo;

-- order by --

select descricao_tipo as Tipo_Usuario, count(tipuser_cd) numero -- "as" é um metodo de segurança para executar a ação em versões mais antigas -- 
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user
group by descricao_tipo order by numero;

-- round( , ) --

select round(avg(preco_unit),2) from produto;

-- Consulta aninhada ou subconsulta --

select descricao from produto
where preco_unit = (select min(preco_unit) from produto);

-- Buscar o a descrição do produto pelo preço desejado --

select descricao from produto
where preco_unit = 60.00;

-- Buscar o a descrição do produto pelo maior preço via subconsulta --

select descricao from produto
where preco_unit = (select max(preco_unit) from produto);

-- Buscar o a descrição do produto pelo menor preço via subconsulta --

select descricao from produto
where preco_unit = (select min(preco_unit) from produto);

-- Quantos usuários existem? --

select count(cpf) from cad_usuario;

select nome, descricao_tipo
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user;

-- Quantos usuários existem de cada tipo? --

select descricao_tipo, count(tipuser_cd) codigo_tipo -- "codigo_tipo" é um apelido necessário para executar a ação --
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user
group by descricao_tipo; -- "descricao_tipo" é o parâmetro de agrupamento, que no caso é um atributo --

-- Ordenando os grupos por um parâmetro --

select descricao_tipo as Tipo_Usuario, count(tipuser_cd) codigo_tipo 
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user
group by descricao_tipo order by descricao_tipo desc; -- "asc" e "desc" são maneiras de ordenar e "descricao_tipo" pode ser alterado por outro atributo ou numero, letra... --

-- Usando round para organizar a posição e arredondar--

select round(avg(preco_unit),2) from produto; -- o valor "2" pode ser trocado por outros números, incluindo o "0" --

-- Exercícios dia 19/10 🍷️🗿️ --

-- Atividade 1 - CRUC que retorne: nome dos usuários e a quantidade de pedidos realizados por cada usuário --

select nome, count(cad_usuario_cpf)
from cad_usuario, pedidos 
where cad_usuario.cpf = pedidos.cad_usuario_cpf group by nome;                  

-- Atividade 2 - CRUC que retorne: nome do usuário e o valor total do pedido, filtrando por um código de pedido válido --

select nome, sum(preco_unit * qtditem  )
from cad_usuario, pedidos, produto, itemped
where cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido - itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
pedidos.cod_pedido =4  group by nome;

-- Tirando a prova real da Atividade 2 --

Select * from pedidos;
select * from cad_usuario where cpf = '63748762435';
select * from itemped where ped_codpedidos =4;
select * from produto where cod_produto in(4,11);

-- Atividade 3 - CRUC que retorne: a quantidade de logradouros filtrando pela sigla do estado -- 

select ds_uf_sigla, count(cd_logradouro)
from logradouro, cidades, uf, bairros
where logradouro.bairros_cd_bairro = bairros_cd_bairro and
bairros.cidade_cd_cidade = cidade_cd_cidade and
cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;

-- Atividade 4 - CRUC que retorne: a quantidade de bairros agrupando pela sigla do estado --select ds_uf_sigla, count(cd_logradouro)
select ds_uf_sigla, count(cd_bairro)
from cidades, uf, bairros
where bairros.cidade_cd_cidade = cidade_cd_cidade and
cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;

-- Atividade 5 - CRUC que retorne: preço total dos pedidos agrupando pelo código dos pedidos-- 


-- Exercícios dia 26/10 --

-- Atividade 1 - CRUC que retorne: descrição do produto e a quantidade de vezes que ele foi comprado, agrupando pela descrição do produto -- 

-- Atividade 2 - CRUC que retorne: quantidade de pedidos agrupando pela sigla da UF --

-- Atividade 3 - CRUC que retorne: quantidade de pedidos agrupando pela sigla da UF -- 
