//
//  DirectMessage.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "DirectMessage.h"


@implementation DirectMessage

@synthesize sender_id;
@synthesize recipient_id;
@synthesize sender_screen_name;
@synthesize recipient_screen_name;
@synthesize sender;
@synthesize recipient;

-(void) dealloc{

	[sender_screen_name release];
	[recipient_screen_name release];
	[sender release];
	[recipient release];
	[super dealloc];	
}
@end
