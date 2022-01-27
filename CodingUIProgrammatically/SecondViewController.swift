//
//  SecondViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 26.01.2022.
//

import UIKit


class SecondViewController: UIViewController{
    
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        createNavigationButtons()
        createButton()
        setupButton()
    }
    
    // initialize view
    private func initView(){
        view.backgroundColor = .lightGray
        title = "Hello"
    }
    
    // Work with navigation bar button item
    
    private func createNavigationButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    // Work with button
    
    private func createButton(){
        button.setTitle("Go Next", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        self.view.addSubview(button)
    }
    
    @objc private func didTapButton(){
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
    }
    
    // constraints of button
    private func setupButton(){
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // center button
        let centerXButton = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let centerYButton = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        // width and height button
        let buttonHeight = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 0, constant: 50)
        
        let buttonWidth = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 0, constant: 300)
        
        // add to view
        self.view.addConstraints([
            centerXButton, centerYButton, buttonHeight, buttonWidth
        ])
    }
}
