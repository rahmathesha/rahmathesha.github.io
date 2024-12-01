library(dplyr)
man_3 %>% group_by(brand) %>% 
  group_by(brand, item_price) %>% 
  summarise(quantity = sum(quantity)) %>% 
  arrange()

man_3 %>% group_by(brand) %>% 
  summarise(total_quantity = sum(quantity), 
            item_price = sum(item_price))

beli_1 <- raw_data %>% filter(order_date >= "2019-10-1" & order_date < "2019-11-1")
dim(beli_1)
beli_2 <- raw_data %>% filter(order_date >= "2019-11-1" & order_date <= "2019-12-31")
dim(beli_2)

dt <- data.frame(kategori = c("A", "B", "C", "D", "E"), 
                    nilai = c(23, 17, 35, 29, 12) ) 

dt %>% 
  ggplot(aes(x= kategori, y= nilai)) +
  geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
  coord_flip() +
  xlab("") +
  theme_classic()

man.4 <- "SELECT 
    brand, 
    SUM(quantity) AS quantity, 
    SUM(item_price) AS item_price
FROM 
    man.3
GROUP BY 
    brand
ORDER BY 
    quantity DESC"

show_dplyr(man.4)

man4 %>% 
  dbplyr::tbl_memdb() %>% 
  mutate(totat_price = quantity * item_price) %>% 
  show_query()

pembelian %>% 
  dbplyr::tbl_memdb() %>% 
  filter(order_date >= "2019-10-1" & order_date < "2019-11-1") %>% 
  show_query()
