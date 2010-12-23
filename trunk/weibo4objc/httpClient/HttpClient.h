//
//  HttpClient.h
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "HttpMethod.h"
#import "HttpResponse.h"

@interface HttpClient : NSObject {
	HttpMethod * method;
}
@property (readwrite,retain) HttpMethod * method;

-(HttpResponse*) executeMethod:(HttpMethod*) method;

@end
