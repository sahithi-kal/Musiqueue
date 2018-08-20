//
//  Sets up background gradient for all view controllers
//  BaseViewController.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/6/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var gradientLayer : CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        //set up and add gradient to screen
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        
        let bottomColor = UIColor(red: 52/255, green: 12/255, blue: 83/255, alpha: 1.0)
        let topColor = UIColor(red: 8/255, green: 8/255, blue: 10/255, alpha: 1.0)
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
