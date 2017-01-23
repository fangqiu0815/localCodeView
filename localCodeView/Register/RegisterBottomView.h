//
//  RegisterBottomView.h
//  localCodeView
//
//  Created by apple on 2017/1/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FQTextField;

@interface RegisterBottomView : UIView

/**
 *  昵称输入框
 */
@property (nonatomic,strong) FQTextField *nameTextField;
/**
 *  邮箱输入框
 */
@property (nonatomic,strong) FQTextField *YXTextField;
/**
 *  密码输入框
 */
@property (nonatomic,strong) FQTextField *MMTextField;
/**
 *  完成注册按钮
 */
@property (nonatomic,strong) UIButton *FinishBtn;
/**
 *  片刻协议按钮
 */
@property (nonatomic,strong) UIButton *messageBtn;


@end
