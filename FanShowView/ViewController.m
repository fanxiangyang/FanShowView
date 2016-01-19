//
//  ViewController.m
//  FanShowView
//
//  Created by 向阳凡 on 16/1/13.
//  Copyright © 2016年 凡向阳. All rights reserved.
//

#import "ViewController.h"
#import "FanShowView.h"
#import "FanShowAlertView.h"
#import "FanActionSheetView.h"
#import "FanShareView.h"

@interface ViewController ()<FanShowViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertViewClick:(id)sender {
    FanShowAlertView *showAlert=[[FanShowAlertView alloc]initWithTitle:@"温馨提示" message:@"即将离线下载最新的论坛文章\n包括置顶文章40篇、热门话题10篇、推荐文章10篇、论坛集萃各10篇。" delegate:self otherButtonTitles:@[@"取消",@"确定"]];
    [showAlert show];
    
}
- (IBAction)actionSheetClick:(UIButton *)sender {

    FanActionSheetView *acView=[[FanActionSheetView alloc]initWithDataArray:@[@"关注",@"取消关注",@"加为好友",@"取消"] delegate:self];
    acView.isTouchRemove=YES;
    [acView show];
}
- (IBAction)shareViewClick:(id)sender {
    NSArray *titleArray=@[@"微信好友",@"微信朋友圈",@"新浪微博",@"Facebook",@"Twitter",@"QQ",@"QQ空间",@"腾讯微博",@"邮件"];
    NSArray *imageArray=@[@"WeiXin_share.png",@"WeiXinQ_share.png",@"Sina_share.png",@"FaceBook_share.png",@"Twitter_share.png",@"image_tencent_qq.png",@"QQKJ_share.png",@"image_tencent_weibo.png",@"Email_share.png"];

    FanShareView *shareView=[[FanShareView alloc]initWithDataArray:imageArray titleArray:titleArray delegate:self];
    shareView.isTouchRemove=YES;
    [shareView show];
}

#pragma mark - FanShowViewDelegate
-(void)fanShowView:(FanShowView *)showView buttonIndex:(NSInteger)buttonIndex viewStyle:(FanShowViewStyle)viewStyle{
    NSLog(@"buttonIndex:%ld",(long)buttonIndex);
}
@end
