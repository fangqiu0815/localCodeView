//
//  DropDownMenu.m
//  localCodeView
//
//  Created by apple on 2017/1/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DropDownMenu.h"
/*
 RGBAlpha(255, 255, 255)
 */
#define RGB(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]


@implementation DropDownMenu

+ (void)showWith:(NSString *)str to:(UIView *)view belowSubView:(UIView *)belowview
{
    for (UIView  *sub in view.subviews) {
        if ([sub isKindOfClass:[DropDownMenu class]]) {
            return;
        }
    }
    CGFloat labelX = 0;
    CGFloat labelW = [UIScreen mainScreen].bounds.size.width;
    CGFloat labelH = 30;
    CGFloat labelY = -30;
    
    DropDownMenu *menu = [[DropDownMenu alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelW, labelH)];
    label.text = str;
    label.backgroundColor = RGB(245, 96, 255);
    label.alpha = 0.5;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    
    [menu addSubview:label];
    
    [view insertSubview:menu belowSubview:belowview];
    
    //设置动画
    [UIView animateWithDuration:0.3 animations:^{
        
        label.transform = CGAffineTransformMakeTranslation(0,labelH * 3);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [menu removeFromSuperview];
        }];
    }];
}


@end
