//
//  GTVideoViewController.m
//  MyApp
//
//  Created by zhujunli on 08/11/2020.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GTVideoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
//        [self.tabBarItem setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateSelected];
        self.tabBarItem.image = [UIImage imageNamed:@"video@2x.png"];
//        self.tabBarItem.selectedImage = [UIImage imageNamed:@"bofang-2.png"];
        
        self.view.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];//流式布局
    flowLayout.minimumLineSpacing = 10; //行间距（最小），实际宽度根据item的尺寸计算得到
    flowLayout.minimumInteritemSpacing = 10; //列间距
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10) / 2, 300); //item的大小
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];

    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 150;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item %3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
    }
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
