//
//  ProfileViewController.m
//  魅眼
//
//  Created by xbo on 16/9/1.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "ProfileViewController.h"
#import "PrefixHeader.pch"
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *HeaderView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"b-16"]];
    HeaderView.frame=CGRectMake(0, -64, self.view.width, 150);
    HeaderView.userInteractionEnabled=YES;
    
    UIImageView *IconView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"60X60"]];
    IconView.frame=CGRectMake(42, 80, 40, 40);
    IconView.userInteractionEnabled=YES;
    [HeaderView addSubview:IconView];
    
    UILabel *namelab=[[UILabel alloc]initWithFrame:CGRectMake(92, 85, 80, 20)];
    namelab.text=@"魅眼科技";
    namelab.font=[UIFont systemFontOfSize:12];
    [HeaderView addSubview:namelab];
    
    UILabel *fanslab=[[UILabel alloc]initWithFrame:CGRectMake(92, 105, 70, 20)];
    fanslab.text=@"粉丝 128";
    fanslab.font=[UIFont systemFontOfSize:12];
    [HeaderView addSubview:fanslab];
    
    UILabel *likelab=[[UILabel alloc]initWithFrame:CGRectMake(162, 105, 80, 20)];
    likelab.text=@"关注 18";
    likelab.font=[UIFont systemFontOfSize:12];
    [HeaderView addSubview:likelab];
    
    self.tableView.tableHeaderView=HeaderView;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    self.tableView.scrollEnabled=NO;
    
       
//    self.tableView.contentInset=UIEdgeInsetsMake(60-35, 0, 0, 0);
    
//    
//    self.view.backgroundColor=XBRandomColor;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return 5;
    }
    else
    {
        return 1;}
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 60;
    }
    if (section==1) {
        return 10;
    }
    else  {
        return 20;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.imageView.image=[UIImage imageNamed:@"Ticket_335px_1192357_easyicon.net"];
            cell.textLabel.text=@"我的门票";
        }
        if (indexPath.row==1) {
            cell.imageView.image=[UIImage imageNamed:@"Share_1168px_1183447_easyicon.net"];
            cell.textLabel.text=@"分享好友";
        }
        if (indexPath.row==2) {
            cell.imageView.image=[UIImage imageNamed:@"mailbox_512px_1187384_easyicon.net"];
            cell.textLabel.text=@"吐槽我们";
        }
        if (indexPath.row==3) {
            cell.imageView.image=[UIImage imageNamed:@"contact_32px_504800_easyicon.net"];
            cell.textLabel.text=@"联系我们";
        }
        if (indexPath.row==4) {
            cell.imageView.image=[UIImage imageNamed:@"Ticket_335px_1192357_easyicon.net"];
            cell.textLabel.text=@"优惠券";
        }
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section==1) {
        self.tableView.sectionFooterHeight=10;
        cell.imageView.image=[UIImage imageNamed:@"gear21"];
        cell.textLabel.text=@"设置";
    }
    if (indexPath.section==2) {
        cell.textLabel.text=@"退出登录";
    }

    

    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        UIView *heardview=[[UIView alloc]initWithFrame:CGRectMake(00, 0, self.view.width, 40)];
        
        UIImageView *payview=[[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 30, 15)];
        payview.image=[UIImage imageNamed:@"credit96"];
        [heardview addSubview:payview];
        
        UIImageView *clotview=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.width/4+20, 15, 30, 15)];
        clotview.image=[UIImage imageNamed:@"truck_711px_1158282_easyicon.net"];
        [heardview addSubview:clotview];
        
        UIImageView *judgeview=[[UIImageView alloc]initWithFrame:CGRectMake(2*self.view.width/4+20, 15, 30, 15)];
        judgeview.image=[UIImage imageNamed:@"chat_532px_1172969_easyicon.net"];
        [heardview addSubview:judgeview];
        
        
        UIImageView *regoodsview=[[UIImageView alloc]initWithFrame:CGRectMake(3*self.view.width/4+20,15,30, 15)];
        regoodsview.image=[UIImage imageNamed:@"truck_711px_1158282_easyicon.net"];
        [heardview addSubview:regoodsview];
        
        
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, 30, 15)];
        lab.text=@"待付款";
        lab.font=[UIFont systemFontOfSize:10];
        [heardview addSubview:lab];
        
        UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(self.view.width/4+20, 30, 30, 15)];
        lab1.text=@"待收货";
        lab1.font=[UIFont systemFontOfSize:10];
        [heardview addSubview:lab1];
        
        UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(2*self.view.width/4+20, 30, 30, 15)];
        lab2.text=@"待评价";
        lab2.font=[UIFont systemFontOfSize:10];
        [heardview addSubview:lab2];
        
        UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(3*self.view.width/4+20, 30, 30, 15)];
        lab3.text=@"退货";
        lab3.textAlignment=NSTextAlignmentCenter;
        lab3.font=[UIFont systemFontOfSize:10];
        [heardview addSubview:lab3];
        
        heardview.backgroundColor=[UIColor clearColor];
        return heardview;

    }
    else
        return nil;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
