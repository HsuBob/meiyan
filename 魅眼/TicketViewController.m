//
//  TicketViewController.m
//  魅眼
//
//  Created by xbo on 16/9/5.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "TicketViewController.h"
#import "PrefixHeader.pch"
@interface TicketViewController ()

@end

@implementation TicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  导航栏标题及颜色
     */
    self.navigationItem.title=@"景点门票";
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    /**
     头视图
     */
    UIImageView *HeaderView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2531170_093213084000_2"]];
    HeaderView.frame=CGRectMake(0, 0, self.view.width, 150);
    HeaderView.userInteractionEnabled=YES;
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:HeaderView];
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
