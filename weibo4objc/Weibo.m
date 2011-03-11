//
//  Weibo.m
//  weibo4objc
//
//  Created by fanng yuan on 11/29/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "Weibo.h"
#import "HttpMethod.h"
#import "Base64.h"
#import "JsonStatusParser.h"
#import "StringPart.h"
#import "FilePart.h"

@interface Weibo (Private) 

- (NSString *) generateParameterString:(NSDictionary *) parameters;
- (void *) generateBodyDic:(NSMutableDictionary *) bodyDic paraKey:(NSString *) key paraValue:(NSString *) value;	
-(HttpMethod *) getMethod:(NSString *) urlString;
-(HttpMethod *) putMethod:(NSString *) urlString;	
-(HttpMethod *) postMethd:(NSString *) urlString;
- (NSString *) retrieveData:(NSString *) urlString callMethod:(methodEnum ) methodE body:(NSDictionary *) httpbody;
-(NSString * ) uploadData:(NSString *) status url:(NSString *) urlString picture:(NSString *) pic lat:(double ) lat log:(double) log;
- (NSDictionary *) setAuth;

@end

@implementation Weibo

@synthesize _consumerKey;
@synthesize _consumerSecret;
@synthesize _accessToken;

@synthesize _username;
@synthesize _password;
@synthesize useOauth;


NSString * baseUrl = @"http://220.181.129.103/";
NSString * error = @"error_code";

-(id) init{
	self = [super init];
	if(self != nil){
		client = [[HttpClient alloc] init];
		useOauth = TRUE;
	}
	return self;
}

-(void) dealloc{
	[_consumerKey release];
	[_consumerSecret release];
	[_accessToken release];
	[_username release];
	[_password release];
	[client release];
	[super dealloc];
}

- (NSArray *)getPublicTimeline:(int) count{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/public_timeline.json?source=%@",_consumerKey];
	if(count > 0)
		[urlString appendFormat:@"&count=%d",count];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToStatuses:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;
}

- (Status *)statusUpdate:(NSString *) status inReplyToStatusId:(weiboId) replyToId latitude:(double) lat longitude:(double) longitude{
	if(status == nil){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/update.json?source=%@",_consumerKey];
	NSMutableDictionary * mbody = [[NSMutableDictionary alloc] init];
	[mbody setObject:status forKey:@"status"];
	if(replyToId!=nilReplyId)
	[self generateBodyDic:mbody paraKey:@"in_reply_to_status_id" paraValue:[NSString stringWithFormat:@"%llu",replyToId]];
	if(lat != nilLatitude)
	[self generateBodyDic:mbody paraKey:@"lat" paraValue:[NSString stringWithFormat:@"%f",lat] ];
	if(longitude != nilLongitude)
	[self generateBodyDic:mbody paraKey:@"long" paraValue:[NSString stringWithFormat:@"%f",longitude] ];
	NSString * resultString = [self retrieveData:urlString callMethod: POST body:mbody];
	NSRange range = [resultString rangeOfString:error];
	if(range.location == NSNotFound){
		Status * result = [JsonStatusParser parseToStatus:resultString];
		[urlString release];
		[result autorelease];
		[resultString release];
		[mbody release];
		return result;	
	}else{
		ServerSideException * exception = [[[ServerSideException alloc] init] autorelease];
		ServerSideError * errorMsg = [JsonStatusParser parsetoServerSideError:resultString];
		[exception setError:errorMsg];
		[errorMsg release];
		[urlString release];
		[resultString release];
		[mbody release];
		@throw exception;
	}
}

- (Status *)statusUpload:(NSString *) status pic:(NSString *) pic latitude:(double ) latitude longitude:(double) longitude{
	if(status == nil||pic == nil){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/upload.json?source=%@",_consumerKey];
	NSString * resultString = [self uploadData:status url:urlString picture:pic lat:latitude log:longitude];
	NSRange range = [resultString rangeOfString:error];
	if(range.location == NSNotFound){
		Status * result = [JsonStatusParser parseToStatus:resultString];
		[urlString release];
		[result autorelease];
		[resultString release];
		return result;	
	}else{
		ServerSideException * exception = [[[ServerSideException alloc] init] autorelease];
		ServerSideError * errorMsg = [JsonStatusParser parsetoServerSideError:resultString];
		[exception setError:errorMsg];
		[errorMsg release];
		[urlString release];
		[resultString release];
		@throw exception;
	}
}

-(NSString * ) uploadData:(NSString *) status url:(NSString *) urlString picture:(NSString *) pic lat:(double ) lat log:(double) log{
	NSURL * url = [[NSURL alloc] initWithString:urlString];
	HttpMethod * method = [[HttpMethod alloc] initWithMethod:MULTI];
	StringPart * statusPart = [[StringPart alloc] initWithParameter:status withName:@"status"];
	NSURL * picUrl = [[NSURL alloc] initWithString:pic];
	FilePart * picPart = [[FilePart alloc] initWithNameAndFile:@"pic" file:picUrl];
	[method addPart:statusPart];
	[method addPart:picPart];
	if(lat != nilLatitude){
		StringPart * latPart = [[StringPart alloc] initWithParameter:[[[NSString alloc] initWithFormat:@"%f",lat] autorelease] withName:@"latitude"];
		[method addPart:latPart];
		[latPart release];
	}
	if(log != nilLongitude){
		StringPart * logPart = [[StringPart alloc] initWithParameter:[[[NSString alloc] initWithFormat:@"%f",log] autorelease] withName:@"longitude"];
		[method addPart:logPart];
		[logPart release];
	}	
	[method setUrl:url];
	NSDictionary * headers = [self setAuth];
	[method setHeaderFields:headers];
	HttpResponse * response =[client executeMethod:method];
	[url release];
	[method release];
	return [response responseString];
}

- (NSArray *)getFriendsTimeline:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/friends_timeline.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],@"since_id",[NSNumber numberWithInt:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToStatuses:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;	
}

- (NSArray *)getUserTimeline:(weiboId) uid userId:(int) userId screenName:(NSString *) screenName 
sinceId:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	// uid will lost at here temporarily
	[urlString appendFormat:@"statuses/user_timeline.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:uid],@"user_id",[NSNumber numberWithLongLong:sinceId],@"since_id",[NSNumber numberWithLongLong:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToStatuses:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;		
}

- (NSArray *)getMentions:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/mentions.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],
							  @"since_id",[NSNumber numberWithLongLong:maxid],@"max_id",
							  [NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToStatuses:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;			
}

