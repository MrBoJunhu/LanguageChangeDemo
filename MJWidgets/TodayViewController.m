//
//  TodayViewController.m
//  MJWidgets
//
//  Created by BillBo on 2017/7/27.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#define standardHeihgt 37
#define row_Height 40
#define max_Height row_Height * self.titlesArray.count

@interface TodayViewController () <NCWidgetProviding,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *myTBV;

@property (nonatomic, strong) NSArray *titlesArray;

@property (nonatomic, assign) NCWidgetDisplayMode displlayModel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
  
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titlesArray = @[@"主页",@"分类",@"购物车",@"我的"];
    
    self.myTBV.delegate = self;
    
    self.myTBV.dataSource = self;
    
    self.myTBV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
  
    [super didReceiveMemoryWarning];
    
}



#pragma mark - 展示 widgets 折叠收起
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    // Widgets 设置默认为"展开"
    self.displlayModel = NCWidgetDisplayModeExpanded;
    self.extensionContext.widgetLargestAvailableDisplayMode = self.displlayModel;
    CGFloat screen_Width = [UIScreen mainScreen].bounds.size.width;
    self.preferredContentSize = CGSizeMake(screen_Width, max_Height);
    
}

#pragma mark - 点击"展开" "折叠效果"

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
  
    CGFloat screen_Width = [UIScreen mainScreen].bounds.size.width;
    
    self.displlayModel = activeDisplayMode;
    
    if (self.displlayModel == NCWidgetDisplayModeCompact) {
      
        //显示展开
        self.preferredContentSize = CGSizeMake(screen_Width, standardHeihgt);
        
    }else{
        
        //显示"折叠"
        self.preferredContentSize = CGSizeMake(screen_Width, max_Height);

    }

    
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    
    completionHandler(NCUpdateResultNewData);
    
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    
    return UIEdgeInsetsMake(0, 16, 0, 0);
    
}

#pragma mark - tableview delegate and datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *cell_Identifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_Identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_Identifier];
      
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell_Identifier];
    
    }
    
    cell.textLabel.text = self.titlesArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:@"图片1.jpg"];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return row_Height;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titlesArray.count;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSNumber *row = @(indexPath.row);
 
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:groupID];
   
    [userDefault setObject:isFromWidgets_Obj forKey:isFromWidgets_Key];
    [userDefault setObject:row forKey:selectedRow];
    
    [userDefault synchronize];
    
    [self.extensionContext openURL:[NSURL URLWithString:@"TestWight://"] completionHandler:^(BOOL success) {
        
        NSLog(@"打开了啊");
        
    }];

}

@end
