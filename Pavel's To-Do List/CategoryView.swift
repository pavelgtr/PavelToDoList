//
//  ViewController.swift
//  Pavel's To-Do List
//
//  Created by Pavel Rivera on 4/12/23.
//

import UIKit

class CategoryView: UIViewController {
    
    let categoryTableView = UITableView()
    let categories = ["Errands", "Exercise", "Groceries", "Kids", "Work"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        overrideUserInterfaceStyle = .light
        categoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell") // Register categoryTableView
        setupSubviews()
        setUpNavigation()
    }
    
    private func setupSubviews() {
        view.addSubview(categoryTableView)
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints
        categoryTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //set delegate and dataSource as self
        categoryTableView.dataSource = self // Set the dataSource for categoryTableView
        categoryTableView.delegate = self // Set the delegate for categoryTableView
    }
    
    private func setUpNavigation() {
        navigationItem.title = "Categories"
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.00)
        //        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.95, green: 0.77, blue: 0.06, alpha: 1.00)]
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.isTranslucent = false
        
        //adding add button
        let addButton = UIBarButtonItem(systemItem: .add)
        addButton.target = self
        addButton.action = #selector(addCategoryButtonTapped)
        addButton.tintColor = .white
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addCategoryButtonTapped() {
        print("Button tapped")
    }
}

//MARK: - tableView Data Source

extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        cell.backgroundColor = .systemBackground
        
        return cell
    }
}

//MARK: - tableView Delegate

extension CategoryView: UITableViewDelegate {
    // Implement UITableViewDelegate methods here, if needed
}

