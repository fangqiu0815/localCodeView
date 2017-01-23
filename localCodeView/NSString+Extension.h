

#import <Foundation/Foundation.h>
#import "MidView.h"


@interface NSString (Extension)

///**
// *  判断是否为账号格式
// */
//- (BOOL)matchWithText:(MidView *)YXTextField;
//
///**
//*  判断是否为密码格式
//*/
//
//- (BOOL)matchSecondWithText:(MidView *)MMTextField;

/**
 *  判断是否为邮箱格式
 */
- (BOOL)isEmail;

/**
 *  判断是否为手机号格式
 */
- (BOOL)isPhone:(NSString *)mobile;



@end
