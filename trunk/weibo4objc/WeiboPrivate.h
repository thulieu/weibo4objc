//
//  WeiboPrivate.h
//  weibo4objc
//
//  Created by fanng yuan on 1/4/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weibo.h"

@interface Weibo (Private) 

- (NSString *) generateParameterString:(NSDictionary *) parameters;
- (void *) generateBodyDic:(NSMutableDictionary *) bodyDic paraKey:(NSString *) key paraValue:(NSString *) value;	
-(HttpMethod *) getMethod:(NSString *) urlString;
-(HttpMethod *) putMethod:(NSString *) urlString;	
-(HttpMethod *) postMethd:(NSString *) urlString;

@end
