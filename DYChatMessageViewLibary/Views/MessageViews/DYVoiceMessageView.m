//
//  DYVoiceMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYVoiceMessageView.h"

@implementation DYVoiceMessageView

+(void)load{
    [DYMessageFactory registerMessageType:kDYMessageTypeVoice viewClazz:[DYVoiceMessageView class]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
