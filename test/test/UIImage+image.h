
#import <UIKit/UIKit.h>

/*
    实现圆形裁剪
    实现控件裁剪
 */

@interface UIImage (image)

//圆形裁剪
+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;

//控件截屏
+ (UIImage *)imageWithCapture:(UIView *)view;


@end
