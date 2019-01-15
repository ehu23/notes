# R

## Basics

- Enter R's environment with `r` on the command line
- Quit environment with `q()`
- To bring up the man page of a command: `?boxplot`

### Reading data from file

`a <- read.table("http://www.stat.ucla.edu/~nchristo/statistics12/body_fat.txt", header=TRUE)`

- The above command reads the table in from the url, which returns an object called a _data frame_, which looks like a table, and stores this data frame into variable _a_.
    - Note: Data frame contains any data types. Matrices contain only numeric data. Both are object classes.
- can put in a local path for the file location as well
- display stored data frame with `a`. Or display first six lines of the data with `head(a)`. Also, can print with `print(a)`

#### Can Also Read CSV Files:
    object_name <- read.csv(file = "filename.csv")
    object_name <- read.csv(file.choose()) # to choose file using file explorer
### Useful commands

- Assignment: `<-` is preferred. Can also use `=`
- Extract the 2nd variable from the data frame: `a[,2]`
- Extract variable by name: `a$VARIABLENAME`
- Access 1st row of data: `a[1,]`
- Mean: `mean(a)`. Mean of 1 variable: `mean(a$y)`. Mean of variable 2 and 3: `mean(a[,c(2,3)])`.
- Variance (var), variance-covariance matrix (cov), correlation matrix (cor) is similar to mean, but different keyword... `var()`, `cov()`, `cor()`.
- Summary of each variable in data frame: `summary(a)`
- Rename variables in a data frame: `names(a) <- c("a", "b")` #renames variable in first column to a, 2nd column var to b. 

#### Plots

    stem(a$y)
    boxplot(a$y)
    hist(a$y)

    plot(a$x, a$y) #plots variable x against variable y from data frame a

- these commands will bring up the plot in another window if run on R from CLI, which you can then save as a pdf

##### Plot Function Arguments
    col="blue" #color of data points
    cex=1.7    #size of points
    pch=20     #integer from 1-25. Style of points
    xlab="l1"  #label for the x axis
    ylab="l2"  #label for the y axis
    main="hi"  #title of plot

#### Create subsets from a data frame
    a1 <- a[, 1:3] #A new data frame with only the first three columns.
    a2 <- a[, c(1:3,8,10)] #A new data frame with columns 1,2,3,8,10

#### Conditional queries
    which(b$lead>450) #This will identify the rows.
    b1 <- b[which(b$lead>450),] #This will create the new data frame.
    which(b$lead>45 & b$lead<60) #Another subset.
    b2 <- b[which(b$lead>45 & b$lead<60),]

## Using Packages

    install.packages("maps") #installs the package, this will prompt to choose a CRAN mirror, just choose the one in CA, USA.
    library(maps) #loads it into R. The maps package gives you the `map()` function, which maps data on a map, i.e. california. This is essentially `using namespace std`, but for each package.

## Vectors

    numbers <- c(1,2,3,4,5)
    schools <- c("UCLA", "UC Berkeley", "USC")
    
    #operations
    numbers[1] #gets first element of numbers, vectors are NOT indexed by 0, but 1.
    numbers <- numbers*2 #multiply all elements in numbers vector by 2

## Probability and Percentiles...to be continued
