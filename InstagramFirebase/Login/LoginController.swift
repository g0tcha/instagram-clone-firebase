//
//  LoginController.swift
//  InstagramFirebase
//
//  Created by Vincent on 27/11/2017.
//  Copyright © 2017 Vincent. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign Up.", for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
    
    @objc private func handleShowSignUp() {
        let signUpController = SignUpController()
        
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
}
