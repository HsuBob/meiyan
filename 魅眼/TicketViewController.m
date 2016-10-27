//
//  TicketViewController.m
//  魅眼
//
//  Created by xbo on 16/9/5.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "TicketViewController.h"
#import "DetailSearchViewController.h"
#import "MYSearchBar.h"
#import "PrefixHeader.pch"
@interface TicketViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSArray *Citylist;
@end

@implementation TicketViewController

//// 懒加载
//-(NSArray*)Citylist
//{
//    if (!_Citylist) {
//        _Citylist= [[NSArray alloc]initWithObjects:@"武汉",@"北京", @"上海",@"广州",@"杭州",nil];
//    }
//    return _Citylist;
//}



-(void)viewWillAppear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  导航栏标题及颜色
     */
//    self.navigationItem.title=@"景点门票";
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
//    self.view.backgroundColor=XBColor(236, 236, 236);
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    /**
     头视图
     */
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 600)];
    
    
    
    UIImageView *HeaderView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2531170_093213084000_2"]];
    HeaderView.frame=CGRectMake(0, 0, self.view.width, 150);
    HeaderView.userInteractionEnabled=YES;
    self.automaticallyAdjustsScrollViewInsets=NO;
    [view addSubview:HeaderView];
    
    
    /**
     *  地址选择栏 PickerView
     *
     *  @return nil
     */
    UIPickerView *CityPicker=[[UIPickerView alloc]initWithFrame:CGRectMake(10, 75, 40, 40)];
    CityPicker.delegate=self;
    CityPicker.dataSource=self;
    CityPicker.showsSelectionIndicator=YES;
    CityPicker.backgroundColor=[UIColor clearColor];
   // CityPicker.backgroundColor=[UIColor blackColor];
    [HeaderView addSubview:CityPicker];
    
    
    
    
    _Citylist= [[NSArray alloc]initWithObjects:@"武汉",@"北京", @"上海",@"广州",@"杭州",nil];
    
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(120, 25, 80, 40)];
    lab.text=@"景点门票";
    lab.textColor=[UIColor blackColor];
    [HeaderView addSubview:lab];
    
    UIButton *SelectBut=[[UIButton alloc]initWithFrame:CGRectMake(55, 85, 20, 20)];
    [SelectBut setImage:[UIImage imageNamed:@"左down"] forState:UIControlStateNormal];
    [HeaderView addSubview:SelectBut];
    
    
    MYSearchBar *searbar=[[MYSearchBar alloc]initWithFrame:CGRectMake(80, 80, 220, 30)];
    searbar.placeholder=@"搜索目的地";
    searbar.backgroundColor=[UIColor whiteColor];
    [HeaderView addSubview:searbar];
    
    [self setCityView:view];
    [self setTip:view];
    
    [self setCityStatioan:view];
    
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.tableHeaderView=view;
    
    tableview.showsVerticalScrollIndicator=NO;
    [self.view addSubview:tableview];
    
    
       
    
    
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

-(void)setCityStatioan:(UIView *)view
{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 280, self.view.width, self.view.height-280)];
     backView.backgroundColor=XBColor(236, 236, 236);
    [view addSubview:backView];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 290, 120, 30)];
    lab.text=@"武汉热门景点";
    lab.font=[UIFont systemFontOfSize:14];
    [view addSubview:lab ];
    
    
    
    
    /**
        ************     view 1
     */
    
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(20, 330, self.view.width/2-30, 150)];
    [imageview setImage:[UIImage imageNamed:@"20120711_e0ac3611b511f60b802eV0s66d69lzz3"]];
    [view addSubview:imageview];
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(30, 110, 90, 20)];
    lab1.text=@"武汉欢乐谷";
    lab1.font=[UIFont systemFontOfSize:14];
    [imageview  addSubview:lab1];
    
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 130, 40, 20)];
    lab2.text=@"¥95";
    lab2.textColor=XBColor(232, 74, 46);
    lab2.font=[UIFont systemFontOfSize:14];
    [imageview  addSubview:lab2];
    
    UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(50, 130, 90, 20)];
    lab3.text=@"满意度96%";
    lab3.textColor=[UIColor lightGrayColor];
    lab3.font=[UIFont systemFontOfSize:12];
    [imageview  addSubview:lab3];
    
    
    /**
     ************     view 2
     */
    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.width/2+10, 330, self.view.width/2-30, 150)];
    [imageview1 setImage:[UIImage imageNamed:@"hhl12"]];
    [view addSubview:imageview1];
    
    UILabel *lab11=[[UILabel alloc]initWithFrame:CGRectMake(30, 110, 90, 20)];
    lab11.text=@"黄鹤楼";
    lab11.font=[UIFont systemFontOfSize:14];
    [imageview1  addSubview:lab11];
    
    UILabel *lab12=[[UILabel alloc]initWithFrame:CGRectMake(10, 130, 40, 20)];
    lab12.text=@"¥60";
    lab12.textColor=XBColor(232, 74, 46);
    lab12.font=[UIFont systemFontOfSize:14];
    [imageview1  addSubview:lab12];
    
    UILabel *lab13=[[UILabel alloc]initWithFrame:CGRectMake(50, 130, 90, 20)];
    lab13.text=@"满意度98%";
    lab13.textColor=[UIColor lightGrayColor];
    lab13.font=[UIFont systemFontOfSize:12];
    [imageview1  addSubview:lab13];

}

