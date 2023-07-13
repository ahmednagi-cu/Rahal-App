//
//  OnBoardingController.swift
//  RAHAL
//
//  Created by ahmed nagi on 25/06/2023.
//

import UIKit

class OnBoardingController: UIViewController {
    private let onBoardingView = OnBoardingView()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for family in UIFont.familyNames {
            let name = UIFont.fontNames(forFamilyName: family)
            print("family = \(family) - name = \(name)")
        }
        view = onBoardingView
        
    }
    

    
 // MARK: - Navigation

   

}
