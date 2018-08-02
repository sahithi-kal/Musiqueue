//
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

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        
        let topColor = UIColor(red: 75/255, green: 79/255, blue: 131/255, alpha: 1.0)
        let bottomColor = UIColor(red: 80/255, green: 157/255, blue: 180/255, alpha: 1.0)
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
