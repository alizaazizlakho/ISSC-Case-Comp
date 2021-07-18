library(tidyverse)

transport = read_csv('data/transport.csv') %>%
  rename(
    `Car, truck, or van` = Car..truck..or.van,
    `Public transit` = Public.tansit,
    `Other method` = Other.method
  )

transport_long = transport %>%
  pivot_longer(1:5, names_to = "mode", values_to = "percentage")

transport_long %>%
  ggplot(aes(
    x = fct_reorder(mode, desc(percentage)),
    y = percentage,
    fill = mode
  )) +
  geom_bar(stat = "identity") +
  labs(x = "Mode of transportation",
       y = "Percentage") +
  theme_minimal() +
  theme(legend.position = "none")
