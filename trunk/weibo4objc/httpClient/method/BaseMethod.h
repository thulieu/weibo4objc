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

@end
