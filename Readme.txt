***Algorithm***

1. Repeat for N= 10, 50, 100, 200, 500, 1000
   i. Repeat 100 times for each N
	a. Call the generateData function for N
	b. Initialize weight vector w0 with zeros
	c. Call the PLA function using w0
	d. Call the peudoinverse algorithm to get learned weight vector(w)
	e. Call the PLA function with weight vector from linear regression.
   ii. Calculate the average of the iterations required
   iii. Plot the point (n, avg)
2 End

** generateData Function **

1. Generate N*2 matrix(X) of random numbers between -1 and 1
2. Generate two random points to create a line
3. Calculate the slope and equation of line
4. Repeat for each point in X
	i. Calculate the distance of each point in the data set from the line.
	ii. Label the point depending on its position with respect to the line
5. return X and label vector(Y)


** PLA ** 

1. append x0=1 to the X input matrix
2. initialize iters = 0
3. For each point in X
	i. Calculate predicted output
	ii. Check if predicted output is equal to real output
	iii. if no, update weight vector and increment iters
4. return weight vector


** Pseudoinverse ** 

1. append x0=1 to the X input matrix
2. Calculate the pseudoinverse of X 
3. update the weight vector using the pseudoinverse of X
4. return weight vector.


** Experiments **

The average iterations required for the PLA with weight initialization using linear regression is less than the average iterations required for PLA without weight initialization.
This is shown in the graph for each N.
