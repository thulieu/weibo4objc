//
//  PutMethod.m
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "PutMethod.h"


@implementation PutMethod

-(id)initWithData:(NSData*)data {
	self = [super init];
	
	if (self != nil) {
		uploadData = [data retain];
	}
	
	return self;
}

-(id)initWithContentsOfURL:(NSURL*)url {
	self = [super init];
	
	if (self != nil) {
		uploadData = [[NSData dataWithContentsOfURL:url] retain];
	}
	
	return self;
}

-(void)prepareURLRequestWithURL:(NSURL*)methodURL withRequest:(NSMutableURLRequest*)request {
	//Set the destination URL
	[request setURL:methodURL];
	//Set the method type
	[request setHTTPMethod:@"PUT"];
	
	[request setHTTPBody:uploadData];
}

-(HttpResponse*)executeSynchronouslyAtURL:(NSURL*)methodURL {
	//Create a new URL request object
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
	
	[self prepareURLRequestWithURL:methodURL withRequest:request];
	
	//Execute the HTTP method, saving the return data
	NSHTTPURLResponse * response;
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	
	HttpResponse * returnResponse = [[HttpResponse alloc] initWithHttpURLResponse:response withData:returnData];
	
	return returnResponse;
}

-(void)executeAsynchronouslyAtURL:(NSURL*)methodURL {
	//Create a new URL request object
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
	
	[self prepareURLRequestWithURL:methodURL withRequest:request];
	
	//DelegateMessenger * messenger = [DelegateMessenger delegateMessengerWithDelegate:delegate];
	
	[NSURLConnection connectionWithRequest:request];
}

-(void)dealloc {
	if (uploadData != nil)
		[uploadData release];
	
	[super dealloc];
}

@end
