#remotes::install_github(c("rstudio/webshot2",
#"rstudio/chromote",
#"r-lib/downlit",
#"dmurdoch/pkgdown@issue1689"))
library(RColorBrewer)
library(rgl)
library(webshot2)

### RUN THIS IN THE LAPTOP!

setwd("~/Desktop/Github/stromal_cells/3-downstream_analyses/3.5_Fibrob_level1/")
Mesench_3D_Phate <- read.csv(file = "Mesench_Phate_3D_Perinatal_clusters.csv",
                             row.names = 1 )

rand_cells <- sample(x = 1:length(Mesench_3D_Phate$PHATE1),
                     size = 2500, replace = F)


x = Mesench_3D_Phate$PHATE1[rand_cells]
y = Mesench_3D_Phate$PHATE2[rand_cells]
z = Mesench_3D_Phate$PHATE3[rand_cells]
#cols <- Mesench_3D_Phate$celltype_cols[rand_cells]
cols <- Mesench_3D_Phate$clusters_cols[rand_cells]

#celltypes <- unique(Mesench_3D_Phate$celltype)
#celltypes_cols <- unique(Mesench_3D_Phate$celltype_cols)
celltypes <- unique(Mesench_3D_Phate$Mes_clusters)
celltypes_cols <- unique(Mesench_3D_Phate$clusters_cols)


### scatterplot3d package
rgl.open() # Open a new RGL device
rgl.bg(color = "lightgrey") # Setup the background color
rgl.spheres(x,y,z, color=cols, radius = 0.0005, )
rgl.bbox(color = c("#333377", "black"), emission = "#333377", draw_front = F,
         specular = "#3333FF", shininess = 5, alpha = 0.6, 
         xat = c(-10,10), yat =c(-10,10), zat = c(-10,10) )
rgl.viewpoint(theta = 0, phi = 15, zoom = 0.6)
# legend3d("topright", legend = celltypes,
#          pch = 16, col = celltypes_cols, cex=1.3, inset=c(0.02))

movie3d(spin3d(rpm = 20,axis = c(0,1,0)),
        duration = 3,#convert = NULL, clean = FALSE,
        dir = "~/Desktop/Github/stromal_cells/3-downstream_analyses/3.5_Fibrob_level1/plots/" )

rgl.viewpoint(theta = 0, phi = 3, zoom = 0.6)
# add legend
legend3d("topright", legend = celltypes,
         pch = 16, col = celltypes_cols, cex=1.3, inset=c(0.02))
# capture snapshot
snapshot3d(filename = "~/Desktop/Github/stromal_cells/3-downstream_analyses/3.5_Fibrob_level1/plots/cell_type_labels.png",
           fmt = 'png')

rgl.close() # Open a new RGL device




## New plot



### scatterplot3d package
rgl.open() # Open a new RGL device
rgl.bg(color = "white") # Setup the background color
legend3d("topright", legend = celltypes,
        pch = 16, col = celltypes_cols, cex=1.3, inset=c(0.02))
rgl.spheres(x,y,z, color=cols, radius = 0.0005, )
rgl.bbox(color = c("#333377", "black"), emission = "#333377", draw_front = F,
         specular = "#3333FF", shininess = 5, alpha = 0.6, 
         xat = c(-10,10), yat =c(-10,10), zat = c(-10,10) )
# add titles
title3d('Phate 3D', '', 'x', 'y', 'z')
rgl.viewpoint(theta = 0, phi = 15, zoom = 0.6)

movie3d(spin3d(rpm = 20,axis = c(0,1,0)),
        duration = 3,#convert = NULL, clean = FALSE,
        dir = "~/Desktop/Github/stromal_cells/3-downstream_analyses/3.5_Fibrob_level1/plots/" )
rgl.close() # close the RGL device



