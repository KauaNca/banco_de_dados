/*
Criar um relatório para saber quem fez a venda:
Numero do Cupom -> venda
Qual o cliente -> venda
Qual o atendente -> pessoa
Valor total da venda 
*/
select 
id_venda,venda.id_cliente, pcl.nome AS nome_cliente,venda.id_atendente, pat.nome AS nome_atendente,total AS total_venda
from venda /*já consigo por aqui o número da venda, valor total da compra e os id de cliente e atendente, falta os nomes*/
INNER JOIN cliente on venda.id_cliente = cliente.id_cliente /*ligacao com cliente*/
INNER JOIN pessoa pcl on cliente.id_pessoa = pcl.id_pessoa /*utilizando a ligação cliente para puxar o nome na tabela pessoa*/
INNER JOIN atendente on atendente.id_atendente = venda.id_atendente /*ligacao com atendente*/
INNER JOIN pessoa pat on atendente.id_pessoa = pat.id_pessoa;/*nova ligacao com pessoa para conseguir o nome do atendente*/

/*
Criar um relatório que mostre os Itens Vendas:
Quantidade na venda -> item_venda x
Preço -> item_venda x
Valor Bruto -> item_venda x
Desconto -> item_venda x
Acréscimo -> item_venda x
Coluna Cancelado -> item_venda x
Nome do Cliente -> pessoa
Nome do Atendente -> pessoa
Qual o produto -> produto
Qual a categoria -> categoria x
Total da Venda -> venda X

*/

SELECT pcli.nome AS nome_cliente,pat.nome AS responsavel_venda, pro.descricao AS produto_vendido,c.descricao AS categoria_produto,cancelado AS produto_cancelado, IV.quantidade AS quantidade_produto,
IV.desconto,IV.acrescimo,IV.preco,IV.valor_bruto,IV.valor_total AS total_na_venda
FROM item_venda IV
INNER JOIN venda V on IV.id_venda = V.id_venda      /*ligacao com venda e assim tendo acesso aos id cliente,atendente e outras colunas de venda*/
INNER JOIN produto pro on pro.id_produto = IV.id_produto  /*ligacao com produto e assim conseguindo o id categoria*/
INNER JOIN categoria c on c.id_categoria = pro.id_categoria    /*utilizando a ligação anterior para pegar o nome da categoria*/
INNER JOIN atendente at on at.id_atendente = V.id_atendente   /* a partir daqui é o processo para pegar os nomes já utilizando a primeira ligação que é vendas*/
INNER JOIN pessoa pat on pat.id_pessoa = at.id_pessoa
INNER JOIN cliente cli on cli.id_cliente = V.id_cliente
INNER JOIN pessoa pcli on pcli.id_pessoa = cli.id_pessoa;


UPDATE produto SET quantidade_estoque = ABS(quantidade_estoque  - (SELECT SUM(quantidade) FROM item_venda WHERE id_produto = 1))  WHERE codigo  = 001;
UPDATE produto SET quantidade_estoque = ABS(quantidade_estoque  - (SELECT SUM(quantidade) FROM item_venda WHERE id_produto = 2))  WHERE codigo  = 002;


UPDATE item_venda SET cancelado = 'Sim' WHERE id_item_venda = 6 and id_produto = 6; /*alterando a coluna cancelado para sim do id_item_venda = 6*/
UPDATE produto set quantidade_estoque = ABS(quantidade_estoque + (SELECT SUM(quantidade) FROM item_venda WHERE cancelado = 'Sim' and id_produto = 6 )) 
WHERE id_produto = 6 AND codigo = 006;  /*aumentando o estoque */




