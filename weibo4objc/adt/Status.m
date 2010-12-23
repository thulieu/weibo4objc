//
//  Status.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

@synthesize source;
@synthesize truncated;
@synthesize in_reply_to_status_id;
@synthesize in_reply_to_user_id;
@synthesize favorited;
@synthesize in_reply_to_screen_name;
@synthesize latitude;
@synthesize longitude;
@synthesize thumbnail_pic;
@synthesize bmiddle_pic;
@synthesize original_pic;
@synthesize retweeted_status;
@synthesize user;

- (NSString *) description{
	NSMutableString * desc = [[NSMutableString alloc]init];
	[desc appendFormat:@"source is %@ ", [self source]];
	[desc appendFormat:@"truncated is %@ ", [self truncated]];
	[desc appendFormat:@"aid is %llu ", [self aid]];
	[desc appendFormat:@"created at is %@ ", [self created_at]];
	return desc;
}

-(void) dealloc{

	[source release];
	[in_reply_to_screen_name release];
	[thumbnail_pic release];
	[bmiddle_pic release];
	[original_pic release];
	[retweeted_status release];
	[user release];
	[super dealloc];	
}
@end
