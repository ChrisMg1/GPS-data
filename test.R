n = c(2, 3, 5) 
s = c("aa", "bb", "cc", "dd", "ee") 
b = c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x = list(n, s, b, 3)   # x contains copies of n, s, b

s
typeof(s)

x
x[1]
x[[1]]

typeof(x)
typeof(x[1])
typeof(x[[1]])

NROW(x)
NROW(x[1])
NROW(x[[1]])
