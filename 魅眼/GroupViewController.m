//
//  GroupViewController.m
//  魅眼
//
//  Created by xbo on 16/9/14.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "GroupViewController.h"
#import "TourstTableViewCell.h"
#import "GuiderTableViewCell.h"
#import "PrefixHeader.pch"
@interface GroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIScrollView *viewScroll;
@property(nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIButton *selectedBtn;
@property (nonatomic,strong) UIButton *GuideselectedBtn;
@property (nonatomic,strong) UIScrollView *Guide;
@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationItem.title=@"组团";
    
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    
    UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fy-102-拷贝"]];
    imageview.frame=CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:imageview];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    NSArray *arry=[NSArray arrayWithObjects:@"游客",@"导游",@"发布", nil];
    for (int i=0; i<arry.count; i++)
    {
        UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/3*i, 64, self.view.width/3, 40)];
        but.tag=i;
        if (i==0) {
            but.selected=1;
            self.selectedBtn=but;
        }
      
        [but setTitle:arry[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected ];
        [but setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal ];
        [but addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:but];
        
    }

    _viewScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 104, self.view.width, self.view.height-104)];
    _viewScroll.contentSize=CGSizeMake(self.view.width*3, 0);
    _viewScroll.showsHorizontalScrollIndicator=0;
    [self.view addSubview:_viewScroll];
    
    UITableView *Tourist=[[UITableView alloc]initWithFrame: CGRectMake(0, 0, self.view.width, self.view.height-104) style:UITableViewStylePlain];
    Tourist.tag=0;
    Tourist.delegate=self;
    Tourist.dataSource=self;
    [_viewScroll addSubview:Tourist];
    
    UITableView *guider=[[UITableView alloc]initWithFrame:CGRectMake(self.view.width*1, 0, self.view.width, self.view.height-104) style:UITableViewStylePlain];
    guider.tag=1;
    guider.delegate=self;
    guider.dataSource=self;
    [_viewScroll addSubview:guider];
    
    
    
    UITableView *republic=[[UITableView alloc]initWithFrame:CGRectMake(self.view.width*2, 0, self.view.width, self.view.height-104) style:UITableViewStyleGrouped];
    [self detailView:republic];
    [_viewScroll addSubview:republic];

    
    _lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 103, self.view.width/3, 1)];
    _lineView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_lineView];

    
}



-(void)change:(UIButton *)sender
{
    [UIView beginAnimations:@"name" context:nil];
    [UIView setAnimationDuration:0.2];
    
    
    if (sender!= self.selectedBtn) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
    }else{
        self.selectedBtn.selected = YES;
    }

    
    _viewScroll.contentOffset=CGPointMake(self.view.width*sender.tag, 0);
    _lineView.x=sender.tag*self.view.width/3;
    [UIView commitAnimations];
}


-(void)detailView:(UITableView *)tableView
{
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 500)];
    UIImageView *HeaderView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2531170_093213084000_2"]];
    HeaderView.frame=CGRectMake(0, 0, self.view.width, 150);
    [backgroundView addSubview:HeaderView];
    
    NSArray *butarry=[NSArray arrayWithObjects:@"我是导游",@"我是游客",nil];
    for (int i=0; i<butarry.count; i++)
    {
        UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2*i, 150, self.view.width/2, 40)];
        but.tag=i;
        
        if (i==0)
        {
         
            but.selected=1;
            self.GuideselectedBtn=but;
        }
        but.titleLabel.font=[UIFont systemFontOfSize:14];
        but.titleLabel.textAlignment=NSTextAlignmentCenter;
        [but setTitle:butarry[i] forState:UIControlStateNormal];
          [but setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal ];
        [but setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected ];
        but.backgroundColor=[UIColor whiteColor];
        [but setBackgroundImage:[UIImage imageNamed:@"fb01_wsykdt"] forState:UIControlStateSelected];
        [but addTarget:self action:@selector(selectChange:) forControlEvents:UIControlEventTouchUpInside];
       
        [backgroundView addSubview:but];
        
    }
    
    
    
    _Guide=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 190, self.view.width, 300)];
    _Guide.contentSize=CGSizeMake(self.view.width*2, 0);
    _Guide.scrollEnabled=0;
    [backgroundView addSubview:_Guide];
    
    NSArray *buttarry=[NSArray arrayWithObjects:@"黄鹤楼",@"2016/9/23/9:30",@"2人",@"带小孩",nil];
    NSArray *labarry=[NSArray arrayWithObjects:@"出发地点:",@"出发时间:",@"人数:",@"备注:",nil];

    [_Guide addSubview:[self GuideViewsetFrane:CGRectMake(self.view.width, 0, self.view.width, 300)  Lab:labarry But:buttarry ]];
    
    NSArray *buttarry1=[NSArray arrayWithObjects:@"黄鹤楼",@"2016/9/23/9:30",@"现有5人参团",nil];
    NSArray *labarry1=[NSArray arrayWithObjects:@"集合地点:",@"集合时间:",@"备注:",nil];
    
    [_Guide addSubview:[self GuideViewsetFrane:CGRectMake(0, 0, self.view.width, 300)  Lab:labarry1 But:buttarry1 ]];
    
    tableView.showsVerticalScrollIndicator=0;
    tableView.tableHeaderView=backgroundView;

    
    
}
-(void)selectChange:(UIButton *)sender
{
    if (sender!= self.GuideselectedBtn) {
        self.GuideselectedBtn.selected = NO;
        sender.selected = YES;
        self.GuideselectedBtn = sender;
    }else{
        self.GuideselectedBtn.selected = YES;
    }

    
    _Guide.contentOffset=CGPointMake(self.view.width*sender.tag, 0);
}

-(UIView *)GuideViewsetFrane:(CGRect)frame Lab:(NSArray *)labarry But:(NSArray *)butarry
{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=XBColor(235, 236, 237);
    
    
    
    for (int i=0; i<butarry.count; i++) {
  
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 10+35*i, 100, 30)];
    lable.backgroundColor=[UIColor clearColor];
    lable.font=[UIFont systemFontOfSize:14];
    lable.textColor=[UIColor darkGrayColor];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.text=labarry[i];
    [view addSubview:lable];
    
    UIButton *but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame=CGRectMake(110, 10+35*i, 180, 30);
    but.layer.masksToBounds=1;
    but.layer.cornerRadius=3;
    but.titleLabel.font=[UIFont systemFontOfSize:14];
    but.titleLabel.textAlignment=NSTextAlignmentCenter;
    but.backgroundColor=[UIColor whiteColor];
    [but setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [but setTitle:butarry[i] forState:UIControlStateNormal];
    [view addSubview:but];
}
    return view;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag==0) {
        [tableView registerNib:[UINib nibWithNibName:@"TourstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        
        TourstTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath ];
        
        return cell;

    }
    else
    {
        
        [tableView registerNib:[UINib nibWithNibName:@"GuiderTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        
        GuiderTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath ];
        
        return cell;

    
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


// 让分割线距左边的间隙为0
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    //按照作者最后的意思还要加上下面这一段，才能做到底部线控制位置，所以这里按stackflow上的做法添加上吧。
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
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
