//
//  DYTextMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYTextMessageView.h" 

@implementation DYTextMessageView
@synthesize message;
+(void)load{
    [DYMessageFactory registerMessageType:kDYMessageTypeText viewClazz:[DYTextMessageView class]];
}

-(void)setMessage:(DYMessageContent *)_message{
    message=_message;
}
-(DYMessageContent *)message{
    return message;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.numberOfLines =0 ;
        self.font = [[self class] textFont];
        self.backgroundColor =[UIColor clearColor];
    }
    return self;
}

+(UIFont *)textFont{
    return [UIFont systemFontOfSize:14.0f];
}

+(CGFloat)textWidth{
    return 210.0f;
}

+(CGSize)messageSizeToFit:(DYMessageContent *)msg{
    NSString *string = [[NSString alloc] initWithBytes:msg.message.bytes length:msg.message.length encoding:NSUTF8StringEncoding];
    
    CGSize textSize = [string sizeWithFont:[[self class] textFont] constrainedToSize:CGSizeMake([[self class] textWidth], 10000)];
    if (textSize.height > 20) {
        textSize.width = [[self class] textWidth];
    } else {
        textSize.height = textSize.height;
    }
    
    return textSize;
}

-(CGSize)messageSizeToFit{
    return [[self class] messageSizeToFit:self.message];
}

-(void)messageStateResresh{
    NSString *string = [[NSString alloc] initWithBytes:message.message.bytes length:message.message.length encoding:NSUTF8StringEncoding];
    self.text =string;
}

-(void)recyleView{

}

-(void)releaseView{

}

@end
