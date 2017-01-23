
#import "LoginViewController.h"
#import "Masonry.h"
#import "BottomView.h"
#import "MidView.h"
#import "TopView.h"
#import "DropDownMenu.h"
#import "RegisterViewController.h"
#import "FQTextField.h"
#import "NSString+Extension.h"
#import <SMS_SDK/SMSSDK.h>
#import "SVProgressHUD.h"
//十六进制数转UIColor的
#define kColorFromRGBHexi(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface LoginViewController ()

/**
 顶部界面
 **/
@property (nonatomic,strong) TopView *topView;
/**
 中部界面
 **/
@property (nonatomic,strong) MidView *midView;
/**
 下部界面
 **/
@property (nonatomic,strong) BottomView *bottomView;
/**
 添加对获取验证码时间的定时器
 **/
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation LoginViewController

#pragma mark - 生命周期的方法
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.midView];
    [self.view addSubview:self.bottomView];
    
    //给按钮添加方法
    //返回按钮
    [self.topView.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //注册按钮
    [self.topView.registerBtn addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    //确认按钮
    [self.midView.LoginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    //获取验证码按钮
    [self.midView.getCodeBtn addTarget:self action:@selector(getCodeClick) forControlEvents:UIControlEventTouchUpInside];
    
    //给子控件添加约束
    [self setupAutoLayout];
//    //添加通知监听键盘的显示与隐藏
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFrame) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backFrame) name:UIKeyboardWillHideNotification object:nil];
    
//收起键盘
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    
    [self.view addGestureRecognizer:singleTap];
    
}

///**
// *  页面被销毁时，移除通知
// */
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

#pragma mark -
#pragma mark - 懒加载
- (TopView *)topView
{
    if (!_topView) {
        _topView = [[TopView alloc] init];
    }
    return _topView;
}

- (MidView *)midView
{
    if (!_midView) {
        _midView = [[MidView alloc] init];
    }
    return _midView;
}

- (BottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[BottomView alloc] init];
    }
    return _bottomView;
}

#pragma mark - 给子控件添加约束
- (void)setupAutoLayout{

    __weak typeof(self)vc = self;
    //设置上部分视图约束
    CGFloat topViewH = self.view.frame.size.height / 3;
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(vc.view);
        make.height.mas_equalTo(topViewH);
    }];
    
    //设置中间视图约束
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.topView.mas_bottom);
        make.left.and.right.equalTo(vc.topView);
        make.bottom.equalTo(vc.bottomView.mas_top);
    }];
    
    //设置底部视图的约束
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(vc.view);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height * 0.2);
    }];
    
}


//#pragma mark - 通知方法
///**
// *  页面上移
// */
//- (void)changeFrame
//{
//    self.view.transform = CGAffineTransformMakeTranslation(0, -50);
//}
//
///**
// *  页面恢复
// */
//- (void)backFrame
//{
//    self.view.transform = CGAffineTransformIdentity;
//}

#pragma mark - 按钮关联的方法
/**
 *  返回上一级页面
 */
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  进入注册页面
 */
- (void)registerUser
{
    RegisterViewController *UserVC = [[RegisterViewController alloc] init];
    
    [self presentViewController:UserVC animated:YES completion:nil];
}

/**
 *  确认登录按钮
 */
- (void)login
{
    [SMSSDK commitVerificationCode:self.midView.MMtextField.text phoneNumber:self.midView.YXtextField.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
    if (!error) {
        NSLog(@"登录成功");
        //正确弹出警告款提示正确
//        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"恭喜您 ^o^" message:@"验证成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alview show];
        
        [SVProgressHUD showSuccessWithStatus:@"恭喜您 ^o^验证成功"];
        
    }else
    {
        NSLog(@"登录失败");
        //错误弹出警告款提示错误
//        UIAlertView *alview1 = [[UIAlertView alloc] initWithTitle:@"错啦错啦 0.0 "message:@"验证错误重新获取" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
//        [alview1 show];

        //添加HUD显示输入错误
        [SVProgressHUD showErrorWithStatus:@"验证错误重新获取"];
        
    }
    }];
}

//修改HUD消失时间
+ (void)dismissWithDelay:(NSTimeInterval)delay{

    [SVProgressHUD dismissWithDelay:1];
}


/**
 *  获取验证码按钮
 */
- (void)getCodeClick
{
    //为了实现获取验证码按钮点击后实现倒计时功能，首先需要判断手机格式的正确，这里采用的是手机正则表达式的形式，然后在根据线程的先后顺序实现按钮倒计时功能
     __block NSInteger time = 59; //倒计时时间
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.midView.YXtextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (self.midView.YXtextField.hasText) {
            if ([self validateMobile:self.midView.YXtextField.text] ) {
                //设置获取验证码按钮实现倒计时功能，倒计时结束后，实现重新获取验证码
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
                    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
                    dispatch_source_set_event_handler(_timer, ^{
                        if(time <= 0){ //倒计时结束，关闭
                            dispatch_source_cancel(_timer);
                            dispatch_async(dispatch_get_main_queue(), ^{
                
                                //设置按钮的样式
                                [self.midView.getCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                                [self.midView.getCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                                self.midView.getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
                                self.midView.getCodeBtn.userInteractionEnabled = YES;
                            });
                
                            }else{
                
                                int seconds = time % 60;
                                dispatch_async(dispatch_get_main_queue(), ^{
                
                                //设置按钮显示读秒效果
                                [self.midView.getCodeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                                [self.midView.getCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                                self.midView.getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
                                self.midView.getCodeBtn.userInteractionEnabled = NO;
                                 });
                                time--;
                            }
                        });
                        dispatch_resume(_timer);
            }else{
                NSLog(@"请输入正确的手机号亲");
                [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
            }
        }else{
            NSLog(@"手机号不能为空");
            [SVProgressHUD showErrorWithStatus:@"手机号码不能为空😯"];
        }
    }];
    
}

#pragma mark - 判断文本框是否符合规范
//这里采用的是正确与错误信息显示在标题栏下方的提示信息栏（自己做的提示信息栏），为了更直观的表达文本框是否符合规范，这里采用的是SVProgressHUD的显示方法
- (BOOL)isRight
{
    if (self.midView.YXtextField.text.length == 0) {
        [DropDownMenu showWith:@"请输入手机号" to:self.view belowSubView:self.view];
        return NO;
    }else if (self.midView.MMtextField.text.length == 0)
    {
        [DropDownMenu showWith:@"请输入密码" to:self.view belowSubView:self.view];
        return NO;
    }else if ([self.midView.YXtextField.text isEmail] == NO){
        [DropDownMenu showWith:@"手机号格式错误" to:self.view belowSubView:self.view];
    }
    return YES;
}

#pragma mark - 判断文本框手机号是否符合规范
//这里就是判断手机文本输入框中的文本信息是否就是现行的手机号段
//目前的手机号段如下
// 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
- (BOOL)validateMobile:(NSString *)mobile{
    
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 * 隐藏状态栏
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark --收起键盘

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.view endEditing:YES];
}



@end
