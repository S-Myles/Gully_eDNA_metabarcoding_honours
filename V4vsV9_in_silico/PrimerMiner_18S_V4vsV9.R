# You need to first download the GitHub repository of the PrimerMiner project
# Then navigate to this directory on your local computer and install PrimerMiner 
install.packages("~/R/PrimerMiner-0.21/PrimerMiner", repos = NULL, type="source", dependencies=T)

# set the path to the desired working directory
setwd("~/R/PrimerMiner-0.21/18S_V4vsV9_Orderlvl")

library(PrimerMiner)

# load the package into R
# quick guide inside R, further documentation in the Github Wiki
# https://github.com/VascoElbrecht/PrimerMiner/wiki
browseVignettes("PrimerMiner")

# creating configuration file to parameterize batch downloads
batch_config("config_Vsearch97.txt")

# batch download and process sequence data
batch_download("taxa.csv", "config_Vsearch97.txt")
