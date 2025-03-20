import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         guard let scene = (scene as? UIWindowScene) else { return }
        
        let profileVC = ProfileViewController()
        let navController = UINavigationController(rootViewController: profileVC)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
 
