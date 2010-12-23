//
//  XmlStatusParser.h
//  weibo4objc
//
//  Created by fanng yuan on 12/14/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XmlStatusParser : NSObject {

}

- (NSArray *) parseToStatuses:(NSString *) statusesString;
- (NSArray *) parseToComments:(NSString *) commentsString;
- (NSArray *) parseToDms:(NSString *) dmsString;

@end
