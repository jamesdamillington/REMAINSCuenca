
library(REMAINS)
library(tibble)  #additional required library
library(conflicted)  #additional required library
library(terra) ##additional required library

# Scenario name
scenName = "remains_test2"
scenDir = paste0("outputs/", scenName)



# Model parameters
params = default.params()
params$time.horizon = 5
params$tseq.save.land = seq(from=1,to=50,by=2)
params$tseq.out.maps = seq(from=1,to=50,by=2)

lcc.demand = data.frame(SmartPlant = round(runif(50, 1, 10)), 
                        AgriConver = round(runif(50, 1, 10)), 
                        RuralAbnd = round(runif(50, 1, 10)),
                        PastureAbnd = round(runif(50, 1, 10)),
                        PastureConvert = round(runif(50, 1, 10)))


# Run the model
res = land.dyn.mdl(scenDir = scenDir, is.land.cover.change = TRUE, is.wildfire = TRUE,
                   is.prescribed.burn = TRUE, is.postfire.rege = TRUE, is.forest.recover = TRUE,
                   is.afforestation = TRUE, is.encroachment = TRUE, nrun = 1, 
                   write.outputs = TRUE, save.land = TRUE, out.maps = TRUE,
                   params = params, lcc.demand = lcc.demand, verbose = FALSE)

lc1 <- rast(paste0(scenDir,"/maps/","land.cover.type_run1time1.tif"))
lc3 <- rast(paste0(scenDir,"/maps/","land.cover.type_run1time3.tif"))
lc5 <- rast(paste0(scenDir,"/maps/","land.cover.type_run1time5.tif"))
plot(lc1, main="land cover t1")
plot(lc3, main="land cover t3")
plot(lc5, main="land cover t5")

fr1 <- rast(paste0(scenDir,"/maps/","firerisk_r1t1.tif"))
fr3 <- rast(paste0(scenDir,"/maps/","firerisk_r1t3.tif"))
fr5 <- rast(paste0(scenDir,"/maps/","firerisk_r1t5.tif"))
plot(fr1, main="fire risk t1")
plot(fr3, main="fire risk t3")
plot(fr5, main="fire risk t5")


