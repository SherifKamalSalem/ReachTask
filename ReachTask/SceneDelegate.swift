//
//  SceneDelegate.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            Application.shared.configureMainInterface(in: window)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

