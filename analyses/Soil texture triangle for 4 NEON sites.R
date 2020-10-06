
library(plotrix)
library(neonUtilities)


###   information on the plotrix capability to plot soil texture triangles: https://rdrr.io/cran/plotrix/man/soil.texture.html
data(soils)
soil.texture(main="NO DATA")
soil.texture(soils, main="DEFAULT", pch=2)
soil.texture(soils, main="LINES AND NAMES", show.lines=TRUE,
             show.names=TRUE, pch=3)
soiltex.return<-soil.texture(soils[1:6,], main="GRID AND LEGEND",
                             show.grid=TRUE, pch=4, col.symbols=1:6, show.legend=TRUE)
par(soiltex.return$oldpar)




head(soils)
phys <-
  loadByProduct(
    site = c("BART","KONZ","OSBS","SRER"),
    dpID = "DP1.10047.001",
    package = "basic",
    check.size = FALSE
  )

names(phys)
names(phys$spc_bulkdensity)
names(phys$spc_particlesize)

# make a soil texture object 'txtr'
pre.txr<-phys$spc_particlesize
#  choose columns you want
txr<-pre.txr[,c(4,5,8,9,20,21,22)]
txr<-na.omit(txr)
head(txr)
head(soils)
summary(txr)


## make a two by two panel graph!
par(mfrow=c(2,2))
soil.texture(txr[txr$siteID=="BART",5:7], main="BART", show.grid=FALSE, show.lines=T, show.names = F)
soil.texture(txr[txr$siteID=="OSBS",5:7], main="OSBS", show.grid=FALSE, show.lines=T, show.names = F)
soil.texture(txr[txr$siteID=="KONZ",5:7], main="KONZ", show.grid=FALSE, show.lines=T, show.names = F)
soil.texture(txr[txr$siteID=="OSBS",5:7], main="OSBS", show.grid=FALSE, show.lines=T, show.names = F)
