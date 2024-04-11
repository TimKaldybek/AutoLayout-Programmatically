//
//  PreviewShortsCell.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 15.03.2024.
//

import Foundation
import SnapKit
import UIKit

final class PreviewShortsCell: UICollectionViewCell {
    static var identifier = "PreviewShortsCell"
    
    private let backgroundImage = UIImageView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textAlignment = .left
        
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    func setupView() {
        [backgroundImage, titleLabel].forEach {
            addSubview($0)
        }
        backgroundImage.image = UIImage(named: "ShortsBackground")
        titleLabel.text = "Обзор на новый BMW"
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }
}
