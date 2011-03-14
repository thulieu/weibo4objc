//
//  XauthSignatureTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/14/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "XauthSignatureTest.h"
#import "OARequestParameter.h"
 
@implementation XauthSignatureTest

-(void) setUp{
    consumer = [[OAConsumer alloc] init];
	[consumer setKey:@"4284364200"];
	[consumer setSecret:@"daa815bbc444a4619b121984b433b489"];
	
	hmacSha1Provider = [[OAHMAC_SHA1SignatureProvider alloc] init];
    
    // From OAuth Spec, Appendix A.5.3 "Requesting Protected Resource"
    hmacSha1Request = [[OauthSingnature alloc] initWithURL:@"http://api.t.sina.com.cn/oauth/access_token"
												  consumer:consumer
													 token:token
													 realm:NULL
										 signatureProvider:hmacSha1Provider
													 nonce:@"kllo9940pd9333jh"
												 timestamp:@"1191242096"];
    [hmacSha1Request setParameters:[NSArray arrayWithObjects:[[OARequestParameter alloc] initWithName:@"file" value:@"vacation.jpg"],
									[[OARequestParameter alloc] initWithName:@"size" value:@"original"], 
									[[OARequestParameter alloc] initWithName:@"x_auth_mode" value:@"client_auth"],
									[[OARequestParameter alloc] initWithName:@"x_auth_username" value:@"loopb@sina.cn"],
									[[OARequestParameter alloc] initWithName:@"x_auth_password" value:@"123456"],nil]];
	
}

-(void) testSignature{
	NSString * result = [hmacSha1Request getSingnatureString];
}

@end
