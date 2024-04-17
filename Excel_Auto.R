# r code to install and load r packages writexl readxl and tidywerse
install.packages(c("writexl", "readxl", "tidyverse"))

# Load the packages
library(writexl)
library(readxl)
library(tidyverse)

# write and read single excel file
ggplot2::txhousing

# Create folders where excel file will be saved
dir.create("txhousing")

# Write a dataframe as an XLSX Excel file
writexl::write_xlsx(txhousing,path = "txhousing/txhousing.xlsx")

# Read an xlsx excefile
df <- readxl::read_excel(path = "txhousing/txhousing.xlsx" )

# Remove Excel File
unlink("txhousing/txhousing.xlsx")


# Write multiple Excel Files -----------

#Function which writes excel files
write_excel_file <- function(city_name){
  txhousing %>%
    filter(city == city_name) %>%
    writexl::write_xlsx(path = paste0("txhousing/txhousing.xlsx",city_name, "xlsx"))
}

#Test on first City
write_excel_file(city_name = txhousing$city[1])


#List of unique city names
list_city_names <- unique(txhousing$city)

#Loop to create multiple excel files
purrr::map(.x = list_city_names,write_excel_file)

#Read and join multiple excel files

#get list files
list_excel_files <- list.files(path = "txhousing", full.names = TRUE)

#Read Excel file and file path variable
read_excel_file <- function(file) {
  # Check if the file path is valid
  if (is.na(file)) {
    stop("No file path provided.")
  }
  
  # Read the Excel file using readxl::read_excel
  df <- readxl::read_excel(file)
  
  # Return the data frame
  return(df)
}

#Test on first excel file
read_excel_file(file = list_excel_files[2])

#Loop to read all excel files data
# df_list <purrr::map(.x=list_excel_files, read_excel_file)
df_list <- purrr::map(.x = list_excel_files, .f = read_excel_file)

#Get first data frame
df_1 <- df_list[[1]]

#Loop to read and bind/merge all data frames by row
df_merged <- purrr::map_dfr(.x = list_excel_files,read_excel_file)

#Remove folder and all Excel Files
unlink("txhousing",recursive = TRUE)














































