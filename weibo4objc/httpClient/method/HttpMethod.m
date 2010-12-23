//
//  HttpMethod.m
//  weibo4objc
//
//  Created by fanng yuan on 11/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "HttpMethod.h"
#import "GetMethod.h"
#import "PutMethod.h"
#import "PostMethod.h"


@implementation HttpMethod

@synthesize needAsyncExcute;
@synthesize headerFields;
@synthesize body;
@synthesize url;

- (HttpResponse *) execute{
	if (delegate !=nil) {
		BaseMethod * method = (BaseMethod *) delegate;
		[method setHeaders: headerFields];
		[method setBodies:body];
		return [delegate executeSynchronouslyAtURL:url];
	}
	return nil;
}

-(id) init{
	self = [super init];
	if(self!=nil){
		delegate= [[GetMethod alloc] init];
	}
	return self;
}

-(id) initWithMethod:(methodEnum )httpMethod{
	self = [super init];
	if(self!=nil){
		switch (httpMethod) {
			case GET:
				delegate = [[GetMethod alloc] init];
				break;
			case PUT:
				delegate = [[PutMethod alloc] init];
				break;
			case POST:
				delegate = [[PostMethod alloc] init];
				break;				
			default:
				break;
		}
	}
	return self;
	
}

-(void) dealloc{
	[delegate release];
	[headerFields release];
	[body release];
	[url release];
	[super dealloc];
}
@end
