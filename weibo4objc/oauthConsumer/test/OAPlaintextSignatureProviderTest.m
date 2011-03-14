//
//  OAPlaintextSignatureProviderTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/13/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OAPlaintextSignatureProviderTest.h"


@implementation OAPlaintextSignatureProviderTest

- (void)testSignClearText {
    OAPlaintextSignatureProvider *provider = [[OAPlaintextSignatureProvider alloc] init];
    STAssertEqualObjects(@"PLAINTEXT", [provider name], NULL);
    STAssertEqualObjects([provider signClearText:@"abcdefg" withSecret:@"123456789"], @"123456789", NULL);
}

@end
