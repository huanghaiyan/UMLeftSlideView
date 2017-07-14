//
//  ViewController.m
//  UMLeftSlideView
//
//  Created by 黄海燕 on 17/7/14.
//  Copyright © 2017年 huanghy. All rights reserved.
//

#import "ViewController.h"
#import "UMLeftSlideView.h"
#import "UMLeftSlideModel.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<5; i++) {
        UMLeftSlideModel *model = [[UMLeftSlideModel alloc] init];
        model.imageName = [NSString stringWithFormat:@"h%d.jpg",i+1];
        [self.dataArray addObject:model];
    }
    
    UMLeftSlideView *leftSlideView = [[UMLeftSlideView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 180)];
    leftSlideView.dataArray = self.dataArray;
    [leftSlideView setLeftSlideViewTitle:@"财险专题" font:[UIFont systemFontOfSize:17] textColor:[UIColor redColor]];
    [leftSlideView setMoreButtonTitle:@"更多>" font:[UIFont systemFontOfSize:14] textColor:[UIColor lightGrayColor]];
    if (self.dataArray.count > 4) {
        [leftSlideView setMoreButtonHidden:NO];
    }
    [self.view addSubview:leftSlideView];
    
    leftSlideView.seeMoreBlock = ^(){
        NSLog(@"查看更多");
    };
    
    leftSlideView.clickBtnBlock = ^(NSInteger clickIndex){
        NSLog(@"你点击了第%ld个",(long)clickIndex);
    };
}


@end
