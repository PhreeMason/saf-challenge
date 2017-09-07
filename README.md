# Returns Analyzer 

## Overview

This is a program that reads inputted text files and prints a formatted summary to the console.

When given a file with valid formatting the ReturnsAnalyzer class will output a summary of the data within the inputed file.

## Improvements

The ReturnsAnalyzer class has a lot of potential to be a powerful analyst tool.

for exmaple it can be used to compare the perfomance of multiple companies with added methods.

```
stock_1 = ResultAnalyzer.new_from_input(path_1)
stock_2 = ResultAnalyzer.new_from_input(path_2)

stock_1.performs_better_than?(stock_2) #=> true
```
In addition to the above method it is possible to add on features for parsing larger files or folders containing thousands of files. These files can all then be used to create new instances of ReturnsAnalyzer for comparisons.

Also, currently the ReturnsAnalyzer only works if the data is formatted correctly. Adding methods that look for specific information within the file such as a year or a string of numbers representing returns can improve this.

## How To Run

To run this program simply clone the repository and run `bundle install`. Next, run `ruby bin/analyzer.rb` and enter the name of the file to analyzer once prompted.


Thank You