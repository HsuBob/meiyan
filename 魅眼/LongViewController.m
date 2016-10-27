//
//  LongViewController.m
//  魅眼
//
//  Created by xbo on 16/9/12.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "LongViewController.h"
#import "PrefixHeader.pch"
@interface LongViewController ()

@end

@implementation LongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    self.navigationItem.title=@"行程记录";
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
    imageView.image=[UIImage imageNamed:@"fy-102-拷贝"];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor=XBColor(242, 242, 242);

    
    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 75, 300, 160)];
    imageview1.image=[UIImage imageNamed:@"xcjl_tp"];
    [self .view addSubview:imageview1];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 205, 40, 30)];
    lab.text=@" 城市";
    [self.view addSubview:lab];
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(50, 205, 260, 30)];
    lab1.text=@" 北京 平壤 开城 金刚山 北京";
    lab1.textColor=XBColor(97, 97, 97);
    lab1.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:lab1];
    
    UIImageView *butimage=[[UIImageView alloc]initWithFrame:CGRectMake(210, 1, 50, 60)];
    [butimage setImage:[UIImage imageNamed:@"xcjl_rq"]];
    [imageview1 addSubview:butimage];
    
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
    lab2.text=@"8天";
    [butimage addSubview:lab2];
    
    
    
    UIImageView *imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(10, 245, 300, 160)];
    imageview2.image=[UIImage imageNamed:@"xcjl_tp"];
    [self .view addSubview:imageview2];
    
    UILabel *lab12=[[UILabel alloc]initWithFrame:CGRectMake(10, 375, 40, 30)];
    lab12.text=@" 城市";
    [self.view addSubview:lab12];
    
    UILabel *lab13=[[UILabel alloc]initWithFrame:CGRectMake(50, 375, 260, 30)];
    lab13.text=@" 北京 平壤 开城 金刚山 北京";
    lab13.textColor=XBColor(97, 97, 97);
    lab13.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:lab13];
    
    UIImageView *butimage1=[[UIImageView alloc]initWithFrame:CGRectMake(210, 1, 50, 60)];
    [butimage1 setImage:[UIImage imageNamed:@"xcjl_rq"]];
    [imageview2 addSubview:butimage1];
    
    UILabel *lab21=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
    lab21.text=@"8天";
    [butimage1 addSubview:lab21];

    
    
    


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
