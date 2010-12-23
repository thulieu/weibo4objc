//
//  BaseMethod.h
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpMethodDelegate.h"

@interface BaseMethod : NSObject<HttpMethodDelegate> {
	NSMutableDictionary * params;	
	NSDictionary * headers;
	NSDictionary * bodies;
}

@property (readwrite,retain) NSDictionary * headers;
@property (readwrite,retain) NSDictionary * bodies;

/**
 * This method adds a parameter to be used in a GET or POST operation.  The order of the parameters is not guaranteed
 * @param paramName The name of the parameter
 * @param paramData The value to correspond to that parameter
 */
-(void)addParameter:(NSString*)paramData withName:(NSString*)paramName;

/**
 * This method adds all of the key/value pairs in a NSDictionary as parameters.  The order of the parameters is not guaranteed
 * @param dict The dictiontary to use for adding parameters
 */
-(void)addParametersFromDictionary:(NSDictionary*)dict;
+(NSString *)URLEncodedString:(NSString *) urlString;
+(NSString *)URLDecodedString:(NSString *) decodeString;
@end
