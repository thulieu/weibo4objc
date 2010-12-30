//
//  MultipartPostMethod.h
//  weibo4objc
//
//  Created by fanng yuan on 12/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseMethod.h"
#import "PartBase.h"

@interface MultipartPostMethod : BaseMethod {
	NSMutableDictionary * parts ;
}

-(void *) addPart:(PartBase *) part;
@end
