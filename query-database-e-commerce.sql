-- Querys para o cenário de e-commerce --

-- Quantos produtos cada cliente comprou? --

SELECT Fname as cliente, SUM(Quantity) as 'quantidade de produtos comprados' from client, order_info, order_product where idClient = fk_client and idOrder = fk_order GROUP BY Fname ORDER BY SUM(Quantity);

-- Quais produtos tiveram mais que duas compras? --

SELECT Pname as produto, SUM(Quantity) as 'quantidade vendida'  from product INNER JOIN order_product where idProduct = fk_product GROUP BY Pname HAVING SUM(Quantity) > 2 ORDER BY SUM(Quantity);

-- Relação Produto/Vendedor/Fornecedor --

SELECT Pname as produto, seller.Trade_name as vendedor, supplier.Trade_name as fornecedor from product_supplier INNER JOIN product_seller USING (fk_Product) INNER JOIN supplier ON idSupplier = fk_supplier INNER JOIN seller ON idSeller = fk_seller INNER JOIN Product ON fk_product = idProduct