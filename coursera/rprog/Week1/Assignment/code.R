
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  files <- dir(directory, pattern = '\\.csv', full.names = TRUE)
  tables <- lapply(files, read.csv)
  data <- do.call(rbind, tables)
  
    # Get the Pollutant vector
  pol_vec_full <- data[[pollutant]]
  
  #Get the range
  pol_vec_range <- pol_vec_full[id[1]:id[length(id)]]
  
  
  #Clean out from NA
  pol_vec_clean <- pol_vec_range[!is.na(pol_vec_range)]
  
  
  #MEAN
  mean(pol_vec_clean)

}

#data <- pollutantmean("D:\\work\\workspace\\RStudio\\edu\\coursera\\rprog\\Assignments\\Week1", "nitrate", 1:1462)