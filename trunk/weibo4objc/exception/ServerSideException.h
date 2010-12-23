//
//  ServerSideException.h
//  weibo4objc
//
//  Created by fanng yuan on 12/20/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerSideError.h"

@interface ServerSideException : NSException {
	ServerSideError * error;
}

@property (readwrite,retain) ServerSideError * error;
@end
