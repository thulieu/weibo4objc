//
//  GetMethod.m
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "GetMethod.h"


@implementation GetMethod

-(HttpResponse*)executeSynchronouslyAtURL:(NSURL*)methodURL {
	//Call the executeMethod function from the super class, giving the appropriate parameters
	return [super executeMethodSynchronously:methodURL methodType:@"GET" dataInBody:NO contentType:@"application/x-www-form-urlencoded"];
}

-(void)executeAsynchronouslyAtURL:(NSURL*)methodURL {
	[super executeMethodAsynchronously:methodURL methodType:@"GET" dataInBody:NO contentType:@"application/x-www-form-urlencoded"];
}

@end
