//
//  OAConsumer.h
//  weibo4objc
//
//  Created by fanng yuan on 3/11/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OAConsumer : NSObject {
@protected
	NSString *key;
	NSString *secret;
}
@property(retain) NSString *key;
@property(retain) NSString *secret;

- (id)initWithKey:(NSString *)aKey secret:(NSString *)aSecret;

@end
