//
//  MidView.m
//  localCodeView
//
//  Created by apple on 2017/1/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MidView.h"
#import "Masonry.h"
#import "FQTextField.h"
/*
 RGBAlpha(255, 255, 255)
 */
#define RGB(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
@interface MidView()<UITextFieldDelegate>

/**
 *  邮箱文本框下方的线条
 */
@property (nonatomic,strong) UIView *YXlineView;
/**
 *  密码文本框下方的线条
 */
@property (nonatomic,strong) UIView *MMlineView;


@end

@implementation MidView


#pragma mark -
#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.YXtextField];
        [self addSubview:self.MMtextField];
        [self addSubview:self.YXlineView];
        [self addSubview:self.MMlineView];
        [self addSubview:self.LoginBtn];
        [self addSubview:self.getCodeBtn];
        self.YXtextField.delegate = self;
        self.MMtextField.delegate = self;
        
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [textField resignFirstResponder];
    return YES;
}


#pragma mrk - 自动适配
- (void)setupAutoLayout
{
    __weak typeof(self)vc = self;
    //邮箱输入框约束
    [_YXtextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.mas_top).offset(10);
        make.centerX.equalTo(vc.mas_centerX);
        //make.right.equalTo(vc.mas_right).offset(100);
        make.left.equalTo(vc.mas_left).offset(30);
        make.bottom.equalTo(vc.MMtextField.mas_top).offset(-20) ;
    }];
    
    //密码输入框约束
    [_MMtextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.YXtextField.mas_bottom).offset(20);
        make.centerX.equalTo(vc.mas_centerX);
        //make.right.equalTo(vc.mas_right).offset(100);
        make.left.equalTo(vc.YXtextField.mas_left);
        make.height.equalTo(vc.YXtextField.mas_height);
    }];
    
    //邮箱线条约束
    [_YXlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.YXtextField.mas_bottom);
        make.centerX.equalTo(vc.mas_centerX);
        make.left.equalTo(vc.YXtextField.mas_left).offset(5);
        make.height.mas_equalTo(1);
    }];
    
    //密码线条约束
    [_MMlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.MMtextField.mas_bottom);
        make.left.equalTo(vc.MMtextField.mas_left).offset(5);
        make.centerX.equalTo(vc.mas_centerX);
        make.height.mas_equalTo(1);
    }];
    
    //登录按钮约束
    [_LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.MMtextField.mas_bottom).offset(20);
        //make.centerX.equalTo(vc.mas_centerX);
        make.right.equalTo(vc.MMtextField.mas_right);
        make.width.offset(100);
        make.height.equalTo(vc.YXtextField.mas_height);
    }];
    
    //获取验证码约束
    [_getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.MMtextField.mas_bottom).offset(20);
        make.left.equalTo(vc.MMtextField.mas_left);
        //make.right.equalTo(vc.LoginBtn.mas_left).offset(50);
        make.width.equalTo(vc.LoginBtn.mas_width);
        make.height.equalTo(vc.YXtextField.mas_height);
    }];
    
}


#pragma mark - 懒加载
- (FQTextField *)YXtextField
{
    if (!_YXtextField) {
        //创建邮箱TextField
        _YXtextField = [[FQTextField alloc] init];
        _YXtextField.title = @"手机";
    }
    return _YXtextField;
}

- (FQTextField *)MMtextField
{
    if (!_MMtextField) {
        _MMtextField = [[FQTextField alloc] init];
        _MMtextField.title = @"密码";
        _MMtextField.secureTextEntry = YES;
    }
    return _MMtextField;
}


- (UIView *)YXlineView
{
    if (!_YXlineView) {
        _YXlineView = [[UIView alloc] init];
        _YXlineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _YXlineView;
}


- (UIView *)MMlineView
{
    if (!_MMlineView) {
        _MMlineView = [[UIView alloc] init];
        _MMlineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _MMlineView;
}

- (UIButton *)LoginBtn
{
    if (!_LoginBtn) {
        _LoginBtn = [[UIButton alloc] init];
        _LoginBtn.backgroundColor = RGB(55, 207, 16);
        [_LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_LoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _LoginBtn;
}


- (UIButton *)getCodeBtn
{
    if (!_getCodeBtn) {
        _getCodeBtn = [[UIButton alloc]init];
        _getCodeBtn.backgroundColor = RGB(55, 207, 16);
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
    }
    return _getCodeBtn;

}





@end
