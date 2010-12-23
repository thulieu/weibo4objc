//
//  PutMethod.h
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseMethod.h"

@interface PutMethod : BaseMethod {
	NSData * uploadData;
}

/**
 * Create a PUT request which will upload the speicifed data
 * @param data The data to upload
 */
-(id)initWithData:(NSData*)data;

/**
 * Create a PUT request which will upload the file pointed to by url
 * @param url The file to upload
 */
-(id)initWithContentsOfURL:(NSURL*)url;

@end
