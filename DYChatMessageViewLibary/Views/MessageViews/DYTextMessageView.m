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
 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        textLabel =[[UILabel alloc] initWithFrame:CGRectZero];
        textLabel.numberOfLines =0 ;
        textLabel.font = [[self class] textFont];
        [_bubbleView addSubview:textLabel];
        
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
    textLabel.text =string;
    
    CGFloat _contentY = 0.0f;
    
    if(self.message.size.height<ICON_WIDTH_HEIGHT/2){
        _contentY= (ICON_WIDTH_HEIGHT/2-self.message.size.height)/2.0f;
    }
    
    if(self.message.userType==DYMessageUserSendType){
        textLabel.frame = CGRectMake(9, MARGIN_TOP_LEFT_RIGHT + _contentY, self.message.size.width, self.message.size.height);
        
    }else{ 
        textLabel.frame = CGRectMake(17, MARGIN_TOP_LEFT_RIGHT + _contentY, self.message.size.width, self.message.size.height);
        
    }

    
    [super messageStateResresh];
}

-(void)recyleView{

}

-(void)releaseView{

}

@end
