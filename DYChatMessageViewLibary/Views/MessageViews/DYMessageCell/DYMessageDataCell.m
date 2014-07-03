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
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT)];
        _iconView.backgroundColor=[UIColor clearColor];
        _iconView.image=[UIImage imageNamed:@"chat_user_icon"]; 
        [self.contentView addSubview:_iconView];
        
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_left"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 15, 5)];
        
        _bubbleView = [[UIImageView alloc] init];
        _bubbleView.userInteractionEnabled = YES;
        _bubbleView.backgroundColor=[UIColor clearColor];
        _bubbleView.image =_bubbleImage;
//        UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
//        [_bubbleView addGestureRecognizer:longPressGestureRecognizer];
//        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(messageAction)];
//        [_bubbleView addGestureRecognizer:gestureRecognizer];
        [self.contentView addSubview:_bubbleView];
        
        

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)refreshCell{
    
    
    if (self.message.showType==DYMessageShowDataType) {
        
        if(_iconView.hidden)
            _iconView.hidden =NO;
        
        if(_bubbleView.hidden)
            _bubbleView.hidden =NO;
        
#define LEFT_ICON_MARGIN_LEFT_OR_TIGHT_ICON_MARGIN_RIGHT 10.0f
        
#define MARGIN_TOP 10.0f
        
        _messageContentView = [DYMessageFactory loadMessageView:self.message.type];
        
        
        CGFloat _contentY = 0.0f;
        
        if(self.message.size.height<ICON_WIDTH_HEIGHT/2){
            _contentY= (ICON_WIDTH_HEIGHT/2-self.message.size.height)/2.0f;
        }
        
        if(self.message.userType==DYMessageUserSendType){
            _iconView.frame=CGRectMake(270, MARGIN_TOP, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT);
            
            
            CGFloat _bubbleX = self.frame.size.width- (self.message.size.width+25) - 63;
            CGFloat _bubbleHeight = self.message.size.height;
            if(_bubbleHeight<ICON_WIDTH_HEIGHT/2){
                _bubbleHeight = ICON_WIDTH_HEIGHT/2;
            }
            
            _bubbleView.frame = CGRectMake(_bubbleX, MARGIN_TOP, self.message.size.width+25, _bubbleHeight+20);
            _messageContentView.frame = CGRectMake(9, MARGIN_TOP + _contentY, self.message.size.width, self.message.size.height);
            
            _bubbleImage = [[UIImage imageNamed:@"chat_bubble_right"] resizableImageWithCapInsets:UIEdgeInsetsMake(26, 5, 10, 10)];
            _bubbleView.image =_bubbleImage;
            
        }else{
            
            CGFloat _bubbleHeight = self.message.size.height;
            if(_bubbleHeight<ICON_WIDTH_HEIGHT/2){
                _bubbleHeight = ICON_WIDTH_HEIGHT/2;
            }
            
            _iconView.frame=CGRectMake(10, MARGIN_TOP, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT);
            _bubbleView.frame = CGRectMake(63, MARGIN_TOP, self.message.size.width+25, _bubbleHeight+20);
            _messageContentView.frame = CGRectMake(17, MARGIN_TOP + _contentY, self.message.size.width, self.message.size.height);
            
            
            _bubbleImage = [[UIImage imageNamed:@"chat_bubble_left"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 15, 5)];
            _bubbleView.image =_bubbleImage;
            
        }
        
        _messageContentView.message =self.message;
        [_messageContentView messageStateResresh];
        
        [_bubbleView addSubview:_messageContentView];
        
    }else{
        
        if(!_iconView.hidden)
            _iconView.hidden =YES;
        
        if(!_bubbleView.hidden)
            _bubbleView.hidden =YES;
        
        
        
        
        
        
    }
    
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
