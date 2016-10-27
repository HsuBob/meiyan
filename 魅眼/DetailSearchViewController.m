//
//  DetailSearchViewController.m
//  魅眼
//
//  Created by xbo on 16/9/12.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "DetailSearchViewController.h"
#import "MYSearchBar.h"
#import "PrefixHeader.pch"
@interface DetailSearchViewController ()

@end

@implementation DetailSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
    imageView.image=[UIImage imageNamed:@"fy-102-拷贝"];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:NO];
    
    MYSearchBar *search=[[MYSearchBar alloc]initWithFrame:CGRectMake(10, 30, 240, 30)];
    [self.view addSubview:search];
    
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(265, 30, 60, 30)];
    [but setTitle:@"取消" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UILabel *titlelab=[[UILabel alloc]initWithFrame:CGRectMake(10, 65, 80, 40)];
    titlelab.text=@"热门搜索";
    titlelab.font=[UIFont systemFontOfSize:14];
    titlelab.textColor=XBColor(142, 142, 142);
    [self.view addSubview:titlelab];
    
    
    UIView *lineview=[[UIView alloc]initWithFrame:CGRectMake(10, 100, 290, 2)];
    lineview.backgroundColor=XBColor(242, 242, 242);
    [self.view addSubview:lineview];
    
    [self setdetaillab];
    
    UIView *lineview1=[[UIView alloc]initWithFrame:CGRectMake(10, 255, 290, 2)];
    lineview1.backgroundColor=XBColor(242, 242, 242);
    [self.view addSubview:lineview1];
    
    UILabel *titlelab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 260, 220, 40)];
    titlelab1.text=@"没有你想要的？试试点下面";
    titlelab1.font=[UIFont systemFontOfSize:14];
    titlelab1.textColor=XBColor(142, 142, 142);
    [self.view addSubview:titlelab1];
    
    
    UIButton *but1=[[UIButton alloc]initWithFrame:CGRectMake(10, 300, 130, 40)];
    [but1 setImage:[UIImage imageNamed:@"6666"] forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2=[[UIButton alloc]initWithFrame:CGRectMake(160, 300, 130, 40)];
    [but2 setImage:[UIImage imageNamed:@"222"] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    
    UILabel *titlelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 350, 220, 40)];
    titlelab2.text=@"搜索历史";
    titlelab2.font=[UIFont systemFontOfSize:14];
    titlelab2.textColor=XBColor(142, 142, 142);
    [self.view addSubview:titlelab2];
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)setdetaillab
{
    [self setbutFrame:CGRectMake(10, 110, 65, 30) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 110, 65, 30) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 110, 65, 30) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 110, 65, 30) Title:@"泰国" Image:nil];
    
    
    [self setbutFrame:CGRectMake(10, 145, 65, 30) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 145, 65, 30) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 145, 65, 30) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 145, 65, 30) Title:@"泰国" Image:nil];
    
    [self setbutFrame:CGRectMake(10, 180, 65, 30) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 180, 65, 30) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 180, 65, 30) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 180, 65, 30) Title:@"泰国" Image:nil];
    
    [self setbutFrame:CGRectMake(10, 215, 65, 30) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 215, 65, 30) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 215, 65, 30) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 215, 65, 30) Title:@"泰国" Image:nil];
}

-(void)setbutFrame:(CGRect)frame Title:(NSString *)title Image:(NSString *)image
{
    UIButton *But=[[UIButton alloc]initWithFrame:frame];
    [But setTitle:title forState:UIControlStateNormal];
    [But setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    But.backgroundColor=XBColor(242, 242, 242);
    But.titleLabel.font=[UIFont systemFontOfSize:14];
    [But setTitleColor:XBColor(142, 142, 142) forState:UIControlStateNormal];
    [But addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:But];
}
-(void)cityChoice
{
    
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
