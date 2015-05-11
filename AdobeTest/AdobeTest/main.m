//
//  main.m
//  AdobeTest
//
//  Created by Pravin on 5/10/15.
//  Copyright (c) 2015 pravin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"
#import "NSMutableArray+Queue.h"

NSMutableArray *queue;
Tree* buildSampleTree_Normal(void);
Tree* buildSampleTree_Null(void);
Tree* buildSampleTree_SingleChild(void);
Tree* buildSampleTree_NoName(void);
Tree* buildSampleTree_Graph(void);

void printGenerations(int,int);
void getGenerationDetailWithRoot(Tree*);

NSString* handleNoName (NSString*);
NSMutableDictionary* getElementsByGeneration(Tree*, NSMutableDictionary*, NSNumber*);


/****************************************************************************
 Create Test Inputs and calls the getGenerationDetailWithRoot function
 * @method main
 * @author Pravin
 *
 * @param
 * @return
 *****************************************************************************/
int main(int argc, const char * argv[]) {
    
    queue=[[NSMutableArray alloc]init];                                 //Intitialize a queue data structure
    
    printf("\n\n*****Output for Normal Sequence*****\n");               //Generating Test Inputs
    Tree *root=buildSampleTree_Normal();
    getGenerationDetailWithRoot(root);
 
    printf("\n\n*****Output when root is null*****\n");
    root=buildSampleTree_Null();
    getGenerationDetailWithRoot(root);
    
    printf("\n\n*****Output when every node from root has single child*****\n");
    root=buildSampleTree_SingleChild();
    getGenerationDetailWithRoot(root);
    
    printf("\n\n*****Output when few nodes doesnot have name*****\n");
    root=buildSampleTree_NoName();
    getGenerationDetailWithRoot(root);
    
    return 0;
}


/****************************************************************************
 * @method getGenerationDetailWithRoot- To Print the
 * @author Pravin
 *
 * @param root- Takes the root of Tree as input
 * @return nil
 *****************************************************************************/
void getGenerationDetailWithRoot(Tree* root){
    if(root==nil){                                                  //Handle Root Null Exception
        printf("\n Root is null \n");
    }
                                                                    //Check if the root node is of valid class Type
    else if(![root isKindOfClass:[Tree class]] ){
        printf("\n Root is null \n");
    }
                                                                    //Execute print Generation when input is correct
    else{
        [queue enqueue:[[NSArray alloc]initWithObjects:root,nil]];
        printGenerations(0,1);
    }
    return;
}


/****************************************************************************
 * @method printGenerations
 * @author Pravin
 *
 * @param level- Current exceution level of tree
 * @param count- denoting the number of children in the current level
 * @return nil
 *****************************************************************************/
void printGenerations(int level , int count){
    int nextLevelCount=0;                                           //nextcount is to count the number of child elements for next generation
    printf("\nGeneration %d: ",level+1);                            //prints current generation
    while(count>0){
        Tree *tree=[queue dequeue];                                 //Deque the current level of trees
        [queue enqueue:tree.children];                              //Enque their Children
        nextLevelCount=nextLevelCount+ (int)tree.children.count;    //Increase the nextLevelCount to track number of next level children
        printf("%s ",[handleNoName(tree.name) UTF8String]);         //Print the name of current tree
        count--;
    }
    if(nextLevelCount>0)                                            //Reiterate for any nextLevel child
        printGenerations(level+1, nextLevelCount);
    return;
}


/****************************************************************************
 * @method handleNoName - Exception handler when tree has no name
 * @author Pravin
 *
 * @param name- name of the tree node
 * @return ErrorHandledName
 *****************************************************************************/
NSString* handleNoName (NSString* name){
    if([name isEqualToString:@""])
       return @"noname";
    return name;
}




/****************************************************************************
TEST CASE INPUT 1
 * @method buildSampleTree_Normal - Normal Tree with 4 generation
 * @author Pravin
 *
 * @param nil
 * @return root node of tree
 *****************************************************************************/
