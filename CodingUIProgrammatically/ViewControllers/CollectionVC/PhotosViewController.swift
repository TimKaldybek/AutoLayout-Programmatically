//
//  PhotosViewController.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 06.06.2022.
//

import UIKit
import SnapKit

class PhotosViewController: UIViewController {
    
    let cellId = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.overrideUserInterfaceStyle = .dark
        collectionView.dataSource = self
        collectionView.delegate = self
        createNavigationButtons()
        configUI()
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: PhotosCell.identifier)
    }
    
    fileprivate var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    // Work with navigation bar button item
    private func createNavigationButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.identifier, for: indexPath) as! PhotosCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = CGFloat(200)
        return CGSize(width: width, height: height)
    }
}


// MARK: - ConfigUI

extension PhotosViewController {

    func registerItems(){
        
    }
    
        func configUI() {
            view.addSubview(collectionView)
            makeConstraints()
        }
        
        func makeConstraints() {
            collectionView.snp.makeConstraints { (m) in
                m.edges.equalToSuperview()
            }
        }
}


