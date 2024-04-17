library(dplyr)

# Example: Chain operations using the pipe operator
result <- mtcars %>%
  filter(mpg > 20) %>%        # Filter rows where mpg is greater than 20
  select(mpg, cyl, hp) %>%    # Select specific columns
  group_by(cyl) %>%           # Group the data by the 'cyl' variable
  summarise(mean_hp = mean(hp))  # Calculate the mean horsepower for each group

# Display the result
print(result)


# Create a data frame with missing data
d <- data.frame(name = c("Abhi", "Bhavesh", "Chaman", "Dimri"),
                age = c(7, 5, 9, 16),
                ht = c(46, NA, NA, 69),
                school = c("yes", "yes", "no", "no"))

# Display the data frame
print(d)

# Finding rows with NA value
rows_with_na <- d %>% filter(is.na(ht))
print(rows_with_na)

# Finding rows with no NA value
rows_without_na <- d %>% filter(!is.na(ht))
print(rows_without_na)


# Create a data frame with missing data
d <- data.frame(name=c("Abhi", "Bhavesh",
                       "Chaman", "Dimri"),
                age=c(7, 5, 9, 16),
                ht=c(46, NA, NA, 69),
                school=c("yes", "yes", "no", "no"))

# startswith() function to print only ht data
select(d, starts_with("ht"))

# -startswith() function to print
# everything except ht data
select(d, -starts_with("ht"))

# Printing column 1 to 2
select(d, 1: 2)

# Printing data of column
# heading containing 'a'
select(d, contains("a"))

# Printing data of column
# heading which matches 'na'
select(d, matches("na"))
