//
//  DYMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-3.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageView.h"

@implementation DYMessageView
@synthesize message;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        self.backgroundColor=[UIColor clearColor];
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT)];
        _iconView.backgroundColor=[UIColor clearColor];
        _iconView.image=[UIImage imageNamed:@"chat_user_icon"];
        [self addSubview:_iconView];
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_left"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 15, 5)];
        
        _bubbleView = [[UIImageView alloc] init];
        _bubbleView.userInteractionEnabled = YES;
        _bubbleView.backgroundColor=[UIColor clearColor];
        _bubbleView.image =_bubbleImage;
        [self addSubview:_bubbleView];
        
    }
    return self;
}

-(void)setMessage:(DYMessageContent *)_message{
    message=_message;
}
-(DYMessageContent *)message{
    return message;
}


-(void)messageStateResresh{
    
    CGFloat _contentY = 0.0f;
    
    if(self.message.size.height<ICON_WIDTH_HEIGHT/2){
        _contentY= (ICON_WIDTH_HEIGHT/2-self.message.size.height)/2.0f;
    }
    
    if(self.message.userType==DYMessageUserSendType){
        _iconView.frame=CGRectMake(270, MARGIN_TOP_LEFT_RIGHT, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT);
        
         
        CGFloat _bubbleX = self.frame.size.width- (self.message.size.width+25) - 63;
        CGFloat _bubbleHeight = self.message.size.height;
        if(_bubbleHeight<ICON_WIDTH_HEIGHT/2){
            _bubbleHeight = ICON_WIDTH_HEIGHT/2;
        }
        
        _bubbleView.frame = CGRectMake(_bubbleX, MARGIN_TOP_LEFT_RIGHT, self.message.size.width+25, _bubbleHeight+20);
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_right"] resizableImageWithCapInsets:UIEdgeInsetsMake(26, 5, 10, 10)];
        _bubbleView.image =_bubbleImage;
        
    }else{
        
        CGFloat _bubbleHeight = self.message.size.height;
        if(_bubbleHeight<ICON_WIDTH_HEIGHT/2){
            _bubbleHeight = ICON_WIDTH_HEIGHT/2;
        }
        
        _iconView.frame=CGRectMake(10, MARGIN_TOP_LEFT_RIGHT, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT);
        _bubbleView.frame = CGRectMake(63, MARGIN_TOP_LEFT_RIGHT, self.message.size.width+25, _bubbleHeight+20);
        
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_left"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 15, 5)];
        _bubbleView.image =_bubbleImage;
        
    }
}

@end
