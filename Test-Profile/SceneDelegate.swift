//
//  SceneDelegate.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = bottomMenu()
        window?.makeKeyAndVisible()

    }
    
    func bottomMenu() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor         = .systemYellow
        UINavigationBar.appearance().tintColor  = .systemGray
   
        tabbar.viewControllers = [main(), raskhodiVC(), simcardMenu(), moreVC()]
 
        return tabbar
    }
    
    func main() -> UINavigationController {
    
        let mainVC = MainViewController()
        mainVC.title = "Главная"
        mainVC.tabBarItem = UITabBarItem(title: "Главное", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    func raskhodiVC() -> UINavigationController {
    
        let raskodVC = RaskhodVC()
        raskodVC.title = "Расходы"
        
        raskodVC.tabBarItem = UITabBarItem(title: "Финансы", image: UIImage(systemName: "dollarsign.circle"), selectedImage: UIImage(systemName: "dollarsign.circle.fill"))
        return UINavigationController(rootViewController: raskodVC)
        
    }
    
    func simcardMenu() -> UINavigationController {
        let simcardmenu = SimCardMenuCV()
        simcardmenu.tabBarItem = UITabBarItem(title: "Sim-card", image: UIImage(systemName: "simcard"), selectedImage: UIImage(systemName: "simcard.fill"))
        return UINavigationController(rootViewController: simcardmenu)
    }
    
    func moreVC() -> UINavigationController {
        
        let moreVC = MoreFunctionsVC()
        moreVC.title = "Еще"
        
        moreVC.tabBarItem = UITabBarItem(title: "Еще", image: UIImage(systemName: "line.horizontal.3.decrease.circle"), selectedImage: UIImage(systemName: "line.horizontal.3.decrease.circle.fill"))
        return UINavigationController(rootViewController: moreVC)
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

