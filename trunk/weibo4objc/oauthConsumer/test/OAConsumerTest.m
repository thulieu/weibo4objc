//
//  OAConsumerTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/12/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OAConsumerTest.h"


@implementation OAConsumerTest

- (void)testInitWithKey {
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:@"123456" secret:@"abcdef"];
    STAssertEquals(consumer.key, @"123456", @"Consumer key was incorrectly set to: %@", consumer.key);
    STAssertEquals(consumer.secret, @"abcdef", @"Consumer secret was incorrectly set to: %@", consumer.secret);
}

@end
