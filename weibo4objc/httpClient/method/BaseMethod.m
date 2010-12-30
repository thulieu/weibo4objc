//
//  BaseMethod.m
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseMethod.h"
#import "Constants.h"
#include "escape.h"

@implementation BaseMethod

@synthesize headers;
@synthesize bodies;

-(id)init {
	self = [super init];
	
	if (self != nil) {
		//Initialize the dictionary used for storing parameters
		params = [[NSMutableDictionary alloc] init];
	}
	
	return self;
}

-(void)prepareMethod:(NSURL*)methodURL methodType:(NSString*)methodType dataInBody:(bool)dataInBody contentType:(NSString*)contentType withRequest:(NSMutableURLRequest*)request {
	//Set the destination URL
	[request setURL:methodURL];
	//Set the method type
	[request setHTTPMethod:methodType];
	//Set the content-type
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	//Create a data object to hold the body while we're creating it
	NSMutableData * body = [[NSMutableData alloc] init];
	
	//for headers
	for(NSString* key in headers){
		[request addValue:[headers valueForKey:key] forHTTPHeaderField:key];
	}
	
	//Loop over all the items in the parameters dictionary and add them to the body
	int cCount = 0;
	for (NSString* cKey in bodies) {
		cCount++;
		//If we've already added at least one data item, we need to add the & character between each new data item
		if (cCount > 1) {
			[body appendData:[@"&" dataUsingEncoding:encoding]];
		}
		
		char * keyBeforeEscape = [cKey UTF8String];
		char * keyAfterEscape = urlEscape(keyBeforeEscape, strlen(keyBeforeEscape));
		char * valueBeforeEscape = [[bodies objectForKey:cKey] UTF8String];
		char * valueAfterEscape = urlEscape(valueBeforeEscape, strlen(valueBeforeEscape));
		NSString * key = [NSString stringWithUTF8String:keyAfterEscape];
		NSString * value = [NSString stringWithUTF8String:valueAfterEscape];
 		//Add the parameter
		[body appendData:[[NSString stringWithFormat:@"%@=%@",key, value] dataUsingEncoding:encoding]];
		free(keyAfterEscape);
		free(valueAfterEscape);
	}

	//Add the body data in either the actual HTTP body or as part of the URL query
	if (dataInBody) { //For post methods, we add the parameters to the body
		[request setHTTPBody:body];
	} //For get methods, we have to add parameters to the url
	
	[body release];
}

-(HttpResponse*)executeMethodSynchronously:(NSURL*)methodURL methodType:(NSString*)methodType dataInBody:(bool)dataInBody contentType:(NSString*)contentType {
	
	//Create a new URL request object
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
	
	[self prepareMethod:methodURL methodType:methodType dataInBody:dataInBody contentType:contentType withRequest:request];
	
	//Execute the HTTP method, saving the return data
	NSHTTPURLResponse * response;
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	
	HttpResponse * responseObject = [[HttpResponse alloc] initWithHttpURLResponse:response withData:returnData];
	
	[request release];
	[returnData release];
	return responseObject;
}

-(void)executeMethodAsynchronously:(NSURL*)methodURL methodType:(NSString*)methodType dataInBody:(bool)dataInBody contentType:(NSString*)contentType {
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
	
	[self prepareMethod:methodURL methodType:methodType dataInBody:dataInBody contentType:contentType withRequest:request];
	
	[NSURLConnection connectionWithRequest:request];
}

-(void)dealloc{
	[params release];
	[headers release];
	[bodies release];
	[super dealloc];
}

@end
