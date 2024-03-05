//
//  OrdersViewController.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 05.03.2024
//

import UIKit

protocol OrdersViewProtocol: AnyObject {
    
    func showOrders(orders: [FetchedOrder])
    
}

class OrdersViewController: UIViewController {
    // MARK: - Public
    var presenter: OrdersPresenterProtocol?
    
    private var orders = [FetchedOrder]()
    
    private let tableView = UITableView()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupNavigation()
        setupTableView()
        setupContraints()
        presenter?.viewDidLoaded()
    }
    
    private func setupNavigation() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My orders"
        let backButton = UIBarButtonItem()
        backButton.title = "Profile"
        backButton.tintColor = .backgroundColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupContraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
    }
}
// MARK: - Private functions
private extension OrdersViewController {
    func initialize() {
    }
}

// MARK: - OrdersViewProtocol
extension OrdersViewController: OrdersViewProtocol {
    
    func showOrders(orders: [FetchedOrder]) {
        self.orders = orders
        tableView.reloadData()
    }
    
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OrderCell
        cell.order = orders[indexPath.row]
        cell.setup()
        return cell
    }
}
        
        

        

