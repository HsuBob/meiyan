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
    
    
    UILabel *phonelab=[[UILabel alloc]initWithFrame:CGRectMake(10, 155, 70, 40)];
    phonelab.text=@"手机号:";
    phonelab.textAlignment=NSTextAlignmentLeft;
    phonelab.font=[UIFont systemFontOfSize:13];
    phonelab.textColor=[UIColor lightTextColor];
    [self.view addSubview:phonelab];
    
    
    UITextField *phonetf=[[UITextField alloc]initWithFrame:CGRectMake(65, 155, 140, 25)];
    [self.view addSubview:phonetf];
    
    UIImageView *imageview1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gd115"]];
    imageview1.frame=CGRectMake(65, 185, 145, 1);
    [self.view addSubview:imageview1];


    
    UILabel *examlab=[[UILabel alloc]initWithFrame:CGRectMake(10, 200, 70, 40)];
    examlab.text=@"验证码:";
    examlab.textAlignment=NSTextAlignmentLeft;
    examlab.font=[UIFont systemFontOfSize:13];
    examlab.textColor=[UIColor lightTextColor];
    [self.view addSubview:examlab];
    
    UITextField *examtf=[[UITextField alloc]initWithFrame:CGRectMake(65, 207, 130, 25)];
//    tf.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:examtf];
    
    UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gd115"]];
    imageview.frame=CGRectMake(65, 230, 145, 1);
    [self.view addSubview:imageview];
    
    
    UILabel *namelab=[[UILabel alloc]initWithFrame:CGRectMake(10, 245, 70, 40)];
    namelab.text=@"昵称:";
    namelab.textAlignment=NSTextAlignmentLeft;
    namelab.font=[UIFont systemFontOfSize:13];
    namelab.textColor=[UIColor lightTextColor];
    [self.view addSubview:namelab];
    
    
    UITextField *nametf=[[UITextField alloc]initWithFrame:CGRectMake(65, 245, 140, 25)];
    [self.view addSubview:nametf];
    
    UIImageView *imageview2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gd115"]];
    imageview2.frame=CGRectMake(65, 275, 145, 1);
    [self.view addSubview:imageview2];

    
    UILabel *codelab=[[UILabel alloc]initWithFrame:CGRectMake(10, 290, 70, 40)];
    codelab.text=@"密码:";
    codelab.textAlignment=NSTextAlignmentLeft;
    codelab.font=[UIFont systemFontOfSize:13];
    codelab.textColor=[UIColor lightTextColor];
    [self.view addSubview:codelab];
    
    
    UITextField *codetf=[[UITextField alloc]initWithFrame:CGRectMake(65, 290, 140, 25)];
    [self.view addSubview:codetf];
    
    UIImageView *imageview3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gd115"]];
    imageview3.frame=CGRectMake(65, 325, 145, 1);
    [self.view addSubview:imageview3];

  //设置发送倒计时
    but=[[UIButton alloc]initWithFrame:CGRectMake(215, 205, 90, 20)];
    but.titleLabel.font=[UIFont systemFontOfSize:12];
    [but setTitle:@"获取" forState:UIControlStateNormal];
    but.layer.borderWidth=1;
    but.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    [but setTitleColor:XBColor(48, 80, 143) forState:UIControlStateNormal];
    [but setTitleColor:[UIColor lightTextColor] forState:UIControlStateSelected];
   
    
    [but addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but];
    
    
    UIButton *but1=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2-120, 350, 200, 30)];
    but1.backgroundColor=[UIColor whiteColor];
    [but1 setTitle:@"注册" forState:UIControlStateNormal];
    [but1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(registertest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    
    UIImageView *iconview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"60X60"]];
    iconview.frame=CGRectMake(self.view.width/2-30, 80, 50, 50);
    [self.view addSubview:iconview];
    
    
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
