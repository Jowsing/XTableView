# XTableView

[![CI Status](https://img.shields.io/travis/jowsing/XTableView.svg?style=flat)](https://travis-ci.org/jowsing/XTableView)
[![Version](https://img.shields.io/cocoapods/v/XTableView.svg?style=flat)](https://cocoapods.org/pods/XTableView)
[![License](https://img.shields.io/cocoapods/l/XTableView.svg?style=flat)](https://cocoapods.org/pods/XTableView)
[![Platform](https://img.shields.io/cocoapods/p/XTableView.svg?style=flat)](https://cocoapods.org/pods/XTableView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

1.Help you quickly build all types of UITableView

2.UITableViewCell & UITableViewHeaderFooterView & Model Type decoupling was done

3.Easy to use Auto or Manual Layout


## Installation

XTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XTableView'
```

## Usage

### Setup (tableView & viewModel)

```swift
tableView.register(MenuViewHeader.self)
tableView.register(MenuViewCell.self)

// Set data
let section0 = TableViewSection([
    MenuViewRow(model: "青椒肉丝"),
])
section0.headerHeight = 60
section0.setHeader("Foods", viewType: MenuViewHeader.self)

let section1 = TableViewSection([
    BlogViewRow(model: "福星版本找到答案了：无脑猩红走连胜，9级d出10猩红开始卡5费，自己有机会追3就追，没机会就每个卡个2星，目前10把已8把鸡，2把第2"),
])
section1.headerHeight = 60
section1.setHeader("Blogs", viewType: MenuViewHeader.self)

self.viewModel.dataSource = [section0, section1]

// Bind
self.tableView.bind(to: viewModel)

```

### TableViewHeaderFooterView

```swift
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
```

### TableViewCell & TableViewRow

#### Manual Layout
```swift
class TitleViewCell: TableViewCell<String> {
    
    let label = UILabel()
    
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
        self.cellHeight = titleRect.maxY + 15
    }
    
    override func bindTo(_ cell: MenuViewCell) {
        super.bindTo(cell)
        cell.label.frame = self.titleRect
    }
}

```

#### Auto Layout
```swift
class TitleViewCell2: TitleViewCell {
    
    override func setupUI() {
        super.setupUI()
        self.label.snp.makeConstraints { make in
            make.left.top.equalTo(15)
            make.right.bottom.equalTo(-15)
        }
    }
}

class BlogViewRow: TableViewRow<String, TitleViewCell2> {
        
    override func layoutRects() {
        self.estimatedHeight = 60
        self.height = UITableViewAutomaticDimension
    }
}
```

## Author

jowsing, jowsing169@gmail.com

## License

XTableView is available under the MIT license. See the LICENSE file for more info.
