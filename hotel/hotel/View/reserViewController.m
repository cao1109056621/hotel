//
//  reserViewController.m
//  hotel
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 Education. All rights reserved.
//

#import "reserViewController.h"
#import "SDCycleScrollView.h"
@interface reserViewController ()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@end

@implementation reserViewController
{
    NSArray *_imagesURLStrings;
    SDCycleScrollView *_customCellScrollViewDemo;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self custom];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)custom{
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:demoContainerView];
    
    NSArray *imageNames = @[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg",@"timg.jpg",@"timg-1.jpg",@"timg-2.jpg",@"timg-3.jpg"];
    // 本地加载 --- 创建不带标题的图片轮播器
    /*    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, UI_SCREEN_W, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
     cycleScrollView.delegate = self;
     cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
     [demoContainerView addSubview:cycleScrollView];
     cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
     //         --- 轮播时间间隔，默认1.0秒，可自定义
     cycleScrollView.autoScrollTimeInterval = 4.0;
     */
    
    
    
    
    /*NSArray *titles = @[@"新建交流QQ群：185534916 ",
     @"disableScrollGesture可以设置禁止拖动",
     @"感谢您的支持，如果下载的",
     @"如果代码在使用过程中出现问题",
     @"您可以发邮件到gsdios@126.com"
     ];
     
     
     
     */
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, UI_SCREEN_W, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [demoContainerView addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imageNames;
    });
    
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}

@end
