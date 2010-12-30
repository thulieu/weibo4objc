//
//  MultipartPostMethod.m
//  weibo4objc
//
//  Created by fanng yuan on 12/30/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "MultipartPostMethod.h"
#import "Constants.h"

@implementation MultipartPostMethod

-(HttpResponse*)executeSynchronouslyAtURL:(NSURL*)methodURL {
	//Call the executeMethod function from the super class, giving the appropriate parameters
	return [super executeMethodSynchronously:methodURL methodType:@"POST" dataInBody:YES contentType:@"multipart/form-data"];
}

-(void)executeAsynchronouslyAtURL:(NSURL*)methodURL {
	[super executeMethodAsynchronously:methodURL methodType:@"POST" dataInBody:YES contentType:@"multipart/form-data"];
}

- (NSData*)generateFormData:(NSDictionary*)dict
{
	NSString* boundary = [NSString stringWithString:@"_insert_some_boundary_here_"];
	NSArray* keys = [dict allKeys];
	NSMutableData* result = [[NSMutableData alloc] initWithCapacity:100];
	
	int i;
	for (i = 0; i < [keys count]; i++) 
	{
		id value = [dict valueForKey: [keys objectAtIndex: i]];
		[result appendData:[[NSString stringWithFormat:@"--%@\n", boundary] dataUsingEncoding:encoding]];
		if ([value class] == [NSString class] || [value class] == [NSConstantString class])
		{
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", [keys objectAtIndex:i]] dataUsingEncoding:encoding]];
			[result appendData:[[NSString stringWithFormat:@"%@",value] dataUsingEncoding:encoding]];
		}
		else if ([value class] == [NSURL class] && [value isFileURL])
		{
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\n", [keys objectAtIndex:i], [[value path] lastPathComponent]] dataUsingEncoding:encoding]];
			[result appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\n\n"] dataUsingEncoding:encoding]];
			[result appendData:[NSData dataWithContentsOfFile:[value path]]];
		}
		[result appendData:[[NSString stringWithString:@"\n"] dataUsingEncoding:encoding]];
	}
	[result appendData:[[NSString stringWithFormat:@"--%@--\n", boundary] dataUsingEncoding:encoding]];
	
	return [result autorelease];
}

@end
