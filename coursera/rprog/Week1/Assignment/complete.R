complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- dir(directory, pattern = '\\.csv', full.names = TRUE)
  tables <- lapply(files, read.csv)
  data <- do.call(rbind, tables)
  
  nobs_v <- c()
  for (i in id) {
    nobs <- data$ID[!is.na(data$Date) & !is.na(data$sulfate) & !is.na(data$nitrate) & !is.na(data$ID) & data$ID == i]
    
    nobs_v <- c(nobs_v, length(nobs))
  }

  data.frame (id=id, nobs=nobs_v)
}