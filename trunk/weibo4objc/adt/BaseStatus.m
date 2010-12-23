//
//  BaseStatus.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "BaseStatus.h"

@implementation BaseStatus

@synthesize aid;
@synthesize text;
@synthesize created_at;

-(void) dealloc{

	[text release];
	[created_at release];
	[super dealloc];	
}
@end
