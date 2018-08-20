//
//  JoinPartyViewController.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/6/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class CodeViewController: BaseViewController {
    
    let topColor = UIColor(red: 8/255, green: 8/255, blue: 10/255, alpha: 1.0)
    
    var isHost : Bool!
    var codeLabel : UILabel!
    var codeTextField : UITextField!
    var fieldLine : UILabel!
    var nextButton : UIButton!

    init(isHost : Bool){
        self.isHost = isHost
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel = UILabel()
        
        if isHost == true {
            codeLabel.text = "Pick a Party Key: "
        }
        else {
            codeLabel.text = "Enter your Party Key: "
        }
        
        codeLabel.textColor = .white
        codeLabel.font = .boldSystemFont(ofSize: 32)
        codeLabel.numberOfLines = 0
        codeLabel.textAlignment = .center
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let nameTextfieldPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        codeTextField = UITextField()
//        codeTextField.layer.cornerRadius = 10
//        codeTextField.layer.borderWidth = 1.0
        
        codeTextField.borderStyle = .none
        codeTextField.textColor = .white
        codeTextField.font = .boldSystemFont(ofSize: 32)
        codeTextField.textAlignment = .center
        codeTextField.tintColor = .white
        codeTextField.leftView = nameTextfieldPadding
        codeTextField.leftViewMode = .always
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        fieldLine = UILabel()
        fieldLine.text = "__________________"
        fieldLine.textColor = .white
        fieldLine.font = .boldSystemFont(ofSize: 32)
        fieldLine.numberOfLines = 0
        fieldLine.textAlignment = .center
        fieldLine.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = UIButton(type: UIButtonType.custom)
        nextButton.setTitle("GO", for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        nextButton.backgroundColor = topColor
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        nextButton.layer.borderWidth = 1.0
        nextButton.layer.borderColor = UIColor.white.cgColor
        nextButton.layer.cornerRadius = 5.0
        nextButton.clipsToBounds = true
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(codeLabel)
        view.addSubview(codeTextField)
        view.addSubview(fieldLine)
        view.addSubview(nextButton)
        
        setupConstraints()
        
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            codeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            codeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -codeLabel.intrinsicContentSize.height * 2),
            codeLabel.widthAnchor.constraint(equalToConstant: codeLabel.intrinsicContentSize.width)
            ])
        
        NSLayoutConstraint.activate([
            codeTextField.leadingAnchor.constraint(equalTo: codeLabel.leadingAnchor),
            codeTextField.trailingAnchor.constraint(equalTo: codeLabel.trailingAnchor),
            codeTextField.centerYAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: codeLabel.intrinsicContentSize.height),
            codeTextField.heightAnchor.constraint(equalToConstant: codeLabel.intrinsicContentSize.height)])
        
        NSLayoutConstraint.activate([
            fieldLine.leadingAnchor.constraint(equalTo: codeTextField.leadingAnchor),
            fieldLine.trailingAnchor.constraint(equalTo: codeTextField.trailingAnchor),
            fieldLine.centerYAnchor.constraint(equalTo: codeTextField.bottomAnchor)])

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: fieldLine.bottomAnchor, constant: 32),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    @objc func nextButtonPressed(sender: UIButton){
        if let partyKey = codeTextField.text{
            if partyKey == "" {
                let alertController = UIAlertController(title: "Alert!", message: "Please Enter a Party Key!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                let mainMusicVC = MainMusicViewController(isHost: isHost, partyKey: partyKey)
                navigationController?.pushViewController(mainMusicVC, animated: true)
            }
        }
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
