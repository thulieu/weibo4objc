//
//  main.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "main.h"
#import "Weibo.h"

int main(int argc, char *argv[]) {
 	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	Weibo * weibo = [[Weibo alloc]init];
	[weibo autorelease];
	//[weibo set_username:@"loopb@sina.cn"];
	[weibo set_username:@"14233221"];
	[weibo set_password:@"123456"];
	[weibo set_consumerKey:@"1852823608"];
	@try{
		//Status * statusme = [weibo statusUpdate:@"aaa1" inReplyToStatusId:1000 latitude:nilLatitude longitude:nilLongitude];
		//Status * statusme = [weibo statusUpdate:@"111" pic:@"file:///Users/fanngyuan/Downloads/IMG_0750.jpg" latitude:nilLatitude longitude:nilLongitude];
		Status * statusme = [weibo statusUpdate:@"122ca" inReplyToStatusId:nilReplyId latitude:nilLatitude longitude:nilLongitude];
		Comment * comment = [weibo comment:[statusme aid] commentString:@"aaa"];
		//NSLog([statusme description]);	
		NSLog([comment description]);
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
