//
//  Comment.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseStatus.h"
#import "User.h"
#import "Status.h"

@interface Comment : BaseStatus {
	NSString * source;
	User * user;
	Status * status;
	Comment * reply_comment;
	
}

@property (readwrite,retain) NSString * source;
@property (readwrite,retain) User * user;
@property (readwrite,retain) Status * status;
@property (readwrite,retain) Comment * reply_comment;

@end
