//
//  main.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "main.h"
#import "HttpClient.h"
#import "HttpMethod.h"
#import "HttpResponse.h"
#import "Base64.h"
#import "Weibo.h"
#import <libxml/xmlmemory.h>
#import "JSON.h"
#import "JsonStatusParser.h"
#import "Status.h"
#include "escape.h"
#import "stdio.h"
#import "stdlib.h"

int main(int argc, char *argv[]) {
 	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	Weibo * weibo = [[Weibo alloc]init];
	[weibo autorelease];
	[weibo set_username:@"loopb@sina.cn"];
	[weibo set_password:@"123456"];
	[weibo set_consumerKey:@"1852823608"];
	@try{
	Status * statusme = [weibo statusUpdate:@"地发a被是abs从aa是a啊a啊t吧1123345" inReplyToStatusId:4520497159 latitude:1 longitude:1];
	NSLog([statusme description]);	
	}
	@catch (id ex) {
		printf("aaa");
		NSLog(@"%@",ex);
	}
	NSArray * statuses = [weibo getPublicTimeline:5];
	
	for(Status * status in statuses){
		NSLog([status description]);
	}
	[pool release];
	return 0;
}
