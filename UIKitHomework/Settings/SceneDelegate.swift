//
//  SceneDelegate.swift
//  UIKitHomework
//
//  Created by Анна Ереськина on 18.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let mainVC = MainVC()
        let navVC = UINavigationController(rootViewController: mainVC)
        
        window.rootViewController = navVC
        self.window = window
        
        window.makeKeyAndVisible()
    }
}

