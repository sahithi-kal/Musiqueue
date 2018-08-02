//
//  ViewController.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/4/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
//    var gradientLayer : CAGradientLayer!
    var joinButton : UIButton!
    var createButton : UIButton!
    var logoLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topColor = UIColor(red: 75/255, green: 79/255, blue: 131/255, alpha: 1.0)
//        let bottomColor = UIColor(red: 80/255, green: 157/255, blue: 180/255, alpha: 1.0)

        
        createButton = UIButton(type: UIButtonType.custom)
        createButton.setTitle("CREATE A PARTY", for: .normal)
        createButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        createButton.backgroundColor = topColor
        createButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        joinButton = UIButton(type: UIButtonType.custom)
        joinButton.setTitle("JOIN A PARTY", for: .normal)
        joinButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        joinButton.backgroundColor = topColor
        joinButton.addTarget(self, action: #selector(joinButtonPressed), for: .touchUpInside)
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        
        logoLabel = UILabel()
        logoLabel.text = "LOGO"
        logoLabel.textColor = .white
        logoLabel.font = .boldSystemFont(ofSize: 80 )
        logoLabel.numberOfLines = 0
        logoLabel.textAlignment = .center
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(joinButton)
        view.addSubview(createButton)
        view.addSubview(logoLabel)
        setupConstraints()
        
        
        
        
        
//        let topColor = UIColor(red: 75/255, green: 79/255, blue: 131/255, alpha: 0.75)
//        let bottomColor = UIColor(red: 80/255, green: 157/255, blue: 180/255, alpha: 0.75)
//
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "dancingGirl")
//        gradientLayer = CAGradientLayer()
//        gradientLayer.frame = backgroundImage.bounds
//        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
//        backgroundImage.layer.insertSublayer(gradientLayer, at: 0)
////        let gradient = CAGradientLayer()
////        gradient.frame = view.frame
////        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
////        gradient.locations = [0.0, 1.0]
////        view.layer.insertSublayer(gradient, at: 0)
////        backgroundImage.addSubview(view)
//
//        self.view.insertSubview(backgroundImage, at: 0)

    }
    
    func setupConstraints() {
        
        //join button label
        NSLayoutConstraint.activate([
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -createButton.intrinsicContentSize.height * 2),
            createButton.widthAnchor.constraint(equalToConstant: 200),
            createButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        //join button label
        NSLayoutConstraint.activate([
            joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinButton.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -32),
            joinButton.widthAnchor.constraint(equalToConstant: 200),
            joinButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50),
            logoLabel.widthAnchor.constraint(equalToConstant: logoLabel.intrinsicContentSize.width)
            ])
        
    }
    
    @objc func createButtonPressed(sender: UIButton){
        let codeVC = CodeViewController(isHost: true)
        navigationController?.pushViewController(codeVC, animated: true)
    }
    
    @objc func joinButtonPressed(sender: UIButton){
        let codeVC = CodeViewController(isHost: false)
        navigationController?.pushViewController(codeVC, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

