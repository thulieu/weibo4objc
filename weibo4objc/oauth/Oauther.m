//
//  Oauther.m
//  weibo4objc
//
//  Created by fanng yuan on 1/17/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "Oauther.h"
#import "OAuth+Additions.h"
#import "NSData+Base64.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation Oauther

+ (NSString *) OAuthorizationHeader:(OAuthToken *) token{
	NSString *_oAuthNonce = [NSString ab_GUID];
	NSString *_oAuthTimestamp = [NSString stringWithFormat:@"%d", (int)[[NSDate date] timeIntervalSince1970]];
	NSString *_oAuthSignatureMethod = @"HMAC-SHA1";
	NSString *_oAuthVersion = @"1.0";
	
	NSMutableDictionary *oAuthAuthorizationParameters = [NSMutableDictionary dictionary];
	[oAuthAuthorizationParameters setObject:_oAuthNonce forKey:@"oauth_nonce"];
	[oAuthAuthorizationParameters setObject:_oAuthTimestamp forKey:@"oauth_timestamp"];
	[oAuthAuthorizationParameters setObject:[token method] forKey:@"oauth_signature_method"];
	[oAuthAuthorizationParameters setObject:_oAuthVersion forKey:@"oauth_version"];
	[oAuthAuthorizationParameters setObject:[token key] forKey:@"oauth_consumer_key"];
	
	return nil;
}

@end
