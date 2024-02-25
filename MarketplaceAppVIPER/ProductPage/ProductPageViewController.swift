//
//  ProductPageViewController.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

import UIKit
import Foundation
import SnapKit

protocol ProductPageViewProtocol: AnyObject {
    
    func set(product: Product)
    
    func showErrorAlert()
    
    func showSuccessAlert()
    
}

class ProductPageViewController: UIViewController {
    
    
    
    private let nameLabel = UILabel()
    
    private var collectionView: UICollectionView!
    
    private let pageView = UIPageControl()
    
    private let priceLabel = UILabel()
    
    private let sizesView = SizesView()
    
    private let cartButton = UIButton()
    
    var product: Product?
    
    private var productSize: String?
    
    private let alert = UIAlertController()
    
    // MARK: - Public
    var presenter: ProductPagePresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupNavigationBar()
        setupNameLabel()
        setupCarouselView()
        setupPageView()
        setupPriceLabel()
        setupSizesView()
        setupCartButton()
        setupAlert()
        setupConstraints()
        presenter?.viewDidLoaded()
    }
    
    private func setupNavigationBar() {
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Products"
        backButton.tintColor = .backgroundColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupNameLabel() {
        
        view.addSubview(nameLabel)
        nameLabel.text = product?.name
        nameLabel.font = UIFont(name: "Copperplate-Bold", size: 23)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        
    }
    
    private func setupPageView() {
        
        view.addSubview(pageView)
        pageView.currentPageIndicatorTintColor = .backgroundColor
        pageView.pageIndicatorTintColor = .white
        pageView.numberOfPages = product?.imagesNames.count ?? 0
        pageView.currentPage = 0
        pageView.hidesForSinglePage = true
    }
    
    private func setupPriceLabel() {
        
        view.addSubview(priceLabel)
        priceLabel.textColor = .white
        priceLabel.font = UIFont(name: "Copperplate-Bold", size: 19)
        priceLabel.backgroundColor = .backgroundColor
        priceLabel.textAlignment = .center
        priceLabel.sizeToFit()
    }
    
    private func setupCarouselView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.reloadData()
        view.addSubview(collectionView)
    }
    
    private func setupSizesView() {
        sizesView.delegate = self
        view.addSubview(sizesView)
    }
    
    private func setupCartButton() {
        
        view.addSubview(cartButton)
        cartButton.backgroundColor = .backgroundColor
        cartButton.setTitle("Add to cart", for: .normal)
        cartButton.setTitleColor(.white, for: .normal)
        cartButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 18)!
        cartButton.layer.cornerCurve = .continuous
        cartButton.layer.cornerRadius = 5
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
    }
    
    private func setupAlert() {
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
    }
    
    
    private func setupConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            
        }
        
        pageView.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(priceLabel.snp.width).multipliedBy(0.4)
        }
        
        sizesView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(collectionView.snp.width)
            
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(collectionView.snp.width).multipliedBy(0.8)
        }
        
    }
    
    @objc private func cartButtonTapped(_ sender: UIButton) {
        sender.pulsate()
        sender.flash()
        presenter?.addToCartButtonTapped()
    }
}

// MARK: - Private functions
private extension ProductPageViewController {
    func initialize() {
    }
}

// MARK: - ProductPageViewProtocol
extension ProductPageViewController: ProductPageViewProtocol {
    
    func set(product: Product) {
        self.product = product
        self.collectionView.reloadData()
        self.priceLabel.text = "\(product.price)$"
    }
    
   
    
    
    func showSuccessAlert() {
        alert.title = "Success"
        alert.message = "Product was successfully added to cart"
        self.present(alert, animated: true)
    }
    
    
    func showErrorAlert() {
        alert.title = "Choose size"
        alert.message = "It looks like you haven't choose size"
        self.present(alert, animated: true)
    }
    
}

extension ProductPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.imagesNames.count ?? 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarouselCell
        cell.imageName = product?.imagesNames[indexPath.row]
            cell.setup()
            return cell
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)
        return CGSize(width: size, height: size * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageView.currentPage = indexPath.row
    }
    
    
    
    }

extension ProductPageViewController: ProductSizeDelegate {
    
    func productWithSizeAdded(size: String) {
        presenter?.sizePicked(size: size)
    }
    
}
