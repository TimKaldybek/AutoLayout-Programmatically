//
//  PreviewShortsView.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 15.03.2024.
//

import Foundation
import UIKit
import SnapKit

final class PreviewShortsView: UIView {
    private let titleLabel: UILabel = {
        let lb  = UILabel()
        lb.text = "Kolesa Shorts"
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.textColor = .black
        return lb
    }()
    
    private let shortsIcon = UIImageView()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 100, height: 150)
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.showsHorizontalScrollIndicator = false
        return vc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubviews()
        setupUI()
        registerCell()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - ConfigUI
extension PreviewShortsView {
    private func addSubviews() {
        [titleLabel, shortsIcon, collectionView].forEach {
            addSubview($0)
        }
    }
    
    private func setupUI() {
        shortsIcon.image = UIImage(named: "Subtract")
    }
    
    private func registerCell() {
        collectionView.register(PreviewShortsCell.self, forCellWithReuseIdentifier: PreviewShortsCell.identifier)
    }
    
    private func makeConstraints() {
        shortsIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.size.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(shortsIcon.snp.trailing).offset(8)
            
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

extension PreviewShortsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(100)
        let height = CGFloat(150)
        
        return CGSize(width: width, height: height)
    }
}

extension PreviewShortsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier:PreviewShortsCell.identifier,
            for: indexPath
        ) as! PreviewShortsCell
        
        return cell
    }
}
