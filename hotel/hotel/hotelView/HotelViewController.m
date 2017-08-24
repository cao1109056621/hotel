//
//  HotelViewController.m
//  HotelReservation
//
//  Created by admin1 on 2017/8/19.
//  Copyright © 2017年 Education. All rights reserved.
//

#import "HotelViewController.h"
#import "HotelTableViewCell.h"
#import "SDCycleScrollView.h"

@interface HotelViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>{
    NSInteger page;
    NSInteger perPage;
}

@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;
@property (strong ,nonatomic) NSArray *arr;
@property (strong ,nonatomic) NSArray *arry;
@end

@implementation HotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        _arr = @[@{@"imageview":@"h1",@"nameLabel":@"无锡万达喜来登酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 350"},@{@"imageview":@"h2",@"nameLabel":@"无锡苏宁凯越酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 260"},@{@"imageview":@"h1",@"nameLabel":@"无锡万达喜来登酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 350"},@{@"imageview":@"h2",@"nameLabel":@"无锡苏宁凯越酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 260"},@{@"imageview":@"h1",@"nameLabel":@"无锡万达喜来登酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 350"},@{@"imageview":@"h2",@"nameLabel":@"无锡苏宁凯越酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 260"},@{@"imageview":@"h1",@"nameLabel":@"无锡万达喜来登酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 350"},@{@"imageview":@"h2",@"nameLabel":@"无锡苏宁凯越酒店",@"placeLabel":@"无锡",@"distanceLabel":@"距离我3.5公里",@"priceLabel":@"Y 260"}];
    
    _arry = @[@"img_01.jpg",@"img_02.jpg",@"img_03.jpg",@"img_04.jpg",@"img_05.jpg"];
    self.bannerView.imageURLStringsGroup = _arry;
    self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.bannerView.delegate = self;
    self.bannerView.currentPageDotColor = [UIColor yellowColor];
    perPage=10;
    page=1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - table view
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arr.count;
}

//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
//细胞长什么样
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelcell" forIndexPath:indexPath];
    //根据行号拿到数组中对应的数据
    NSDictionary *dict = _arr[indexPath.section];
    
    cell.imageview.image = [UIImage imageNamed:dict[@"imageview"]];
    cell.nameLabel.text = dict[@"nameLabel"];
    cell.placeLabel.text = dict[@"placeLabel"];
    cell.distanceLabel.text = dict[@"distanceLabel"];
    cell.priceLabel.text = dict[@"priceLabel"];
    return cell;
}

//设置细胞的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
