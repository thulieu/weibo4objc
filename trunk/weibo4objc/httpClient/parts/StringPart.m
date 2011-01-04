//
//  StringPart.m
//  weibo4objc
//
//  Created by fanng yuan on 12/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "StringPart.h"
#import "escape.h"
#import "Constants.h"

@implementation StringPart

-(id) initWithParameter:(NSString*)valueData withName:(NSString*)valueName {
	self = [super init];	
	if (self != nil) {
		name = [valueName retain];
		value = [valueData retain];
	}
	return self;
}

-(NSData *) toData{
	NSMutableData * outputData = [[NSMutableData alloc] init];
	[outputData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n", name] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithString:@"Content-Type: text/plain; charset=UTF-8\r\n"] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithString:@"Content-Transfer-Encoding: 8bit\r\n"] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",value] dataUsingEncoding:encoding]];
	return outputData;
}

-(void) dealloc{
	[name release];
	[value release];
	[super dealloc];
}
@end
