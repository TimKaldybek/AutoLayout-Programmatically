//
//  CompanyCell.swift
//  CodingUIProgrammatically
//
//  Created by Timur Kaldybek on 22.12.2022.
//

import UIKit
import SnapKit

class CompanyCell: UITableViewCell {
    static var identifier = "Test"
    var photos = [Photos]()
    
    var titleLabel: UILabel = {
        let lb  = UILabel()
        lb.text = "Section"
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.textColor = .black
        return lb
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        configUI()
    }
    
    func setupCell(){
        addSubview(titleLabel)
    }
    
    func configUI(){
        titleLabel.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(8)
            m.left.equalToSuperview().offset(8)
        }
    }
    
}
