# What is peakseek?

Here, we provide a R package with two functions. 
$paied_peak_search_ab$ is used for **. 
$paied_peak_search_aa$ is used for **. 

# How to installation?

This package can be install this package from github:

```
library(devtools)
install_github("microbma/peakseek")
```

# How to prepare the data file?

The data file need 6 columns:

```
mztest <- read.csv("MS-data.csv")
mz.df <- data.frame(num1 = mztest[,1], #ID 1
                    time1 = mztest[,5], # *** 
                    mz1 = mztest[,4],  # *** 
                    num2 = mztest[,1], # *** 
                    time2 = mztest[,3], # *** 
                    mz2 = mztest[,2] # *** 
                    )
```

# How to get the results?

**Search in different column**

```
paired_peak_search_ab(file = mz.df,
                      s = 0.2, 
                      f1 = 3.0188, 
                      f2 = 0.00001)
```


**Search in same column**

```
paired_peak_search_aa(file = mz.df,
                      s = 0.2, 
                      f1 = 3.0188, 
                      f2 = 0.00001)
```

