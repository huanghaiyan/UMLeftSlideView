//
//  UMLeftSlideView.m
//  UMLeftSlideView
//
//  Created by 黄海燕 on 17/7/14.
//  Copyright © 2017年 huanghy. All rights reserved.
//

#import "UMLeftSlideView.h"
#import "UMLeftSlideModel.h"

#define ScrollViewHeight    100
#define ImageBtnWidth       165
#define ImageBtnMargin      10
#define EdgeDistance        10

@interface UMLeftSlideView ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UIScrollView *mScrollView;

@end

@implementation UMLeftSlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        [self createUI:frame];
    }
    return self;
}

- (void)createUI:(CGRect)frame{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(EdgeDistance, 0, 180, 50)];
    [self addSubview:self.titleLabel];
    
    self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.moreButton.frame = CGRectMake(frame.size.width-50-EdgeDistance, 10, 50, 30);
    self.moreButton.hidden = YES;//默认不显示，图片资源大于4张显示
    [self.moreButton addTarget:self action:@selector(seeMore:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreButton];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(EdgeDistance, self.titleLabel.frame.size.height + 1, frame.size.width - 2*10, 1)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:lineView];
    
    self.mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 66, frame.size.width, ScrollViewHeight)];
    self.mScrollView.showsVerticalScrollIndicator = NO;
    self.mScrollView.showsHorizontalScrollIndicator = NO;
    self.mScrollView.bounces = NO;
    self.mScrollView.scrollsToTop = NO;
    [self addSubview:self.mScrollView];
}

- (void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray = dataArray;
    [self setupView];
}

//设置左侧视图的文字
- (void)setLeftSlideViewTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor{
    self.titleLabel.text = title;
    self.titleLabel.font = font;
    self.titleLabel.textColor = textColor;
}

//设置更多按钮视图的文字
- (void)setMoreButtonTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor{
    [self.moreButton setTitle:title forState:UIControlStateNormal];
    self.moreButton.titleLabel.font = font;
    [self.moreButton setTitleColor:textColor forState:UIControlStateNormal];
}

//设置更多按钮是否显示
- (void)setMoreButtonHidden:(BOOL)isHidden{
    self.moreButton.hidden = isHidden;
}

- (void)setupView{
    NSInteger imageCount = _dataArray.count;
    for (int i = 0; i<imageCount; i++) {
        UIButton *imageBtn = [[UIButton alloc] initWithFrame:CGRectMake(EdgeDistance+(ImageBtnWidth+ImageBtnMargin)*i, 0, ImageBtnWidth, ScrollViewHeight)];
        UMLeftSlideModel *model = _dataArray[i];
        [imageBtn setBackgroundImage:[UIImage imageNamed:model.imageName] forState:UIControlStateNormal];
        [imageBtn setBackgroundImage:[UIImage imageNamed:model.imageName] forState:UIControlStateHighlighted];
        imageBtn.tag = 10000+i;
        [imageBtn addTarget:self action:@selector(clickImageBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:imageBtn];
    }
    
    self.mScrollView.contentSize = CGSizeMake(EdgeDistance+(ImageBtnWidth+ImageBtnMargin)*imageCount, ScrollViewHeight);
}

//查看更多回调
- (void)seeMore:(UIButton *)sender{
    if (self.seeMoreBlock != nil) {
        self.seeMoreBlock();
    }
}

//点击图片按钮回调
- (void)clickImageBtn:(UIButton *)sender{
    NSInteger clickIndex = sender.tag-10000;
    if (self.clickBtnBlock != nil) {
        self.clickBtnBlock(clickIndex);
    }
}

@end
