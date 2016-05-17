//
//  WebServieceCall.h
//  NatioveWSCall
//
//  Created by Tops on 12/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^WebSuccessBlock)(id respocneDATA);
typedef void(^WebFailureBlock)(id FailDATA);
@interface WebServieceCall : NSObject{
}
+(WebServieceCall *)sharedSingleton;
-(void)GETCall:(NSString *)url success:(WebSuccessBlock)successBlock failure:(WebFailureBlock)failBlock ;
-(void)POSTCall:(NSString *)strulr :(NSMutableDictionary *) param sucess:(WebSuccessBlock) successBlock filure:(WebFailureBlock) failBlock;
-(void)UPLOADImageCall :(NSString *)strURL :(NSMutableDictionary *)param :(NSData *)imageData success:(WebSuccessBlock)BlockSuccess Failure:(WebFailureBlock) BlockFail;
@end
