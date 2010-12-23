//
//  ServerSideException.m
//  weibo4objc
//
//  Created by fanng yuan on 12/20/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "ServerSideException.h"


@implementation ServerSideException

@synthesize error;

-(void) dealloc{
	[error release];
	[super dealloc];
}
@end
