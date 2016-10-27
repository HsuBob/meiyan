//
//  SurroundingViewController.m
//  魅眼
//
//  Created by xbo on 16/9/14.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "SurroundingViewController.h"
#import "SurroudingTableViewCell.h"
#import "PrefixHeader.pch"
@interface SurroundingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SurroundingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;

    self.navigationItem.title=@"附近的人";
    
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];

    
    UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fy-102-拷贝"]];
    imageview.frame=CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:imageview];
    
    UITableView *surroundingView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    surroundingView.delegate=self;
    surroundingView.dataSource=self;
    [self.view addSubview:surroundingView];
    
    self.view.backgroundColor=XBColor(242, 242, 242);
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView registerNib:[UINib nibWithNibName:@"SurroudingTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    SurroudingTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath ];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
