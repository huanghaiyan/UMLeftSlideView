//
//  UMLeftSlideView.h
//  UMLeftSlideView
//
//  Created by 黄海燕 on 17/7/14.
//  Copyright © 2017年 huanghy. All rights reserved.
//

#import <UIKit/UIKit.h>
//查看更多回调
typedef void(^SeeMoreBlock)();
//点击图片按钮回调
typedef void(^ClickBtnBlock)(NSInteger clickIndex);

@interface UMLeftSlideView : UIView


@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,copy) SeeMoreBlock seeMoreBlock;
@property (nonatomic,copy) ClickBtnBlock clickBtnBlock;

/**
 * 设置左侧视图的文字
 * parameter:title 文字内容 font 文字字体 textColor 文字颜色
 */
- (void)setLeftSlideViewTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor;

/**
 * 设置更多按钮视图的文字
 * parameter:title 文字内容 font 文字字体 textColor 文字颜色
 */
- (void)setMoreButtonTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor;
/**
 * 设置更多按钮是否显示
 */
- (void)setMoreButtonHidden:(BOOL)isHidden;

@end
