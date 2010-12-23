//
//  Status.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseStatus.h"
@class User;
 
@interface Status : BaseStatus {

	 NSString * source;
	 BOOL  truncated;
	 weiboId in_reply_to_status_id;
	 int in_reply_to_user_id;
	 BOOL favorited;
	 NSString * in_reply_to_screen_name;
	 double latitude;
	 double longitude;
	 NSString * thumbnail_pic;
	 NSString * bmiddle_pic;
	 NSString * original_pic;
	 Status * retweeted_status;
	 User * user;
	
}

@property (readwrite,retain) NSString * source;
@property (readwrite,assign) BOOL truncated;
@property (readwrite,assign) weiboId  in_reply_to_status_id;
@property (readwrite,assign) int in_reply_to_user_id;
@property (readwrite,assign) BOOL favorited;
@property (readwrite,retain) NSString * in_reply_to_screen_name;
@property (readwrite,assign) double latitude;
@property (readwrite,assign) double longitude;
@property (readwrite,retain) NSString * thumbnail_pic;
@property (readwrite,retain) NSString * bmiddle_pic;
@property (readwrite,retain) NSString * original_pic;
@property (readwrite,retain) Status * retweeted_status;
@property (readwrite,retain) User * user;

@end
