//
//  FixLeadingSpacingView.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 06.03.2024.
//

import Foundation
import UIKit
import SnapKit

class FixLeadingSpacingView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var titleLabelLeadingToImageView: ConstraintMakerEditable?
    var titleLabelLeadingToSuperview: ConstraintMakerEditable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configureView(imageName: String?,
                       titleText: String,
                       shouldShowImage: Bool) {
        imageView.image = UIImage(named: imageName ?? "Akon")
        title.text = titleText
        
        if shouldShowImage {
            titleLabelLeadingToImageView?.priority(.high)
            titleLabelLeadingToSuperview?.priority(.low)
        } else {
            imageView.isHidden = true
            titleLabelLeadingToImageView?.priority(.low)
            titleLabelLeadingToSuperview?.priority(.high)
        }
    }
    
    private func setupViews() {
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        backgroundColor = .white
        layer.cornerRadius = 7
        
        addSubview(imageView)
        addSubview(title)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(8)
            $0.height.equalTo(60)
            $0.width.equalTo(80)
        }
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            titleLabelLeadingToImageView = $0.leading.equalTo(imageView.snp.trailing).offset(12)
            titleLabelLeadingToSuperview = $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(8)
        }
    }
}
