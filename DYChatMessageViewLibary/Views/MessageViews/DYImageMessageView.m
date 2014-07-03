//
//  DYImageMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYImageMessageView.h" 

@implementation DYImageMessageView

+(void)load{
    [DYMessageFactory registerMessageType:kDYMessageTypeImage viewClazz:[DYImageMessageView class]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        imageView =[[UIImageView alloc] initWithFrame:CGRectZero]; 
        [_bubbleView addSubview:imageView];
         
    }
    return self;
}


+(CGSize)messageSizeToFit:(DYMessageContent *)msg{
    NSString *string = [[NSString alloc] initWithBytes:msg.message.bytes length:msg.message.length encoding:NSUTF8StringEncoding];
    UIImage *image = [UIImage imageWithContentsOfFile:string];
    
    
    CGFloat wscale = image.size.width / PIC_MAX_WIDTH_HEIGHT;
    CGFloat hscale = image.size.height / PIC_MIN_WIDTH_HEIGHT;
    CGFloat scale = (wscale > hscale) ? wscale : hscale;
    CGSize imageSize = CGSizeMake(image.size.width / scale, image.size.height / scale);
    
    msg.height = imageSize.height + 30.0f;
    
    return imageSize;
}

-(CGSize)messageSizeToFit{
    return [[self class] messageSizeToFit:self.message];
}

-(void)messageStateResresh{
    NSString *string = [[NSString alloc] initWithBytes:self.message.message.bytes length:self.message.message.length encoding:NSUTF8StringEncoding];
    
    UIImage *image =  [UIImage imageWithContentsOfFile:string];
    
    imageView.image =image;
    
    CGFloat _contentY = 0.0f;
    
    if(self.message.contentSize.height<ICON_WIDTH_HEIGHT/2){
        _contentY= (ICON_WIDTH_HEIGHT/2-self.message.contentSize.height)/2.0f;
    }
    
    if(self.message.userType==DYMessageUserSendType){
        imageView.frame = CGRectMake(9, MARGIN_TOP_LEFT_RIGHT + _contentY, self.message.contentSize.width, self.message.contentSize.height);
        
    }else{
        imageView.frame = CGRectMake(17, MARGIN_TOP_LEFT_RIGHT + _contentY, self.message.contentSize.width, self.message.contentSize.height);
        
    }
    
    
    [super messageStateResresh];
}

-(void)recyleView{
    
}

-(void)releaseView{
    
}
-(DYMessageMenuType)supportMenuType{
    return DYMessageMenuTypeForward|DYMessageMenuTypeDelete|DYMessageMenuTypeSave;
}


@end
