//
//  XTableViewModel.swift
//  Pods
//
//  Created by jowsing on 2025/1/22.
//

import Foundation

open class TableViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Property (assign)
    
    public var dataSource = TableViewDataSource()
    
    public var sectionIndexTitles: [String]?
    
    
    // MARK: - UITableView DataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.dataSource.row(at: indexPath).cell(for: tableView, at: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sectionIndexTitles
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    // MARK: - UITableView Delegate
    
    // MARK: Height & EstimatedHeight
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dataSource.row(at: indexPath).height
    }
        
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.dataSource[section].headerHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.dataSource[section].footerHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dataSource.row(at: indexPath).estimatedHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.dataSource[section].estimatedHeaderHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return self.dataSource[section].estimatedFooterHeight
    }
    
    // MARK: Header & Footer
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = self.dataSource[section]
        guard let header = model.header else {
            if model.headerHeight <= .leastNonzeroMagnitude {
                return nil
            }
            return tableView.dequeueReusableHeaderFooterView(ClearHeaderFooterView.self)
        }
        return header.view(for: tableView, at: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let model = self.dataSource[section]
        guard let footer = model.footer else {
            if model.footerHeight <= .leastNonzeroMagnitude {
                return nil
            }
            return tableView.dequeueReusableHeaderFooterView(ClearHeaderFooterView.self)
        }
        return footer.view(for: tableView, at: section)
    }
    
    // MARK: - DidSelectRowAt
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Edting Actions
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return self.dataSource.row(at: indexPath).swipeActionsConfiguration
    }
}
