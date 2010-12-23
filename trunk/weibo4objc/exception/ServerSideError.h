//
//  ServerSideError.h
//  weibo4objc
//
//  Created by fanng yuan on 12/20/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ServerSideError : NSObject {

	NSString * request;
	int error_code;
	NSString * error;
		
}

@property (readwrite,retain) NSString * request;
@property (readwrite,assign) int error_code;
@property (readwrite,retain) NSString * error;

@end
