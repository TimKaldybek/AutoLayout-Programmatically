//
//  PhotosCell.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 07.06.2022.
//

import UIKit
import SnapKit

 class PhotosCell: UICollectionViewCell {

     
     var photos = [Photos]()

     static var identifier = "Test"
     static var shared = PhotosCell()

     fileprivate var titleLabel: UILabel = {
             let lb  = UILabel()
             lb.text = "Section Title"
             lb.font = UIFont.boldSystemFont(ofSize: 24)
             lb.font = UIFont.boldSystemFont(ofSize: 24)
             lb.textColor = .white
             return lb
         }()
     
     fileprivate var collectionView : UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         return cv
     }()
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         backgroundColor = .black
         setupCell()
         configUI()
         collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.cellId)
         
         photos = [
            Photos(name: "Adele", image: UIImage(named: "Adele")!),
            Photos(name: "Akon", image: UIImage(named: "Akon")!),
            Photos(name: "JayZ", image: UIImage(named: "Jayz")!)
        ]
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     fileprivate func setupCell(){
         addSubview(titleLabel)
         addSubview(collectionView)
         collectionView.dataSource = self
         collectionView.delegate = self
     }
     
     fileprivate func configUI(){
         titleLabel.snp.makeConstraints { (m) in
             m.top.equalToSuperview().offset(8)
             m.left.equalToSuperview().offset(8)
         }
         collectionView.snp.makeConstraints { (m) in
             m.top.equalTo(titleLabel.snp.bottom).offset(5)
             m.left.right.bottom.equalToSuperview()
         }
     }
 }

 extension PhotosCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AlbumCell.cellId, for: indexPath) as! AlbumCell
         cell.albumImage = photos[indexPath.row].image
         return cell
     }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return photos.count
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width = frame.width / 2
         let height = frame.height
         return CGSize(width: width, height: height)
     }
 }

