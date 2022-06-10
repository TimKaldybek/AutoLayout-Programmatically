//
//  PhotosTableCell.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 06.06.2022.
//

import UIKit
import SnapKit

class AlbumCell: UICollectionViewCell {
    
    static let cellId = "subCellID"
    
    var albumImage: UIImage? {
        didSet {
            guard let albumImage = self.albumImage else { return }
                albumImageView.image = albumImage
        }
    }
    
    fileprivate var albumImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
       addSubview(albumImageView)
    }
    func configUI() {
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
}
