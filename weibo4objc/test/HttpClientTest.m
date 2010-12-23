//
//  HttpClientTest.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "HttpClientTest.h"
#import "HttpResponse.h"
#import <Foundation/Foundation.h>

@implementation HttpClientTest

//#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application

//- (void) testAppDelegate {
    
//    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
//    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
    
//}

//#else                           // all code under test must be linked into the Unit Test bundle

- (void) testMath {
    
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
    //STFail(@"fff");
}


- (void) testGetMethod{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	HttpClient * client = [[HttpClient alloc] init];
	[client autorelease];
	HttpMethod * method = [[HttpMethod alloc] init];
	[method autorelease];
	NSURL * url = [[NSURL alloc] initWithString:@"http://www.google.com"] ;
	[url autorelease];
	[method setUrl:url];
	HttpResponse * response = [client executeMethod: method];
	//[response autorelease];
	
	NSLog([response responseString]);
	[pool release];
}

- (void) testPutMethod{
}

- (void) testPostMethod{
}


//#endif


@end
