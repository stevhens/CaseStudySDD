//
//  MainViewTabBarController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/12/23.
//

import UIKit

final class MainViewTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .slate_0
        self.tabBar.backgroundColor = .slate_0
        self.tabBar.isTranslucent = false
        
        self.delegate = self
        
        let homepage = UINavigationController(rootViewController: FirstCaseViewController())
        homepage.tabBarItem = UITabBarItem(
            title: "CS1",
            image: UIImage(systemName: "1.circle")?.withTintColor(.text_pencil),
            selectedImage: UIImage(systemName: "1.circle.fill")
        )
        
        let salesPage = UINavigationController(rootViewController: SecondCaseViewController())
        salesPage.tabBarItem = UITabBarItem(
            title: "CS2",
            image: UIImage(systemName: "2.circle")?.withTintColor(.text_pencil),
            selectedImage: UIImage(systemName: "2.circle.fill")
        )
        
        let productPage = UINavigationController(rootViewController: ThirdCaseViewController())
        productPage.tabBarItem = UITabBarItem(
            title: "CS3",
            image: UIImage(systemName: "3.circle")?.withTintColor(.text_pencil),
            selectedImage: UIImage(systemName: "3.circle.fill")
        )
        
        let settingPage = UINavigationController(rootViewController: FourthCaseViewController())
        settingPage.tabBarItem = UITabBarItem(
            title: "CS4",
            image: UIImage(systemName: "4.circle")?.withTintColor(.text_pencil),
            selectedImage: UIImage(systemName: "4.circle.fill")
        )
        
        viewControllers = [homepage, salesPage, productPage, settingPage]
        
        self.selectedIndex = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let items = tabBar.items {
            for item in items {
                item.image = item.image?.withRenderingMode(.alwaysOriginal)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.text_pencil], for: .normal)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.text_link as Any], for: .selected)
            }
        }
    }
}

extension MainViewTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

