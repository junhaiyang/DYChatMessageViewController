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
        
        voiceImageView =[[UIImageView alloc] init];
        
        [_bubbleView addSubview:voiceImageView];
        
        redPointView =[[UIView alloc] init];
        redPointView.backgroundColor=[UIColor redColor];
        redPointView.layer.cornerRadius =6.0f;
        redPointView.layer.masksToBounds =YES;
        [_bubbleView addSubview:redPointView];
        
        timeLabel =[[UILabel alloc] init];
        timeLabel.textColor=[UIColor grayColor];
        timeLabel.backgroundColor=[UIColor clearColor];
        timeLabel.font=[UIFont systemFontOfSize:12.0f];
        [_bubbleView addSubview:timeLabel];
        
    }
    return self;
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
    
    timeLabel.text =[NSString stringWithFormat:@"%d”",(int)self.message.mediaTime];
    
    CGFloat _contentY  = (ICON_WIDTH_HEIGHT - 20)/2.0f;
    
    CGFloat _redPointY  = (ICON_WIDTH_HEIGHT - 12)/2.0f;
    
    if(self.message.userType==DYMessageUserSendType){
        
        timeLabel.frame = CGRectMake(-25, _contentY, 30, 20);
        
        voiceImageView.frame = CGRectMake(self.message.size.width, _contentY, 12, 20);
        voiceImageView.image =[UIImage imageNamed:@"chat_voice_lg"];
        redPointView.hidden = YES;
    }else{
        redPointView.hidden = NO;
        
        timeLabel.frame = CGRectMake(self.message.size.width+30, _contentY, 30, 20);
       
        voiceImageView.frame = CGRectMake(17, _contentY, 12, 20);
        redPointView.frame = CGRectMake(self.message.size.width+5, _redPointY, 12, 12);
        voiceImageView.image =[UIImage imageNamed:@"chat_voice"];
        
    }
    
    [super messageStateResresh];
}

-(void)recyleView{

}

-(void)releaseView{

}

@end
