//
//  TakeViewController.m
//  魅眼
//
//  Created by xbo on 16/9/20.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "TakeViewController.h"
#import "PrefixHeader.pch"
#import <MAMapKit/MAMapKit.h>



@interface TakeViewController ()<MAMapViewDelegate>
@property(nonatomic,strong) MAMapView *mapView;
@end

@implementation TakeViewController


-(void)viewWillAppear:(BOOL)animated
{
    _mapView.showsUserLocation= YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"顺带";
    NSDictionary *atribute=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:atribute];
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
    imageView.image=[UIImage imageNamed:@"fy-102-拷贝"];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor=XBColor(242, 242, 242);
    
    
    [self setMapView];
    [self takeView];
    
}

-(void)setMapView
{
    //初始化地图
    
    _mapView=[[MAMapView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    _mapView.delegate=self;
    
    [self.view addSubview:_mapView];
    _mapView.showsCompass= NO; // 设置成NO表示关闭指南针；YES表示显示指南针
    
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22); //设置指南针位置
    
    _mapView.showsUserLocation=YES;
    
    _mapView.showsScale= 0;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);  //设置比例尺位置
    _mapView.centerCoordinate=_mapView.userLocation.coordinate;

  
    
    //    设置地图logo的位置
    //    _mapView.logoCenter = CGPointMake(CGRectGetWidth(self.view.bounds)-55, 450);
    
    //  _mapView.userTrackingMode=MAUserTrackingModeFollow ;
    [_mapView setUserTrackingMode: MAUserTrackingModeFollowWithHeading animated:YES];  //        地图跟着位置移动
    
    _mapView.zoomEnabled = YES;    //NO表示禁用缩放手势，YES表示开启
    [_mapView setZoomLevel:18 animated:YES];
    


    

  
    _mapView.pausesLocationUpdatesAutomatically = NO;
    
    _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    
    
     _mapView.customizeUserLocationAccuracyCircleRepresentation=YES;
}

/**
 * @brief 是否自定义用户位置精度圈(userLocationAccuracyCircle)对应的 view, 默认为 NO.
 如果为YES: 会调用 - (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay 若返回nil, 则不加载.
 如果为NO : 会使用默认的样式.
 */


- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    MAOverlayRenderer *render=[[MAOverlayRenderer alloc]init];
    [render renderRegionWithPoints:nil pointCount:1 fillColor:[UIColor clearColor] usingTriangleFan:NO];
    return render;
}



/*!
 @brief 设定UserLocationView样式。如果用户自定义了userlocation的annotationView，或者该annotationView还未添加到地图上，此方法将不起作用。
 @param representation 样式信息对象
 */

- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MAAnnotationView *view = views[0];
    
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
//        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
////        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
////        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
////        pre.image = [UIImage imageNamed:@"location.png"];
////        pre.lineWidth = 3;
////        pre.lineDashPattern = @[@6, @3];
//        
//        
//        pre.image=[UIImage imageNamed:@"sd_dw"];
//        pre.showsAccuracyRing=NO;
//        
//        [self.mapView updateUserLocationRepresentation:pre];
        
        view.calloutOffset = CGPointMake(0, 0);
    }  
}
-(void)takeView
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(10, 280, 300, 210)];
    view.backgroundColor=[UIColor whiteColor];
    view.layer.cornerRadius=5;
    view.layer.masksToBounds=YES;
//    view.layer.borderWidth=5;
//    view.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor grayColor]);
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 40)];
    lab.text=@"取货时间";
    lab.font=[UIFont systemFontOfSize:16];
    lab.textColor=XBColor(154, 154, 154);
    [view addSubview:lab];
    
    UILabel *lab6=[[UILabel alloc]initWithFrame:CGRectMake(180, 10, 100, 40)];
    lab6.text=@"30分钟后";
    lab6.font=[UIFont systemFontOfSize:15];
    [view addSubview:lab6];
    for (int i=0; i<4; i++) {
        UIImageView *lineView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 50+i*40, 280, 1)];
        lineView.image=[UIImage imageNamed:@"xian"];
        [view addSubview:lineView];
    }
   

    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(5, 65, 10, 10)];
    [imageview setImage:[UIImage imageNamed:@"sd_yuan"]];
    imageview.layer.masksToBounds=YES;
    imageview.layer.cornerRadius=5;
    [view addSubview:imageview];
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 120, 40)];
    lab1.text=@"尚文科技大厦";
    lab1.font=[UIFont systemFontOfSize:16];
    [view addSubview:lab1];
    
    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(5, 105, 10, 10)];
    [imageview1 setImage:[UIImage imageNamed:@"sd_yuan2"]];
    imageview1.layer.masksToBounds=YES;
    imageview1.layer.cornerRadius=5;
    [view addSubview:imageview1];

    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(20, 90, 100, 40)];
    lab2.text=@"目的地";
    lab2.textColor=XBColor(154, 154, 154);
    lab2.font=[UIFont systemFontOfSize:16];
    [view addSubview:lab2];
    
    UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 120, 40)];
    lab3.text=@"默认收货联系人";
    lab3.font=[UIFont systemFontOfSize:15];
    lab3.textColor=XBColor(154, 154, 154);
    [view addSubview:lab3];
    
    UIImageView *imageview3=[[UIImageView alloc]initWithFrame:CGRectMake(145, 140, 20, 20)];
    [imageview3 setImage:[UIImage imageNamed:@"sdtj"]];
    imageview1.layer.masksToBounds=YES;
    imageview1.layer.cornerRadius=10;
    [view addSubview:imageview3];
    
    UILabel *lab4=[[UILabel alloc]initWithFrame:CGRectMake(170, 130, 130, 40)];
    lab4.text=@"电话: 18888888888";
    lab4.font=[UIFont systemFontOfSize:13];
    lab4.textColor=XBColor(154, 154, 154);
    [view addSubview:lab4];
    
    
    UIImageView *imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(20, 175, 20, 25)];
    [imageview2 setImage:[UIImage imageNamed:@"sd_sh"]];
    imageview1.layer.masksToBounds=YES;
    imageview1.layer.cornerRadius=5;
    [view addSubview:imageview2];

    
    UILabel *lab5=[[UILabel alloc]initWithFrame:CGRectMake(50, 170, 100, 40)];
    lab5.text=@"捎话";
    lab5.textColor=XBColor(154, 154, 154);
    lab5.font=[UIFont systemFontOfSize:15];
    [view addSubview:lab5];
    
    [_mapView addSubview:view];
}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    
    
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        
        self.mapView.centerCoordinate=userLocation.coordinate;
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
