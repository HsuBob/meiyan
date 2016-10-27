//
//  MainViewController.m
//  魅眼
//
//  Created by xbo on 16/9/1.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "MainViewController.h"
#import "DetailSearchViewController.h"
#import "LoginViewController.h"
#import "LongViewController.h"
#import "ProfileViewController.h"
#import "PrefixHeader.pch"
#import "MYSearchBar.h"

#import "TestViewController.h"
@interface MainViewController ()
@property(nonatomic,strong)MYSearchBar *SearhBar;
@property(nonatomic,strong)UIImageView *Backimage;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    /**
     *  添加searchbar
     
     */
    
//    _SearhBar =[MYSearchBar searchBar];
//    _SearhBar.height=30;
//    _SearhBar.enablesReturnKeyAutomatically=NO;
//    _SearhBar.width=300;
//
//   self.navigationItem.titleView=_SearhBar;
    
  
    
   


    
    UIView  *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor=XBColor(73, 200, 236);
    [self.view addSubview:view];
    
    UITableView *mainTabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-64) style:UITableViewStyleGrouped  ];
    
    mainTabView.showsVerticalScrollIndicator=0;
    mainTabView.tableHeaderView=[self setHeaderView];
    
    [self.view addSubview:mainTabView];


//    self.Backimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1422609001606"]];
//    self.Backimage.frame=self.view.bounds;
//    self.Backimage.userInteractionEnabled=YES;
//
//    [self.view addSubview:self.Backimage];
    
  
    
//     [self viewSetting];
    
    
    
    
}

-(UIView *)setHeaderView
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 600)];
    
    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 300, 110)];
    [imageview1 setImage:[UIImage imageNamed:@"zy_gg"]];
    [view addSubview:imageview1];
    
    UIImageView *imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(10, 130, 145, 110)];
    [imageview2 setImage:[UIImage imageNamed:@"zy_wds"]];
    [view addSubview:imageview2];
    
    UIImageView *imageview3=[[UIImageView alloc]initWithFrame:CGRectMake(165, 130, 145, 110)];
    [imageview3 setImage:[UIImage imageNamed:@"zy_ly"]];
    [view addSubview:imageview3];
    
    UIImageView *imageview4=[[UIImageView alloc]initWithFrame:CGRectMake(10, 250, 145, 110)];
    [imageview4 setImage:[UIImage imageNamed:@"zy_sxrj"]];
    [view addSubview:imageview4];
    
    UIImageView *imageview5=[[UIImageView alloc]initWithFrame:CGRectMake(165, 250, 145, 110)];
    [imageview5 setImage:[UIImage imageNamed:@"zy_lj"]];
    imageview5.userInteractionEnabled=YES;
    [view addSubview:imageview5];
    
  
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(10, 370, 300, 50)];
    [but setImage:[UIImage imageNamed:@"zy_an"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(moreVR) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:but];
    
    return view;

    
    
}


-(void)moreVR
{
    TestViewController *testVc=[[TestViewController alloc]init];
    [self.navigationController pushViewController:testVc animated:YES ];
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    
      self.tabBarController.tabBar.hidden=NO;
    
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"User"] style:UIBarButtonItemStyleDone target:self action:@selector(PersonalCenter)];
    self.navigationItem.leftBarButtonItem.tintColor=XBColor(237, 237, 237);
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"xc-9"] style:UIBarButtonItemStyleDone target:self action:@selector(Longlist)];
    self.navigationItem.rightBarButtonItem.tintColor=XBColor(237, 237, 237);
    
    self.navigationItem.titleView.backgroundColor=[UIColor clearColor];
    
    self.navigationController.navigationBar.backgroundColor=[UIColor clearColor];
    
    self.navigationItem.title=@"VR旅游体验馆";
    
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)keyboardWillShow:(id)sender
{
   
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    DetailSearchViewController *searchVc=[[DetailSearchViewController alloc]init];
    
    
    [self presentViewController:searchVc animated:YES completion:nil];
    
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

-(void)PersonalCenter
{
    LoginViewController *LoginVc=[[LoginViewController alloc]init];
    
    [self.navigationController pushViewController:LoginVc animated:YES];
    
    self.tabBarController.tabBar.hidden=YES;
    
}
-(void)Longlist
{
    LongViewController *longVc=[[LongViewController alloc]init];
  
    
    [self.navigationController pushViewController:longVc animated:YES];
    
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
