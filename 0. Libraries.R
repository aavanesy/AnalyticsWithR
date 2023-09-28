# 1. SETTINGS

rm(list = ls(),envir = .GlobalEnv)
options(scipen = 999); options(digits = 10)
# dev.off()

# LIBRARIES 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse); 
library(compare); library(RColorBrewer);
library(lubridate); library(xts);
library(openxlsx); library(stringi); library(grid);
library(ggplot2); library(ggrepel); library(gridExtra);
library(splines); library(YieldCurve); library(showtext)

## Static Colors
colors_list <- list()
colors_list$blue = c('#000078', '#003CB4', '#008CD2', '#82BEF5')
colors_list$green = c('#28CD78', '#9BDC8C')
colors_list$grey = c('#FFFFFF')
colors_list$purple = c('#00BEC8', '#C396FF', '#8C50C8')
colors_list$red = c('#FF9B9B')