//
//  DYVoiceMessageView.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMessageObj.h"

@interface DYVoiceMessageView : UIView<DYMessageContentViewDelegate>

@property (nonatomic,strong) DYMessageContent *message;

@end
