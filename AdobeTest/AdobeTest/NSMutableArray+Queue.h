//
//  NSMutableArray+Queue.h
//  AdobeTest
//
//  Created by Pravin on 5/11/15.
//  Copyright (c) 2015 pravin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)
- (id) dequeue;
- (void) enqueue:(id)obj;
@end
