//
//  DYTextMessageView.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMessageObj.h"

@interface DYTextMessageView : UILabel<DYMessageContentViewDelegate>

@property (nonatomic,strong) DYMessageContent *message;

+(UIFont *)textFont;

+(CGFloat)textWidth;


@end
