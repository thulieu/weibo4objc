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
#import "StringPart.h"
#import "FilePart.h"

@interface MultipartPostMethod : BaseMethod {
	NSMutableArray * parts ;
}

-(void *) addPart:(PartBase *) part;
@end
