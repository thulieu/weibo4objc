//
//  HttpMethod.h
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "HttpResponse.h"

@protocol HttpMethodDelegate

/**
 * Execute the method at the supplied URL, blocking the current thread until the result is returned
 * @param methodURL The URL to use for executing the method
 * @return A NSString* containing the results of the method execution
 */
-(HttpResponse*)executeSynchronouslyAtURL:(NSURL*)methodURL;

/**
 * Execute the method at the supplied URL.  The current thread continues executing, and results are sent through the delegate methods
 * @param methodURL The URL to use for executing the method
 */
-(void)executeAsynchronouslyAtURL:(NSURL*)methodURL;

@end
