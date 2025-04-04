//
//  TableViewRow.swift
//  Pods
//
//  Created by jowsing on 2025/1/15.
//

import UIKit

public protocol TableViewRowable {
    
    var height: CGFloat { get set }
        
    var swipeActionsConfiguration: UISwipeActionsConfiguration? { get set }
    
    func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

open class TableViewRow<Model, Cell: TableViewCell<Model>>: TableViewRowable {
    
    // MARK: - Property
    
    open var identifierExtra: String {
        return ""
    }
    
    open var model: Model
    
    public var height: CGFloat = .zero
        
    public var indexPath: IndexPath?
    
    public var swipeActionsConfiguration: UISwipeActionsConfiguration?
    
    
    
    // MARK: - Life Cycle
    
    public init(model: Model) {
        self.model = model
        self.layoutRects()
    }
    
    open func layoutRects() {
        
    }
    
    open func updateRects(for cell: Cell) {
        
    }
    
    open func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        self.indexPath = indexPath
        let cell = tableView.dequeueReusableCell(Cell.self, indexPath: indexPath, extra: identifierExtra)
        self.bindTo(cell)
        return cell
    }
    
    open func bindTo(_ cell: Cell) {
        self.updateRects(for: cell)
        cell.configure(model)
    }
}
