//
//  PartBase.m
//  weibo4objc
//
//  Created by fanng yuan on 12/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//
#import "PartBase.h"


@implementation PartBase

@synthesize charSet;
@synthesize contentType;
@synthesize name;
@synthesize transferEncoding;
@synthesize length;

-(void) dealloc{
	[charSet release];
	[contentType release];
	[name release];
	[transferEncoding release];
	[super dealloc];
}

@end
