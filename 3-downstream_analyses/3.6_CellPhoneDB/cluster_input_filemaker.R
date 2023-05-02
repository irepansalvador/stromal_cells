
setwd("/home/irepan/Desktop/Github/stromal_cells/3-downstream_analyses/3.6_CellPhoneDB/")

clusters <- paste0("cluster_",seq(0,11,1))


for (A in clusters)
  { 
  f <- file(paste0("./in/",A,"_cols.txt"), "w")  # open an output file connection
  # 
  line <- paste0(A,"|",A,"\n")
  cat(line, file = f, append = T)
  print(paste0(A,"|",A))
  for (B in clusters)
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
