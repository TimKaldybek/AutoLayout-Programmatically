//
//  PreviewView.swift
//  Pods
//
//  Created by Timur Kaldybek on 07.02.2023.
//

import UIKit
import SnapKit

class PreviewView: UIView {
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
    private let price: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private let packageImageView = UIImageView()
    
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
                       priceText: String,
                       city: String,
                       packageName: String?) {
        imageView.image = UIImage(named: imageName ?? "Akon")
        title.text = titleText
        price.text = priceText
        cityLabel.text = city
        
        if let packageName {
            packageImageView.image = UIImage(named: packageName)
        } else {
            packageImageView.isHidden = true
        }
    }
    
    private func setupViews() {
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        backgroundColor = .white
        layer.cornerRadius = 7
        
        addSubview(imageView)
        addSubview(title)
        addSubview(price)
        addSubview(cityLabel)
        addSubview(packageImageView)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(8)
            $0.height.equalTo(60)
            $0.width.equalTo(80)
        }
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.equalTo(imageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        price.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(4)
            $0.leading.equalTo(imageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview()
        }
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(4)
            $0.leading.equalTo(imageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(8)
        }
        packageImageView.snp.makeConstraints {
            $0.size.equalTo(18)
            $0.trailing.bottom.equalToSuperview().inset(11)
        }
    }
}
