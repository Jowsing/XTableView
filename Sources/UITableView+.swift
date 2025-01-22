//
//  Extension.swift
//  Pods
//
//  Created by jowsing on 2025/1/22.
//

import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    public static var reuseIdentifier: String {
        return String(describing: self.self)
    }
}

extension UITableViewCell: Reusable {}

extension UITableViewHeaderFooterView: Reusable {}

public extension UITableView {
    
    func bind(to viewModel: TableViewModel) {
        self.dataSource = viewModel
        self.delegate = viewModel
        self.reloadData()
    }
    
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        let reuseIdentifier = cellClass.reuseIdentifier
        register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }

    func registerNib<T: UITableViewCell>(cellClass: T.Type) {
        let reuseIdentifier = cellClass.reuseIdentifier
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) {
        let reuseIdentifier = viewClass.reuseIdentifier
        register(viewClass, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }

    func registerNib<T: UITableViewHeaderFooterView>(_ forHeaderFooterViewClass: T.Type) {
        let reuseIdentifier = forHeaderFooterViewClass.reuseIdentifier
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type) -> T {
        let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier)
        guard let cellType = cell as? T else {
            fatalError("Unable to dequeue:\(cellClass)")
        }
        return cellType
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath)
        guard let cellType = cell as? T else {
            fatalError("Unable to dequeue:\(cellClass)")
        }
        return cellType
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) -> T {
        let view = dequeueReusableHeaderFooterView(withIdentifier: viewClass.reuseIdentifier)
        guard let viewType = view as? T else {
            fatalError("Unable to dequeue:\(viewClass)")
        }
        return viewType
    }
}
