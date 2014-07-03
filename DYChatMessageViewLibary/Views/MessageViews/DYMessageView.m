//
//  DYMessageView.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-3.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageView.h"

@implementation DYMessageView

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

-(void)releaseView{
    for (UIView *view in self.subviews) {
//         view rem
    }
}

@end
