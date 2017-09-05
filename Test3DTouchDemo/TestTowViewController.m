//
//  TestTowViewController.m
//  3D TouchTest
//
//  Created by maweilong-PC on 2017/9/1.
//  Copyright © 2017年 maweilong. All rights reserved.
//

#import "TestTowViewController.h"

@interface TestTowViewController ()
@property (nonatomic,strong) UILabel *InformationLabel;
@end

@implementation TestTowViewController
- (UILabel *)InformationLabel {
    
    if (!_InformationLabel) {
        
        _InformationLabel = [[UILabel alloc] init];
    }
    
    return _InformationLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"test2";
    
    self.InformationLabel.text = [NSString stringWithFormat:@"通过点击下标为[%@]进来的", self.InfoStr];
    self.InformationLabel.textColor = [UIColor blackColor];
    self.InformationLabel.textAlignment = NSTextAlignmentCenter;
    self.InformationLabel.frame = CGRectMake(0, 0, 200, 30);
    [self.InformationLabel sizeToFit];
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    self.InformationLabel.center = center;
    
    [self.view addSubview:self.InformationLabel];
}



//3D Touch 预览图时 向上拖拽得到的快捷功能菜单
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    NSMutableArray *arrItem = [NSMutableArray new];
    UIPreviewAction *previewAction0 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        //
        
        NSLog(@"didClickCancel");
    }];
    UIPreviewAction *previewAction1 = [UIPreviewAction actionWithTitle:@"替换" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        //
        
        NSLog(@"替换");
    }];
    [arrItem addObjectsFromArray:@[previewAction0,previewAction1]];
    return arrItem;
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

@end