- (NSArray *)getCommentsTimeline:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/comments_timeline.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],@"since_id",
							  [NSNumber numberWithLongLong:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToComments:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;			
}

- (NSArray *)getCommentsByMe:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/comments_by_me.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],@"since_id",
							  [NSNumber numberWithLongLong:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToComments:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;				
}

- (NSArray *)getCommentsToMe:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/comments_timeline.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],@"since_id",
							  [NSNumber numberWithLongLong:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToComments:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;				
}

- (NSArray *)getComments:(weiboId) statusId count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/comments.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:statusId],@"id",
							  [NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToStatuses:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;				
}

- (Comment *)comment:(weiboId) statusId commentString:(NSString *) commentString{
	if(statusId == NULL||commentString==nil){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/comment.json?source=%@",_consumerKey];
	//todo add new check
	NSDictionary * mbody = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:statusId],@"id",
							commentString,@"comment",nil];
	NSString * resultString = [self retrieveData:urlString callMethod:POST body:mbody];
	Comment * result = [JsonStatusParser parseToComment:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;					
}

- (NSString *) retrieveData:(NSString *) urlString callMethod:(methodEnum ) methodE body:(NSDictionary *) httpbody{
	NSURL * url = [[NSURL alloc] initWithString:urlString];
	HttpMethod * method = [[HttpMethod alloc] initWithMethod:methodE];
	[method setUrl:url];
	NSDictionary * headers = [self setAuth];
	[method setHeaderFields:headers];
	[method setBody:httpbody]; 
	HttpResponse * response =[client executeMethod:method];
	[url release];
	[method release];
	return [response responseString];
}


- (NSArray *)getDms:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"direct_messages.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],@"since_id",
							  [NSNumber numberWithLongLong:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:maxCount],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToDms:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;					
}

- (NSArray *)getDmsSent:(weiboId) sinceId maxId:(weiboId) maxid count:(int) maxCount page:(int) currentPage{
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"direct_messages/sent.json?source=%@",_consumerKey];
	NSDictionary * paraDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:sinceId],@"since_id",
							  [NSNumber numberWithLongLong:maxid],@"max_id",[NSNumber numberWithInt:maxCount],@"count",
							  [NSNumber numberWithInt:currentPage],@"page",nil];
	NSString * paraString = [self generateParameterString:paraDic];
	[urlString appendFormat:@"%@",paraString];
	[paraString release];
	NSString * resultString = [self retrieveData:urlString callMethod:GET body:nil];
	NSArray * result = [JsonStatusParser parseToDms:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;						
}