Tree* buildSampleTree_Normal(){
    Tree *root=[[Tree alloc]initWithName:@"Bob"];
    
    Tree *a11=[[Tree alloc]initWithName:@"A11" andChildren:nil];
    Tree *a22=[[Tree alloc]initWithName:@"A22" andChildren:nil];
    Tree *a33=[[Tree alloc]initWithName:@"A33" andChildren:nil];
    
    Tree *a1=[[Tree alloc]initWithName:@"A1"  andChildren:[[NSMutableArray alloc]initWithObjects:a11,a22,a33,nil]];
    Tree *a2=[[Tree alloc]initWithName:@"A2"  andChildren:nil];
    Tree *a3=[[Tree alloc]initWithName:@"A3"  andChildren:nil];
    
    Tree *b1=[[Tree alloc]initWithName:@"B1"  andChildren:nil];
    Tree *b2=[[Tree alloc]initWithName:@"B2"  andChildren:nil];
    
    Tree *c1=[[Tree alloc]initWithName:@"C1"  andChildren:nil];
    Tree *c2=[[Tree alloc]initWithName:@"C2"  andChildren:nil];
    Tree *c3=[[Tree alloc]initWithName:@"C3"  andChildren:nil];
    
    Tree *a=[[Tree alloc]initWithName:@"A"    andChildren:[[NSMutableArray alloc]initWithObjects:a1,a2,a3,nil]];
    Tree *b=[[Tree alloc]initWithName:@"B"    andChildren:[[NSMutableArray alloc]initWithObjects:b1,b2,nil]];
    Tree *c=[[Tree alloc]initWithName:@"C"    andChildren:[[NSMutableArray alloc]initWithObjects:c1,c2,c3,nil]];
    
    [root setChildren:[[NSMutableArray alloc]initWithObjects:a,b,c,nil]];
    
    return root;
}


/****************************************************************************
 TEST CASE INPUT 2
 * @method buildSampleTree_Null - Tree with nil as root
 * @author Pravin
 *
 * @param nil
 * @return root node of tree
 *****************************************************************************/
Tree* buildSampleTree_Null(void){
    return nil;
}


/****************************************************************************
 TEST CASE INPUT 3
 * @method buildSampleTree_SingleChild - Tree with only one element per generation
 * @author Pravin
 *
 * @param nil
 * @return root node of tree
 *****************************************************************************/
Tree* buildSampleTree_SingleChild(void){
    Tree *root=[[Tree alloc]initWithName:@"Bob"];
    Tree *a5=[[Tree alloc]initWithName:@"A5" andChildren:nil];
    Tree *a4=[[Tree alloc]initWithName:@"A4" andChildren:[[NSMutableArray alloc]initWithObjects:a5,nil]];
    Tree *a3=[[Tree alloc]initWithName:@"A3" andChildren:[[NSMutableArray alloc]initWithObjects:a4,nil]];
    Tree *a2=[[Tree alloc]initWithName:@"A2" andChildren:[[NSMutableArray alloc]initWithObjects:a3,nil]];
    Tree *a1=[[Tree alloc]initWithName:@"A1" andChildren:[[NSMutableArray alloc]initWithObjects:a2,nil]];
     [root setChildren:[[NSMutableArray alloc]initWithObjects:a1,nil]];
    return root;
}


/****************************************************************************
 TEST CASE INPUT 4
 * @method buildSampleTree_NoName - Tree with few elements having no name field
 * @author Pravin
 *
 * @param nil
 * @return root node of tree
 *****************************************************************************/
Tree* buildSampleTree_NoName(){
    
    Tree *root=[[Tree alloc]initWithName:@"Bob"];
    
    Tree *a1=[[Tree alloc]initWithName:@"A1" andChildren:nil];
    Tree *a2=[[Tree alloc]initWithName:@"A2" andChildren:nil];
    Tree *a3=[[Tree alloc]initWithName:@"A3" andChildren:nil];
    
    Tree *b1=[[Tree alloc]initWithName:@"" andChildren:nil];
    Tree *b2=[[Tree alloc]initWithName:@"B2" andChildren:nil];
    
    Tree *c1=[[Tree alloc]initWithName:@"" andChildren:nil];
    Tree *c2=[[Tree alloc]initWithName:@"C2" andChildren:nil];
    Tree *c3=[[Tree alloc]initWithName:@"" andChildren:nil];
    
    Tree *a=[[Tree alloc]initWithName:@"A" andChildren:[[NSMutableArray alloc]initWithObjects:a1,a2,a3,nil]];
    Tree *b=[[Tree alloc]initWithName:@"" andChildren:[[NSMutableArray alloc]initWithObjects:b1,b2,nil]];
    Tree *c=[[Tree alloc]initWithName:@"C" andChildren:[[NSMutableArray alloc]initWithObjects:c1,c2,c3,nil]];
    
    [root setChildren:[[NSMutableArray alloc]initWithObjects:a,b,c,nil]];
    return root;
}












