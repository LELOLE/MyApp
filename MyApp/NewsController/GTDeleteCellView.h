//
//  GTDeleteCellView.h
//  MyApp
//
//  Created by zhujunli on 2020/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView


- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
- (void)dismissDeleteView;

@end

NS_ASSUME_NONNULL_END
