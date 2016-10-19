//
//  LoginViewController.m
//  魅眼
//
//  Created by xbo on 16/9/2.
//  Copyright © 2016年 xbo. All rights reserved.
//


#import "RegisterViewController.h"
#import "ProfileViewController.h"
#import "LoginViewController.h"
#import "PrefixHeader.pch"
@interface LoginViewController ()
@property(nonatomic,strong) UIImageView *Backimage;
@property(nonatomic,strong) UITextField *nametx;
@property(nonatomic,strong) UITextField *codetx;
@end

@implementation LoginViewController
@synthesize nametx,codetx;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
    self.Backimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zcdt-34"]];
    self.Backimage.frame=self.view.bounds;
    self.Backimage.userInteractionEnabled=YES;
    [self.view addSubview:self.Backimage];
    
    
    nametx=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-130, 240, 260, 40)];
    nametx.placeholder=@"请输入用户名";
    nametx.backgroundColor=XBColor(241, 241, 241);
    nametx.layer.cornerRadius=20;
    nametx.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *accLeftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zh"]];
    accLeftView.contentMode = UIViewContentModeCenter;
    accLeftView.frame=CGRectMake(0, 0, 55, 0);
    // 添加到左侧视图中
    nametx.leftView = accLeftView;
    
    nametx.leftViewMode =UITextFieldViewModeAlways;
    [nametx setValue:[UIColor colorWithRed:126/255.0  green:195/255.0  blue:201/255.0  alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    nametx.adjustsFontSizeToFitWidth = YES;
    [self.Backimage addSubview:nametx];
    
    
    
    
    codetx=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-130, 290, 260, 40)];
    codetx.backgroundColor=XBColor(241, 241, 241);
    codetx.placeholder=@"请输入密码";
    codetx.layer.cornerRadius=20;
    codetx.borderStyle = UITextBorderStyleRoundedRect;
    
    UIImageView *accLeftView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mm"]];
    accLeftView1.contentMode = UIViewContentModeCenter;
    accLeftView1.frame=CGRectMake(0, 0, 55, 0);
    codetx.leftView = accLeftView1;
    codetx.leftViewMode =UITextFieldViewModeAlways;
    codetx.secureTextEntry=YES;
    codetx.keyboardType=UIKeyboardTypeNumberPad;
    codetx.adjustsFontSizeToFitWidth = YES;
    
    [codetx setValue:[UIColor colorWithRed:126/255.0  green:195/255.0  blue:201/255.0  alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.Backimage addSubview:codetx];

    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-130, 340, 260, 30)];
    but.backgroundColor=XBColor(73, 198, 237);
    but.layer.cornerRadius=15;
    [but setTitle:@"登录" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.Backimage addSubview:but];
    
    
    
    UIButton *wxbut=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-70, 390, 40, 40)];
    [wxbut setImage:[UIImage imageNamed:@"wx"] forState:UIControlStateNormal];
    [wxbut addTarget:self action:@selector(wxlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.Backimage addSubview:wxbut];
    
    
    UIButton *qqbut=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-20, 390, 40, 40)];
    [qqbut setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [qqbut addTarget:self action:@selector(qqlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.Backimage addSubview:qqbut];

    
    UIButton *wbbut=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2+30, 390, 40, 40)];
    [wbbut setImage:[UIImage imageNamed:@"wb"] forState:UIControlStateNormal];
    [wbbut addTarget:self action:@selector(wblogin) forControlEvents:UIControlEventTouchUpInside];
    [self.Backimage addSubview:wbbut];
    
    
    UIButton *registerBut=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-84, 450, 168, 40)];
    [registerBut setImage:[UIImage imageNamed:@"ljzc"] forState:UIControlStateNormal];
    [registerBut addTarget:self action:@selector(RegisterAccount:) forControlEvents:UIControlEventTouchUpInside];
    [self.Backimage addSubview:registerBut];
    
    UIButton *CodemissrBut=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width)/2-40, 500, 80, 20)];
    [CodemissrBut setTitle:@"忘记密码" forState:UIControlStateNormal];
    CodemissrBut.titleLabel.font=[UIFont systemFontOfSize:12];
    [CodemissrBut setTitleColor:XBColor(196, 196, 196) forState:UIControlStateNormal];
    [CodemissrBut addTarget:self action:@selector(Codemissed:) forControlEvents:UIControlEventTouchUpInside];
    [self.Backimage addSubview:CodemissrBut];
    
    UILabel *huo=[[UILabel alloc]initWithFrame:CGRectMake(self.view.width/2-5, 375, 10, 10)];
    huo.text=@"或";
    huo.textColor=XBColor(73, 198, 237);
    huo.font=[UIFont systemFontOfSize:10];
    [self.Backimage addSubview:huo];
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(self.view.width/2-120, 380, 100, 1)];
    view.backgroundColor=XBColor(73, 198, 237);
    [self.view addSubview:view];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(self.view.width/2+20, 380, 100, 1)];
    view1.backgroundColor=XBColor(73, 198, 237);
    [self.view addSubview:view1];
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [nametx resignFirstResponder];
    [codetx resignFirstResponder];
}
-(void)RegisterAccount:(UIButton *)sender
{
    NSLog(@"222");
    RegisterViewController *RegisterVc=[[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:RegisterVc animated:YES];

}
-(void)Codemissed:(UIButton *)sender
{
    NSLog(@"222");

}
-(void)login
{
        ProfileViewController *profVc=[[ProfileViewController alloc]initWithStyle:UITableViewStylePlain];
    
        [self.navigationController pushViewController:profVc animated:YES];
}
-(void)qqlogin
{
    NSLog(@"222");

}
-(void)wblogin
{
    NSLog(@"222");

}
-(void)wxlogin
{
    NSLog(@"222");

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
