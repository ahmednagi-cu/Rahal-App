//
//  MainTabBarController.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        configureTabBar()
        customizeAppearence()
    }
    
   
    
    private func setupTabBar() {
        let viewControllers = [personalFileController(), homeMainController(), myOrderdController()]
        setViewControllers(viewControllers, animated: true)
    }
    
    
    private func configureTabBar() {
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .systemBlue
    }
    
    func customizeAppearence() {

        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
       
        tabBar.layer.cornerRadius = 20
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3

        //self.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -30)

        self.tabBar.itemPositioning = .centered
        self.tabBar.itemWidth = 100
        self.tabBar.tintColor = .systemBlue
        
            let items = self.tabBar.items!
            for item in items {
                let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
                item.setTitleTextAttributes(attributes, for: .normal)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)


            }

    }
    
    private func personalFileController() -> UINavigationController {
        let personalFileVC = PersonalFileController()
        personalFileVC.tabBarItem = UITabBarItem(title: "الملف الشخصي", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        return UINavigationController(rootViewController: personalFileVC)
    }
    
    private func homeMainController() -> UINavigationController {
        let homeMainVC = HomeMainController()
        homeMainVC.tabBarItem = UITabBarItem(title: "الرئيسية", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        return UINavigationController(rootViewController: homeMainVC)
    }
    
    private func myOrderdController() -> UINavigationController {
        let myOrderdVC = MyOrderdController()
        myOrderdVC.tabBarItem = UITabBarItem(title: "طلباتي", image: UIImage(systemName: "tabimg_2"), selectedImage: UIImage(systemName: "tabimg2" ))
        
        return UINavigationController(rootViewController: myOrderdVC)
    }
    
    
    
}
