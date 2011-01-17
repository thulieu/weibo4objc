//
//  MultipartPostMethod.m
//  weibo4objc
//
//  Created by fanng yuan on 12/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "MultipartPostMethod.h"
#import "Constants.h"
#import "escape.h"

@implementation MultipartPostMethod

-(id) init{
	self = [super init];
	if(self != nil){
		parts = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void *) addPart:(PartBase *)part{
	[parts addObject:part];
}


-(NSString*)generateBoundary {
	//The characters to use when generating the boundary
	NSString * boundChars = @"-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	//Set the seed value for the random number generator
	srandom(time(NULL));
	
	//Get a random number between 30 and 40 for the length of the boundary
	int boundSize = 30 + (random() % 11);
	
	NSMutableString * boundaryString = [[NSMutableString alloc] initWithCapacity:boundSize];
	
	//Create the boundary string with random characters from the character pool
	for (int x = 0; x < boundSize; x++) {
		[boundaryString appendFormat:@"%c", [boundChars characterAtIndex:(random() % [boundChars length])]];
	}
	
	return boundaryString;
}

-(void)prepareRequestWithURL:(NSURL*)methodURL withRequest:(NSMutableURLRequest*)urlRequest {
	NSString * boundary = [self generateBoundary];
	NSString * contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	
	//Set up the request
	[urlRequest setURL:methodURL];
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
	
	//for headers
	for(NSString* key in headers){
		[urlRequest addValue:[headers valueForKey:key] forHTTPHeaderField:key];
	}	
	
	//Set up the body
	NSMutableData * requestBody = [[NSMutableData alloc] init];
	
	for (int i = 0; i < [parts count]; i++) {
		PartBase * cPart = [parts objectAtIndex:i];
		[requestBody appendData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:encoding]];
		[requestBody appendData:[cPart toData]];
	}
	
	[requestBody appendData:[[NSString stringWithFormat:@"--%@--\r\n",boundary] dataUsingEncoding:encoding]];
	
	[urlRequest setHTTPBody:requestBody];
	
	[boundary release];
	[requestBody release];
}

-(HttpResponse*)executeSynchronouslyAtURL:(NSURL*)methodURL {
	NSMutableURLRequest * urlRequest = [[NSMutableURLRequest alloc] init];
	
	[self prepareRequestWithURL:methodURL withRequest:urlRequest];
	
	NSHTTPURLResponse * response;
	NSData *returnData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:nil];
	
	HttpResponse * returnResponse = [[HttpResponse alloc] initWithHttpURLResponse:response withData:returnData];
	
	[urlRequest release];
	
	return returnResponse;
}

-(void)executeAsynchronouslyAtURL:(NSURL*)methodURL{
	
	/*NSMutableURLRequest * urlRequest = [[NSMutableURLRequest alloc] init];
	
	[self prepareRequestWithURL:methodURL withRequest:urlRequest];
		
	[NSURLConnection connectionWithRequest:urlRequest];
	 */
}

@end
