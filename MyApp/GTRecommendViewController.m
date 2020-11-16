//
//  GTRecommendViewController.m
//  MyApp
//
//  Created by zhujunli on 2020/11/16.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate>

@end

@implementation GTRecommendViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"hot@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 7, self.view.bounds.size.height);
    NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor], [UIColor orangeColor], [UIColor greenColor], [UIColor grayColor], [UIColor brownColor], [UIColor purpleColor]];
    for (int i = 0; i < 7; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
//    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES; //按页为单位滚动，不是按view宽度，而是contentView 的 width
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll:%@", @(scrollView.contentOffset.x));
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"START");
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"DID END");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {//
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView API_AVAILABLE(ios(3.2)) {
    
}



@end
