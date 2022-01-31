//
//  ThirdViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 26.01.2022.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 13/255, alpha: 1)
}

class ThirdViewController: UIViewController {
    
    private let topImageContainerView: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bearImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nJoin us today in our fun and games!"))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(topImageContainerView)
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomView()
    }
    
    fileprivate func setupLayout(){
        
        // add Image to view 1
        topImageContainerView.addSubview(bearImage)
        
        // set constraints into view
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            // set constraints into image
            bearImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            bearImage.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5),
            
            // set constraints to description text
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    fileprivate func setupBottomView(){
        
        let bottomControlsView = UIStackView(arrangedSubviews: [backButton, pageControl, nextButton])
        bottomControlsView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsView.distribution = .fillEqually
        
        view.addSubview(bottomControlsView)
        
        NSLayoutConstraint.activate([
            bottomControlsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
