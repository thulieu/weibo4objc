//
//  HttpResponse.h
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * The HttpResponse object is used for holding information about the result of a HTTP operation
 * @version 0.5
 */
@interface HttpResponse : NSObject {
	NSData * responseData;
	NSString * responseString;
	NSDictionary * headerFields;
	NSInteger statusCode;
}

/**
 * The NSDictionary object which holds the response header fields
 */
@property (readonly) NSDictionary * headerFields;

/**
 * Create a HttpResponse object, populating it with the specified data and response object
 * @param response The HTTP respone to use to populate this response
 * @param data The data returned by the HTTP method
 */
-(id)initWithHttpURLResponse:(NSHTTPURLResponse*)response withData:(NSData*)data;

/**
 * Get the data that was returned after exectuing the method
 * @return The data that was returned after executing the HTTP method
 */
-(NSData*) responseData;

/**
 * Get the data that was returned after exectuing the method, formatted as a string
 * @return A string representing the data returned by the HTTP method
 */
-(NSString*) responseString;

/**
 * Get one of the HTTP headers from the response sent after executing a HTTP method
 * @param The name of the HTTP header field you want
 * @return The requested key, or nil if the requested key couldn't be found
 */
-(NSString*) HTTPHeaderForKey:(NSString*)key;

/**
 * Get the response code sent back after executing the HTTP method
 * @return The response code
 */
-(NSInteger) statusCode;

@end
