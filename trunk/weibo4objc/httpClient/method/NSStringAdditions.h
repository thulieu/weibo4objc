//
//  NSStringAdditions.h
//  weibo4objc
//
//  Created by fanng yuan on 12/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSStringAdditions)

+ (NSString *)stringByGeneratingUUID;

+ (NSString *)base64StringFromData: (NSData *)data length: (int)length;

@end
