//
//  DYImageMessageView.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMessageView.h"

#define PIC_MIN_WIDTH_HEIGHT  105.0f   //图片最小宽度
#define PIC_MAX_WIDTH_HEIGHT  149.0f   //图片最大宽度

@interface DYImageMessageView : DYMessageView{
    UIImageView *imageView;
}


@end
