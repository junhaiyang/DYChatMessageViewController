//
//  DYMessageToastView.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-3.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMessageObj.h"

@interface DYMessageToastView : UIView<DYMessageContentViewDelegate>{
    UIImageView *_bubbleView;
    UIImage *_bubbleImage;
    
    UILabel *textLabel;

}
@property (nonatomic,strong) DYMessageContent *message;

+(UIFont *)textFont;

+(CGFloat)textWidth;

@end
