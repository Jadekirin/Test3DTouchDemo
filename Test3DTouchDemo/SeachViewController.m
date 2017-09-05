//
//  SeachViewController.m
//  3D TouchTest
//
//  Created by maweilong-PC on 2017/9/4.
//  Copyright © 2017年 maweilong. All rights reserved.
//

#import "SeachViewController.h"

@interface SeachViewController ()
@property (nonatomic,strong) UILabel *pressLab;
@property (nonatomic,strong) UILabel *showpressLab;
@end

@implementation SeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"搜索";
    [self testressure];
}

//测试按压的力度
- (void)testressure{
    self.pressLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 200, 100)];
    self.pressLab.backgroundColor = [UIColor blueColor];
    self.pressLab.text = @"用不同的力度按我试试";
    self.pressLab.textColor = [UIColor whiteColor];
    self.pressLab.tag = 100;
    self.pressLab.userInteractionEnabled = YES;
    [self.view addSubview:self.pressLab];
    
    self.showpressLab = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 200, 40)];
    self.showpressLab.backgroundColor = [UIColor redColor];
    self.showpressLab.text = @"压力";
    self.showpressLab.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.showpressLab];
}

//压力回调
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 100) {
        //红色背景的label显示压力值
        _showpressLab.text = [NSString stringWithFormat:@"Began压力%f",touch.force];
        
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 100) {
        //红色背景的label显示压力值
        _showpressLab.text = [NSString stringWithFormat:@"Moved压力%f",touch.force];
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 100) {
        //红色背景的label显示压力值
        _showpressLab.text = [NSString stringWithFormat:@"End压力%f",touch.force];
        
    }
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
