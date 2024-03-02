//
//  CartViewController.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 28.02.2024
//

import UIKit

protocol CartViewProtocol: AnyObject {
    
    func showCart(content: [Product])
    
    func presentAlert(title: String, message: String)
    
}

class CartViewController: UIViewController {
    
    private let alertController = UIAlertController()
    
    private var cart = [Product]()
    
    private let tableView = UITableView()
    
    private let emptyCartView = EmptyCartView()
    
    private let makeOrderButton = UIButton()
    
    // MARK: - Public
    var presenter: CartPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        initialize()
        presenter?.viewDidLoaded()
        setupEmptyCartView()
        setupTableView()
        setupMakeOrderButton()
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(tableView.contentSize.height)
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupEmptyCartView() {
        
        view.addSubview(emptyCartView)
    }
    
    private func setupMakeOrderButton() {
        
        view.addSubview(makeOrderButton)
        makeOrderButton.setTitle("Make order", for: .normal)
        makeOrderButton.backgroundColor = .backgroundColor
        makeOrderButton.setTitleColor(.white, for: .normal)
        makeOrderButton.layer.cornerCurve = .continuous
        makeOrderButton.layer.cornerRadius = 5
        makeOrderButton.addTarget(self, action: #selector(makeOrderButtonTapped), for: .touchUpInside)
        makeOrderButton.titleLabel?.font =  UIFont(name: "Copperplate-Bold", size: 18)!
        
    }
    
    @objc private func makeOrderButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        presenter?.makeOrderButtonTapped(cart: cart)
        
    }
    
    private func presentAlertController(title: String, message: String) {
        
        alertController.title = title
        alertController.message = message
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        emptyCartView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(emptyCartView.snp.width)
        }
        
        makeOrderButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}

// MARK: - Private functions
private extension CartViewController {
    func initialize() {
    }
}

// MARK: - CartViewProtocol
extension CartViewController: CartViewProtocol {
    
    func presentAlert(title: String, message: String) {
        presentAlertController(title: title, message: message)
    }
    
    
    func showCart(content: [Product]) {
        if content.isEmpty {
            self.tabBarItem.badgeValue = nil
            self.emptyCartView.reveal()
            self.emptyCartView.isHidden = false
            self.tableView.isHidden = true
        } else {
            self.cart = content
            self.tableView.reloadData()
            self.tabBarItem.badgeValue = String(self.cart.count)
            self.emptyCartView.isHidden = true
            self.tableView.isHidden = false
        }
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartCell
        cell.product = cart[indexPath.row]
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.height / 8
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            presenter?.removedFromCart(product: cart[indexPath.row])
        }
    }
    
}
