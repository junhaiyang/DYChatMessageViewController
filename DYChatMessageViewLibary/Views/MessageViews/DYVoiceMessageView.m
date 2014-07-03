//
//  DYVoiceMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYVoiceMessageView.h"

@implementation DYVoiceMessageView
@synthesize message;
+(void)load{
    [DYMessageFactory registerMessageType:kDYMessageTypeVoice viewClazz:[DYVoiceMessageView class]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setMessage:(DYMessageContent *)_message{
    message =_message;
}

-(DYMessageContent *)message{
    
    return message;
}

+(CGSize)messageSizeToFit:(DYMessageContent *)msg{
    CGFloat maxWidth  = 180.0f;
    CGFloat minWidth  = 50.0f;
    
    
    CGFloat perWidth =  (maxWidth - minWidth)/30.0f;
    
    return CGSizeMake(50+perWidth*msg.mediaTime, 20.0f);
}

-(CGSize)messageSizeToFit{
    return [[self class] messageSizeToFit:self.message];
}

-(void)messageStateResresh{

}

-(void)recyleView{

}

-(void)releaseView{

}

@end
