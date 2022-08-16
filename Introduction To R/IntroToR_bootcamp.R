# Introduction to R Workshop
# Cornell Center for Social Sciences
# Adapted from Data Carpentry’s R for Social Scientists(https://datacarpentry.org/r-socialsci) and the D-Lab at Berkeley's R Fundamentals(https://github.com/dlab-berkeley/R-Fundamentals)

# Section 1: Navigating RStudio

## By default, this script will open in the upper left pane of RStudio. You can open a new script by clicking File --> New File --> R Script.

## Most of the time, RStudio will be organized in the following four panes:

## 1. Source (upper left): This is where you view and edit most files, such as scripts, RMarkdown notebooks, etc.
## 2. Console (lower left): You can use this to enter R commands on the fly. Furthermore, most R output will appear here.
## 3. Environment/History (upper right): Saved variables, functions, and other R objects will appear here.
## 4. Files/Plots/Packages (lower right): A variety of other tabs which allow you to navigate your file system, view plots, install packages, view help, etc.

## RStudio also has a lot of helpful customizations to improve your experience:

## Click Tools --> Global Options --> Appearance to change your color and font settings.
## Click Tools --> Global Options --> Code and check the box that says "Soft-wrap R source files" to wrap the text in your script to the width of the script pane.
## Click Tools --> Global Options --> Code --> Display and check the boxes that say "Highlight selected line" and "Highlight R function calls". These will provide helpful highlighting as you edit your files.

# Section 2: Creating variables in R
# While you can run any code and display the output, most times it will be more helpful to save the output to a variable. In R, there are two common ways to assign an output to a variable.
## To run a line of code, place your cursor on a line of runnable code and click the "Run" button or click Ctrl + Enter (PC) or command + Enter (Mac).
5+5 # Output is printed
var1 = 5+5 # No output is printed. Notice that var1 is now showing up in the Environment Panel.
var1

## Now that we have a numeric variable stored, we can now do arithmetic operations on the variable.
var1 + 1
var1 - 2
var1 * 3
var1 / 4
### Notice that var 1 has not changed.

## We can also change the value of existing variables, by assigning a new value to the variable.
var2
var2 <- var1 / 4
var2

## Use a hashtag to comment your code (e.g., write notes to your future self and your collaborators) to help keep your script organized.

# Section 3: Functions and Arguments

## Functions run a prescripted set of commands. Predefined functions is what keeps you from reinventing the wheel on common analysis tasks (Ex. Calculating mean and SD or running regressions). Arguments are inputs to the functions.

#Import sample dataset. 
mydata <- mtcars
#description of mtcars dataset https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/mtcars
view(mydata)
#Summarize numeric variables
summary(mydata)
#Perform T test. Compare average MPG between automatic and manual cars. 
t.test(mpg ~ am, data = mydata)
#Chisquared test. Is there association between auto or manual cars and how many forward gears they have?
#1 is manual, 0 is automatic. 
table(mydata$am, mydata$gear)
chisq.test(mydata$am, mydata$gear)
#Manual cars tend to have more forward gears, auto 
#Perform regression
lm(mpg ~ wt + hp, data = mydata)

### Challenge 1: Variable Assignment
### 1. Define three variables and then write a mathematical expression using only those variables.
### 2. Using the round() function, round 3.14159 to the second decimal place. Hint: Use ?round if you need help on the function definition.

# Section 4: Data Classes and Coercion

## There are five main classes of data we will work with in this workshop:
## 1. numeric: decimals (the default for ALL numbers in R).
## 2. integer: whole numbers (positive and negative, including zero).
## 3. character: text strings (always wrapped in quotations).
## 4. logical: TRUE or FALSE (1 or 0).
## 5. factor: nominal or ordinal categorical type.

# Section 4.1: Numerics
## Assign 5 to 'number' and check its class. 
number <- 5
class(number)

# Section 4.2: Integers
## Coerce 'number' to integer type with the as.integer() function:
number_int <- as.integer(number)
class(number_int)

## Section 4.3: Characters
## Define welcome <- "Welcome to CCSS" and check its class:
welcome <- "Welcome to CCSS"
class(welcome)

## Single and double quotes work similarly:
contraction <- 'I am hungry.'
contraction

contraction <- "I am hungry."
contraction

## You can nest single quotes inside of double quotes:
contraction <- "I'm hungry"
contraction

## Or, you can use all single quotes along with escape characters:
contraction <- 'I\'m hungry'
contraction

