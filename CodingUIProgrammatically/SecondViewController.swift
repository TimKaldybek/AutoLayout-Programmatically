//
//  SecondViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 26.01.2022.
//

import UIKit


class SecondViewController: UIViewController{
    
    private let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go Next", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
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
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc private func didTapButton(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = CollectionViewController(collectionViewLayout: layout)
        
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(swipingController, animated: true)
        navigationController?.navigationBar.tintColor = .black
    }
    
    // constraints of button
    private func setupButton(){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
