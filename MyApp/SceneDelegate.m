//
//  SceneDelegate.m
//  MyApp
//
//  Created by zhujunli on 01/11/2020.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *VC = [[ViewController alloc] init];
    
    
    UITabBarController * tabbarController = [[UITabBarController alloc] init];

    
    GTVideoViewController *controller2 = [[GTVideoViewController alloc] init];
    GTRecommendViewController *controller3 = [[GTRecommendViewController alloc] init];
    UIViewController *controller4 = [[UIViewController alloc] init];
    VC.view.backgroundColor = [UIColor redColor];
    controller4.view.backgroundColor = [UIColor blueColor];
    
    
    VC.tabBarItem.title = @"新闻";
    controller4.tabBarItem.title = @"我的";
    controller4.tabBarItem.image = [UIImage imageNamed:@"mine@2x.png"];
    
    tabbarController.delegate = self;
    [tabbarController setViewControllers:@[VC, controller2, controller3, controller4]];
    UINavigationController *controller1 = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    [self.window setWindowScene:windowScene];
    self.window.rootViewController = controller1;
    [self.window makeKeyAndVisible];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
