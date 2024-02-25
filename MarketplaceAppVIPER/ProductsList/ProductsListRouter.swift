//
//  ProductsListRouter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

protocol ProductsListRouterProtocol {
    
    func showProductPage(product: Product)
    
}

class ProductsListRouter: ProductsListRouterProtocol {
    
    weak var viewController: ProductsListViewController?
    
    func showProductPage(product: Product) {
        let vc = ProductPageModuleBuilder.build(product: product)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
