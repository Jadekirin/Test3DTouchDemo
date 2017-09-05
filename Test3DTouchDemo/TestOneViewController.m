//
//  TestOneViewController.m
//  3D TouchTest
//
//  Created by maweilong-PC on 2017/9/1.
//  Copyright © 2017年 maweilong. All rights reserved.
//

#import "TestOneViewController.h"
#import "TestTowViewController.h"
@interface TestOneViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation TestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"test1";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 60;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@"test1",@"test2"];
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = arr[indexPath.row];
    
    //注册3D Touch
    /**
     从iOS9开始，我们可以通过这个类来判断运行程序对应的设备是否支持3D Touch功能。
     UIForceTouchCapabilityUnknown = 0,     //未知
     UIForceTouchCapabilityUnavailable = 1, //不可用
     UIForceTouchCapabilityAvailable = 2    //可用
    */
    
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                [self registerForPreviewingWithDelegate:(id)self sourceView:cell];
            }
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTowViewController *VC = [[TestTowViewController alloc] init];
    NSArray *arr = @[@"1",@"2"];
    VC.InfoStr = arr[indexPath.row];
    VC.index = indexPath.row;
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - 3D Touch代理 UIViewControllerPreviewingDelegate

//预览图
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    NSArray *arr = @[@"1",@"2"];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];
    //创建要预览的控制器
    TestTowViewController *TwoVC = [[TestTowViewController alloc] init];
    TwoVC.InfoStr = arr[indexPath.row];
    TwoVC.index = indexPath.row;
    
    //指定当前上下文视图Rect
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    previewingContext.sourceRect = rect;
    return TwoVC;
    
}

//从预览图跳转进入TestTwo 控制器
//(用力按压 跳转)
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self showViewController:viewControllerToCommit sender:self];
}

@end
