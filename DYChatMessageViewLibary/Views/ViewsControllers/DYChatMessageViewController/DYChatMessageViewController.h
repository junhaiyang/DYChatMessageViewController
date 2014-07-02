//
//  DYChatMessageViewController.h
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYChatMessageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *container;
@property (nonatomic,strong) NSMutableArray *messages;

@end
