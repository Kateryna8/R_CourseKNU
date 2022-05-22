pmean <- function(pollutant, id = 1:332, directory="C:/Users/Asus/Documents/specdata") {
  
  data1 = lapply(id, function(i) read.csv(paste(directory, "/", formatC(i,width = 3, flag = "0"), ".csv", sep=""))[[pollutant]])
  return (mean(unlist(data1), na.rm = TRUE))
}


complete <- function(id= 1:332, directory="C:/Users/Asus/Documents/specdata"){
  numrow <- numeric()
  for (i in id) { 
    data2 <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"),  ".csv", sep = ""))
    numrow <- c(numrow,sum(complete.cases(data2)))
  }
  return(data.frame(id, numrow))
}

corr <- function(threshold = 0, directory="C:/Users/Asus/Documents/specdata") {
  corv <- NULL
  for (i in 1:332) {
    data3 <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"),".csv", sep = ""))
    res <- data3[complete.cases(data3), ]
    if (nrow(res) > threshold)
      corv <- c(corv, cor(res[,"sulfate"], res[, "nitrate"]))
  }
  if(length(corv) > 0)
    return (corv)
  return (as.numeric(c()))
}
