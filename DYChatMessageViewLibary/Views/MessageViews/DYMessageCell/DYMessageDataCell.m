//
//  DYMessageCell.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageDataCell.h"


@interface DYMessageDataCell(){
    
}

@end

@implementation DYMessageDataCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        self.contentView.backgroundColor=[UIColor clearColor];
        
        _timeBubbleView = [[UIImageView alloc] init];
        _timeBubbleView.userInteractionEnabled = YES;
        _timeBubbleView.backgroundColor=[UIColor clearColor];
        _timeBubbleView.image =[[UIImage imageNamed:@"chat_toast"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];;
        [self.contentView addSubview:_timeBubbleView];
        
        timeLabel =[[UILabel alloc] initWithFrame:CGRectZero];
        timeLabel.numberOfLines =0 ;
        timeLabel.backgroundColor=[UIColor clearColor];
        timeLabel.font = [UIFont systemFontOfSize:12.0f];
        [_timeBubbleView addSubview:timeLabel];
        _timeBubbleView.hidden = YES;
        UILongPressGestureRecognizer *imagelongPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
        [self.contentView addGestureRecognizer:imagelongPressGestureRecognizer];
//        UITapGestureRecognizer *imagegestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(messageAction)];
//        [self.contentView addGestureRecognizer:imagegestureRecognizer];

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)refreshCell{
    
    CGFloat _messageContectY =0.0f;
    if(self.message.showDate){
        _messageContectY = DY_MESSAGE_SHOW_DATE_HEIGHT;
        _timeBubbleView.hidden = NO;
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString *time =[formatter stringFromDate:[NSDate date]];
        timeLabel.text=time;
        CGSize textSize = [time sizeWithFont:timeLabel.font constrainedToSize:CGSizeMake(300, 14)];
        
        timeLabel.frame = CGRectMake(5, 0, textSize.width, 20.0f);
        
        CGFloat _timeBubbleX  = (self.frame.size.width-textSize.width-10)/2.0f;
        
        _timeBubbleView.frame= CGRectMake(_timeBubbleX, 10, textSize.width+10, 20.0f);
    
    }else{
        _timeBubbleView.hidden = YES;
    }

    _messageContentView = [DYMessageFactory loadMessageView:self.message.type];
    
    _messageContentView.frame = CGRectMake(0, _messageContectY, 320.0f, self.message.contentSize.height+20);
    
    _messageContentView.message =self.message;
    
    [_messageContentView messageStateResresh];
    _messageContentView.backgroundColor =self.testColor;
    
    [self.contentView addSubview:_messageContentView];
    
    
}
-(BOOL)becomeFirstResponder{ 
    return [super becomeFirstResponder];
}
- (void)menuCopyAction:(id)sender {
    NSLog(@"ssssssssss");
//    if ([self.delegate respondsToSelector:@selector(copyClick)]) {
//        [self.delegate copyClick];
//    }
}

- (void)menuSaveAction:(id)sender {
    //    if ([self.delegate respondsToSelector:@selector(saveClick)]) {
    //        [self.delegate saveClick];
    //    }
}
- (void)menuDeleteAction:(UIMenuController *)sender {
    NSLog(@"ssssssssss");
    //    if ([self.delegate respondsToSelector:@selector(deleteClick)]) {
    //        [self.delegate deleteClick];
    //    }
}
- (void)menuForwardAction:(UIMenuController *)sender {
    NSLog(@"ssssssssss");
    //    if ([self.delegate respondsToSelector:@selector(forwardClick)]) {
    //        [self.delegate forwardClick];
    //    }
}

- (BOOL)canPerformAction:(SEL)action
              withSender:(id)sender {
    if (action == @selector(menuDeleteAction:) ||
        action == @selector(menuSaveAction:) ||
        action == @selector(menuCopyAction:) ||
        action == @selector(menuForwardAction:))
        return YES;
    
    return [super canPerformAction:action withSender:sender];
}

- (void)longPressAction {
    
    DYMessageMenuType menuType =_messageContentView.supportMenuType;
    
    if(menuType==DYMessageMenuTypeNone)
        return;
    
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (!menu.menuVisible) {
        menu.arrowDirection = UIMenuControllerArrowDown;
        
        NSMutableArray *menuItems =[[NSMutableArray alloc] init];
        
        if (menuType >= DYMessageMenuTypeDelete) {
            menuType = menuType - DYMessageMenuTypeDelete;
            
            UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(menuDeleteAction:)];
            [menuItems addObject:menuItem];
            
        }
        if (menuType >= DYMessageMenuTypeSave) {
            menuType = menuType - DYMessageMenuTypeSave;
            
            UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"保存" action:@selector(menuSaveAction:)];
            [menuItems addObject:menuItem];
            
        }
        if (menuType >= DYMessageMenuTypeForward) {
            menuType = menuType - DYMessageMenuTypeForward;
            
            UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(menuForwardAction:)];
            [menuItems addObject:menuItem];
            
        }
        if (menuType >= DYMessageMenuTypeCopy) {
            menuType = menuType - DYMessageMenuTypeCopy;
            
            UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(menuCopyAction:)];
            [menuItems addObject:menuItem];
            
        }
        
        
        
        NSLog(@"longPressAction");
        menu.menuItems = menuItems;
        
        float x = _messageContentView.frame.size.width / 2.0f;
        float y = 10.0f;
        
        if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f) {
            
            if (!self.message.showDate) {
                y = 10.0f;
            }
            
            if (self.message.userType==DYMessageUserSendType) {
                x = self.frame.size.width - ICON_WIDTH_HEIGHT -  self.message.contentSize.width / 2.0f - 95.0f;
            }else{
                x = ICON_WIDTH_HEIGHT +  self.message.contentSize.width / 2.0f - 55.0f;
            }
            
        } else {
            //            y = 10.0f;
            //            if (message.isShowDate) {
            //                y = 0.0f;
            //            }
            //            if ([User loginUserId] == message.send) {
            //                x = iconImageView.frame.origin.x - bubbleImageView.frame.size.width / 2.0f - 75.0f;
            //            }
            //
        }
        
        
        [menu setTargetRect:CGRectMake(x, y, 150, 25) inView:_messageContentView];
        [menu setMenuVisible:YES animated:YES];
        
        
    }
}


- (BOOL)canBecomeFirstResponder {
    return YES;
}


-(void)releaseCell{
    [_messageContentView removeFromSuperview];
    [DYMessageFactory recyleMessageView:_messageContentView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