-(void)setCityView:(UIView *)view
{
    UIButton *cityBut=[[UIButton alloc]initWithFrame:CGRectMake(30, 150, 30, 30)];
    [cityBut setImage:[UIImage imageNamed:@"whjj-22" ]  forState:UIControlStateNormal];
    cityBut.layer.cornerRadius=15;
    cityBut.backgroundColor=XBColor(236, 236, 251);
    [cityBut addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:cityBut];
    
    UILabel *citylab=[[UILabel alloc]initWithFrame:CGRectMake(70, 145, self.view.width/2-40, 40)];
    citylab.text=@"武汉景点";
    citylab.font=[UIFont systemFontOfSize:16];
    [citylab addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cityChoice)]];
    [view addSubview:citylab];
    
    UIButton *locotionBut=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2+30, 150, 30, 30)];
    [locotionBut setImage:[UIImage imageNamed:@"fj-23" ]  forState:UIControlStateNormal];
    locotionBut.layer.cornerRadius=15;
    locotionBut.backgroundColor=XBColor(244, 249, 251);
    [locotionBut addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:locotionBut];
    
    UILabel *locotionlab=[[UILabel alloc]initWithFrame:CGRectMake(self.view.width/2+70, 145, self.view.width/2-40, 40)];
    locotionlab.text=@"附近景点";
    locotionlab.font=[UIFont systemFontOfSize:16];
    [locotionlab addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cityChoice)]];
    [view addSubview:locotionlab];
    
}

-(void)cityChoice
{
    NSLog(@"222111");
}

-(void)setTip:(UIView *)view
{
    
    [self setbutFrame:CGRectMake(10, 200, 65, 30) Title:@"名胜风光" View:view];
    [self setbutFrame:CGRectMake(85, 200, 65, 30) Title:@"主题乐园" View:view];
    [self setbutFrame:CGRectMake(160, 200, 65, 30) Title:@"家庭亲子" View:view];
    [self setbutFrame:CGRectMake(235, 200, 65, 30) Title:@"节假日游" View:view];

    
    
    
    
    [self setbutFrame:CGRectMake(10, 240, 70, 30) Title:@"漂流" View:view];
    [self setbutFrame:CGRectMake(85, 240, 65, 30) Title:@"主题乐园" View:view];
    [self setbutFrame:CGRectMake(160, 240, 65, 30) Title:@"家庭亲子" View:view];
    [self setbutFrame:CGRectMake(235, 240, 65, 30) Title:@"节假日游" View:view];

    
}
-(void)setbutFrame:(CGRect)frame Title:(NSString *)title View:(UIView *)view
{
    UIButton *But=[[UIButton alloc]initWithFrame:frame];
    [But setTitle:title forState:UIControlStateNormal];
    But.backgroundColor=XBColor(244, 249, 251);
    But.titleLabel.font=[UIFont systemFontOfSize:14];
    [But setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [But addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:But];
}
/**
 *  代理方法
 *
 *  @param pickerView Datasource
 *
 *  @return
 */
// pickerView 列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//每列的个数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0) {
        return _Citylist.count;
    }
    else
        return 0;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30;
}
//每列宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 40;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString  *_proNameStr = [_Citylist objectAtIndex:row];
    NSLog(@"nameStr=%@",_proNameStr);
    
}
//返回当前行的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString  *_proNameStr = [_Citylist objectAtIndex:row];
    NSLog(@"nameStr=%@",_proNameStr);
    
    return _proNameStr;

}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *citylab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    citylab.text=_Citylist[row];
    citylab.font=[UIFont systemFontOfSize:16];
    citylab.backgroundColor=[UIColor clearColor];
    citylab.textColor=[UIColor whiteColor];
    citylab.textAlignment=NSTextAlignmentCenter;
    return citylab;
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
