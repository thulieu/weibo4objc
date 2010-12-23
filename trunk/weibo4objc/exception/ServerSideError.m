//
//  ServerSideError.m
//  weibo4objc
//
//  Created by fanng yuan on 12/20/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "ServerSideError.h"


@implementation ServerSideError

@synthesize request;
@synthesize error_code;
@synthesize error;

-(void) dealloc{
	[request release];
	[error release];
	[super dealloc];
}
@end
