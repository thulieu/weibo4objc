//
//  HttpResponse.m
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "HttpResponse.h"
#import "Constants.h"


@implementation HttpResponse

@synthesize headerFields;

-(id)initWithHttpURLResponse:(NSHTTPURLResponse*)response withData:(NSData*)data {
	self = [super init];
	
	if (self != nil) {
		responseData = [data retain];
		responseString = nil;
		headerFields = [[response allHeaderFields] retain];
		statusCode = [response statusCode];
	}
	
	return self;
}

-(NSData*) responseData {
	return responseData;
}

-(NSString*) responseString {
	if (responseString == nil) {
		responseString = [[NSString alloc] initWithData:responseData encoding:encoding];
	}
	
	return responseString;
}

-(NSString*) HTTPHeaderForKey:(NSString*)key {
	return [headerFields objectForKey:key];
}

-(NSInteger) statusCode {
	return statusCode;
}

-(void)dealloc {
	[responseData release];
	if (responseString != nil)
		[responseString release];
	[headerFields release];
	
	[super dealloc];
}

@end
