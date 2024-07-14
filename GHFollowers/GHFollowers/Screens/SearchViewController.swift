//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 09/06/24.
//

import UIKit

class SearchViewController: UIViewController {

    let logoImageView = UIImageView()
    let userNameTextField = GFTextField();
    let callToActionButton = GFButton(background: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered : Bool { return !userNameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyBoardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func createDismissKeyBoardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListNavigationController() {
        guard isUsernameEntered else {
            return presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need it to know whom to look for.", buttonTitle: "OK")
        }
        let followerList = FollowerListViewController();
        followerList.username = userNameTextField.text
        followerList.title = userNameTextField.text
        navigationController?.pushViewController(followerList, animated: true)
    }
    
    func configureTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListNavigationController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

extension SearchViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListNavigationController()
        return true
    }
}
