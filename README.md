
#Getting and Cleaning Data Course Project
##Coursera course 3

The scripts can be used to create a two tidy data sets from the UCI Human Activity Recgonition Using Smart Phone Data Set.  The extracts the mean and std for all the measurements in the X_train.txt and X_test.txt.
[original data can be found here link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


## Getting Started

You know the deal; fork this repository to your github account and clone it to your local environment.

1. Fork the GitHub https://github.com/waperez73/assignment4

2. Clone the project to your local account
  
    - git clone https://github.com/[your github account]/assignment4
    
### Prerequisites

You will need to download the latest version of R (this was developed using R version 3.4.3 (2017-11-30)).

You can download R here: 

Windows: https://cran.r-project.org/bin/windows/base/

Mac OSx: https://cran.r-project.org/bin/macosx/

If you really feel adventurous download RStudio for a more complete development environment.

https://www.rstudio.com/products/rstudio/download/#download

You also need to install plyr and data.table

install.packages("plyr")

install.packages("data.table")

### Installing

1. Install R and make sure it is working
2. Install Rtudio - if you feel you need it

##The scripts
  
  1. run_analysis.R - this is the main script 
  2. test.R - The script works with the UCI test data set.  
     The scripts exposes the function prepareTest(directory,rows) - see script for details
  3. training.R - The script works with the UCI training data set.  
     The scripts exposes the function prepareTraing(directory,rows) - see script for details

## Running the scripts

1. After you clone the repo to your local you can simply run the main script
    
### On Windows operating system
    C:\Rhome>rscript run_analysis.R --path "F:\Home\coursera\projects\assignment4"
    
### On the Unix operating system
    $ ./run_analysis.R --path "F:\Home\coursera\projects\assignment4"

####You can also source the main script run_analysis.R to run the script
    To the run the script from RStudio or from the R Console you need to set the home_dir variable to the script location.
  
    ```home_dir<-"C:/projects/assignment4/"```
    
## Contributing

The original data and documentation can be found here

[original data can be found here link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Versioning
  
  version 0.1

## Authors

Wellintton Perez 2018

## License

Use it at you own risk this is code from a novice R programmer

## Acknowledgments


[original data can be found here link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

