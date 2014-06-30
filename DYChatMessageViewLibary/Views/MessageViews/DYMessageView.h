//
//  DYMessageView.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-6-30.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DY_MESSAGE_TYPE_TEXT @"text"
#define DY_MESSAGE_TYPE_IMAGE @"image"
#define DY_MESSAGE_TYPE_VOICE @"voice"
#define DY_MESSAGE_TYPE_TOAST @"toast"

typedef NS_ENUM(NSInteger, DYMessageState) {
    DYMessageStateNone          =   0,
    
    DYMessageStateSending       =   1,
    DYMessageStateSendFail      =   2,
    
    DYMessageStateUnread        =   3,
    DYMessageStateReading       =   4,
    
    DYMessageStateRecording     =   5,
    
};

typedef NS_ENUM(NSInteger, DYMessageUserType) {
    DYMessageUserSendType          =   0,
    
    DYMessageUserReceiveType       =   1,
    
};

@interface DYMessageContent : NSObject

@property (nonatomic, assign) long long mid;                     //编号

@property (nonatomic, strong) NSData    *message;                //消息内容

@property (nonatomic, strong) NSString *type;

@property (nonatomic, assign) NSTimeInterval mediaTime;

@property (nonatomic,assign) CGSize size;


@end

@protocol DYMessageContentViewDelegate;

@interface DYMessageFactory : NSObject

+(void)registerMessageType:(NSString *)type viewClazz:(Class<DYMessageContentViewDelegate>)clazz;

+(void)unregisterMessageType:(NSString *)type;

+(CGSize)messageSizeToFit:(DYMessageContent *)msg;

+(UIView<DYMessageContentViewDelegate> *)loadMessageView:(NSString *)type;

+(void)recyleMessageView:(UIView<DYMessageContentViewDelegate> *)view;

+(void)releaseALLMessageView;

@end

@protocol DYMessageContentViewDelegate <NSObject>

@property (nonatomic,strong) DYMessageContent *message;

+(CGSize)messageSizeToFit:(DYMessageContent *)msg; //计算出所占位置大小

-(CGSize)messageSizeToFit;

-(void)messageViewShow;                     //显示数据和位置布局

-(void)messageStateNotify;                  //变化数据状态 

-(void)recyleView;                         //释放数据内存

-(void)releaseView;                        //完全释放界面内存

@end