- (DirectMessage *)newDm:(int) userId screenName:(NSString *) screenName dmText:(NSString *) dm{
	if(userId<0||screenName==nil||dm==nil){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"direct_messages/new.json?source=%@",_consumerKey];
	NSDictionary * mbody = [NSDictionary dictionaryWithObjectsAndKeys:dm,@"text",nil];
	NSString * resultString = [self retrieveData:urlString callMethod:POST body:mbody];
	DirectMessage * result = [JsonStatusParser parseToDm:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;					
}

- (DirectMessage *)dmDestroy:(weiboId) dmId{
	if(dmId<0){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;		
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"direct_messages/destroy/%lf.json?source=%@",dmId,_consumerKey];
	NSString * resultString = [self retrieveData:urlString callMethod:POST body:nil];
	DirectMessage * result = [JsonStatusParser parseToDm:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;						
}

- (Status *)statusDestroy:(weiboId) statusId{
	if(statusId<0){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;		
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/destroy/%lf.json?source=%@",statusId,_consumerKey];
	NSString * resultString = [self retrieveData:urlString callMethod:POST body:nil];
	Status * result = [JsonStatusParser parseToStatus:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;							
}

- (Status *)statusRepost:(weiboId) statusId status:(NSString *) status{
	if(status == nil||statusId<=0){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/repost.json?source=%@",_consumerKey];
	NSDictionary * mbody = [NSDictionary dictionaryWithObjectsAndKeys:statusId,@"id",status,@"status",nil];
	NSString * resultString = [self retrieveData:urlString callMethod: POST body:mbody];
	Status * result = [JsonStatusParser parseToStatus:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;		
}

- (Comment *)commentDestroy:(weiboId) commentId{
	if(commentId<=0){
		InvalidParameterException * exception = [InvalidParameterException 
												 exceptionWithName:@"Invalid Parameter Exception" reason:@"Status should not be nil. " userInfo:nil];
		@throw exception;		
	}
	NSMutableString * urlString = [[NSMutableString alloc] init];
	[urlString appendString:baseUrl];
	[urlString appendFormat:@"statuses/comment_destroy/%lf.json?source=%@",commentId,_consumerKey];
	NSString * resultString = [self retrieveData:urlString callMethod:POST body:nil];
	Comment * result = [JsonStatusParser parseToComment:resultString];
	[urlString release];
	[result autorelease];
	[resultString release];
	return result;								
}

- (NSDictionary *) setAuth{
	[Base64 initialize];
	NSMutableString * tmpString = [[NSMutableString alloc]init];
	[tmpString appendFormat:_username];
	[tmpString appendFormat:@":"];
	[tmpString appendFormat:_password];
	NSData* data=[tmpString dataUsingEncoding:NSUTF8StringEncoding];
	NSString * baseString = [Base64 encode:data];
	NSString * authString = [[NSString alloc] initWithFormat:@"%@ %@",@"Basic",baseString];
	NSDictionary * headers = [NSDictionary dictionaryWithObjectsAndKeys:authString,@"Authorization",nil];
	[authString release];
	[tmpString release];
	return headers;
}

- (NSString *) generateParameterString:(NSDictionary *) parameters{
	NSMutableString * result = [[NSMutableString alloc] init];
	for(NSString * key in parameters){
		NSData * value = [parameters objectForKey:key];
		if(value != nil){
			[result appendFormat:@"&%@=%@",key,[[NSString alloc] initWithData:value encoding:encoding]];
		}
	}
	return result;
}

- (void *) generateBodyDic:(NSMutableDictionary *) bodyDic paraKey:(NSString *) key paraValue:(NSString *) value{
	if(value!=nil){
		[bodyDic setObject:value forKey:key];
	}
}

+ (NSString *)version{
} 
- (NSString *)clientName{
} 
- (NSString *)clientVersion{}
- (NSString *)clientURL{}
- (NSString *)clientSourceToken{}
- (void)setClientName:(NSString *)name version:(NSString *)version URL:(NSString *)url token:(NSString *)token{}
- (NSString *)APIDomain{}
- (void)setAPIDomain:(NSString *)domain{}
- (BOOL)usesSecureConnection{}
- (NSString *)getImageAtURL:(NSString *)urlString{}

-(HttpMethod *) getMethod:(NSString *) urlString{
	HttpMethod * method = [[HttpMethod alloc] init];
	return method;
}

-(HttpMethod *) putMethod:(NSString *) urlString{
	HttpMethod * method = [[HttpMethod alloc] initWithMethod:PUT];
	return method;	
}

-(HttpMethod *) postMethd:(NSString *) urlString{
	HttpMethod * method =[[HttpMethod alloc] initWithMethod:POST];
	return method;
}

@end
