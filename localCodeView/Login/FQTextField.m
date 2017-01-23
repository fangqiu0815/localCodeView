//
//  FQTextField.m
//  localCodeView
//
//  Created by apple on 2017/1/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "FQTextField.h"

@interface FQTextField ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation FQTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubViews];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)setupSubViews
{
    //创建左边的Label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.frame = CGRectMake(0, 0, 50, 30);
    
    self.titleLabel = label;
    self.leftView = label;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = [NSString stringWithFormat:@"%@:",title];
}



@end
