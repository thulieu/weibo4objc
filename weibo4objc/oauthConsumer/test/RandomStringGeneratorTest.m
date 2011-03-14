//
//  RandomStringGeneratorTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/14/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "RandomStringGeneratorTest.h"


@implementation RandomStringGeneratorTest

-(void) testGenerateRandomString{
	RandomStringGenerator * random = [[RandomStringGenerator alloc] init];
	STAssertTrue(![[random genRandStringLength:8] isEqual:[random genRandStringLength:8]],@"those two string should not be equal");
}

@end
