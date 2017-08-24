//
//  ViewController.m
//  hotel
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 adminadmineducation. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"

@interface ViewController ()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bannerView;

@end

@implementation ViewController
{
    NSArray *_imagesURLStrings;
    SDCycleScrollView *_customCellScrollViewDemo;

  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"005.jpg"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    
       [self custom];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)custom{
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:demoContainerView];

    
    // 情景一：采用本地图片实现
    // 本地图片请填写全名
  NSArray *imageNames = @[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg",@"timg",@"timg-1",@"timg-2",@"timg-3"];
     // 本地加载 --- 创建不带标题的图片轮播器
   /*    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, UI_SCREEN_W, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
     cycleScrollView.delegate = self;
     cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
     [demoContainerView addSubview:cycleScrollView];
     cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
     //         --- 轮播时间间隔，默认1.0秒，可自定义
     cycleScrollView.autoScrollTimeInterval = 4.0;
     */
    

//    // 情景二：采用网络图片实现
//    NSArray *imagesURLStrings = @[
//                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
//                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
//                                  @"http://bbs.zhulong.com/101010_group_201805/detail31113662.jpg"
//                                  ];
 //   _imagesURLStrings = imagesURLStrings;
    
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"disableScrollGesture可以设置禁止拖动",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];

    

    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, UI_SCREEN_W, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
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
