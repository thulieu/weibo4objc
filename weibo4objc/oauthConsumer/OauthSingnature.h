//
//  OauthSingnature.h
//  weibo4objc
//
//  Created by fanng yuan on 3/11/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAConsumer.h"
#import "OAToken.h"
#import "OASignatureProviding.h"
#import "HttpMethod.h"

@interface OauthSingnature : NSObject {
@protected
    OAConsumer *consumer;
    OAToken *token;
    NSString *realm;
    NSString *signature;
    id<OASignatureProviding> signatureProvider;
    NSString *nonce;
    NSString *timestamp;
	NSMutableDictionary *extraOAuthParameters;
	NSString *urlStringWithoutQuery;
	methodEnum method;
}
@property(readonly) NSString *signature;
@property(readonly) NSString *nonce;
@property(retain) NSString * urlStringWithoutQuery;
@property(assign) methodEnum method;

- (NSString *)getSingnatureString;
- (void)setOAuthParameterName:(NSString*)parameterName withValue:(NSString*)parameterValue;

@end
