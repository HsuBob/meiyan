//
//  SailingViewController.m
//  魅眼
//
//  Created by xbo on 16/9/6.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "SailingViewController.h"
#import "DetailSearchViewController.h"
#import "PrefixHeader.pch"
#import "MYSearchBar.h"
@interface SailingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UIButton *desityitembut;
@property (nonatomic ,strong)UIButton *helpitembut;
@property (nonatomic ,strong)UIView *labView;
@property (nonatomic ,strong)NSArray *arry;
@property (nonatomic ,strong)UIView *HelpView;
@property (nonatomic ,strong)UITableView *subtitletable;
@property (nonatomic ,strong)UIScrollView *ContentScrollView;
@property (nonatomic ,strong)UIButton *but;
@property (nonatomic ,strong) UIButton *dayBut;
@property (nonatomic ,strong)NSArray *dayarry;
@end

@implementation SailingViewController
@synthesize desityitembut,helpitembut,labView,arry,subtitletable,ContentScrollView,HelpView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 140)];
    imageView.image=[UIImage imageNamed:@"7487939_194730408001_2"];
    imageView.userInteractionEnabled=YES;
    [self.view addSubview:imageView];
    
    MYSearchBar *mysear=[[MYSearchBar alloc]initWithFrame:CGRectMake(20, 90, 280, 30)];
    mysear.placeholder=@"输入你想去的地方";
    [imageView addSubview:mysear];
    
    
    
    desityitembut=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2-120, 150, 120, 40)];
    [desityitembut setTitle:@"目的地大全" forState:UIControlStateNormal];
    [desityitembut setTitle:@"目的地大全" forState:UIControlStateSelected];
    desityitembut.selected=YES;
    [desityitembut setTitleColor:XBColor(131, 131, 131) forState:UIControlStateNormal];
    [desityitembut setTitleColor:XBColor(79, 212, 241) forState:UIControlStateSelected];
    [desityitembut addTarget:self action:@selector(desitnationChoice:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:desityitembut];
    
    helpitembut=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2+10, 150, 120, 40)];
    [helpitembut setTitle:@"帮你选目的地" forState:UIControlStateNormal];
    [helpitembut setTitle:@"帮你选目的地" forState:UIControlStateSelected];
    [helpitembut setTitleColor:XBColor(131, 131, 131) forState:UIControlStateNormal];
    [helpitembut setTitleColor:XBColor(79, 212, 241) forState:UIControlStateSelected];
    [helpitembut addTarget:self action:@selector(helpChoice:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:helpitembut];
    
    
    UIView *lineview=[[UIView alloc]initWithFrame:CGRectMake(0, 189, self.view.width, 1)];
    lineview.backgroundColor=XBColor(217, 217 , 217);
    [self.view addSubview:lineview];
    
    labView=[[UIView alloc]initWithFrame:CGRectMake(self.view.width/2-120, 187, 120, 2)];
    labView.backgroundColor=XBColor(79, 212, 241);
    [self.view addSubview:labView];
    
    
    [self setDenstyView];
    
   
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    
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
-(void)setDenstyView
{
    
    subtitletable=[[UITableView alloc]initWithFrame:CGRectMake(0, 190, 50, self.view.height-240)  style:UITableViewStylePlain];
    subtitletable.delegate=self;
    subtitletable.dataSource=self;
    subtitletable.showsVerticalScrollIndicator=NO;
    subtitletable.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:subtitletable];
    
    
    
    
    arry=[NSArray arrayWithObjects:@"热门",@"周边",@"国内",@"马尔代夫",@"韩国",@"欧洲",@"泰国",@"日本",@"东南亚", nil];
    
    
    ContentScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(50, 190, self.view.width-50, 580)];
    ContentScrollView.scrollEnabled=NO;
    ContentScrollView.contentSize=CGSizeMake(self.view.width-50, 600*arry.count);
    
    ContentScrollView.showsHorizontalScrollIndicator=NO;
    ContentScrollView.showsVerticalScrollIndicator=NO;
    
    for (int i=0; i<arry.count; i++) {
        [ContentScrollView addSubview:[self setContentView:i]];
    }
    [self.view addSubview:ContentScrollView];

}


