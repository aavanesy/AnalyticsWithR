credit_bonds_data <- bonds_data %>% 
  filter(Bloomberg_Name == 'CREDIT SUISSE S') %>% 
  mutate(across(YLD_YTM_MID:YLD_YTM_ASK, as.numeric)) %>% 
  mutate(Z_SPREAD = as.numeric(Z_SPREAD)/100) %>% 
  select(ISIN, YLD_YTM_BID, YLD_YTM_MID, YLD_YTM_ASK, AMT_ISSUED, Z_SPREAD)

View(credit_bonds_data)

credit_maturity_data <- maturity_data %>% 
  filter(ISIN %in% credit_bonds_data$ISIN) %>% 
  select(ISIN, Remaining_of_Maturity) %>% 
  arrange(Remaining_of_Maturity) %>% 
  left_join(credit_bonds_data)

View(credit_maturity_data)