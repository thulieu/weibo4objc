//
//  DirectMessage.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseStatus.h"
#import "User.h"

@interface DirectMessage : BaseStatus {
	int sender_id;
	int recipient_id;
	NSString * sender_screen_name;
	NSString * recipient_screen_name;
	User * sender;
	User * recipient;	
}

@property (readwrite,assign) int sender_id;
@property (readwrite,assign) int recipient_id;
@property (readwrite,retain) NSString * sender_screen_name;
@property (readwrite,retain) NSString * recipient_screen_name;
@property (readwrite,retain) User * sender;
@property (readwrite,retain) User * recipient;

@end
