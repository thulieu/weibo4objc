//
//  OAPlaintextSignatureProvider.m
//  weibo4objc
//
//  Created by fanng yuan on 3/11/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OAPlaintextSignatureProvider.h"


@implementation OAPlaintextSignatureProvider

- (NSString *)name 
{
    return @"PLAINTEXT";
}

- (NSString *)signClearText:(NSString *)text withSecret:(NSString *)secret 
{
    return secret;
}

@end
