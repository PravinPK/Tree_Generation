//
//  Tree.m
//  AdobeTest
//
//  Created by Pravin on 5/10/15.
//  Copyright (c) 2015 pravin. All rights reserved.
//

#import "Tree.h"

@implementation Tree
@synthesize name,children;


-(id)initWithName:(NSString *)_name andChildren:(NSMutableArray *)_children{
    self = [super init];
    if(self)
    {
        self.name =_name;
        self.children=_children;
    }
    return self;
}

-(id)initWithName:(NSString *)_name{
    self = [super init];
    if(self)
    {
        self.name =_name;
    }
    return self;
}

@end
