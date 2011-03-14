//
//  XauthSignatureTest.h
//  weibo4objc
//
//  Created by fanng yuan on 3/14/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "OAConsumer.h"
#import "OAToken.h"
#import "OauthSingnature.h"
#import "OAPlaintextSignatureProvider.h"
#import "OAHMAC_SHA1SignatureProvider.h"


@interface XauthSignatureTest : SenTestCase {
    OAConsumer *consumer;
    OAToken *token;
    OAHMAC_SHA1SignatureProvider *hmacSha1Provider;
    OauthSingnature *hmacSha1Request;	
}

-(void) testSignature;

@end
