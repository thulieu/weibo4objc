//
//  Oauther.h
//  weibo4objc
//
//  Created by fanng yuan on 1/17/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthToken.h"

@interface Oauther : NSObject {

}

+ (NSString *) OAuthorizationHeader:(OAuthToken *) token;
@end
