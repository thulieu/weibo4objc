//
//  FilePart.h
//  weibo4objc
//
//  Created by fanng yuan on 12/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PartBase.h"

@interface FilePart : PartBase {
	NSURL * file;
	
}


-(id) initWithNameAndFile:(NSString *) partName file:(NSURL *) fileUrl;
-(id) initWithNameFileContentTypeAndCharSet:(NSString *) partName file:(NSURL *) fileUrl contentType:(NSString *) contentTypeString charSet:(NSString *) charSetString;

@end
