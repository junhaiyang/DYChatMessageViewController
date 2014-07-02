//
//  DYTextMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYTextMessageView.h" 

@implementation DYTextMessageView

+(void)load{
    [DYMessageFactory registerMessageType:kDYMessageTypeText viewClazz:[DYTextMessageView class]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(UIFont *)textFont{
    return [UIFont systemFontOfSize:16.0f];
}

+(CGFloat)textWidth{
    return 160.0f;
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

}

-(void)recyleView{

}

-(void)releaseView{

}

@end
