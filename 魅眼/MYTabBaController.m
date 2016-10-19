//
//  MYTabBaController.m
//  魅眼
//
//  Created by xbo on 16/8/31.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "MYTabBaController.h"
#import "PrefixHeader.pch"
#import "MYNavController.h"
#import "MainViewController.h"
#import "TicketViewController.h"
@interface MYTabBaController ()

@end

@implementation MYTabBaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *VC1=[[MainViewController alloc]init];
    [self addChildVc:VC1 Title:@"首页" Image:@"Home" Selectedimage:@"Home-h"];
    
    TicketViewController *VC2=[[TicketViewController alloc]init];
     [self addChildVc:VC2 Title:@"门票" Image:@"435" Selectedimage:@"435-h"];
    
    UIViewController *VC3=[[UIViewController alloc]init];
   
   [self addChildVc:VC3 Title:@"导游" Image:@"0412" Selectedimage:@"0412-h"];
    
    UIViewController *VC4=[[UIViewController alloc]init];
   
     [self addChildVc:VC4 Title:@"译得" Image:@"Calendar" Selectedimage:@"Calendar-h"];
    
    UIViewController *VC5=[[UIViewController alloc]init];
    [self addChildVc:VC5 Title:@"出发" Image:@"Rocket" Selectedimage:@"Rocket-h"];

}
-(void)addChildVc:(UIViewController *)childVC Title:(NSString *)title Image:(NSString *)image Selectedimage:(NSString *) selectedimage
{
    
    childVC.tabBarItem.title=title;
//    childVC.view.backgroundColor=XBRandomColor;
    childVC.tabBarItem.image=[UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage=[[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    MYNavController *nv=[[MYNavController alloc]initWithRootViewController:childVC];
    self.tabBar.tintColor=XBColor(61, 159, 221);
    
    
//    nv.navigationBar.tintColor=[UIColor clearColor];
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:XBColor(61, 159, 221),NSForegroundColorAttributeName,nil];
    [nv.navigationBar setTitleTextAttributes:attributes];
    
    
//    nv.navigationController.navigationBar.translucent=YES;
//    nv.navigationController.navigationBar.tintColor=[UIColor clearColor];
//    nv.navigationController.navigationBar.alpha=0;
//    [nv.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsDefault];
//    nv.navigationController.navigationBar.clipsToBounds=YES;
//    [[[nv.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0.0];
//    
 

    
    [self addChildViewController:nv];

    
}
- (void) setNavBarImg:(UINavigationBar *)navBar
{
#define kSCNavBarImageTag 10
    
    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        //if iOS 5.0 and later
        [navBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        UIImageView *imageView = (UIImageView *)[navBar  viewWithTag:kSCNavBarImageTag];
        [imageView setBackgroundColor:[UIColor clearColor]];
        if (imageView == nil)
        {
            imageView = [[UIImageView alloc] initWithImage:
                         [UIImage imageNamed:@"bigShadow"]];
            [imageView setTag:kSCNavBarImageTag];
            [navBar insertSubview:imageView atIndex:0];
        }
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
