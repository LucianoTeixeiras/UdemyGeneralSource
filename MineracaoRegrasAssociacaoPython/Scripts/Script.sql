SELECT prd.nome FROM mercado.venda_produtos vpr INNER JOIN mercado.produtos prd ON vpr.idproduto = prd.idproduto;