-(UIView *)setContentView:(int)tag
{
    
   
    
    UIView *ContentView=[[UIView alloc]initWithFrame:CGRectMake(0, 600, self.view.width-50, 600)];
    
    
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 120, 40)];
    lab1.text=[NSString stringWithFormat:@"清凉国内好去处  %d",tag ];
    lab1.font=[UIFont systemFontOfSize:14];
    lab1.textColor=XBColor(131, 131, 131);
    [ContentView addSubview:lab1];
    
    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 45, self.view.width-70, 80)];
    imageview1.image=[UIImage imageNamed:@"176-12972"];
    [ContentView addSubview:imageview1];
    
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 130, 100, 30)];
    lab2.text=@"云南";
    lab2.font=[UIFont systemFontOfSize:17];
    [ContentView addSubview:lab2];
    
    UILabel *lab4=[[UILabel alloc]initWithFrame:CGRectMake(130, 130, 120, 30)];
    lab4.text=@"124万人出游";
    lab4.font=[UIFont systemFontOfSize:12];
    lab4.textColor=XBColor(131, 131, 131);
    [ContentView addSubview:lab4];
    
    UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(10, 160, 120, 30)];
    lab3.text=@"走到哪里都是风景";
    lab3.font=[UIFont systemFontOfSize:13];
    lab3.textColor=XBColor(131, 131, 131);
    [ContentView addSubview:lab3];
    
    
    UIImageView *imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(10, 195, 80, 60)];
    imageview2.image=[UIImage imageNamed:@"4928086_4928086_1282369546879"];
    [ContentView addSubview:imageview2];
    
    UILabel *lab5=[[UILabel alloc]initWithFrame:CGRectMake(10, 255, 80, 20)];
    lab5.textAlignment=NSTextAlignmentLeft;
    lab5.text=@"厦门";
    lab5.font=[UIFont systemFontOfSize:15];
    [ContentView addSubview:lab5];
    
    UIImageView *imageview3=[[UIImageView alloc]initWithFrame:CGRectMake(95, 195, 80, 60)];
    imageview3.image=[UIImage imageNamed:@"42A58PICCBR"];
    [ContentView addSubview:imageview3];
    
    UILabel *lab6=[[UILabel alloc]initWithFrame:CGRectMake(95, 255, 80, 20)];
    lab6.textAlignment=NSTextAlignmentLeft;
    lab6.text=@"三亚";
    lab6.font=[UIFont systemFontOfSize:15];
    [ContentView addSubview:lab6];
    
    UIImageView *imageview4=[[UIImageView alloc]initWithFrame:CGRectMake(180, 195, 80, 60)];
    imageview4.image=[UIImage imageNamed:@"20150820013715-375u-i47174vH2U473640"];
    [ContentView addSubview:imageview4];
    
    UILabel *lab7=[[UILabel alloc]initWithFrame:CGRectMake(180, 255, 80, 20)];
    lab7.textAlignment=NSTextAlignmentLeft;
    lab7.text=@"九寨沟";
    lab7.font=[UIFont systemFontOfSize:15];
    [ContentView addSubview:lab7];

    UILabel *lab8=[[UILabel alloc]initWithFrame:CGRectMake(10, 270, 120, 40)];
    lab8.text=@"周末去哪儿";
    lab8.font=[UIFont systemFontOfSize:14];
    lab8.textColor=XBColor(131, 131, 131);
    [ContentView addSubview:lab8];
    
    UITableView *detailtable=[[UITableView alloc]initWithFrame:CGRectMake(0, 600*tag, self.view.width-50, self.view.height-190)];
    detailtable.tableHeaderView=ContentView;
    detailtable.showsVerticalScrollIndicator=NO;

    return detailtable;
}
-(void)desitnationChoice:(UIButton *)sender
{
    [UIView beginAnimations:@"aa" context:nil];
    [UIView setAnimationDuration:0.2];
    labView.x=sender.x;
    [self.view addSubview:ContentScrollView];
    [self.view addSubview:subtitletable ];
    
    [HelpView removeFromSuperview];
    
    [UIView commitAnimations];
    helpitembut.selected=NO;
    
    sender.selected=YES;
    
}

