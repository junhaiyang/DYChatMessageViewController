//
//  DYMessageCell.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMessageObj.h"

#define ICON_WIDTH_HEIGHT  40.0f

@interface DYMessageDataCell : UITableViewCell{
    UIImageView *_bubbleView;
    UIView<DYMessageContentViewDelegate> *_messageContentView;
    
    UIImageView *_iconView;
}


@property (nonatomic,strong) DYMessageContent *message;

@property (nonatomic,strong) UIImage *bubbleImage;

-(void)refreshCell;
-(void)releaseCell;

@end
