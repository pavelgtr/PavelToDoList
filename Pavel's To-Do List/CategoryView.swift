//
//  ViewController.swift
//  Pavel's To-Do List
//
//  Created by Pavel Rivera on 4/12/23.
//

import UIKit

class CategoryView: UIViewController {
    
    let categoryTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(categoryTableView)
        categoryTableView.isUserInteractionEnabled = true
        // no auto layout
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
    }


}

