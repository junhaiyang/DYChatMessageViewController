//
//  DYMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-6-30.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageView.h"

NSString *const kDYMessageTypeText      = @"Text";
NSString *const kDYMessageTypeImage      = @"Image";
NSString *const kDYMessageTypeVoice      = @"Voice";
NSString *const kDYMessageTypeToast      = @"Toast";

@implementation DYMessageContent


-(void)prepareBuild{
    self.size = [DYMessageFactory messageSizeToFit:self];
}

@end


@interface DYMessageFactory(){
    

}
@property (nonatomic,strong)NSMutableDictionary *caches;
@property (nonatomic,strong)NSMutableDictionary *classes;

@end

@implementation DYMessageFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.caches = [[NSMutableDictionary alloc] init];
        self.classes = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (DYMessageFactory *)sharedManager {
    static DYMessageFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DYMessageFactory alloc] init];
        // Do any other initialisation stuff here
    });
    
    return sharedInstance;
}


+(void)registerMessageType:(NSString *)type viewClazz:(Class<DYMessageContentViewDelegate>)clazz{
    
    UIView<DYMessageContentViewDelegate> *view =[[DYMessageFactory sharedManager].caches objectForKey:type];
    if(view&&[view isMemberOfClass:clazz]){
        return;
    }
    
    [[DYMessageFactory sharedManager].classes setObject:clazz forKey:type];
}

+(void)unregisterMessageType:(NSString *)type{
    [[DYMessageFactory sharedManager].classes removeObjectForKey:type];
    UIView<DYMessageContentViewDelegate> *view =[[DYMessageFactory sharedManager].caches objectForKey:type];
    
    [view releaseView];
    [[DYMessageFactory sharedManager].classes removeObjectForKey:type];
}

+(CGSize)messageSizeToFit:(DYMessageContent *)msg{
    Class<DYMessageContentViewDelegate> clazz = [[DYMessageFactory sharedManager].classes objectForKey:msg.type];
    return [clazz messageSizeToFit:msg];
}


+(UIView<DYMessageContentViewDelegate> *)loadMessageView:(NSString *)type{
    UIView<DYMessageContentViewDelegate> *view =[[DYMessageFactory sharedManager].caches objectForKey:type];
    if(view==nil){
        Class clazz = [[DYMessageFactory sharedManager].classes objectForKey:type];
        view =[[clazz alloc] init];
      }
    return view;
}

+(void)recyleMessageView:(UIView<DYMessageContentViewDelegate> *)view{
    [view recyleView];
    if([[DYMessageFactory sharedManager].caches objectForKey:view.message.type]){
        [view releaseView];
    }else{
        [[DYMessageFactory sharedManager].caches setObject:view forKey:view.message.type];
    }
    
}

+(void)releaseALLMessageView{
    for (UIView<DYMessageContentViewDelegate> *view in [DYMessageFactory sharedManager].caches.allValues) {
        [view releaseView];
    }
    
    [[DYMessageFactory sharedManager].caches removeAllObjects];
}

@end
