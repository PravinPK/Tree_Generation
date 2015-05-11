# Tree_Generation
Algorithm to print the different generation of a tree


# Objective: 
To write a function that takes the root of a family tree as an input and prints the names of individuals belonging to each generation on a separate line.

# How to Execute:
<h5>Xcode:</h5> 
1.	1.If you have Xcode installed  open the Adobe_Test.xcodeproj  file. 
2.	2.Hit the build button at the top right.
3.	Watch the console for the output.

<h5>Terminal:</h5> 
1.	Move to the directory where main.m is situated
2.	Example  [DownloadedPath]/Adobe_Test/Adobe_test
3.	And execute the following command.
4.	clang -framework Foundation main.m Tree.m NSMutableArray+Queue.m  -o output
5.	Finally run the executable file.  /output to see the output.

# Language Used:
 Objective-C

# Time Complexity:
O(n)

# Space Complexity:
 Size of queue(NSMutableArray) which is equivalent to     maximum size of nodes in same generation.

# Assumptions Made: 
This is a tree and not a graph. (Invalid when lower generation has a higher generation parent)



# File Used:
main.m : main function which builds tree and executes the algorithm.
Tree.m :  Model Class for Tree Structure.
NSMutableArray+Queue.m : Extended NSMutableArray and added enque and deque


# Sample Input:
		     A
 	  A1		    A2
A11	 A12		A21 	A22


# Output
Generation 1:  A </br>
Generation 2:  A1, A2 </br>
Generation 3: A11, A12 , A21,  A22 </br>

# Summary on Testing
The following test cases are already executed in the program.
1.	Normal flow with root!=null and many valid branches.
2.	root=null.
3.	Initialize few elements in a tree without a name.
4.	Tree with just one branch of children.
5.	Finally test with bigger load of input.
