
setwd("/home/irepan/Desktop/Github/stromal_cells/3-downstream_analyses/3.6_CellPhoneDB/")

clusters <- paste0("cluster_",seq(0,11,1))

celltypes <- read.csv(file = "./celltypes.txt")
celltypes <- celltypes$x

other_ct <- celltypes[stringr::str_detect(celltypes, "cluster", negate = T)]

for (A in clusters)
  { 
  f <- file(paste0("./in/other_",A,"_cols.txt"), "w")  # open an output file connection
  # 
  line <- paste0(A,"|",A,"\n")
  cat(line, file = f, append = T)
  print(paste0(A,"|",A))
  for (B in other_ct)
    {
    if (A != B) {
      line <- paste0(A,"|",B,"\n")
      cat(line, file = f, append = T)
      line <- paste0(B,"|",A,"\n")
      cat(line, file = f, append = T)
      }
    }
  close(f)
  }
