// 
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-6-30.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <Foundation/Foundation.h>
 
extern NSString *const kDYMessageTypeText;
extern NSString *const kDYMessageTypeImage;
extern NSString *const kDYMessageTypeVoice;
extern NSString *const kDYMessageTypeToast;


#define CHAT_CONTENT_LONG_CLICK_ACTION_NOTIFICATION  @"chat_content_long_click_action"


typedef NS_ENUM(NSInteger, DYMessageState) {
    DYMessageStateNone          =   0,  //正常状态
    
    DYMessageStateSending       =   1,  //发送中
    DYMessageStateSendFail      =   2,  //发送失败
    
    DYMessageStateUnread        =   3,  //未读取
    DYMessageStateReading       =   4,  //读取中
    
    DYMessageStateRecording     =   5,  //录制中
    
};

typedef NS_ENUM(NSInteger, DYMessageUserType) {
    DYMessageUserSendType          =   0,   //发送消息
    
    DYMessageUserReceiveType       =   1,   //接收消息
    
};
 

@interface DYMessageContent : NSObject

@property (nonatomic, assign) long long mid;                     //编号

@property (nonatomic, strong) NSData    *message;                //消息内容

@property (nonatomic, strong) NSString *type;

@property (nonatomic, assign) NSTimeInterval mediaTime;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, assign) DYMessageUserType userType;


-(void)prepareBuild;

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

-(void)setMessage:(DYMessageContent *)message;

-(DYMessageContent *)message;

+(CGSize)messageSizeToFit:(DYMessageContent *)msg; //计算出所占位置大小

-(CGSize)messageSizeToFit;
 
-(void)messageStateResresh;                //刷新数据

-(void)recyleView;                         //释放数据内存

-(void)releaseView;                        //完全释放界面内存

@end
