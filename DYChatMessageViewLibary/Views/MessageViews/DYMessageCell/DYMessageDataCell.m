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
        
        

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)refreshCell{
    
    _messageContentView = [DYMessageFactory loadMessageView:self.message.type];
    
    _messageContentView.frame = CGRectMake(0, 0, 320.0f, self.message.size.height+20);
    
    _messageContentView.message =self.message;
    
    [_messageContentView messageStateResresh];
    
    [self.contentView addSubview:_messageContentView];
    
    
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
