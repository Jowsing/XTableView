//
//  TableViewSection.swift
//  Pods
//
//  Created by jowsing on 2025/1/15.
//

import Foundation

public typealias TableViewDataSource = Array<TableViewSection>

public class TableViewSection {
    
    public var headerHeight: CGFloat = CGFloat.leastNonzeroMagnitude
    public var footerHeight: CGFloat = CGFloat.leastNonzeroMagnitude
    public var estimatedHeaderHeight: CGFloat = CGFloat.leastNonzeroMagnitude
    public var estimatedFooterHeight: CGFloat = CGFloat.leastNonzeroMagnitude
    
    public var key: String?
    
    public var index = 0
    
    public var count: Int {
        return self.rows.count
    }
    
    public init(_ rows: [any TableViewRowable] = []) {
        self.rows = rows
    }
    
    // MARK: - Header & Footer
    
    private(set) var header: (any TableViewSectionHeaderFooterable)?
    private(set) var footer: (any TableViewSectionHeaderFooterable)?
    
    public func setHeader(_ header: any TableViewSectionHeaderFooterable) {
        self.header = header
    }
    
    public func setHeader<Model, View: TableViewHeaderFooterView<Model>>(_ model: Model, viewType: View.Type) {
        self.header = HeaderFooter<Model, View>(model)
    }
    
    public func setFooter(_ footer: any TableViewSectionHeaderFooterable) {
        self.footer = footer
    }
    
    public func setFooter<Model, View: TableViewHeaderFooterView<Model>>(_ model: Model, viewType: View.Type) {
        self.footer = HeaderFooter<Model, View>(model)
    }
    
    // MARK: - Row
    
    private(set) var rows: [any TableViewRowable]
    
    public func append(_ row: any TableViewRowable) {
        self.rows.append(row)
    }
    
    public func insert(_ row: any TableViewRowable, at index: Int) {
        self.rows.insert(row, at: index)
    }
    
    @discardableResult
    public func remove(at index: Int) -> any TableViewRowable {
        return self.rows.remove(at: index)
    }
    
}

extension TableViewDataSource {
    
    public func row(at indexPath: IndexPath) -> any TableViewRowable {
        return self[indexPath.section].rows[indexPath.row]
    }
    
    @discardableResult
    public func remove(at indexPath: IndexPath) -> (any TableViewRowable)? {
        guard indexPath.section < self.count else {
            return nil
        }
        let section = self[indexPath.section]
        guard indexPath.row < section.count else {
            return nil
        }
        return section.remove(at: indexPath.row)
    }
}

public protocol TableViewSectionHeaderFooterable {
        
    func view(for tableView: UITableView, at section: Int) -> UITableViewHeaderFooterView
}

extension TableViewSection {
    
    open class HeaderFooter<Model, View: TableViewHeaderFooterView<Model>>: TableViewSectionHeaderFooterable {
                
        open var model: Model

        public var section: Int = 0
        
        init(_ model: Model) {
            self.model = model
            self.layoutRects()
        }
        
        open func layoutRects() {
            
        }        
        
        open func view(for tableView: UITableView, at section: Int) -> UITableViewHeaderFooterView {
            self.section = section
            let view = tableView.dequeueReusableHeaderFooterView(View.self)
            self.bind(to: view)
            return view
        }
        
        open func bind(to view: View) {
            view.configure(model)
        }
    }
}
