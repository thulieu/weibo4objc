//
//  JsonStatusParser.m
//  weibo4objc
//
//  Created by fanng yuan on 12/14/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "JsonStatusParser.h"
#import "SBJsonParser.h"

@interface JsonStatusParser (Private) 

+ (Status *) dicToStatus:(NSDictionary *) dic;
+ (User *) dicToUser:(NSDictionary *) dic;
+ (DirectMessage *) dicToDm:(NSDictionary *) dic;

@end

@implementation JsonStatusParser

+ (NSArray *) parseToStatuses:(NSString *) statusesString{
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError * error;
	NSArray * array = [jsonParser objectWithString:statusesString error:&error];
	NSMutableArray * result = [[NSMutableArray alloc] init];
	for(NSDictionary * dic in array){
		[result addObject:[self dicToStatus:dic]];
	}
	[jsonParser release];
	return result;
}

+ (Status *) dicToStatus:(NSDictionary *) dic {
	Status * status = [[Status alloc] init];
	[status setText:[dic objectForKey:@"text"]];
	[status setCreated_at:[dic objectForKey:@"created_at"]];
	[status setAid:[[dic objectForKey:@"id"] longLongValue]];
	[status setSource:[dic objectForKey:@"source"]];
	[status setFavorited:[[dic objectForKey:@"favorited"] boolValue]];
	[status setTruncated:[[dic objectForKey:@"truncated"] boolValue]];
	[status setIn_reply_to_status_id:[[dic objectForKey:@"in_reply_to_status_id"] longLongValue]];
	[status setIn_reply_to_user_id:[[dic objectForKey:@"in_reply_to_user_id"] intValue]];
	[status setIn_reply_to_screen_name:[dic objectForKey:@"in_reply_to_screen_name"]];
	[status setThumbnail_pic:[dic objectForKey:@"thumbnail_pic"]];
	[status setBmiddle_pic:[dic objectForKey:@"bmiddle_pic"]];
	[status setOriginal_pic:[dic objectForKey:@"original_pic"]];
	[status setLatitude:[[dic objectForKey:@"latitude"] doubleValue]];
	[status setLongitude:[[dic objectForKey:@"longitude"] doubleValue]];
	if ([dic objectForKey:@"retweeted_status"]!= nil) {
		[status setRetweeted_status:[JsonStatusParser dicToStatus:[dic objectForKey:@"retweeted_status"]]];
	}
	[status setUser:[JsonStatusParser dicToUser:[dic objectForKey:@"user"]]];
	return status;
} 

+ (Status *) parseToStatus:(NSString *)statusString{
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError * error;
	NSDictionary * dic = [jsonParser objectWithString:statusString error:&error];
	Status * status = [self dicToStatus:dic];
	[jsonParser release];
	return status;	
}

+ (User *) dicToUser:(NSDictionary *) dic{
	User * user = [[User alloc] init];
	[user setUid:[[dic objectForKey:@"id"] intValue]];
	[user setScreen_name:[dic objectForKey:@"screen_name"]];
	[user setName:[dic objectForKey:@"name"]];
	[user setProvince:[dic objectForKey:@"provice"]];
	[user setCity:[dic objectForKey:@"city"]];
	[user setLocation:[dic objectForKey:@"location"]];
	[user setDescription:[dic objectForKey:@"description"]];
	[user setUrl:[dic objectForKey:@"url"]];
	[user setProfile_image_url:[dic objectForKey:@"profile_image_url"]];
	[user setDomain:[dic objectForKey:@"domain"]];
	[user setGender:[dic objectForKey:@"gender"]];
	[user setFollowers_count:[[dic objectForKey:@"followers_count"] intValue]];
	[user setFriends_count:[[dic objectForKey:@"friends_count"] intValue]];
	[user setStatuses_count:[[dic objectForKey:@"statuses_count"] intValue]];
	[user setFavourites_count:[[dic objectForKey:@"favourites_count"] intValue]];
	[user setCreated_at:[dic objectForKey:@"created_at"]];
	[user setFollowing:[[dic objectForKey:@"following"] boolValue]];
	[user setVerified:[[dic objectForKey:@"verified"] boolValue]];
	[user setAllow_all_act_msg:[[dic objectForKey:@"allow_all_act_msg"] boolValue]];
	[user setGeo_enabled:[[dic objectForKey:@"geo_enabled"] boolValue]];
	if([dic objectForKey:@"status"]!=nil)
		[user setStatus:[JsonStatusParser dicToStatus:[dic objectForKey:@"status"]]];
	return user;
}

