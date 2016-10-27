//
//  RegisterViewController.m
//  魅眼
//
//  Created by xbo on 16/9/2.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "RegisterViewController.h"
#import "ProfileViewController.h"
#import "PrefixHeader.pch"
@interface RegisterViewController ()
@property(nonatomic,strong)UIImageView *Backimage;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UIButton *but;
@property(nonatomic,assign)NSInteger cctime;
@end

@implementation RegisterViewController
@synthesize but,cctime;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.Backimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ditu114"]];
    self.Backimage.frame=self.view.bounds;
    self.Backimage.userInteractionEnabled=YES;
    
    [self.view addSubview:self.Backimage];
    
    
    UITextField *phonetf=[[UITextField alloc]initWithFrame:CGRectMake(25, 155, 250, 30)];
    phonetf.placeholder=@" 请输入手机号";
    phonetf.layer.cornerRadius=3;
    phonetf.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:phonetf];
 

    
    UITextField *examtf=[[UITextField alloc]initWithFrame:CGRectMake(25, 205, 140, 30)];
    examtf.backgroundColor=[UIColor whiteColor];
    examtf.placeholder=@" 请输入验证码";
    examtf.layer.cornerRadius=3;

    [self.view addSubview:examtf];
    
    
    
    
    
    UITextField *nametf=[[UITextField alloc]initWithFrame:CGRectMake(25, 255, 250, 30)];
    nametf.placeholder=@" 请输入呢称";
    nametf.backgroundColor=[UIColor whiteColor];
    nametf.layer.cornerRadius=3;

    [self.view addSubview:nametf];
    
  
    
    
    UITextField *codetf=[[UITextField alloc]initWithFrame:CGRectMake(25, 305, 250, 30)];
    codetf.placeholder=@" 请输入密码";
    codetf.layer.cornerRadius=3;

     codetf.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:codetf];
    
  //设置发送倒计时
    but=[[UIButton alloc]initWithFrame:CGRectMake(185, 205, 90, 30)];
    but.titleLabel.font=[UIFont systemFontOfSize:12];
    [but setTitle:@"获取验证码" forState:UIControlStateNormal];
    but.backgroundColor=XBColor(250, 204, 44);
    but.layer.borderWidth=1;
    but.layer.cornerRadius=3;

    but.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    [but setTitleColor:XBColor(48, 80, 143) forState:UIControlStateNormal];
    [but setTitleColor:[UIColor lightTextColor] forState:UIControlStateSelected];
   
    
    [but addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but];
    
    
    UIButton *but1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame=     CGRectMake(25, 370, 250, 30);
    but1.backgroundColor=[UIColor whiteColor];
    [but1 setTitle:@"注册并登陆" forState:UIControlStateNormal];
    [but1 setTitleColor:XBColor(73, 199, 236) forState:UIControlStateNormal];
    but1.layer.masksToBounds=YES;
    but1.layer.cornerRadius=4;
    [but1 addTarget:self action:@selector(registertest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    
    UIImageView *iconview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zc_logo"]];
    iconview.frame=CGRectMake(self.view.width/2-30, 60, 60, 60);
    [self.view addSubview:iconview];
    
    
    
    UIButton *but2=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2-90, 410, 180, 30)];
    but2.backgroundColor=[UIColor clearColor];
    but2.titleLabel.font=[UIFont systemFontOfSize:13];
    [but2 setTitle:@"已有账号，直接登陆" forState:UIControlStateNormal];
    [but2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(backlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];

    
}
-(void)backlogin
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)registertest
{
    
        ProfileViewController *profVc=[[ProfileViewController alloc]initWithStyle:UITableViewStylePlain];
    
        [self.navigationController pushViewController:profVc animated:YES];
}
-(void)change:(UIButton *)sender
{
    [sender setSelected:YES];
    sender.userInteractionEnabled=NO;
    
    [_timer invalidate];
    _timer = nil;
     cctime=60;
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timedown) userInfo:nil repeats:self];
    
    
  
}
-(void)timedown
{
     [but setTitle:[NSString stringWithFormat:@"%ld秒后重发",(long)cctime] forState:UIControlStateSelected];
    but.backgroundColor=XBColor(145, 223, 249);
     cctime--;
    if (cctime==0) {
        
        [but setTitle:@"重新发送" forState:UIControlStateNormal];
        but.selected=0 ;
        but.enabled=YES;
        but.userInteractionEnabled=YES;
        
        
        [_timer invalidate];
        _timer = nil;
        cctime = 60;
        return ;
    }

   
   
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
