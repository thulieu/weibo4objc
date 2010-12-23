//
//  Comment.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "Comment.h"


@implementation Comment

@synthesize source;
@synthesize user;
@synthesize status;
@synthesize reply_comment;

-(void) dealloc{

	[user release];
	[status release];
	[reply_comment release];
	[super dealloc];
}
@end
