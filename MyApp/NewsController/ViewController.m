//
//  ViewController.m
//  MyApp
//
//  Created by zhujunli on 01/11/2020.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"



@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSMutableArray *dataArray;//真实当中不用 mutable

@end

@implementation ViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
            [_dataArray addObject:@(i)];
        }
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed: @"news@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.brownColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
//    [self testSubviewManagement];
    
//    TestView *view = [[TestView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view];
    
    
//    [self.view addSubview:({
//            UILabel *label = [[UILabel alloc] init];
//            label.text = @"Hello World!";
//            label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
//            label;
//    })];
//
//    UITapGestureRecognizer *TGRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view addGestureRecognizer:TGRecognizer];
    
    
}
#pragma mark delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTDetailViewController *viewController = [[GTDetailViewController alloc] init];
//    viewController.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:viewController animated:YES];
}
#pragma mark data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCell];
//    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@",@(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"pic.jpg"];
    return cell;
}

#pragma mark selectors
- (void)pushController {
    
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右键" style:UIBarButtonItemStylePlain target:self action:@selector(action1)];     
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)action1 {
}

- (void)testSubviewManagement {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    view2.frame = CGRectMake(120, 120, 100, 100);
    [self.view addSubview:view2];
    
    //addSubview 方法管理子view使用的是栈结构
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof(self) wself = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self)strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:100];
        
    }];
}


@end




//- (instancetype)init {
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}
///*
// *
// *     重载     探究 UIViewController 的生命周期
// *
// */
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//}    // Called when the view is about to made visible. Default does nothing
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//}     // Called when the view has been fully transitioned onto the screen. Default does nothing
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
//


//@interface TestView : UIView
//
//@end
//
//@implementation TestView
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
//    [super willMoveToSuperview:newSuperview];
//
//}
//- (void)didMoveToSuperview {
//    [super didMoveToSuperview];
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
//    [super willMoveToWindow:newWindow];
//
//}
//- (void)didMoveToWindow {
//    [super didMoveToWindow];
//}
//
//
//@end
