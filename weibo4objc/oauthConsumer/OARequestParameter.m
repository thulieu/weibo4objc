//
//  OARequestParameter.m
//  weibo4objc
//
//  Created by fanng yuan on 3/11/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OARequestParameter.h"
#import "NSString+URLEncoding.h"

@implementation OARequestParameter
@synthesize name, value;

+ (id)requestParameterWithName:(NSString *)aName value:(NSString *)aValue 
{
	return [[[OARequestParameter alloc] initWithName:aName value:aValue] autorelease];
}

- (id)initWithName:(NSString *)aName value:(NSString *)aValue 
{
    if (self = [super init])
	{
		self.name = aName;
		self.value = aValue;
	}
    return self;
}

- (void)dealloc
{
	[name release];
	[value release];
	[super dealloc];
}

- (NSString *)URLEncodedName 
{
	return [self.name URLEncodedString];
}

- (NSString *)URLEncodedValue 
{
    return [self.value URLEncodedString];
}

- (NSString *)URLEncodedNameValuePair 
{
    return [NSString stringWithFormat:@"%@=%@", [self URLEncodedName], [self URLEncodedValue]];
}

@end
