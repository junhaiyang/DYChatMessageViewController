//
//  DYMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-3.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageView.h"

@interface DYMessageView(){
    UIControl *iconControl;
}



@end

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
        _iconView.userInteractionEnabled = YES;
        [self addSubview:_iconView];
        iconControl =[[UIControl alloc] initWithFrame:_iconView.bounds];
        iconControl.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [_iconView addSubview:iconControl];
        
        [iconControl addTarget:self action:@selector(imageDown:) forControlEvents:UIControlEventTouchDown];
        [iconControl addTarget:self action:@selector(imageClick:) forControlEvents:UIControlEventTouchUpInside];
        [iconControl addTarget:self action:@selector(imageUp:) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside|UIControlEventTouchDragOutside];
        
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_left"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 15, 5)];
        
        _bubbleView = [[UIImageView alloc] init];
        _bubbleView.userInteractionEnabled = YES;
        _bubbleView.backgroundColor=[UIColor clearColor];
        _bubbleView.image =_bubbleImage;
        
        
        [self addSubview:_bubbleView];
        
    }
    return self;
}

-(void)imageUp:(UIControl *)control{
    control.backgroundColor =[UIColor clearColor];
}
-(void)imageDown:(UIControl *)control{
    control.backgroundColor =[[UIColor blackColor] colorWithAlphaComponent:0.4f];
}
-(void)imageClick:(UIControl *)control{
    control.backgroundColor =[UIColor clearColor];
    NSLog(@"------iconAction-----");

}


-(void)setMessage:(DYMessageContent *)_message{
    message=_message;
}
-(DYMessageContent *)message{
    return message;
}


-(void)messageStateResresh{
      
    
    CGFloat _contentY = 0.0f;
    
    if(self.message.contentSize.height<ICON_WIDTH_HEIGHT/2){
        _contentY= (ICON_WIDTH_HEIGHT/2-self.message.contentSize.height)/2.0f;
    }
    
    if(self.message.userType==DYMessageUserSendType){
        _iconView.frame=CGRectMake(270, MARGIN_TOP_LEFT_RIGHT, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT);
        
         
        CGFloat _bubbleX = self.frame.size.width- (self.message.contentSize.width+25) - 63;
        CGFloat _bubbleHeight = self.message.contentSize.height;
        if(_bubbleHeight<ICON_WIDTH_HEIGHT/2){
            _bubbleHeight = ICON_WIDTH_HEIGHT/2;
        }
        
        _bubbleView.frame = CGRectMake(_bubbleX, MARGIN_TOP_LEFT_RIGHT, self.message.contentSize.width+25, _bubbleHeight+20);
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_right"] resizableImageWithCapInsets:UIEdgeInsetsMake(26, 5, 10, 10)];
        _bubbleView.image =_bubbleImage;
        
    }else{
        
        CGFloat _bubbleHeight = self.message.contentSize.height;
        if(_bubbleHeight<ICON_WIDTH_HEIGHT/2){
            _bubbleHeight = ICON_WIDTH_HEIGHT/2;
        }
        
        _iconView.frame=CGRectMake(10, MARGIN_TOP_LEFT_RIGHT, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT);
        _bubbleView.frame = CGRectMake(63, MARGIN_TOP_LEFT_RIGHT, self.message.contentSize.width+25, _bubbleHeight+20);
        
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_left"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 15, 5)];
        _bubbleView.image =_bubbleImage;
        
    }
}

@end
