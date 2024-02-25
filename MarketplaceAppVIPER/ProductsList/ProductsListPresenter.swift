//
//  ProductsListPresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

protocol ProductsListPresenterProtocol: AnyObject {
    
    func viewDidLoaded()
    
    func productsListFetched(products: [Product]?)
    
    func showProductPage(product: Product)
    
}

class ProductsListPresenter {
    weak var view: ProductsListViewProtocol?
    var router: ProductsListRouterProtocol
    var interactor: ProductsListInteractorProtocol

    init(interactor: ProductsListInteractorProtocol, router: ProductsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
    
    func showProductPage(product: Product) {
        router.showProductPage(product: product)
    }
    
    
    func productsListFetched(products: [Product]?) {
        if products != nil {
            view?.showProducts(products: products ?? [])
        } else {
            view?.showErrorAlert()
        }
    }
    
    
   
    
    
    func viewDidLoaded() {
        interactor.fetchProductsList()
    }
    
}
