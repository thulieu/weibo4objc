//
//  OASignatureProviding.h
//  weibo4objc
//
//  Created by fanng yuan on 3/11/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol OASignatureProviding <NSObject>

- (NSString *)name;
- (NSString *)signClearText:(NSString *)text withSecret:(NSString *)secret;

@end
