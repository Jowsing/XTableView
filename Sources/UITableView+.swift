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
    
    func register<T: UITableViewCell>(_ cellClass: T.Type, extra: String = "") {
        let reuseIdentifier = cellClass.reuseIdentifier + extra
        self.register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type, extra: String = "") {
        let reuseIdentifier = viewClass.reuseIdentifier + extra
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, extra: String = "") -> T {
        let reuseIdentifier = cellClass.reuseIdentifier + extra
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier) as? T else {
            fatalError("Unable to dequeue:\(cellClass)")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, indexPath: IndexPath, extra: String = "") -> T {
        let reuseIdentifier = cellClass.reuseIdentifier + extra
        guard let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue:\(cellClass)")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type, extra: String = "") -> T {
        let reuseIdentifier = viewClass.reuseIdentifier + extra
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            fatalError("Unable to dequeue:\(viewClass)")
        }
        return view
    }
}
