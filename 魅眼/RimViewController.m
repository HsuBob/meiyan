//
//  RimViewController.m
//  魅眼
//
//  Created by xbo on 16/9/20.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "RimViewController.h"
#import "SurroundingViewController.h"

#import "PrefixHeader.pch"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface RimViewController ()<MAMapViewDelegate,AMapLocationManagerDelegate>
@property(nonatomic,strong) MAMapView *mapView;
@property(nonatomic,strong) AMapLocationManager *locationManager;
@property(nonatomic,strong) UILabel *locationlab;

@end

@implementation RimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationItem.title=@"周边";
    
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    
    UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fy-102-拷贝"]];
    imageview.frame=CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:imageview];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 600)];
    view.backgroundColor=[UIColor whiteColor];
    
   
    
    
    UITableView *tabview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-64)];
    tabview.tableHeaderView=view;
    tabview.showsVerticalScrollIndicator=NO;
    [self.view addSubview:tabview];

    
     [self setMapView];
    [view addSubview:_mapView];
    
    [self detailView:view];
    
    
}

-(void)detailView:(UIView *)view
{
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(5, 190, 20, 20)];
    [but setImage:[UIImage imageNamed:@"zb_dw"] forState:UIControlStateNormal];
    [view addSubview:but];
    
    _locationlab=[[UILabel alloc]initWithFrame:CGRectMake(30, 190, 240, 20)];
    _locationlab.text=@"当前位置:武汉市洪山区光谷国际广场";
    _locationlab.font=[UIFont systemFontOfSize:12];
    [view addSubview:_locationlab];
    
    UIButton *but1=[[UIButton alloc]initWithFrame:CGRectMake(280, 190, 20, 20)];
   
    [but1 setImage:[UIImage imageNamed:@"zb_sx"] forState:UIControlStateNormal];
    
    [but1 addTarget:self action:@selector(refreshLocation) forControlEvents:UIControlEventTouchUpInside ];
    [view addSubview:but1];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(5, 215, self.view.width-10, 1)];
    view1.backgroundColor=XBColor(152, 152, 152);
    [view addSubview:view1];

    
    
    
    UIButton *but2=[[UIButton alloc]initWithFrame:CGRectMake(20, 220, 40, 40)];
    [but2 setImage:[UIImage imageNamed:@"zb_fjdr"] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(Surrounding) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:but2];
    
    UILabel *butlab=[[UILabel alloc]initWithFrame:CGRectMake(0, 260, 80, 20)];
    butlab.text=@" 附近的人";
    butlab.userInteractionEnabled=YES;
    butlab.font=[UIFont systemFontOfSize:12];
    butlab.textAlignment=NSTextAlignmentCenter;
    [butlab addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Surrounding)]];
    [view addSubview:butlab];
    
    UIButton *but3=[[UIButton alloc]initWithFrame:CGRectMake(100, 220, 40, 40)];
    [but3 setImage:[UIImage imageNamed:@"zb_tc"] forState:UIControlStateNormal];
    [view addSubview:but3];
    
    UILabel *butlab1=[[UILabel alloc]initWithFrame:CGRectMake(80, 260, 80, 20)];
    butlab1.text=@" 特产";
    butlab1.font=[UIFont systemFontOfSize:12];
    butlab1.textAlignment=NSTextAlignmentCenter;
    [view addSubview:butlab1];
    
    UIButton *but4=[[UIButton alloc]initWithFrame:CGRectMake(180, 220, 40, 40)];
    [but4 setImage:[UIImage imageNamed:@"zb_sgyp"] forState:UIControlStateNormal];
    [view addSubview:but4];
    
    UILabel *butlab2=[[UILabel alloc]initWithFrame:CGRectMake(160, 260, 80, 20)];
    butlab2.text=@" 手工艺品";
    butlab2.font=[UIFont systemFontOfSize:12];
    butlab2.textAlignment=NSTextAlignmentCenter;
    [view addSubview:butlab2];

    
    UIButton *but5=[[UIButton alloc]initWithFrame:CGRectMake(260, 220, 40, 40)];
    [but5 setImage:[UIImage imageNamed:@"zb_kzms"] forState:UIControlStateNormal];
    [view addSubview:but5];
    
    UILabel *butlab3=[[UILabel alloc]initWithFrame:CGRectMake(240, 260, 80, 20)];
    butlab3.text=@" 客栈民宿";
    butlab3.font=[UIFont systemFontOfSize:12];
    butlab3.textAlignment=NSTextAlignmentCenter;
    [view addSubview:butlab3];
    
    
    
    
    UILabel *tiplab=[[UILabel alloc]initWithFrame:CGRectMake(0, 290, 80, 40)];
    tiplab.text=@"附近美食";
    tiplab.font=[UIFont systemFontOfSize:12];
    tiplab.backgroundColor=XBColor(246, 246, 246);
    tiplab.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab];
    
    UILabel *tiplab1=[[UILabel alloc]initWithFrame:CGRectMake(80, 290, 80, 40)];
    tiplab1.text=@"大牌商圈";
    tiplab1.font=[UIFont systemFontOfSize:12];
    tiplab1.backgroundColor=XBColor(246, 246, 246);
    tiplab1.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab1];
    
    UILabel *tiplab2=[[UILabel alloc]initWithFrame:CGRectMake(160, 290, 80, 40)];
    tiplab2.text=@"娱乐休闲";
    tiplab2.font=[UIFont systemFontOfSize:12];
    tiplab2.backgroundColor=XBColor(246, 246, 246);
    tiplab2.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab2];
    
    UILabel *tiplab3=[[UILabel alloc]initWithFrame:CGRectMake(240, 290, 80, 40)];
    tiplab3.text=@"当地名胜";
    tiplab3.backgroundColor=XBColor(246, 246, 246);
    tiplab3.font=[UIFont systemFontOfSize:12];
    tiplab3.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab3];
    
    
    UILabel *tiplab4=[[UILabel alloc]initWithFrame:CGRectMake(0, 330, 80, 40)];
    tiplab4.text=@"附近美食";
    tiplab4.font=[UIFont systemFontOfSize:12];
    tiplab4.backgroundColor=XBColor(246, 246, 246);
    tiplab4.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab4];
    
    UILabel *tiplab5=[[UILabel alloc]initWithFrame:CGRectMake(80, 330, 80, 40)];
    tiplab5.text=@"大牌商圈";
    tiplab5.font=[UIFont systemFontOfSize:12];
    tiplab5.backgroundColor=XBColor(246, 246, 246);
    tiplab5.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab5];
    
    UILabel *tiplab6=[[UILabel alloc]initWithFrame:CGRectMake(160, 330, 80, 40)];
    tiplab6.text=@"娱乐休闲";
    tiplab6.font=[UIFont systemFontOfSize:12];
    tiplab6.backgroundColor=XBColor(246, 246, 246);
    tiplab6.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab6];
    
    UILabel *tiplab7=[[UILabel alloc]initWithFrame:CGRectMake(240, 330, 80, 40)];
    tiplab7.text=@"当地名胜";
    tiplab7.backgroundColor=XBColor(246, 246, 246);
    tiplab7.font=[UIFont systemFontOfSize:12];
    tiplab7.textAlignment=NSTextAlignmentCenter;
    [view addSubview:tiplab7];


    
    UILabel *titlelab=[[UILabel alloc]initWithFrame:CGRectMake(20, 370, 80, 40)];
    titlelab.text=@"附近美食";
    titlelab.font=[UIFont systemFontOfSize:15];
    [view addSubview:titlelab];

    
    UIImageView *foodimageview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 410, 140, 100)];
    foodimageview.image=[UIImage imageNamed:@"zb_rm"];
    [view addSubview:foodimageview];
    
  
    
    UIImageView *foodimageview1=[[UIImageView alloc]initWithFrame:CGRectMake(170, 410, 140, 100)];
    foodimageview1.image=[UIImage imageNamed:@"zb_rm"];
    [view addSubview:foodimageview1];
    
      [self setSublab:foodimageview];
      [self setSublab:foodimageview1];



    
}


