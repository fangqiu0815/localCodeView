//
//  RegisterTopView.h
//  localCodeView
//
//  Created by apple on 2017/1/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTopView : UIView

/**
 *  返回上级页面按钮
 */
@property (nonatomic,strong) UIButton *backBtn;
/**
 *  头像图片
 */
@property (nonatomic,strong) UIImageView *iconImageView;
/**
 *  性别
 */
@property (nonatomic,strong) NSString *xingbie;


@end
