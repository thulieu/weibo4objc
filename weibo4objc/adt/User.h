//
//  User.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Status;

@interface User : NSObject {

	int uid;
	NSString * name;
	NSString * screen_name;
	NSString * description;
	NSString * profile_image_url;
	NSString * url;
	BOOL  isProtected;
	int  followers_count;
	int  friends_count;
	NSDate * created_at;
	int  favourites_count;
	int  utc_offset;
	NSString * time_zone;
	BOOL following;
	BOOL notifications;
	int  statuses_count;
	BOOL verified;
	NSString * profile_background_color;
	NSString * profile_text_color;
	NSString * profile_link_color;
	NSString * profile_sidebar_fill_color;
	NSString * profile_sidebar_border_color;
	NSString * profile_background_image_url;
	NSString * profile_background_tile;
	NSString * province;
	NSString * city;
	NSString * location;
	NSString * domain;
	NSString * gender;
	BOOL allow_all_act_msg;
	BOOL geo_enabled;
	Status * status;	
}

@property (readwrite,assign) int uid;
@property (readwrite,retain) NSString * name;
@property (readwrite,retain) NSString * screen_name;
@property (readwrite,retain) NSString * description;
@property (readwrite,retain) NSString * profile_image_url;
@property (readwrite,retain) NSString * url;
@property (readwrite,assign) BOOL isProtected;
@property (readwrite,assign) int  followers_count;
@property (readwrite,assign) int  friends_count;
@property (readwrite,retain) NSDate * created_at;
@property (readwrite,assign) int  favourites_count;
@property (readwrite,assign) int  utc_offset;
@property (readwrite,retain) NSString * time_zone;
@property (readwrite,assign) BOOL  following;
@property (readwrite,assign) BOOL  notifications;
@property (readwrite,assign) int  statuses_count;
@property (readwrite,assign) BOOL  verified;
@property (readwrite,retain) NSString * profile_background_color;
@property (readwrite,retain) NSString * profile_text_color;
@property (readwrite,retain) NSString * profile_link_color;
@property (readwrite,retain) NSString * profile_sidebar_fill_color;
@property (readwrite,retain) NSString * profile_sidebar_border_color;
@property (readwrite,retain) NSString * profile_background_image_url;
@property (readwrite,retain) NSString * profile_background_tile;
@property (readwrite,retain) NSString * province;
@property (readwrite,retain) NSString * city;
@property (readwrite,retain) NSString * location;
@property (readwrite,retain) NSString * domain;
@property (readwrite,retain) NSString * gender;
@property (readwrite,assign) BOOL  allow_all_act_msg;
@property (readwrite,assign) BOOL  geo_enabled;
@property (readwrite,retain) Status * status;

@end
