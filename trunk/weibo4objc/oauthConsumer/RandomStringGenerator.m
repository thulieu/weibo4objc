//
//  RandomStringGenerator.m
//  weibo4objc
//
//  Created by fanng yuan on 3/14/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "RandomStringGenerator.h"

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@implementation RandomStringGenerator

-(NSString *) genRandStringLength: (int) len {
	
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
	
    for (int i=0; i<len; i++) {
		[randomString appendFormat: @"%c", [letters characterAtIndex: rand()%[letters length]]];
	}
		 
	return randomString;
}
		 
@end
