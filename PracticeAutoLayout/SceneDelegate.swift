//
//  SceneDelegate.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // entry point를 ViewController로
//    guard let windowScene = (scene as? UIWindowScene) else { return }
//    let window = UIWindow(windowScene: windowScene)
//    window.rootViewController = UINavigationController(rootViewController: ViewController())
//    window.makeKeyAndVisible()
//    self.window = window
    
    let tbc = UITabBarController()
    
    let view1 = ViewController()
    let view2 = ViewController2()
    let view3 = ViewController3()

    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = tbc
    window.makeKeyAndVisible()
    self.window = window

    
    tbc.setViewControllers([view1, view2, view3], animated: true)
    
    view1.tabBarItem = UITabBarItem(title: "첫번째",
                                    image: UIImage(systemName: "heart.fill") ,
                                    tag: 1)
    
    view2.tabBarItem = UITabBarItem(title: "두번째",
                                    image: UIImage(systemName: "person") ,
                                    tag: 2)
    
    view3.tabBarItem = UITabBarItem(title: "세번째",
                                    image: UIImage(systemName: "circle") ,
                                    tag: 3)
    
    tbc.tabBar.backgroundColor = .white
    
    guard let _ = (scene as? UIWindowScene) else { return }
    
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

