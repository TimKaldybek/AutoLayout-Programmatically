//
//  ViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private var view2: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBrown
        return view
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "favicon")
        image.contentMode = .scaleAspectFill
        image.frame.size.height = 200
        image.frame.size.width = 200
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GO", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private var secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CollectionView", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)

        return button
    }()

    private var thirdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TableView", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(thirdButtonAction), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        createConstraints()
    }
    
    
    func initViews(){
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(image)
        self.view.addSubview(button)
        self.view.addSubview(secondButton)
        self.view.addSubview(thirdButton)
    }
    
    func createConstraints(){
        
        NSLayoutConstraint.activate([
            // create view 1
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view1.topAnchor.constraint(equalTo: view.topAnchor),
            view1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view1.heightAnchor
                .constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            view1.bottomAnchor.constraint(equalTo: view2.topAnchor),
            
            // create view 2
            view2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // create image
            image.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            
            // width & height of image
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            // create buttons
            button.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view2.centerYAnchor, constant: -50),
            secondButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            secondButton.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 16),
            thirdButton.centerXAnchor.constraint(equalTo: view2.centerXAnchor),

            
            //Create width & height of buttons
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.widthAnchor.constraint(equalToConstant: 140),
            thirdButton.heightAnchor.constraint(equalToConstant: 50),
            thirdButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc func buttonAction(sender: UIButton!){
        let secondVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: secondVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    @objc func secondButtonAction(sender: UIButton!){
        let photosVC = PhotosViewController()
        let navVC = UINavigationController(rootViewController: photosVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    @objc func thirdButtonAction(sender: UIButton!){
        let tableVC = MainTableViewController()
        let navVC = UINavigationController(rootViewController: tableVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
