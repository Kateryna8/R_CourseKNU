getcsv = function(directory, file_id) {
    return(read.csv(paste0(directory, "/", formatC(file_id, width = 3, flag = "0"), ".csv")))
}

pmean = function(directory, pollutant, id = 1:332) {
    all = NULL
    for (i in id) {
        all = c(all, getcsv(directory, i)[[pollutant]])
    }
    return(mean(all, na.rm = TRUE))
}

complete = function(directory, id = 1:332) {
    nobs = NULL
    for (i in id) {
        nobs = c(nobs, nrow(na.omit(getcsv(directory, i))))
    }
    return(data.frame(id, nobs))
}

corr = function(directory, threshold = 0) {
    corelations = numeric()
    for (i in 1:332) {
        full_obs = na.omit(getcsv(directory, i))
        if (nrow(full_obs) > threshold) {
            corelations = c(corelations, cor(full_obs$sulfate, full_obs$nitrate))
        }
    }
    return(corelations)
}
