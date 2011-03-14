//
//  OAHMAC_SHA1SignatureProviderTest.m
//  weibo4objc
//
//  Created by fanng yuan on 3/13/11.
//  Copyright 2011 fanngyuan@sina. All rights reserved.
//

#import "OAHMAC_SHA1SignatureProviderTest.h"


@implementation OAHMAC_SHA1SignatureProviderTest

- (void)testSignClearText {
    OAHMAC_SHA1SignatureProvider *provider = [[OAHMAC_SHA1SignatureProvider alloc] init];
    STAssertEqualObjects([provider signClearText:@"simon says" withSecret:@"abcedfg123456789"],
                         @"vyeIZc3+tF6F3i95IEV+AJCWBYQ=",
                         NULL);
    STAssertEqualObjects([provider signClearText:@"GET&http%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26oauth_consumer_key%3Ddpf43f3p2l4k3l03%26oauth_nonce%3Dkllo9940pd9333jh%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26oauth_version%3D1.0%26size%3Doriginal&kd94hf93k423kf44&pfkkdhi9sl3r4s00"
                                      withSecret:@"kd94hf93k423kf44&pfkkdhi9sl3r4s00"],
                         @"Gcg/323lvAsQ707p+y41y14qWfY=",
                         NULL);
}

@end
