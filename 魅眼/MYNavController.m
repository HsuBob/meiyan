//
//  MYNavController.m
//  魅眼
//
//  Created by xbo on 16/9/1.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "MYNavController.h"
#import "UIBarButtonItem+Extension.h"
@interface MYNavController ()

@end

@implementation MYNavController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
        
//        [UIView animateWithDuration:0.5 animations:^{
//            UIView *view = [[UIView alloc] init];
//            view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
//            [self.view insertSubview:view belowSubview:self.navigationBar];
        
//        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
//        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"tm"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:[UIImage imageNamed:@"tm"]];
        [self.navigationBar setBackgroundColor:[UIColor clearColor]];
        [self.navigationBar setTintColor:[UIColor clearColor]];
        self.navigationBar.translucent=YES;
        self.navigationBar.layer.masksToBounds = YES;// 去掉横线（没有这一行代码导航栏的最下面还会有一个横线）
//        }];
        
     
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"z2" highImage:nil];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:nil highImage:nil];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
//  #warning 这里要用self，不是self.navigationController
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

//- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    // 如果进入的是当前视图控制器
//    if (viewController == self) {
//        // 背景设置为黑色
////        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
////        // 透明度设置为0.3
////        self.navigationController.navigationBar.alpha = 0.300;
////        // 设置为半透明
////        self.navigationController.navigationBar.translucent = YES;
//        
//        [self.navigationController.navigationBar setTranslucent:YES];
//        //    为什么要加这个呢，shadowImage 是在ios6.0以后才可用的。但是发现5.0也可以用。不过如果你不判断有没有这个方法，
//        //    而直接去调用可能会crash，所以判断下。作用：如果你设置了上面那句话，你会发现是透明了。但是会有一个阴影在，下面的方法就是去阴影
//        if ([self.navigationController.navigationBar respondsToSelector:@selector(shadowImage)])
//        {
//            [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//        }
//        //    以上面4句是必须的,但是习惯还是加了下面这句话
////        [self.navigationController.navigationBar setBackgroundColor:ClearColor];
//    } else {
//        // 进入其他视图控制器
//        self.navigationController.navigationBar.alpha = 1;
//        // 背景颜色设置为系统默认颜色
//        self.navigationController.navigationBar.tintColor = nil;
//        self.navigationController.navigationBar.translucent = NO;
//    }
//}
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
