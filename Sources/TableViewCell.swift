//
//  XTableViewCell.swift
//  Pods
//
//  Created by jowsing on 2025/1/22.
//

import UIKit

open class TableViewCell<Model>: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.setupBind()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupUI() {
        self.backgroundColor = .white
        self.contentView.backgroundColor = .white
    }
    
    open func setupBind() {
        
    }
    
    open func configure(_ model: Model) {
        
    }
}

