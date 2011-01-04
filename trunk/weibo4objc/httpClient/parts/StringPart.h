//
//  StringPart.h
//  weibo4objc
//
//  Created by fanng yuan on 12/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PartBase.h"

@interface StringPart : PartBase {
	NSString * value;
}
-(id) initWithParameter:(NSString*)valueData withName:(NSString*)valueName;

@end
