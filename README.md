# FanShowView
FanShowView FanShowAlertView，FanActionSheetView FanShareView（类似系统的几种弹出方式）

## 1.首先看下几种不同弹出方式

![动画](https://github.com/fanxiangyang/FanShowView/blob/master/showView.gif?raw=true)

*注意：可以重写此类，自定义显示和动画
*1.需重写文本区域self.fan_contentView: -(void)configUIWithData（包含动画）
*3.重写消失动画方法 : -(void)removeSelfView;
*4.事件响应代理要调用：-(void)showViewDidSeletedIndex:(NSInteger)seletedIndex;
*5.最后一点，别忘记执行:[super **];

```
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
```

### 2.支持继承基类自定义


```
#pragma mark - 一般内部调用方法（或子类重写）
-(void)configUIWithData;//创建UI,需要重写
-(void)removeSelfView;//移除View，可以加动画移除
-(void)refreshUIWithData:(id)data;//暂时没有用（空方法）


-(void)showViewDidSeletedIndex:(NSInteger)seletedIndex;//用来选中按钮回调
-(void)shareBtnClick:(UIButton*)btn;//按钮单击事件，tag-100

```


###开发环境

* OS X 10.11.2
* Xcode Version 7.2 

####有问题请直接在文章下面留言。
####喜欢此系列文章可以点击上面右侧的 Star 哦，变成 Unstar 就可以了！ 
###开发人：凡向阳
####Email:fanxiangyang_heda@163.com
