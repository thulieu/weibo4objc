//
//  BaseStatus.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef unsigned long long weiboId;

@interface BaseStatus : NSObject {
	weiboId aid;
	NSDate * created_at;
	NSString * text;
	
}

@property (readwrite,assign) weiboId aid;
@property (readwrite,retain) NSDate * created_at;
@property (readwrite,retain) NSString * text;

@end
