//
//  OATokenTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/12/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OATokenTest.h"
#import "NSString+URLEncoding.h"

@implementation OATokenTest

- (void)setUp {
    key = @"123456";
    secret = @"abcdef";
    appName = @"OAuth Framework Test";
    serviceProviderName = @"OAuth Service Provider";
    token = [[OAToken alloc] initWithKey:key secret:secret];
}

- (void)testInitWithKey {
	STAssertEquals(token.key, @"123456", @"Token key was incorrectly set to: %@", token.key);
	STAssertEquals(token.secret, @"abcdef", @"Token secret was incorrectly set to: %@", token.secret);
}

- (void)testInitWithHTTPResponseBody {
    OAToken *aToken = [[OAToken alloc] initWithHTTPResponseBody:[NSString stringWithFormat:@"oauth_token=%@&oauth_token_secret=%@", key, secret]];
    STAssertEqualObjects(aToken.key, key, @"Token key was incorrectly set to :%@", aToken.key);
    STAssertEqualObjects(aToken.secret, secret, @"Token secret was incorrect set to %@", aToken.secret);
	[aToken release];
	
	NSString *yahooishKey = @"%A=123h%798sdfnF";
	NSString *yahooishSecret = @"%A=234298273985";
	aToken = [[OAToken alloc] initWithHTTPResponseBody:[NSString stringWithFormat:@"oauth_token=%@&oauth_token_secret=%@",
														[yahooishKey URLEncodedString], [yahooishSecret URLEncodedString]]];
	STAssertEqualObjects(aToken.key, yahooishKey, @"Yahoo like  token key was incorrectly set to %@", aToken.key);
	STAssertEqualObjects(aToken.secret, yahooishSecret, @"Yahoo like token secret was incorrectly set to %@", aToken.secret);
	[aToken release];
}

@end
