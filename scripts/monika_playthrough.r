#Upload libraries 
library(REMAINS) 
library(tibble)  
library(conflicted)  
library(terra) 
library(raster)

# Scenario name
scenName = "remains_test"
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
                   params = params, lcc.demand = lcc.demand, verbose = TRUE)
```