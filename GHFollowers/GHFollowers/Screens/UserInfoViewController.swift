//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 22/06/24.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    var itemViews : [UIView] = []
    
    var username : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        layoutUI()
        fetchUserInfo()
    }
    
    private func fetchUserInfo() {
            NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {
                            self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
                        }
                        
                        
                    case .failure(let error):
                        self.presentGFAlertOnMainThread(title: "Something went erong", message: error.rawValue, buttonTitle: "OK")
                    }
                }
            }
        }
    
    func layoutUI() {
        itemViews = [headerView, itemViewOne, itemViewTwo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        itemViewOne.backgroundColor = .systemPink
        itemViewTwo.backgroundColor = .systemBlue
        
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: 140),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func add(childVC : UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    

}
