//
//  WeiboPrivate.m
//  weibo4objc
//
//  Created by fanng yuan on 1/4/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "WeiboPrivate.h"
#import "Base64.h"

@implementation Weibo(Private)


- (NSString *) generateParameterString:(NSDictionary *) parameters{
	NSMutableString * result = [[NSMutableString alloc] init];
	for(NSString * key in parameters){
		NSData * value = [parameters objectForKey:key];
		if(value != nil){
			[result appendFormat:@"&%@=%@",key,[[NSString alloc] initWithData:value encoding:encoding]];
		}
	}
	return result;
}

- (void *) generateBodyDic:(NSMutableDictionary *) bodyDic paraKey:(NSString *) key paraValue:(NSString *) value{
	if(value!=nil){
		[bodyDic setObject:value forKey:key];
	}
	[key release];
	[value release];
}

-(HttpMethod *) getMethod:(NSString *) urlString{
	HttpMethod * method = [[HttpMethod alloc] init];
	return method;
}

-(HttpMethod *) putMethod:(NSString *) urlString{
	HttpMethod * method = [[HttpMethod alloc] initWithMethod:PUT];
	return method;	
}

-(HttpMethod *) postMethd:(NSString *) urlString{
	HttpMethod * method =[[HttpMethod alloc] initWithMethod:POST];
	return method;
}

@end
