//
//  ViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var view1: UIView!
    var view2: UIView!
    var image: UIImageView!
    var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        initViews()
        createConstraints()
        goToNextVC()
    }

    
    func initViews(){
        //Init
        self.view1 = UIView()
        self.view2 = UIView()
        self.image = UIImageView()
        self.button = UIButton()
        
        // prepare auto layout
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //set background color
        view1.backgroundColor = .systemGray
        view2.backgroundColor = .systemBrown
        image.backgroundColor = .white
        button.backgroundColor = .darkGray
        
        // additional options
        image.image = UIImage(named: "favicon")
        image.contentMode = .scaleAspectFill
        
        image.frame.size.height = 200
        image.frame.size.width = 200
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        
        //add to super view
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(image)
        self.view.addSubview(button)
        
    }
    
    func createConstraints(){
        
        //Create view1
        let pinLeftView1 = NSLayoutConstraint(item: view1!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        
        let pinTopView1 = NSLayoutConstraint(item: view1!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        
        let pinRightView1 = NSLayoutConstraint(item: view1!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        
        let verticalView1 = NSLayoutConstraint(item: view1!, attribute: .bottom, relatedBy: .equal, toItem: view2, attribute: .top, multiplier: 1, constant: 0)
        
        let heightView1 = NSLayoutConstraint(item: view1!, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.65, constant: 0)
        
        //Create view2
        
        let pinLeftView2 = NSLayoutConstraint(item: view2!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        
        let pinBottomView2 = NSLayoutConstraint(item: view2!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        
        let pinRightView2 = NSLayoutConstraint(item: view2!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        
        //create image view
        let centerXImage = NSLayoutConstraint(item: image!, attribute: .centerX, relatedBy: .equal, toItem: view1, attribute: .centerX, multiplier: 1, constant: 0)
        
        let centerYImage = NSLayoutConstraint(item: image!, attribute: .centerY, relatedBy: .equal, toItem: view1, attribute: .centerY, multiplier: 1, constant: 0)
        
        // width & height image
        let widthImage = NSLayoutConstraint(item: image!, attribute: .width, relatedBy: .equal, toItem: image, attribute: .width, multiplier: 0, constant: 200)
        
        let heightImage = NSLayoutConstraint(item: image!, attribute: .height, relatedBy: .equal, toItem: image, attribute: .height, multiplier: 0, constant: 200)
        
        //Create button
        button.centerXAnchor.constraint(equalTo: view2.centerXAnchor, constant: 0).isActive = true
        button.centerYAnchor.constraint(equalTo: view2.centerYAnchor, constant: 0).isActive = true
        
        //let centerXButton = NSLayoutConstraint(item: button!, attribute: .centerX, relatedBy: .equal, toItem: view2, attribute: .centerX, multiplier: 1, constant: 0)
        
      //  let centerYButton = NSLayoutConstraint(item: button!, attribute: .centerY, relatedBy: .equal, toItem: view2, attribute: .centerY, multiplier: 1, constant: 0)
        
//MARK: Create width & height of button
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
     //   let heightButton = NSLayoutConstraint(item: button!, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 0, constant: 50)
        
    //    let widthButton = NSLayoutConstraint(item: button!, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 0, constant: 100)
        
        self.view.addConstraints([
            pinLeftView1,pinTopView1,pinRightView1, verticalView1,heightView1,
            centerXImage, centerYImage, widthImage, heightImage,
            pinLeftView2, pinBottomView2, pinRightView2,
           // centerYButton, centerXButton,  heightButton, widthButton
        ])
    }
    
    func goToNextVC(){
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!){
        let secondVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: secondVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
