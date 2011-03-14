//
//  OARequestParameterTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/13/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OARequestParameterTest.h"


@implementation OARequestParameterTest

- (void)setUp {
    param = [[OARequestParameter alloc] initWithName:@"simon" value:@"did not say"];
}

- (void)testInitWithName {
    STAssertEqualObjects(param.name, @"simon", @"The parameter name was incorrectly set to: %@", param.name);
    STAssertEqualObjects(param.value, @"did not say", @"The parameter value was incorrectly set to: %@", param.value);
}

- (void)testURLEncodedName {
    STAssertEqualObjects([param URLEncodedName], @"simon", @"The parameter name was incorrectly encoded as: %@", [param URLEncodedName]);
}

- (void)testURLEncodedValue {
    STAssertEqualObjects([param URLEncodedValue], @"did\%20not\%20say", @"The parameter value was incorrectly encoded as: %@", [param URLEncodedValue]);
}

- (void)testURLEncodedNameValuePair {
    STAssertEqualObjects([param URLEncodedNameValuePair], @"simon=did\%20not\%20say", @"The parameter pair was incorrectly encoded as: %@", [param URLEncodedNameValuePair]);
}

@end
