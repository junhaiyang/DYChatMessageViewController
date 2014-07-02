//
//  DYMessageCell.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYMessageCell.h"

@interface DYMessageCell(){
    
}

@end

@implementation DYMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bubbleImage = [[UIImage imageNamed:@"chat_bubble_right.png"]
                       stretchableImageWithLeftCapWidth:20 topCapHeight:19];
        
        _bubbleView = [[UIImageView alloc] init];
        _bubbleView.userInteractionEnabled = YES;
        _bubbleView.image =_bubbleImage;
        _bubbleView.frame = CGRectMake(10, 10, 300, 200);
//        UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
//        [_bubbleView addGestureRecognizer:longPressGestureRecognizer];
//        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(messageAction)];
//        [_bubbleView addGestureRecognizer:gestureRecognizer];
        [self.contentView addSubview:_bubbleView];
        
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ICON_WIDTH_HEIGHT, ICON_WIDTH_HEIGHT)];
        _iconView.backgroundColor=[UIColor grayColor];
        _iconView.layer.cornerRadius = 3.0f;
        _iconView.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconView];

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
