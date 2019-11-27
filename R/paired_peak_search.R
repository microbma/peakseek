paired_peak_search_ab <- function(file = mz.df,
                               s = 0.2,
                               f1 = 3.0188,
                               f2 = 0.00001){
        # read file
        mz.data <- file
        # size of dataset
        row.num <- nrow(mz.data)
        print(paste(row.num,"in total"))
        # match
        output <- NULL
        for(i in 1:row.num){
                print(i)
                time.1 <- mz.data$time1[i]
                mz.1 <- mz.data$mz1[i]
                id <- mz.data$num1[i]
                pos.time.2 <- c(1:row.num)[abs(mz.data$time2 - time.1) <= s ]
                pos.mz2 <- pos.time.2[abs(mz.data$mz2[pos.time.2] - mz.1 - f1)/mz.1 <= f2]
                output <- rbind(output,c(id,time.1,mz.1,mz.data[pos.mz2[1],4:6]))
        }
        colnames(output) <- c("ID 1","Time 1","m/z 1","ID 2","Time 2","m/z 2")
        output1 <- output[!is.na(output[,4]),]
        return(output1)
}

paired_peak_search_aa <- function(file = mz.df,
                               s = 0.3,
                               f1 = 3,
                               f2 = 0.0001){
        # read file
        mz.data <- file
        # size of dataset
        row.num <- nrow(mz.data)
        # match
        output <- NULL
        for(i in c(1:row.num)){
                print(i)
                time.1 <- mz.data$time1[i]
                mz.1 <- mz.data$mz1[i]
                id <- mz.data$num1[i]
                mz.data1 <- mz.data[-1, ]
                pos.time.2 <- c(1:(row.num-1))[abs(mz.data1$time1 - time.1) < s ]
                pos.mz2 <- pos.time.2[abs(mz.data1$mz1[pos.time.2] - mz.1 - f1)/mz.1 <= f2]
                output <- rbind(output,c(id,time.1,mz.1,mz.data1[pos.mz2[1],1:3]))
        }
        colnames(output) <- c("ID 1","Time 1","m/z 1","ID 2","Time 2","m/z 2")
        output1 <- output[!is.na(output[,4]),]
        return(output1)
}