+ (Comment *) dicToComment:(NSDictionary *) dic{
	Comment * comment = [[Comment alloc] init];
	[comment setCreated_at:[dic objectForKey:@"created_at"]];
	[comment setAid:[[dic objectForKey:@"id"]longLongValue]];
	[comment setText:[dic objectForKey:@"text"]];
	[comment setUser:[JsonStatusParser dicToUser:[dic objectForKey:@"user"]]];
	return comment;
}

+ (Comment *) parseToComment:(NSString *) commentStrig{
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError * error;
	NSDictionary * dic = [jsonParser objectWithString:commentStrig error:&error];
	Comment * comment = [self dicToComment:dic];
	[jsonParser release];
	[dic release];
	return comment;	
}

+ (NSArray *) parseToComments:(NSString *) commentsString{
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError * error;
	NSArray * array = [jsonParser objectWithString:commentsString error:&error];
	NSMutableArray * result = [[NSMutableArray alloc] init];
	for(NSDictionary * dic in array){
		[result addObject:[self dicToComment:dic]];
	}
	[jsonParser release];
	[array release];
	return result;
}

+ (NSArray *) parseToDms:(NSString *) dmsString{
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError * error;
	NSArray * array = [jsonParser objectWithString:dmsString error:&error];
	NSMutableArray * result = [[NSMutableArray alloc] init];
	for(NSDictionary * dic in array){
		[result addObject:[self dicToDm:dic]];
	}
	[jsonParser release];
	[array release];
	return result;
}

+ (DirectMessage *) parseToDm:(NSString *) dmString{
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError * error;
	NSDictionary * dic = [jsonParser objectWithString:dmString error:&error];
	[jsonParser release];
	DirectMessage * dm = [self dicToDm:dic];
	[dic release];
	return dm;		
}

+ (DirectMessage *) dicToDm:(NSDictionary *) dic{
	DirectMessage * dm = [[DirectMessage alloc]init];
	[dm setCreated_at:[dic objectForKey:@"created_at"]];
	[dm setAid:[[dic objectForKey:@"id"] longLongValue]];
	[dm setText:[dic objectForKey:@"text"]];
	[dm setSender_id:[[dic objectForKey:@"sender_id"] longLongValue]];
	[dm setRecipient_id:[[dic objectForKey:@"recipient_id"]longLongValue]];
	[dm setSender_screen_name:[dic objectForKey:@"sender_screen_name"]];
	[dm setRecipient_screen_name:[dic objectForKey:@"recipient_screen_name"]];
	[dm setSender:[JsonStatusParser dicToUser:[dic objectForKey:@"sender"]]];
	[dm setRecipient:[JsonStatusParser dicToUser:[dic objectForKey:@"recipient"]]];
	return dm;		
}

+ (ServerSideError *) parsetoServerSideError:(NSString *) errorString{
	SBJsonParser * jsonParser = [[SBJsonParser alloc] init];
	NSDictionary * dic =[jsonParser objectWithString:errorString error:nil];
	ServerSideError * error = [[ServerSideError alloc] init];
	[error setRequest:[dic objectForKey:@"request"]];
	[error setError_code:[[dic objectForKey:@"error_code"] intValue]];
	[error setError:[dic objectForKey:@"error"]];
	[jsonParser release];
	return error;
}

@end
