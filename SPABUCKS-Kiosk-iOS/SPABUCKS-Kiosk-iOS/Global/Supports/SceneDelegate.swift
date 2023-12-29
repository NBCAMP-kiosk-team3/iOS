//
//  SceneDelegate.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = ViewController() // 루트 뷰 컨트롤러 생성
        window.rootViewController = viewController // 루트 뷰 컨트롤러 설정
        
        self.window = window
        window.makeKeyAndVisible()
    }
}
