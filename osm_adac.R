

head(available_features())
## [1] "4wd only"  "abandoned" "abutters"  "access"    "addr"      "addr:city"
#amenities
head(available_tags("highway"))

available_tags("highway")

## [1] "animal boarding" "animal shelter"  "archive"         "arts centre"    
## [5] "atm"             "baby hatch"
#shops
head(available_tags("shop"))
## [1] "agrarian"  "alcohol"   "anime"     "antiques"  "appliance" "art"


q <- getbb("Germany")%>%
  opq()%>%
  add_osm_feature("amenity", "cinema")

str(q) #query structure
## List of 4
##  $ bbox    : chr "40.3119774,-3.8889539,40.6437293,-3.5179163"
##  $ prefix  : chr "[out:xml][timeout:25];\n(\n"
##  $ suffix  : chr ");\n(._;>;);\nout body;"
##  $ features: chr " [\"amenity\"=\"cinema\"]"
##  - attr(*, "class")= chr [1:2] "list" "overpass_query"
cinema <- osmdata_sf(q)
# cinema

mad_map <- get_map(getbb("Germany"),maptype = "toner-background")

#final map
ggmap(mad_map)+
  geom_sf(data=cinema$osm_points,
          inherit.aes =FALSE,
          colour="red",
          fill="red",
          alpha=.5,
          size=4,
          shape=21)+
  labs(x="",y="")







