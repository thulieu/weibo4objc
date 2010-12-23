//
//  HttpClient.m
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient

@synthesize method;

-(HttpResponse *) executeMethod:(HttpMethod *) method{
	if (method != nil) {
		return [method execute];
	}
	return nil;
}

-(void) dealloc{

	[method release];
	[super dealloc];	
}
@end
