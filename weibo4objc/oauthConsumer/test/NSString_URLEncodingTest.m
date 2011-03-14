//
//  NSString_URLEncodingTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/13/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "NSString_URLEncodingTest.h"


@implementation NSString_URLEncodingTest

- (void)testURLEncodedString {
    //TODO gather complete set of test chars -> encoded values
    NSString *starter = @"\"<>\%{}[]|\\^`hello #";
    STAssertEqualObjects([starter URLEncodedString], @"\%22\%3C\%3E\%25\%7B\%7D\%5B\%5D\%7C\%5C\%5E\%60hello\%20\%23", @"The string was not encoded properly.");
}

@end
