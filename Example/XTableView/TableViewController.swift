//
//  TableViewController.swift
//  XTableView_Example
//
//  Created by jowsing on 2025/1/22.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import XTableView

class MenuViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MenuViewHeader.self)
        tableView.register(TitleViewCell.self)
        tableView.register(TitleViewCell2.self)
        tableView.backgroundColor = .groupTableViewBackground
        return tableView
    }()
    
    lazy var viewModel = TableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "列表样式"
        self.navigationItem.leftBarButtonItem = .init(title: "取消", style: .plain, target: self, action: #selector(cancelAction))
        
        self.view.addSubview(tableView)
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let section0 = TableViewSection([
            MenuViewRow(model: "青椒肉丝"),
            MenuViewRow(model: "白菜豆腐汤"),
            MenuViewRow(model: "干丝豆角"),
        ])
        section0.headerHeight = 60
        section0.setHeader("Foods", viewType: MenuViewHeader.self)
        
        let section1 = TableViewSection([
            BlogViewRow(model: "福星版本找到答案了：无脑猩红走连胜，9级d出10猩红开始卡5费，自己有机会追3就追，没机会就每个卡个2星，目前10把已8把鸡，2把第2"),
            BlogViewRow(model: "jym，家里人看有国补想换个容量大点的冰箱，预算8000块有什么推荐吗？之前去店里店员给宣传的什么杀菌、保鲜、净化这些功能真有说的那么好吗？"),
            BlogViewRow(model: "JYM，想给父亲买个护腰以及腰部按摩器，有推荐的吗"),
        ])
        section1.headerHeight = 60
        section1.setHeader("Blogs", viewType: MenuViewHeader.self)
        
        self.viewModel.dataSource = [section0, section1]
        self.tableView.bind(to: viewModel)
    }
    
    @objc private func cancelAction() {
        self.navigationController?.dismiss(animated: true)
    }

}

class MenuViewHeader: TableViewHeaderFooterView<String> {
    
    let label = UILabel()
    
    override func setupUI() {
        super.setupUI()
        self.contentView.backgroundColor = .groupTableViewBackground
        self.label.textColor = .gray
        self.label.font = .systemFont(ofSize: 13)
        self.contentView.addSubview(label)
        self.label.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
        }
    }
    
    override func configure(_ model: String) {
        self.label.text = model
    }
}

class MenuViewRow: TableViewRow<String, TitleViewCell> {
    
    var titleRect: CGRect = CGRect.zero
    
    override func layoutRects() {
        let titleW = UIScreen.main.bounds.width - 30
        let titleH = model.boundingSize(with: CGSize(width: titleW, height: .greatestFiniteMagnitude), font: UIFont.systemFont(ofSize: 17)).height
        self.titleRect = CGRect.init(x: 15, y: 15, width: titleW, height: titleH)
        self.height = titleRect.maxY + 15
    }
    
    override func bindTo(_ cell: TitleViewCell) {
        super.bindTo(cell)
        cell.label.frame = self.titleRect
    }
}

class BlogViewRow: TableViewRow<String, TitleViewCell2> {
        
    override func layoutRects() {
        self.height = UITableViewAutomaticDimension
    }
}

class TitleViewCell: TableViewCell<String> {
    
    let label = UILabel()
    
    override func setupUI() {
        super.setupUI()
        self.label.textColor = .black
        self.label.font = .systemFont(ofSize: 17)
        self.label.numberOfLines = 0
        self.contentView.addSubview(label)
    }
    
    override func configure(_ model: String) {
        self.label.text = model
    }
}

class TitleViewCell2: TitleViewCell {
    
    override func setupUI() {
        super.setupUI()
        self.label.snp.makeConstraints { make in
            make.left.top.equalTo(15)
            make.right.bottom.equalTo(-15)
        }
    }
}
