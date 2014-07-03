//
//  DYMessageView.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-3.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMessageObj.h"

#define ICON_WIDTH_HEIGHT  40.0f
#define MARGIN_TOP_LEFT_RIGHT 10.0f

@interface DYMessageView : UIView<DYMessageContentViewDelegate>{
    UIImageView *_bubbleView;
    UIView<DYMessageContentViewDelegate> *_messageContentView;
    
    UIImageView *_iconView;
    
    UIImage *_bubbleImage;
    
    CGSize contentSize;
    
    CGFloat _bubbleOriginX;
}

@property (nonatomic,strong) DYMessageContent *message;

-(void)messageStateResresh;


@end
