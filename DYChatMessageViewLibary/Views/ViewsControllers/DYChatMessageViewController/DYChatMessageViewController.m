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
    self.view.backgroundColor=[UIColor colorWithWhite:0.804 alpha:1.000];
    self.messages =[[NSMutableArray alloc] init];
    self.container.backgroundColor=[UIColor clearColor];
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        data.userType =DYMessageUserSendType;
        data.showDate = YES;
        NSString *text=@"按时大大阿斯达十大";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }{
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeToast;
        data.userType =DYMessageUserSendType;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeText;
        data.userType =DYMessageUserReceiveType;
        data.showDate = YES;
        NSString *text=@"萨达速度按时大大阿斯达十按时大大阿斯达十大的飒飒大叔大叔按时大大阿斯达十大的飒飒大叔大叔大的飒飒大叔大叔大叔大叔的撒旦撒";
        data.message=[text dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }{
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeToast;
        data.userType =DYMessageUserSendType;
        NSString *text=@"按时大大阿斯达十大";
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
        data.showDate = YES;
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
        data.showDate = YES;
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
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeImage;
        data.userType =DYMessageUserSendType;
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"];
        
        data.message = [path dataUsingEncoding:NSUTF8StringEncoding];
        [data prepareBuild];
        [self.messages addObject:data];
    }
    
    
    {
        DYMessageContent *data =[[DYMessageContent alloc] init];
        data.type=kDYMessageTypeImage;
        data.userType =DYMessageUserReceiveType;
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"];
        
        data.message = [path dataUsingEncoding:NSUTF8StringEncoding];
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
    return message.height;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *DYMessageLeftCell = @"DYMessageDataCell";
    
    DYMessageDataCell *cell = [tableView dequeueReusableCellWithIdentifier:DYMessageLeftCell];
    if (cell == nil) {
        cell = [[DYMessageDataCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DYMessageLeftCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }else{
        [cell resignFirstResponder];
        [cell releaseCell];
    }
    DYMessageContent *message = [self.messages objectAtIndex:indexPath.row];
    cell.message =message;
    [cell becomeFirstResponder];
//    switch (indexPath.row%3) {
//        case 0:{
//            cell.testColor =[UIColor greenColor];
//            break;
//        }
//            
//        case 1:{
//            cell.testColor =[UIColor redColor];
//            break;
//        }
//            
//        case 2:{
//            cell.testColor =[UIColor yellowColor];
//            break;
//        }
//            
//    }
    [cell refreshCell];
    
    return cell;
    
    
} 
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(!decelerate){
        [self cellfirstResponder];
    }

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self cellfirstResponder];
}
- (void)cellfirstResponder {
    for (UITableViewCell *cell in self.container.visibleCells) {
        [cell becomeFirstResponder];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
