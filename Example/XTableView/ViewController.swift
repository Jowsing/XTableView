//
//  ViewController.swift
//  XTableView
//
//  Created by jowsing on 01/15/2025.
//  Copyright (c) 2025 jowsing. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let menuBtn = UIButton()
        menuBtn.setTitle("Go to menu", for: .normal)
        menuBtn.setTitleColor(.systemBlue, for: .normal)
        menuBtn.setTitleColor(.systemBlue.withAlphaComponent(0.5), for: .highlighted)
        menuBtn.titleLabel?.font = .systemFont(ofSize: 25)
        self.view.addSubview(menuBtn)
        
        menuBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        menuBtn.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func showMenu() {
        let navc = UINavigationController(rootViewController: MenuViewController())
        navc.modalPresentationStyle = .overFullScreen
        self.present(navc, animated: true)
    }

}
