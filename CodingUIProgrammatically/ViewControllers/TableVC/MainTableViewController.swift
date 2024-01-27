//
//  MainTableViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 22.12.2022.
//

import Foundation
import UIKit
import SnapKit

class MainTableViewController: UIViewController {    
    private let previewView = PreviewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
        setupConstraints()
        createNavigationButtons()
        previewView.configureView(imageName: nil,
                                  titleText: "Hyundai accent",
                                  priceText: "123 324",
                                  city: "Almaty",
                                  packageName: "favicon")
    }
    
    private func setupView() {
        view.addSubview(previewView)
    }
    
    private func setupConstraints() {
        previewView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
        }
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
