//
//  MainViewController.m
//  魅眼
//
//  Created by xbo on 16/9/1.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "PrefixHeader.pch"
#import "MYSearchBar.h"
#import "UIView+Extension.h"
@interface MainViewController ()
@property(nonatomic,strong)MYSearchBar *SearhBar;
@property(nonatomic,strong)UIImageView *Backimage;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"User"] style:UIBarButtonItemStyleDone target:self action:@selector(PersonalCenter)];
    self.navigationItem.leftBarButtonItem.tintColor=XBColor(237, 237, 237);
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"xc-9"] style:UIBarButtonItemStyleDone target:self action:@selector(PersonalCenter)];
     self.navigationItem.rightBarButtonItem.tintColor=XBColor(237, 237, 237);
    
    /**
     *  添加searchbar
     
     */
    
    _SearhBar =[MYSearchBar searchBar];
    _SearhBar.height=30;
    _SearhBar.width=300;
    self.navigationItem.titleView=_SearhBar;
    
    
   
    
    self.Backimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1422609001606"]];
    self.Backimage.frame=self.view.bounds;
    self.Backimage.userInteractionEnabled=YES;
    
    [self.view addSubview:self.Backimage];
    
  
    
     [self viewSetting];
    

    }

-(void)viewSetting
{
    UILabel *location=[[UILabel alloc]initWithFrame:CGRectMake(20, self.view.height-240, 100, 80)];
    location.text=@"巴厘岛";
    location.textColor=[UIColor whiteColor];
    location.font=[UIFont systemFontOfSize:28];
    [self.Backimage addSubview:location];
    
    UILabel *time=[[UILabel alloc]initWithFrame:CGRectMake(30, self.view.height-200, 120, 50)];
    time.text=@"今天15：53发布";
    time.textColor=[UIColor whiteColor];
    time.font=[UIFont systemFontOfSize:12];
    [self.Backimage addSubview:time];
    
    UILabel *temperature=[[UILabel alloc]initWithFrame:CGRectMake(30, self.view.height-170, 100, 40)];
    temperature.text=@"22℃";
    temperature.textColor=[UIColor whiteColor];
    temperature.font=[UIFont systemFontOfSize:18];
    [self.view addSubview:temperature];
    
    UILabel *weather=[[UILabel alloc]initWithFrame:CGRectMake(30, self.view.height-150, 100, 50)];
    weather.text=@"多云";
    weather.textColor=[UIColor whiteColor];
    weather.font=[UIFont systemFontOfSize:18];
    [self.view addSubview:weather];
    
    UILabel *attention=[[UILabel alloc]initWithFrame:CGRectMake(200, self.view.height-110, 140, 30)];
    attention.text=@"实时热度 1.22万人";
    attention.font=[UIFont systemFontOfSize:13];
    attention.textColor=XBColor(207, 80, 63);
    [self.view addSubview:attention];
    
    UILabel *country=[[UILabel alloc]initWithFrame:CGRectMake(30, self.view.height-110, 140, 30)];
    country.text=@"Jalan Gatot Subroto 2";
    country.font=[UIFont systemFontOfSize:13];
    country.textColor=XBColor(134, 143, 141);
    [self.view addSubview:country];
    
    UIImageView *weatherview=[[UIImageView alloc]initWithFrame:CGRectMake(80, self.view.height-150, 45, 30)];
    [weatherview setImage:[UIImage imageNamed:@"012"]];
    [self.view addSubview:weatherview];
    
    
    UIImageView *locationview=[[UIImageView alloc]initWithFrame:CGRectMake(5, self.view.height-105, 20, 20)];
    [locationview setImage:[UIImage imageNamed:@"location_400px_1187488_easyicon.net"]];
    [self.view addSubview:locationview];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_SearhBar resignFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;

}
-(void)PersonalCenter
{

    
    LoginViewController *LoginVc=[[LoginViewController alloc]init];
    
    [self.navigationController pushViewController:LoginVc animated:YES];
    
    
//    ProfileViewController *profVc=[[ProfileViewController alloc]init];
//    
//    [self.navigationController pushViewController:profVc animated:YES];
    self.tabBarController.tabBar.hidden=YES;
    
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



//self.navigationController.navigationBar.translucent=YES;
//UIColor *color=[UIColor clearColor];
//CGRect rect=CGRectMake(0, 0, self.view.bounds.size.width, 64);
//UIGraphicsBeginImageContext(rect.size);
//CGContextRef context=UIGraphicsGetCurrentContext();
//CGContextSetFillColorWithColor(context, [color CGColor]);
//CGContextFillRect(context, rect);
//UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
//UIGraphicsEndImageContext();
//[self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//self.navigationController.navigationBar.clipsToBounds=YES;


@end
