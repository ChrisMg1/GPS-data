library ("data.table")
#library(stringr)
#library(plotly)
#library(ggplot2)
#library(scatterplot3d)
#library(scatterD3)
#library("car")
#library("rgl")
#library(plotrix)
#library(MASS)
#library(lattice)
#library(ffbase)
#library(ff)
# library(rworldmap)
library( leaflet )
library( magrittr )
library(dplyr)



#load packages
library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)




in_file <- 'C:\\Users\\c.maget\\Downloads\\DE_BAYERN_2018_09.csv'

# readLines(in_file, n=10)


adac_mat <- fread(in_file, header = TRUE)


# head(adac_mat)
# length(unique(adac_mat$assetId)) # 1435472 unique elements