-(void)helpChoice:(UIButton *)sender
{
  
    
    [UIView beginAnimations:@"aa" context:nil];
    [UIView setAnimationDuration:0.2];
    labView.x=sender.x;
    [ContentScrollView removeFromSuperview];
    [subtitletable  removeFromSuperview];
    
    [self setHelpView];
    [UIView commitAnimations];
    
    sender.selected=YES;
    desityitembut.selected=NO;
    
}




/**
 *  ********      pragam mark -创建 帮你选择页面
 */


-(void)setHelpView
{
    
    
    
    HelpView=[[UIView alloc]initWithFrame:CGRectMake(0, 190, self.view.width, 900)];
   
    
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 50)];
    lab.text=@"目的地方向";
    lab.textColor=XBColor(135, 135, 135);
    lab.font=[UIFont systemFontOfSize:15];
    [HelpView addSubview:lab];

    [self setTip];
    
    UIView *lineview=[[UIView alloc]initWithFrame:CGRectMake(0, 210, self.view.width, 1)];
    lineview.backgroundColor=XBColor(217, 217 , 217);
    [HelpView addSubview:lineview];
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 210, 100, 50)];
    lab1.text=@"适合人群";
    lab1.textColor=XBColor(135, 135, 135);
    lab1.font=[UIFont systemFontOfSize:15];
    [HelpView addSubview:lab1];
    
    
    [self setbutFrame:CGRectMake(10, 260, 65, 50) Title:nil Image:@"qzy"];
    [self setbutFrame:CGRectMake(85, 260, 65, 50) Title:nil Image:@"bmy"];
    [self setbutFrame:CGRectMake(160, 260, 65, 50) Title:nil Image:@"myy"];
    [self setbutFrame:CGRectMake(235, 260, 65, 50) Title:nil Image:@"byy"];
    
    
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 310, 100, 50)];
    lab2.text=@"游玩天数";
    lab2.textColor=XBColor(135, 135, 135);
    lab2.font=[UIFont systemFontOfSize:15];
    [HelpView addSubview:lab2];
    
    _dayBut=[[UIButton alloc]initWithFrame:CGRectMake(75, 325, 40, 20)];
    [_dayBut setTitle:@"不限" forState:UIControlStateNormal];
    _dayBut.backgroundColor=XBColor(242, 242, 242);
    _dayBut.titleLabel.font=[UIFont systemFontOfSize:14];
    [_dayBut setTitleColor:XBColor(79, 212, 241) forState:UIControlStateNormal];
    [_dayBut addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [HelpView addSubview:_dayBut];

   
    
    [self pogressView:HelpView Y:360 Tag:1];
    
    UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 100, 50)];
    lab3.text=@"出游时间";
    lab3.textColor=XBColor(135, 135, 135);
    lab3.font=[UIFont systemFontOfSize:15];
    [HelpView addSubview:lab3];
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 450, 300, 60)];
    imageview.image=[UIImage imageNamed:@"riqi"];
    imageview.userInteractionEnabled=YES;
    [HelpView addSubview:imageview];
    
    UILabel *lab4=[[UILabel alloc]initWithFrame:CGRectMake(30, 10 , 100, 20)];
    lab4.text=@"最早";
    lab4.textAlignment=NSTextAlignmentCenter;
    lab4.font=[UIFont systemFontOfSize:13];
    [imageview addSubview:lab4];
    
    UILabel *lab5=[[UILabel alloc]initWithFrame:CGRectMake(30, 30 , 100, 20)];
    lab5.text=@"选择日期";
    lab5.textColor=XBColor(79, 212, 241);
    lab5.textAlignment=NSTextAlignmentCenter;
    lab5.font=[UIFont systemFontOfSize:13];
    [imageview addSubview:lab5];
    
    UILabel *lab6=[[UILabel alloc]initWithFrame:CGRectMake(170, 10 , 100, 20)];
    lab6.text=@"最晚";
    lab6.textAlignment=NSTextAlignmentCenter;
    lab6.font=[UIFont systemFontOfSize:13];
    [imageview addSubview:lab6];
    
    UILabel *lab7=[[UILabel alloc]initWithFrame:CGRectMake(170, 30 , 100, 20)];
    lab7.text=@"选择日期";
    lab7.textColor=XBColor(79, 212, 241);
    lab7.textAlignment=NSTextAlignmentCenter;
    lab7.font=[UIFont systemFontOfSize:13];
    [imageview addSubview:lab7];

    
    UILabel *lab8=[[UILabel alloc]initWithFrame:CGRectMake(10, 520, 100, 50)];
    lab8.text=@"单人预算";
    lab8.textColor=XBColor(135, 135, 135);
    lab8.font=[UIFont systemFontOfSize:15];
    [HelpView addSubview:lab8];
    
    UIButton *But=[[UIButton alloc]initWithFrame:CGRectMake(75, 535, 40, 20)];
    [But setTitle:@"不限" forState:UIControlStateNormal];
    But.backgroundColor=XBColor(242, 242, 242);
    But.titleLabel.font=[UIFont systemFontOfSize:14];
    [But setTitleColor:XBColor(79, 212, 241) forState:UIControlStateNormal];
    [But addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [HelpView addSubview:But];
   
    [self pogressView:HelpView Y:570 Tag:2];
    
    UIButton *But2=[[UIButton alloc]initWithFrame:CGRectMake(10, 620, 40, 40)];
    But2.titleLabel.font=[UIFont systemFontOfSize:14];
    [But2 setImage:[UIImage imageNamed:@"cz"] forState:UIControlStateNormal];
    [But2 addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [HelpView addSubview:But2];
    
    UIButton *But3=[[UIButton alloc]initWithFrame:CGRectMake(60, 620, 240, 40)];
    But3.titleLabel.font=[UIFont systemFontOfSize:14];
    [But3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [But3 setTitle:@"全部532个目的地，1354条线路" forState:UIControlStateNormal];
    But3.backgroundColor=XBColor(247, 197, 60);
    [But3 addTarget:self action:@selector(cityChoice) forControlEvents:UIControlEventTouchUpInside];
    [HelpView addSubview:But3];

    
    
    UITableView *detailtable=[[UITableView alloc]initWithFrame:CGRectMake(0, 190, self.view.width, self.view.height-190)];
     detailtable.tableHeaderView=HelpView;
    detailtable.showsVerticalScrollIndicator=NO;

    [self.view addSubview:detailtable];

   
}

-(void)pogressView:(UIView *)view Y:(CGFloat)y Tag:(NSInteger)index
{
    _dayarry=[NSArray arrayWithObjects:@"不限",@"1",@"2",@"3",@"4",@"5-6",@"7-8",@"9-10",@">10", nil];
   
    
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(10, y, 290, 10)];
    slider.maximumValue=100;
    slider.minimumValue=0;
    slider.value=0;
    slider.tag=index;
    slider.tintColor=XBColor(79, 212, 241);
    slider.autoresizingMask=UIViewAutoresizingFlexibleWidth;
//    [slider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
//    [slider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
    
 //   [slider setThumbImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateHighlighted];
    [slider setThumbImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
    [slider addTarget:self action:@selector(sliderDragUp:) forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:slider];
    
    
    for (int i=0; i<_dayarry.count; i++) {
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(5+35*i, y+20, 25, 20)];
        lab.text=_dayarry[i];
        lab.tag=i;
        lab.textAlignment=NSTextAlignmentCenter;
        lab.textColor=XBColor(79, 212, 241);
        lab.font=[UIFont systemFontOfSize:11];
        [view addSubview:lab];
        
        
       
    }
    
    //   _but=[[UIButton alloc]initWithFrame:CGRectMake(10, 350, 15, 20)];
    //    [_but setImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
    //    [view addSubview:_but];
//    
//    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(daychoice:)];
//    swipe.direction=UISwipeGestureRecognizerDirectionRight;
//    [_but addGestureRecognizer:swipe];
//    
//    UISwipeGestureRecognizer *swipe1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(daychoice:)];
//    swipe1.direction=UISwipeGestureRecognizerDirectionLeft;
//    [_but addGestureRecognizer:swipe1];

}

-(void)sliderValueChanged:(UISlider *)sender
{
    
    NSUInteger index = (NSUInteger)sender.value;
    [sender setValue:index-0.22 animated:YES];
    
}
-(void)sliderDragUp:(UISlider *)sender
{
     NSInteger level= sender.value*8/100+1;
    if (sender.value<8) {
        level=0;
    }
    
    [UIView beginAnimations:@"day" context:nil];
    [UIView setAnimationDuration:0.2];
    
    sender.value=level*12.5;
    if (sender.tag==1) {
         [_dayBut setTitle:[NSString stringWithFormat:@"%@",_dayarry[level]] forState:UIControlStateNormal];
    }
   
    [UIView commitAnimations];

    
    
}
-(void)daychoice:(UISwipeGestureRecognizer *)sender
{
   if(sender.view.center.y>370&&sender.view.center.y<350)
   {
       sender.enabled=NO;
        NSLog(@"33333");
   }
    else
    {
        sender.enabled=YES;
        _but.x=sender.view.center.x;
        
        
    }
    
}


-(void)setTip
{
    
    [self setbutFrame:CGRectMake(10, 50, 65, 40) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 50, 65, 40) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 50, 65, 40) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 50, 65, 40) Title:@"泰国" Image:nil];
    
    
    
    
    
    [self setbutFrame:CGRectMake(10, 100, 65, 40) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 100, 65, 40) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 100, 65, 40) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 100, 65, 40) Title:@"泰国" Image:nil];
    
    
    [self setbutFrame:CGRectMake(10, 150, 65, 40) Title:@"周边" Image:nil];
    [self setbutFrame:CGRectMake(85, 150, 65, 40) Title:@"国内" Image:nil];
    [self setbutFrame:CGRectMake(160, 150, 65, 40) Title:@"巴厘岛" Image:nil];
    [self setbutFrame:CGRectMake(235, 150, 65, 40) Title:@"泰国" Image:nil];

    
    
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
    [HelpView addSubview:But];
}
-(void)cityChoice
{
   
    
//    前一段公司赶项目赶时间,OK我无怨言，我能为公司作出牺牲。但我认为有些事情闲时都不处理，忙时更没得处理。
    
}

/**
 *  pragma mark - TableView Datasource
 *
 *
 */


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


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arry.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier=@"cell";
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    else  //当页面拉动的时候 当cell存在并且最后一个存在 把它进行删除就出来一个独特的cell我们在进行数据配置即可避免
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
   

    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    lab.text=arry[indexPath.row];
    lab.font=[UIFont systemFontOfSize:12];
    lab.textAlignment=NSTextAlignmentCenter;
    [cell.contentView addSubview:lab];
    
    cell.backgroundColor=XBColor(232, 233, 232);
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, 50)];
    lineView.backgroundColor=XBColor(71, 171, 128);
    [view addSubview:lineView];
    
    cell.selectedBackgroundView=view;
    
    
    //    NSLog(@"%@",arry[indexPath.row]);
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
    ContentScrollView.contentOffset =CGPointMake(0, 600*indexPath.row);
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
