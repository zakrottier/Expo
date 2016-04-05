library(TSP)
library(gdata)
library(doParallel)
registerDoParallel()

# Load Data ----
data = read.xls("/Users/zakrottier/Desktop/distances.xlsx", header=TRUE)

# Transform Data ----
rownames(data) = data$City
data$y = -(data$y)
data_matrix = as.matrix(data[,2:3])

# Solve TSP ----
square = ETSP(data_matrix)
tour = solve_TSP(square, two_opt=TRUE, rep=1000, start="Madison")
plot(square, tour, tour_col='red')
text(data$x, data$y, row.names(data), cex=0.5, pos=4, col="blue")
tour_length(tour)
names(tour)