O dataset está disponível em : https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

-- Categorias com maior número de produtos cadastrados-
SELECT top 10
[product_category_name] AS " Categoria de produtos ",
COUNT(*) AS "Total Produtos"
FROM [dbo].[TB_OLIST_PRODUCTS]
GROUP BY product_category_name
ORDER BY COUNT(*) DESC

