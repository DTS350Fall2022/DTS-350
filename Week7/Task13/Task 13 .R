
library(readr) 
library(haven)
library(readxl)
library(ggplot2)
library(knitr)
library(tidyverse)
library(dplyr)
library(forcats)
library(corrplot)
library(downloader)
library(readr)

randomletters <- read_lines("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/randomletters.txt")
randomletterswnum <- read_lines("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/randomletters_wnumbers.txt")

str(randomletters)
str(randomletterswnum)

#Pull out every 1700 letter (e.g. 1, 1700, 3400, …) and find the quote that is hidden. The quote ends in a period.

hiddenmessage <- c()
for (i in seq(1, str_length(randomletters)/1700)) {
  if (i == 1) {
    hiddenmessage <- str_c(hiddenmessage, str_sub(randomletters, start = 1, end = 1))
  }
  hiddenmessage <- str_c(hiddenmessage, str_sub(randomletters, start = i*1700, end = i*1700))
  if (str_sub(randomletters, i*1700, end = i*1700) == ".") {
    break
  }
}
hiddenmessage


#The hidden quote is...
#The plural of anecdote is not data.


#Find all the numbers hidden and convert those numbers to letters using the letters order in the alphabet to decipher the message.

hiddenmessage <- unlist(str_extract_all(randomletterswnum, ("(\\d)+")))
decipher <- c()

for (i in seq(1,length(hiddenmessage))) {
  decipher <- append(decipher,letters[as.integer(hiddenmessage[i])])
}
decipher <- paste(decipher,collapse = " ")
decipher

#Experts often possess more data than judegement 

#Find the longest palindrome.

longpalindrome <- str_extract_all(randomletters, "(.)(.)(.)(.)\\4\\3\\2\\1")
longpalindrome


#Remove all the spaces and periods from the string then find the longest sequence of vowels

longestvowelseq <- c("0")
nospaceperiod <- randomletters %>%
  str_remove_all(" ") %>%
  str_remove_all("\\.")

vowels <- unlist(str_extract_all(nospaceperiod,"([aeiou])+"))

for (i in seq(1,length(vowels))) {
  if (str_length(vowels[i]) > str_length(longestvowelseq[length(longestvowelseq)])) {
    longestvowelseq <- vowels[i]
  }
}
longestvowelseq














