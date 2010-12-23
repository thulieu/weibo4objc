//
//  JsonStatusParser.h
//  weibo4objc
//
//  Created by fanng yuan on 12/14/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"
#import "Comment.h"
#import "DirectMessage.h"
#import "ServerSideError.h"

@interface JsonStatusParser : NSObject {

}

+ (ServerSideError *) parsetoServerSideError:(NSString *) errorString;
+ (NSArray *) parseToStatuses:(NSString *) statusesString;
+ (Status *) parseToStatus:(NSString *)statusString;
+ (NSArray *) parseToComments:(NSString *) commentsString;
+ (Comment *) parseToComment:(NSString *) commentStrig;
+ (NSArray *) parseToDms:(NSString *) dmsString;
+ (DirectMessage *) parseToDm:(NSString *) dmString;

@end
