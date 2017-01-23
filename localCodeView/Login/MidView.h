//
//  MidView.h
//  localCodeView
//
//  Created by apple on 2017/1/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FQTextField;
@interface MidView : UIView

/**
 *  邮箱文本输入框
 */
@property (nonatomic,strong) FQTextField *YXtextField;
/**
 *  密码文本输入框
 */
@property (nonatomic,strong) FQTextField *MMtextField;
/**
 *  确认按钮
 */
@property (nonatomic,strong) UIButton *LoginBtn;

/**
 *  获取验证码按钮
 */
@property (nonatomic,strong) UIButton *getCodeBtn;




@end
