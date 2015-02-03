corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  
  files <- dir(directory, pattern = '\\.csv', full.names = TRUE)
  tables <- lapply(files, read.csv)
  data <- do.call(rbind, tables)
  
  cors <- c()
  for (i in 1:332) {
    monitor <- data[data$ID == i & !is.na(data$Date) & !is.na(data$sulfate) & !is.na(data$nitrate), ]
    if (nrow(monitor) > threshold) {
      cors <- c(cors, cor(monitor$sulfate, monitor$nitrate))
    }
  }
  
  cors
}