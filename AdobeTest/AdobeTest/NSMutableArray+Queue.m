//
//  NSMutableArray+Queue.m
//  AdobeTest
//
//  Created by Pravin on 5/11/15.
//  Copyright (c) 2015 pravin. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

- (id) dequeue {
    id head = [self objectAtIndex:0];
    if (head != nil) {
        [self removeObjectAtIndex:0];
    }
    return head;
}


- (void) enqueue:(NSArray*)Objects {
if(Objects.count>0)
    {
        for(id object in Objects)
        [self addObject:object];
    }
}
@end
