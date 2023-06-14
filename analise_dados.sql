O dataset está disponível em : https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

-- Categorias com maior número de produtos cadastrados-
SELECT top 10
[product_category_name] AS " Categoria de produtos ",
COUNT(*) AS "Total Produtos"
FROM [dbo].[TB_OLIST_PRODUCTS]
GROUP BY product_category_name
ORDER BY COUNT(*) DESC
  

-- Categorias com menor número de produtos cadastrados--
SELECT top 10
[product_category_name] AS " Categoria de produtos ", COUNT(*) AS "Total Produtos" FROM [dbo].[TB_OLIST_PRODUCTS]
GROUP BY product_category_name
ORDER BY COUNT(*) ASC
  

-- Valor Total Pago por forma de pagamento--
SELECT DISTINCT["payment_type"] AS "Forma de pagamento" , ROUND(SUM(["payment_value"]),2) AS "Total vendido"
FROM TB_OLIST_ORDER_PAYMENTS
GROUP BY ["payment_type"]
ORDER BY 2 DESC
  

-- Pedidos totalizados por forma de pagamento--
SELECT DISTINCT["payment_type"] AS "Forma de pagamento", count(["payment_installments"]) AS " Total de Pedidos"
FROM
TB_OLIST_ORDER_PAYMENTS
GROUP BY ["payment_type"]
ORDER BY " Total de Pedidos" DESC



-- Quantidade de Clientes agrupados por Estado --
SELECT COUNT([customer_id]) AS PedidosAgrpCid, customer_city AS Cidade FROM [TB_OLIST_CUSTOMER]
GROUP BY customer_city
ORDER BY PedidosAgrpCid DESC;



-- Categorias com  mais vendas--
SELECT top 10
[product_category_name] AS " Categoria de produtos ", COUNT(*) AS "Total Produtos" FROM [dbo].[TB_OLIST_PRODUCTS]
GROUP BY product_category_name
ORDER BY COUNT(*) DESC


  
-- Categorias que menos vendem --
SELECT top 10
[product_category_name] AS " Categoria de produtos ", COUNT(*) AS "Total Produtos" FROM [dbo].[TB_OLIST_PRODUCTS]
GROUP BY product_category_name
ORDER BY COUNT(*) ASC



  -- Quantidades de vendedores por Estado da Federação--
select count (seller_id) as "Total Vendedores", seller_state
from [dbo].[TB_OLIST_SELLERS]
group by seller_state
order by [Total Vendedores]


--Estudo sobre quantidade de fotos por anúncio de 0-5 fotos--

SELECT COUNT(product_photos_qty) AS "Sem fotos",(SELECT COUNT(product_photos_qty) FROM dbo.TB_OLIST_PRODUCTS
WHERE product_photos_qty = 1) AS "1 Foto",(SELECT COUNT(product_photos_qty) FROM dbo.TB_OLIST_PRODUCTS
WHERE product_photos_qty = 2) AS "2 Fotos",(SELECT COUNT(product_photos_qty) FROM dbo.TB_OLIST_PRODUCTS
WHERE product_photos_qty = 3) AS "3 Fotos",(SELECT COUNT(product_photos_qty) FROM dbo.TB_OLIST_PRODUCTS
WHERE product_photos_qty = 4) AS "4 Fotos",(SELECT COUNT(product_photos_qty) FROM dbo.TB_OLIST_PRODUCTS
WHERE product_photos_qty >= 5) AS "5 Fotos ou mais" FROM dbo.TB_OLIST_PRODUCTS
WHERE product_photos_qty = 0


