//
//  FilePart.m
//  weibo4objc
//
//  Created by fanng yuan on 12/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "FilePart.h"
#import "Constants.h"

@implementation FilePart


-(id) initWithNameAndFile:(NSString *) partName file:(NSURL *) fileUrl{
	if([fileUrl isFileURL]){
		self = [super init];
		if(self != nil){
			name = [partName retain];
			file = [fileUrl retain];
		}
		return self;
	}
	return nil;
}

-(id) initWithNameFileContentTypeAndCharSet:(NSString *) partName file:(NSURL *) fileUrl contentType:(NSString *) contentTypeString charSet:(NSString *) charSetString{
	if([fileUrl isFileURL]){
		self = [super init];
		if(self != nil){
			name = [partName retain];
			file = [fileUrl retain];
			contentType = [contentTypeString retain];
			charSet = [charSetString retain];
		}
		return self;	
	}
	return nil;
}

-(NSData *) toData{
	NSMutableData * outputData = [[NSMutableData alloc] init];
	NSString * fileName = [[[file absoluteString] componentsSeparatedByString:@"/"] lastObject];
	
	//Get the file data
	NSData * fileData = [NSData dataWithContentsOfURL:file];
	
	[outputData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", name, fileName] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n"] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithString:@"Content-Transfer-Encoding: binary\r\n\r\n"] dataUsingEncoding:encoding]];
	[outputData appendData:[NSData dataWithData:fileData]];
	[outputData appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:encoding]];
	return outputData;
}

-(void) dealloc{
	[file release];
	[super dealloc];
}
@end
