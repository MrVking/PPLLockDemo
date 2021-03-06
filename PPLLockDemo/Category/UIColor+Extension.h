//
//  UIColor+Extension.h
//  OnlyBother_Personal
//
//  Created by Makang on 2016/11/22.

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**应用主题色*/
+ (UIColor *)colorThemeColor;

+(UIColor *)colorLightWhiteColor;

+ (UIColor *)colorGreenColor;

+ (UIColor *)colorBrownColor;

+ (UIColor *)colorRedColor;
//导航栏毛玻璃效果导致的色差  ，假导航用这个上色
+ (UIColor *)newThemeColor;

/**应用辅助色*/
+ (UIColor *)colorAssistColor;
/**应用常用灰*/
+ (UIColor *)colorLightGrayColor;
/**应用深灰*/
+(UIColor *)colorDarkGrayColor;

/**随机色*/
+ (UIColor *)colorWithRandom;
/**16进制色*/
+ (UIColor *)colorWithHexString:(NSString *)colorStr;

/**HUD的背景颜色*/
+(UIColor *)colorHudColor;

/**导航栏颜色*/
+ (UIColor *)colorNavigationBarColor;

/**view背景色*/
+ (UIColor *)colorBackGroundColor;
/**分割线灰*/
+ (UIColor *)colorBoardLineColor;
/**view纯白背景色*/
+ (UIColor *)colorWhiteColor;
/**view偏灰色背景色*/
+(UIColor *)viewBackGroundColor;
/**登录&注册输入框分割线颜色*/
+ (UIColor *)colorLoginRgisterLineColor;


/**深色字体*/
+ (UIColor *)colorDarkTextColor;
/**浅色字*/
+ (UIColor *)colorLightTextColor;
/**渐变*/
+ (CAGradientLayer *)shadowAsInverseWithFrame:(CGRect)frame;


/**
 修改颜色的辅助色
 */
+ (UIColor *)colorTextAssistColor;

/**
 常用按钮字体&背景颜色
 */
+ (UIColor *)totalLabelColor;


+ (UIColor *)colorButtonAssistColor;

/**
 输入框占位文本颜色

 @return 颜色值
 */
+ (UIColor *)colorPlaceholderColor;

@end
