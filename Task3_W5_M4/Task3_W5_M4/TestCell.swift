//
//  TestCell.swift
//  Task3_W5_M4
//
//  Created by Aziz on 16/1/22.
//

import Foundation
import UIKit
import SnapKit

class TestCell: UITableViewCell {
    
    static let identifier = "TestCell"
    
    lazy var titleName: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(titleName)
        titleName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
}
