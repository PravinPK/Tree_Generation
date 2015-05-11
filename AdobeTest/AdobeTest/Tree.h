//
//  Tree.h
//  AdobeTest
//
//  Created by Pravin on 5/10/15.
//  Copyright (c) 2015 pravin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSMutableArray *children;
@property (nonatomic) NSInteger level;

-(id)initWithName:(NSString *)_name;
-(id)initWithName:(NSString *)_name andChildren:(NSMutableArray *)_children;
@end
