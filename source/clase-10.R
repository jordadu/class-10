#==========================================#
# Eduard F Martinez-Gonzalez
# Update: 18-04-2022
# R version 4.1.1 (2021-08-10)
#==========================================#

# initial configuration
rm(list=ls())
require(pacman) # llamar pacman

# llamar y/o instalar librerias
p_load(tidyverse,grid,png,
       viridis, # Paletas de colores
       sf, # Manipular datos espaciales
       leaflet, # Visualizar 
       raster) # get crs()

# 
getwd()
list.files(".")

#==============================#
# [1.] Introduccion a GIs en R #
#==============================#

# read shape
points = st_read("input/amenitys madrid.shp")
points
points %>% class() # get class

# plot points
leaflet() %>% 
addTiles() %>% 
addCircleMarkers(data = points , label = points$name)

# geometry
points %>% crs() # get CRS

points %>% st_crs() # get CRS

points %>% st_bbox() # get bbox

points %>% st_geometry() # get vertices

# attributes
points %>% colnames() # get column names

points$amenity %>% table() # frequency table

# add columns 
points = points %>% mutate(no_name = ifelse(is.na(name),1,0)) # add variable

points$no_name %>% table() # frequency table

points %>% head() # view