## However, you cannot nest single quotes inside of single quotes.

## Section: 4.4 Logicals
## Logical data will check to see if a condition is TRUE (1) or FALSE (0).
class(TRUE)
class(FALSE)

## Since TRUE and FALSE are stored as 1 and 0, they take on mathematical properties:
TRUE + 2

## Boolean data types evaluate whether a statement is TRUE. Check the following:
FALSE < TRUE # less than
TRUE >= TRUE # greater than or equal to
FALSE == FALSE # equivalent to (equal to)
"Mac" == "mac" # R is case sensitive
FALSE != FALSE # not equivalent to (not equal to)

# Section 4.5: Factors

## A factor variable is a set of categorical or ordinal values.
## Categorical data can be important when you are performing calculations or making visualizations by group. This way, R knows that the numeric or character data should have grouping properties.
## "Levels" are the groups contained within the factor variable itself.

## To create a factor variable, we first need a vector.

# Section 5: Data Structures

## There are four main functions you can use to form more complex data structures:
## 1. c(): ordered groupings of the SAME type of data (called "vectors").
## 2. data.frame(): and ordered group of equal-length vectors; also like a list.
## 3. list(): store heterogeneous data.
## 4. matrix(): like a vector, but can be ordered into rows and columns.

# Section 5.1: Vectors
## A vector is the most common and basic data type in R, and is pretty much the workhorse of R. A vector is composed by a series of values. We can assign a series of values to a vector using the c() function.
id_vector <- c(4, 2, 9, 4, 8)
name_vector <- c("Roxanna", "Traci", "Jude", "Sharleen", "Bryce")
code_vector <- c("GH", "GW", "GH", "GW", "GH")
enrolled_vector <- c(T, T, F, TRUE, FALSE)

### The vector must contained the same type, so if there are different types present some of the values will get coerced.
enrolled_vector <- c(T, T, F, TRUE, "Bryce")
class(enrolled_vector)
enrolled_vector <- c(T, T, F, TRUE, FALSE)
class(enrolled_vector)

## We can also store missing values in a vector using the NA keyword:
experience_vector <- c(12, 33, 2, 30, NA)

## There are many functions that allow you to inspect the content of a vector. length() tells you how many elements are in a particular vector:
length(name_vector)

## There are many functions that allow you to perform an operation on a vector. mean() calculates the arithmetic mean of the values in a vector:
mean(id_vector)
mean(experience_vector)
?mean
mean(experience_vector, na.rm = T)
mean(name_vector) 
class(name_vector)

## Indexing a vector
## To index a vector means to extract an element based on its position.
## For example, if we want to return just the third thing from the "id_vector", we would use square brackets and type:
id_vector[3]

## To return the second, third, and fourth thing from the "name_vector":
name_vector[2:4]

## We can also use logical tests to subset vectors. 
id_vector > 3
id_vector[id_vector > 3]

##R also provides the operator %in% to test if a value belongs to a vector. 
TRUE %in% enrolled_vector
"Jude" %in% name_vector


# Section 5.2: Data frames
## A data frame is an ordered group of equal-length vectors.
## Think of a data frame as a spread sheet you would open in MS Excel.
## Since they are vectors, each column can only contain the same data type, but columns of different types can be lined up next to each other.
## Meanwhile, rows can contain heterogeneous data.

## Using the vectors we created above, we can create a data frame with the data.frame() function.
df <- data.frame(id_vector, name_vector, code_vector, enrolled_vector, experience_vector)
df

## If we wanted to change the column names, we can specify that with the function argument:
df <- data.frame(id=id_vector, name=name_vector, code=code_vector, 
                 enrolled=enrolled_vector, experience=experience_vector)
df

## Check the compact structure of the data frame. This can also be checked in the Environment panel.
str(df)

## View the dimensions (nrow x ncol) of the data frame:
dim(df) 

## View the first two rows:
head(df,2)

## View column names:
colnames(df)

## View row names (we did not change these and they default to character type):
rownames(df)
class(rownames(df))

## You can extract a single column with the $ operator:
df$name # What data structure does this remind you of?

## The $ operator can also be used to create new columns:
df$newColumn <- df$id * df$experience
df

### Challenge 4: Make your own data frame.
### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
### 2. Add a fourth column that calculates the total cost for each food item.
### 3. Calculate the total cost of all the fruits combined. Hint: ?sum
