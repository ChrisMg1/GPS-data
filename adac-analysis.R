


# split file by different cars ("assetIDs")
assets <- adac_mat %>%
  group_by(assetId)

assets_split <- group_split(assets, keep = TRUE)




length(assets_split) # 1435472 splits


# find tibble (assetID, Car) with maximum GPS-points

max_GPS<-c(0., 0., "f")
print(max_GPS)

for (n in 1:length(assets_split)){
  # print( nrow(assets_split[[n]]) )
  if (nrow(assets_split[[n]]) > max_GPS[1]) {
    max_GPS <- c(nrow( assets_split[[n]]), n, assets_split[[n]]$assetId[1] )
  }
  
  print(n)
  }

print(max_GPS)



# prepare for plot
asset.one <- adac_mat[adac_mat$assetId == "D1890F08"]
asset.one$lat = asset.one$latitude / 1000000
asset.one$lon = asset.one$longitude / 1000000

# head(asset.one)
# nrow(asset.one)

hist(asset.one$velocity)

binpal <- colorBin("Reds", asset.one$velocity, 6, pretty = FALSE, reverse = TRUE)


# get coors from GPS
subscr<-data.frame(lat=c(55.381640),
                   lon=c(10.433600))

# plot map
leaflet() %>% addTiles() %>% 
  addCircles(data = asset.one,
                   lat = ~lat, lng = ~lon,
                   color = ~binpal(asset.one$velocity), radius = 1
                   # color = "blue"
                   )

asset.one$my_time <- as.POSIXct(asset.one$timestamputc, format = "%d.%m.%Y %H:%M:%S", tz="GMT")


str(asset.one)

asset.one$my_time[40] - asset.one$my_time[3]

asset.one$my_time_diff1 <- asset.one$my_time - lag(asset.one$my_time)
asset.one$my_time_diff1_num <- as.numeric(asset.one$my_time_diff1, units="secs")

ggplot( data = asset.one, aes( my_time, my_time_diff1_num )) + geom_line() 

boxplot(asset.one$my_time_diff1_num, data=asset.one)

which.max(asset.one$my_time_diff1_num)

lag(asset.one[16880])


