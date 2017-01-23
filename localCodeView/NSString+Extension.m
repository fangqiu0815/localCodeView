
#import "NSString+Extension.h"

@implementation NSString (Extension)

//#pragma mark - 创建账号的登录的正则
//- (BOOL)matchWithText:(MidView *)YXTextField
//{
//    NSString *str = YXTextField.text;
//    NSString *regex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
//    NSString *regex1 = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex1];
//    if ([predicate evaluateWithObject:str  ]||[predicate1 evaluateWithObject:str]) {
//        NSLog(@"%@",YXTextField.text);
//        return YES;
//    }
//    NSLog(@"-------1111");
//    return NO;
//}
//
//#pragma mark - 创建密码的登录的正则
//- (BOOL)matchSecondWithText:(MidView *)MMTextField
//{
//    NSString *passWordStr = MMTextField.text;
//    NSString *regex = @"^[a-zA-Z0-9]{6,20}+$";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHS %@",regex ];
//    if ([predicate evaluateWithObject:passWordStr]) {
//        NSLog(@"%@",passWordStr );
//        return YES;
//    }
//    return NO;
//}
//
//
//



- (BOOL)match:(NSString *)Pattern
{
    //1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:Pattern options:0 error:nil];
    
    //2.测试字符串
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count > 0;
}

- (BOOL)isEmail
{
    NSString *Pattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self match:Pattern];
}

/**
 *  正则表达式验证手机号
 *
 *  @param mobile 传入手机号
 *
 *
 */
- (BOOL)isPhone:(NSString *)mobile
{
    //    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    //    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];

}


@end
