//
//  DYMessageToastView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-3.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageToastView.h"

@implementation DYMessageToastView
@synthesize message;
+(void)load{
    [DYMessageFactory registerMessageType:kDYMessageTypeToast viewClazz:[DYMessageToastView class]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor=[UIColor clearColor];
        
        
        _bubbleImage = [[UIImage imageNamed:@"chat_toast"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        
        _bubbleView = [[UIImageView alloc] init];
        _bubbleView.userInteractionEnabled = YES;
        _bubbleView.backgroundColor=[UIColor clearColor];
        _bubbleView.image =_bubbleImage;
        [self addSubview:_bubbleView];
        
        textLabel =[[UILabel alloc] initWithFrame:CGRectZero];
        textLabel.numberOfLines =0 ;
        textLabel.backgroundColor=[UIColor clearColor];
        textLabel.font = [[self class] textFont];
        [_bubbleView addSubview:textLabel];
    }
    return self;
}

+(UIFont *)textFont{
    return [UIFont systemFontOfSize:12.0f];
}

+(CGFloat)textWidth{
    return 240.0f;
}

-(void)setMessage:(DYMessageContent *)_message{
    message=_message;
}
-(DYMessageContent *)message{
    return message;
}

+(CGSize)messageSizeToFit:(DYMessageContent *)msg{
    NSString *string = [[NSString alloc] initWithBytes:msg.message.bytes length:msg.message.length encoding:NSUTF8StringEncoding];
    
    CGSize textSize = [string sizeWithFont:[[self class] textFont] constrainedToSize:CGSizeMake([[self class] textWidth], 10000)];
    if (textSize.height > 20) {
        textSize.width = [[self class] textWidth];
    } else {
        textSize.height = textSize.height;
    }
    msg.height = textSize.height + 20.0f;
    
    return textSize;
}

-(CGSize)messageSizeToFit{
    return [[self class] messageSizeToFit:self.message];
}

#define MARGIN_ITEM_TOP_LEFT_RIGHT 10.0f

-(void)messageStateResresh{
    
    CGFloat _bubbleX = (self.frame.size.width- (self.message.contentSize.width+20))/2;
    CGFloat _bubbleHeight = self.message.contentSize.height;
    if(_bubbleHeight<15){
        _bubbleHeight = 15;
    }
    
    _bubbleView.frame = CGRectMake(_bubbleX, MARGIN_ITEM_TOP_LEFT_RIGHT, self.message.contentSize.width+20, _bubbleHeight+10);
    
    CGFloat textX = (_bubbleView.frame.size.width-self.message.contentSize.width)/2.0f;
    CGFloat textY = (_bubbleView.frame.size.height-self.message.contentSize.height)/2.0f;
    
    textLabel.frame= CGRectMake(textX, textY, self.message.contentSize.width, self.message.contentSize.height);
    NSString *string = [[NSString alloc] initWithBytes:self.message.message.bytes length:self.message.message.length encoding:NSUTF8StringEncoding];
    textLabel.text =string;
    
    
    
}
-(void)recyleView{
    
}

-(void)releaseView{
    
}

-(DYMessageMenuType)supportMenuType{
    return DYMessageMenuTypeNone;
}

@end
