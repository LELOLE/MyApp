//
//  ViewController.m
//  MyApp
//
//  Created by zhujunli on 01/11/2020.
//

#import "ViewController.h"

@interface TestView : UIView

@end

@implementation TestView

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
   
}
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
}
- (void)didMoveToWindow {
    [super didMoveToWindow];
}


@end

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) int a;
@end

@implementation ViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed: @"news@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.brownColor];
    // Do any additional setup after loading the view.
    self.a = 0;
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
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:viewController animated:YES];
}
#pragma mark data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        self.a = self.a + 1;
        NSLog(@"%d",self.a);
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@",@(indexPath.row)];
    cell.detailTextLabel.text = @"副标题";
    cell.imageView.image = [UIImage imageNamed:@"pic.jpg"];
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
    NSLog(@"action 1");
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
