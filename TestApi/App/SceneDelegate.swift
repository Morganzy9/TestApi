//
//  SceneDelegate.swift
//  TestApi
//
//  Created by Ислам Пулатов on 9/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowSene)
        let welcomeVC = UINavigationController(rootViewController: SeeAllViewController())
        window?.rootViewController = welcomeVC
        window?.makeKeyAndVisible()
    }
}