-(void)setSublab:(UIView *)view
{
    UILabel *sublab=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 40, 20)];
    sublab.text=@"热门";
    sublab.textAlignment=NSTextAlignmentCenter;
    sublab.font=[UIFont systemFontOfSize:10];
    sublab.textColor=[UIColor whiteColor];
    sublab.backgroundColor=[UIColor clearColor];
    [view  addSubview:sublab];
    
    UILabel *sublab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 60, 130, 20)];
    sublab1.text=@"小糖人欢乐火锅 ";
    sublab1.textAlignment=NSTextAlignmentRight;
    sublab1.font=[UIFont systemFontOfSize:11];
    sublab1.textColor=[UIColor whiteColor];
    sublab1.backgroundColor=[UIColor clearColor];
    [view  addSubview:sublab1];
    
    UILabel *sublab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 130, 20)];
    sublab2.text=@"会员  8.8折 ";
    sublab2.textAlignment=NSTextAlignmentRight;
    sublab2.font=[UIFont systemFontOfSize:13];
    sublab2.textColor=XBColor(235, 106, 65);
    sublab2.backgroundColor=[UIColor clearColor];
    [view  addSubview:sublab2];

}

-(void)refreshLocation
{
    [self setLocation];
}

-(void)Surrounding
{
    
    SurroundingViewController *StVc=[[SurroundingViewController alloc]init];
    [self.navigationController pushViewController:StVc animated:YES];
    
}
-(void)setMapView
{
    //初始化地图
    _mapView=[[MAMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 180)];
    _mapView.delegate=self;
    
    [self.view addSubview:_mapView];
    _mapView.showsCompass= NO;     // 设置成NO表示关闭指南针；YES表示显示指南针
    
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22); //设置指南针位置
    
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    
    _mapView.showsScale= 0;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);  //设置比例尺位置
    
    _mapView.centerCoordinate=_mapView.userLocation.coordinate;
    //    设置地图logo的位置
    //    _mapView.logoCenter = CGPointMake(CGRectGetWidth(self.view.bounds)-55, 450);
    
    //  _mapView.userTrackingMode=MAUserTrackingModeFollow ;
    
    _mapView.zoomEnabled = YES;    //NO表示禁用缩放手势，YES表示开启
    [_mapView setZoomLevel:18 animated:YES];
    
    
    
    
    
    _mapView.customizeUserLocationAccuracyCircleRepresentation=YES;
    
    _mapView.pausesLocationUpdatesAutomatically = NO;
    
    _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    MAOverlayRenderer *render=[[MAOverlayRenderer alloc]init];
    [render renderRegionWithPoints:nil pointCount:1 fillColor:[UIColor clearColor] usingTriangleFan:NO];
    return render;
}
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MAAnnotationView *view = views[0];
    
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        
        
