//
//  DYChatMessageViewController.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYChatMessageViewController.h"

#import "DYMessageView.h"

#import "DYMessageCell.h"

@interface DYChatMessageViewController ()

@end

@implementation DYChatMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messages =[[NSMutableArray alloc] init];
    self.container.backgroundColor=[UIColor redColor];
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        NSString *text=@"按时大大阿斯达十大的飒飒大叔大叔";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        NSString *text=@"萨达速度按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    
    
    
    // Do any additional setup after loading the view from its nib.
}


#pragma mark  tableviewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.messages.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DYMessageContent *message = [self.messages objectAtIndex:indexPath.row];
    return message.size.height;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *DYMessageLeftCell = @"DYMessageLeftCell";
    
    DYMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:DYMessageLeftCell];
    if (cell == nil) {
        cell = [[DYMessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DYMessageLeftCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
    
    
}
 


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
