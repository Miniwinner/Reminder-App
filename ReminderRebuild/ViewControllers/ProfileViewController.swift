//
//  ProfileViewController.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 26.08.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    

    
    lazy var profileImage: UIImageView = {
       let image = UIImageView()
//        image.image = UIImage(named: "rabbit")
        image.layer.cornerRadius = 50
        image.backgroundColor = .black
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill

        image.translatesAutoresizingMaskIntoConstraints = false
           return image
       }()
    
     lazy var notifyButton: UIButton = {
        let button = UIButton()
         button.backgroundColor = .white
         button.setTitle("Notifications", for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.setTitleColor(.gray, for: .selected)
         
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.layer.cornerRadius = 15
         button.contentHorizontalAlignment = .left
        
            return button
        }()
    
    lazy var deviceButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Devices", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15

        button.contentHorizontalAlignment = .left
      
           return button
       }()
    
    lazy var languageButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Change Pass", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15

        button.contentHorizontalAlignment = .left
       
           return button
       }()
    
    lazy var changePassword: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Leave Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15

        button.contentHorizontalAlignment = .left
        
           return button
       }()
    
    lazy var leaveAccount: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Change Language", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15

        button.contentHorizontalAlignment = .left
       
           return button
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 0.9059, blue: 0.8196, alpha: 1.0)
        view.addSubview(notifyButton)
        view.addSubview(deviceButton)
        view.addSubview(languageButton)
        view.addSubview(changePassword)
        view.addSubview(leaveAccount)
        view.addSubview(profileImage)
        configureLayout()
    }
    
    func configureLayout(){
        NSLayoutConstraint.activate([
        notifyButton.heightAnchor.constraint(equalToConstant: 50),
        notifyButton.widthAnchor.constraint(equalToConstant: 150),
        notifyButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 300),
        notifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
        notifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),

        deviceButton.heightAnchor.constraint(equalToConstant: 50),
        deviceButton.widthAnchor.constraint(equalToConstant: 150),
        deviceButton.topAnchor.constraint(equalTo: notifyButton.bottomAnchor,constant: 15),
        deviceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
        deviceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
        
        languageButton.heightAnchor.constraint(equalToConstant: 50),
        languageButton.widthAnchor.constraint(equalToConstant: 150),
        languageButton.topAnchor.constraint(equalTo: deviceButton.bottomAnchor,constant: 15),
        languageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
        languageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
        
        changePassword.heightAnchor.constraint(equalToConstant: 50),
        changePassword.widthAnchor.constraint(equalToConstant: 150),
        changePassword.bottomAnchor.constraint(equalTo: leaveAccount.topAnchor,constant: -15),
        changePassword.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
        changePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
        
        leaveAccount.heightAnchor.constraint(equalToConstant: 50),
        leaveAccount.widthAnchor.constraint(equalToConstant: 150),
        leaveAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -140),
        leaveAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
        leaveAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
        
        profileImage.heightAnchor.constraint(equalToConstant: 100),
        profileImage.widthAnchor.constraint(equalToConstant: 100),
        profileImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
        profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50)
        ])
    }

}
