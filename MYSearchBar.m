//
//  MYSearchBar.m
//  魅眼
//
//  Created by xbo on 16/9/1.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "MYSearchBar.h"

@implementation MYSearchBar





- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder=@"搜索";
        self.textAlignment=NSTextAlignmentCenter;
        
        self.borderStyle = UITextBorderStyleRoundedRect;
        UIImageView *LeftView = [[UIImageView alloc] init];
        LeftView.image=[UIImage imageNamed:@"ss"];
        LeftView.contentMode = UIViewContentModeCenter;
        LeftView.frame=CGRectMake(0, 0, 30, 0);
        // 添加到左侧视图中
        self.leftViewMode =UITextFieldViewModeAlways;
        self.leftView = LeftView;
        
        UIButton *RightView = [[UIButton alloc] init];
        [RightView setImage:[UIImage imageNamed:@"Microphone"] forState:UIControlStateNormal];;
        RightView.contentMode = UIViewContentModeCenter;
        RightView.frame=CGRectMake(0, 0, 30, 30);
        
        
        self.rightView= RightView;
        self.rightViewMode =UITextFieldViewModeAlways;
        
        //    [nametx setValue:[UIColor colorWithRed:126/255.0  green:195/255.0  blue:201/255.0  alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
        self.adjustsFontSizeToFitWidth = YES;

    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
