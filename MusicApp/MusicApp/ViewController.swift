//
//  Home Screen that user first sees
//  ViewController.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/4/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    var joinButton : UIButton! //button to join a party
    var createButton : UIButton! //button to create a party
    var logoLabel : UILabel!  //label for logo

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set button color
        let buttonColor = UIColor(red: 8/255, green: 8/255, blue: 10/255, alpha: 1.0)

        //set up buttons
        createButton = UIButton(type: UIButtonType.custom)
        createButton.setTitle("CREATE A PARTY", for: .normal)
        createButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        createButton.backgroundColor = buttonColor
        createButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        createButton.layer.borderWidth = 1.0
        createButton.layer.borderColor = UIColor.white.cgColor
        createButton.layer.cornerRadius = 5.0
        createButton.clipsToBounds = true
        createButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        joinButton = UIButton(type: UIButtonType.custom)
        joinButton.setTitle("JOIN A PARTY", for: .normal)
        joinButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        joinButton.backgroundColor = buttonColor
        joinButton.addTarget(self, action: #selector(joinButtonPressed), for: .touchUpInside)
        joinButton.layer.borderWidth = 1.0
        joinButton.layer.borderColor = UIColor.white.cgColor
        joinButton.layer.cornerRadius = 5.0
        joinButton.clipsToBounds = true
        joinButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        
        //set up logo
        logoLabel = UILabel()
        logoLabel.text = "Musiqueue"
        logoLabel.textColor = .white
        logoLabel.font = .boldSystemFont(ofSize: 65 )
        logoLabel.numberOfLines = 0
        logoLabel.textAlignment = .center
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(joinButton)
        view.addSubview(createButton)
        view.addSubview(logoLabel)
        setupConstraints()

    }
    
    //set layout of view controller
    func setupConstraints() {
        
        //create button layout
        NSLayoutConstraint.activate([
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -createButton.intrinsicContentSize.height * 2),
            createButton.widthAnchor.constraint(equalToConstant: 200),
            createButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        //join button layout
        NSLayoutConstraint.activate([
            joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinButton.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -32),
            joinButton.widthAnchor.constraint(equalToConstant: 200),
            joinButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        //logo label layout
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50),
            logoLabel.widthAnchor.constraint(equalToConstant: logoLabel.intrinsicContentSize.width)
            ])
        
    }
    
    //when create button is pressed, "Enter Party Code" screen appears
    @objc func createButtonPressed(sender: UIButton){
        let codeVC = CodeViewController(isHost: true)
        navigationController?.pushViewController(codeVC, animated: true)
    }
    
    //wehn join button is pressed, "Create a Party Code" screen appears
    @objc func joinButtonPressed(sender: UIButton){
        let codeVC = CodeViewController(isHost: false)
        navigationController?.pushViewController(codeVC, animated: true)
    }



}