//        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
//        //        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
//        //        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
//        //        pre.image = [UIImage imageNamed:@"location.png"];
//        //        pre.lineWidth = 3;
//        //        pre.lineDashPattern = @[@6, @3];
//        
//        
////        pre.image=[UIImage imageNamed:@"sd_dw"];
//        
//        pre.showsAccuracyRing=NO;
//        
//        [self.mapView updateUserLocationRepresentation:pre];
    
        
        view.calloutOffset = CGPointMake(0, 0);
    }  
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
    
    
  //  [self.mapView addObserver:self forKeyPath:@"showsUserLocation" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        
        
        
        CLGeocoder *geocoder=[[CLGeocoder alloc]init];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            for (CLPlacemark * place in placemarks) {
                
                NSLog(@" --%@   --%@   --%@",place.locality,place.thoroughfare,place.name);
                
            }
        }];

        
        if (regeocode)
        {
            NSLog(@"\n\n reGeocode:%@  \n\n\n", regeocode);
        }
    }];
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
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        for (CLPlacemark * place in placemarks) {
            
          NSLog(@"%@%@%@",place.locality,place.subLocality,place.thoroughfare);
            
            
            _locationlab.text=[NSString stringWithFormat:@"%@%@%@",place.locality,place.subLocality,place.thoroughfare];
        }

       
    }];
    
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
        
        CLGeocoder *geocoder=[[CLGeocoder alloc]init];
        [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            for (CLPlacemark * place in placemarks) {
                
                NSLog(@"--%@",place.name);
                
            }
            
            
        }];


    }
    self.mapView.userTrackingMode=0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
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
