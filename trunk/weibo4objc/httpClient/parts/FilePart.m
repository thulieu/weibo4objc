//
//  FilePart.m
//  weibo4objc
//
//  Created by fanng yuan on 12/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "FilePart.h"


@implementation FilePart


-(id) initWithNameAndFile:(NSString *) partName file:(NSURL *) fileUrl{
	self = [super init];
	if(self != nil){
		name = [partName retain];
		file = [fileUrl retain];
	}
	return self;
}

-(id) initWithNameFileContentTypeAndCharSet:(NSString *) partName file:(NSURL *) fileUrl contentType:(NSString *) contentTypeString charSet:(NSString *) charSetString{
	self = [super init];
	if(self != nil){
		name = [partName retain];
		file = [fileUrl retain];
		contentType = [contentTypeString retain];
		charSet = [charSetString retain];
	}
	return self;	
}

-(void) dealloc{
	[file release];
	[super dealloc];
}
@end
