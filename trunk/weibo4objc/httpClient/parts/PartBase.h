/*
 *  PartBase.h
 *  weibo4objc
 *
 *  Created by fanng yuan on 12/29/10.
 *  Copyright 2010 fanngyuan@sina. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>


@interface PartBase : NSObject {
	NSString * charSet;
	NSString * contentType;
	NSString * name;
	NSString * transferEncoding;
	int length;
}

@property (readwrite,retain) NSString * charSet;
@property (readwrite,retain) NSString * contentType;
@property (readwrite,retain) NSString * name;
@property (readwrite,retain) NSString * transferEncoding;
@property (readwrite,assign) int length;
-(NSData *) toData;

@end
