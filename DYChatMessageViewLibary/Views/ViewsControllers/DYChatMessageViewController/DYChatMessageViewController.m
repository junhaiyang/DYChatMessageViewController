//
//  DYChatMessageViewController.m
//  DYChatMessageDemo
//
//  Created by yangjunhai on 14-7-2.
//  Copyright (c) 2014年 junhai. All rights reserved.
//

#import "DYChatMessageViewController.h"

#import "DYMessageObj.h"

#import "DYMessageDataCell.h"

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
    self.view.backgroundColor=[UIColor colorWithWhite:0.639 alpha:1.000]; 
    self.messages =[[NSMutableArray alloc] init];
    self.container.backgroundColor=[UIColor clearColor];
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        data.userType =DYMessageUserSendType;
        NSString *text=@"按时大大阿斯达十大";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        data.userType =DYMessageUserReceiveType;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        data.userType =DYMessageUserSendType;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        data.userType =DYMessageUserSendType;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeVoice;
        data.userType =DYMessageUserSendType;
        data.mediaTime = 10.0f;
        [data prepareBuild];
        [self.messages addObject:data];
    }
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeVoice;
        data.userType =DYMessageUserReceiveType;
        data.mediaTime = 20.0f;
        [data prepareBuild];
        [self.messages addObject:data];
    }
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeVoice;
        data.userType =DYMessageUserSendType;
        data.mediaTime = 20.0f;
        [data prepareBuild];
        [self.messages addObject:data];
    }
    
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeVoice;
        data.userType =DYMessageUserSendType;
        data.mediaTime = 30.0f;
        [data prepareBuild];
        [self.messages addObject:data];
    }
     
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
    return message.size.height+30.0f;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *DYMessageLeftCell = @"DYMessageDataCell";
    
    DYMessageDataCell *cell = [tableView dequeueReusableCellWithIdentifier:DYMessageLeftCell];
    if (cell == nil) {
        cell = [[DYMessageDataCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DYMessageLeftCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }else{
        [cell releaseCell];
    }
    DYMessageContent *message = [self.messages objectAtIndex:indexPath.row];
    cell.message =message;
    [cell refreshCell];
    
    return cell;
    
    
}
 


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
