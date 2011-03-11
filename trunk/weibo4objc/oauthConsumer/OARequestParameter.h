//
//  OARequestParameter.h
//  weibo4objc
//
//  Created by fanng yuan on 3/11/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OARequestParameter : NSObject {
	@protected
		NSString *name;
		NSString *value;
}
@property(retain) NSString *name;
@property(retain) NSString *value;
	
+ (id)requestParameterWithName:(NSString *)aName value:(NSString *)aValue;
- (id)initWithName:(NSString *)aName value:(NSString *)aValue;
- (NSString *)URLEncodedName;
- (NSString *)URLEncodedValue;
- (NSString *)URLEncodedNameValuePair;
	
@end
