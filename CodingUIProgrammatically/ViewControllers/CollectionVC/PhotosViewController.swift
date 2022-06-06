//
//  PhotosViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 06.06.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigationButtons()
        configUI()
    }
    
    
    
    private func configUI(){
        view.backgroundColor = .white
    }
    
    // Work with navigation bar button item
    private func createNavigationButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
}

