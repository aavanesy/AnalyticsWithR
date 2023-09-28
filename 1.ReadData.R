
# DATA
wb <- loadWorkbook('xlsx_files/202301_RV_Selection_V7R.xlsx') 
names(wb)

maturity_data <- openxlsx::read.xlsx(wb, sheet = 'AAA-BBB Adjusted Rawdata')

str(maturity_data)

bonds_data <- openxlsx::read.xlsx(wb, sheet = paste0('9Jan23_Group'))

str(bonds_data)









