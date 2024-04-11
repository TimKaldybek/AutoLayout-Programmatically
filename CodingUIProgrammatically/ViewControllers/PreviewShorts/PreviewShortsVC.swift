//
//  PreviewShortsVC.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 15.03.2024.
//

import Foundation
import UIKit
import SnapKit

final class PreviewShortsVC: UIViewController {
    let customView = PreviewShortsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        createNavigationButtons()
    }
    
    private func setupViews() {
        view.addSubview(customView)
        view.backgroundColor = .white
        customView.snp.makeConstraints { make in
            make.centerX.centerY.width.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    private func createNavigationButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}
