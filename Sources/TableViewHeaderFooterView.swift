//
//  TableViewHeaderFooterView.swift
//  Pods
//
//  Created by jowsing on 2025/1/22.
//

import UIKit

open class TableViewHeaderFooterView<Model>: UITableViewHeaderFooterView {
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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

class ClearHeaderFooterView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundColor = nil
        contentView.backgroundColor = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
