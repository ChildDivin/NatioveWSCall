//
//  WebServieceCall.m
//  NatioveWSCall
//
//  Created by Tops on 12/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "WebServieceCall.h"
static WebServieceCall *shareObj = NULL ;
@implementation WebServieceCall{
}
+(WebServieceCall *)sharedSingleton {
    if (!shareObj) {
        shareObj= [[self alloc] init];
    }
    return shareObj;
}
-(void)GETCall:(NSString *)url success:(WebSuccessBlock)successBlock failure:(WebFailureBlock)failBlock
{
    NSURL * baseURL = [NSURL URLWithString:url];
    NSError *error=nil;
    NSURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5];
    NSHTTPURLResponse *response = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (response == nil){
        failBlock(error);
    } else {
        successBlock(dictionary);
    }
    
}
-(void)POSTCall:(NSString *)strulr :(NSMutableDictionary *) param sucess:(WebSuccessBlock) successBlock filure:(WebFailureBlock) failBlock
{
    NSError *err = nil;
    NSHTTPURLResponse *res = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:strulr]];
    request.HTTPMethod = @"POST";
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:param options:0 error:nil];
    NSString *urlString =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *stringData = [[NSString alloc] initWithFormat:@"%@", urlString];
    NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBodyData;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&res error:NULL];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
    NSLog(@"data---%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    if (res){
        successBlock(dictionary);
    }
    else{
        failBlock(err);
    }
}

-(void)UPLOADImageCall :(NSString *)strURL :(NSMutableDictionary *)param :(NSData *)imageData success:(WebSuccessBlock)BlockSuccess Failure:(WebFailureBlock) BlockFail
{
    NSError *err = nil;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:strURL]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---XXX---";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data--%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"application/x-www-form-urlencoded" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; image=\"image\"; \"filename\"=\"%d.jpg\"\r\n",1]] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"project-id\"\r\n\r\n%@",nil] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"password\"\r\n\r\n%d",4] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"email\"\r\n\r\n%d",0] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
    NSLog(@"data---%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    if (!err) {
        BlockSuccess(dictionary);
    }
    else{
        BlockFail(err);
    }
}
@end
