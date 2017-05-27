//
//  ViewController.m
//  test
//
//  Created by 毛强 on 2016/11/14.
//  Copyright © 2016年 maoqiang. All rights reserved.
//

#import "ViewController.h"
#import "MQSecondViewController.h"
#import "SCModalTransition.h"
#import "UIImage+image.h"
#import <JavaScriptCore/JavaScriptCore.h> 

@interface ViewController ()<UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

#pragma mark ==== UINavigationControllerDelegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
        SCModalTransition *transiton = [[SCModalTransition alloc]init];
        return transiton;
}
-(void)screenShot{
    
    //设置截屏尺寸与缩放透明上下文
    UIGraphicsBeginImageContextWithOptions(self.tabBarController.tabBar.frame.size, YES, 0);
    
    //设置截屏位置
    [self.tabBarController.tabBar.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //获取图片
    UIImage *sendImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
//    CGImageRef imageRef = sendImage.CGImage;
//    CGRect rect = self.button.frame;//这里可以设置想要截图的区域
    
//    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
//    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    
    //以下为图片保存代码
    UIImageWriteToSavedPhotosAlbum(sendImage, nil, nil, nil);//保存图片到照片库
    
//    NSData *imageViewData = UIImagePNGRepresentation(sendImage);
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *pictureName= @"screenShow.png";
//    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:pictureName];
//    [imageViewData writeToFile:savedImagePath atomically:YES];//保存照片到沙盒目录
//    
//    CGImageRelease(imageRef);
    
    
    //从手机本地加载图片
    
//    UIImage *bgImage2 = [[UIImage alloc]initWithContentsOfFile:savedImagePath];
}


@end
