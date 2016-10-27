//
//  TourViewController.m
//  魅眼
//
//  Created by xbo on 16/9/8.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "TourViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "DetailSearchViewController.h"
#import "MYSearchBar.h"
#import "PrefixHeader.pch"

#import <AMapLocationKit/AMapLocationKit.h>


#import "SurroundingViewController.h"
#import "GroupViewController.h"
#import "TakeViewController.h"
#import "RimViewController.h"

@interface TourViewController ()<MAMapViewDelegate,AMapLocationManagerDelegate>
@property(nonatomic,strong) MAMapView *mapView;
@property(nonatomic,strong) AMapLocationManager *locationManager;
@end

@implementation TourViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    [self setMapView];
    
  //  [self setLocation];

    MYSearchBar *mysearch=[[MYSearchBar alloc]initWithFrame:CGRectMake(10, 30, 300, 40)];
    
    self.navigationItem.titleView=mysearch;
    
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-60, 80, 35, 35)];
    [but setImage:[UIImage imageNamed:@"zt"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(groupping) forControlEvents:UIControlEventTouchUpInside];
    [_mapView addSubview:but];
    
    UIButton *but1=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-60, 125, 35, 35)];
    [but1 setImage:[UIImage imageNamed:@"ljt"] forState:UIControlStateNormal];
    [_mapView addSubview:but1];
    
    UIButton *but2=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-60, 170, 35, 35)];
    [but2 setImage:[UIImage imageNamed:@"zb"] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(Rim) forControlEvents:UIControlEventTouchUpInside];
    [_mapView addSubview:but2];
    
    UIButton *but3=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-60, 215, 35, 35)];
    [but3 setImage:[UIImage imageNamed:@"sd"] forState:UIControlStateNormal];
    [but3 addTarget:self action:@selector(takegoods) forControlEvents:UIControlEventTouchUpInside];
    [_mapView addSubview:but3];
}

-(void)Rim
{
    RimViewController *RimVc=[[RimViewController alloc]init];
    [self.navigationController pushViewController:RimVc animated:YES];

}


-(void)groupping
{
    
    GroupViewController *groupVc=[[GroupViewController alloc]init];
    [self.navigationController pushViewController:groupVc animated:YES];
    
}
-(void)takegoods
{
    TakeViewController *takeVc=[[TakeViewController alloc]init];
    [self.navigationController pushViewController:takeVc animated:YES];
    
}
-(void)setMapView
{
    //初始化地图
    
    _mapView=[[MAMapView alloc]initWithFrame:self.view.bounds];
    _mapView.delegate=self;
    
    [self.view addSubview:_mapView];
    _mapView.showsCompass= NO; // 设置成NO表示关闭指南针；YES表示显示指南针
    
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22); //设置指南针位置
    
    _mapView.showsUserLocation= YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;

    _mapView.showsScale= NO;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);  //设置比例尺位置


    
    
    //    设置地图logo的位置
    //    _mapView.logoCenter = CGPointMake(CGRectGetWidth(self.view.bounds)-55, 450);
   
    //  _mapView.userTrackingMode=MAUserTrackingModeFollow ;
//    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];  //        地图跟着位置移动
    
    _mapView.zoomEnabled = YES;    //NO表示禁用缩放手势，YES表示开启
    [_mapView setZoomLevel:12.5 animated:YES];
    
    
    _mapView.pausesLocationUpdatesAutomatically = NO;
    
    _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    
    
    _mapView.customizeUserLocationAccuracyCircleRepresentation=YES;
}

-(void)setLocation
{
    
    
    self.locationManager=[[AMapLocationManager alloc]init];
    self.locationManager.delegate=self;
    [self.locationManager startUpdatingLocation];
    //
    //    // 带逆地理信息的一次定位（返回坐标和地址信息）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //   定位超时时间，最低2s，此处设置为2s
    self.locationManager.locationTimeout =2;
    //   逆地理请求超时时间，最低2s，此处设置为2s
    self.locationManager.reGeocodeTimeout = 2;
    
    
    
    //设置允许后台定位参数，保持不会被系统挂起
    //    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    //
    //    [self.locationManager setAllowsBackgroundLocationUpdates:YES];//iOS9(含)以上系统需设置
    
    
    //    [self.mapView addObserver:self forKeyPath:@"showsUserLocation" options:NSKeyValueObservingOptionNew context:nil];
    
   
}

- (void)startSerialLocation
{
    //开始定位
    [self.locationManager startUpdatingLocation];
}

- (void)stopSerialLocation
{
    //停止定位
    [self.locationManager stopUpdatingLocation];
}

- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    //定位错误
    NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    
    //定位结果
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
//    self.mapView. 
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



-(void)setAnnotation
{
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(30.5438889605, 114.3049736889);
    pointAnnotation.title = @"黄鹤楼";
    pointAnnotation.subtitle = @"查看全景";
    [_mapView addAnnotation:pointAnnotation];
    
}


//  根据anntation生成对应的View
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        
//        annotationView.image=[UIImage imageNamed:@"dy_tp"];
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
        [but setImage:[UIImage imageNamed:@"dy_tp"] forState:UIControlStateNormal];
        annotationView.leftCalloutAccessoryView=but;
        return annotationView;
    }
    return nil;
}
//  当选中一个annotation views时调用此接口
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
   
    NSString  *str=[[NSBundle mainBundle]pathForResource:@"怒放的生命" ofType:@"MP3"];
    
    NSLog(@"%@",str);
    
    
//    NSURL *URL=[NSURL fileURLWithPath:str];
//    self.player=[[AVAudioPlayer alloc]initWithContentsOfURL:URL error:nil];
//    if (!self.player.isPlaying) {
//        [self.player play];
//        
//    }
//    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self setAnnotation];
    [self startSerialLocation];
    
    
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.mapView.mapType = MAMapTypeStandard;
    
    [self stopSerialLocation];
    
    
}
-(void)keyboardWillShow:(id)sender
{
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    DetailSearchViewController *searchVc=[[DetailSearchViewController alloc]init];
    
    
    [self.navigationController presentViewController:searchVc animated:YES completion:nil];
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
