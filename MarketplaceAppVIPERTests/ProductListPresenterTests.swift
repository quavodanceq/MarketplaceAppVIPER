//
//  ProductListPresenterTests.swift
//  MarketplaceAppVIPERTests
//
//  Created by Куат Оралбеков on 20.03.2024.
//

import XCTest
@testable import MarketplaceAppVIPER

final class ProductListPresenterTests: XCTestCase {
    
    private let interactor = ProductListInteractorMock()
    private let router = ProductListRouterMock()
    private let view = ProductListViewMock()
    private lazy var presenter = ProductsListPresenter(interactor: interactor, router: router)
    
    
    override func setUp() async throws {
        interactor.pres = presenter
        presenter.view = view
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testReceiveData() {
        let data = [Product(imageName: "", name: "", price: "", imagesNames: [""], sizes: [""]),
                    Product(imageName: "", name: "", price: "", imagesNames: [""], sizes: [""])]
        interactor.productsToSend = data
        presenter.viewDidLoaded()
        XCTAssertEqual(view.products?.count, 2)
    }
    
    func testReceiveEmptyData() {
        let data = [Product]()
        interactor.productsToSend = data
        presenter.viewDidLoaded()
        XCTAssertEqual(view.products?.count, 0)
    }
    
    func testReceiveNilData() {
        interactor.productsToSend = nil
        presenter.viewDidLoaded()
        XCTAssertTrue(view.isErrorAlertWasShown)
    }
    
    func testRouting() {
        let receivedProduct = Product(imageName: "",
                               name: "",
                               price: "",
                               imagesNames: [""],
                               sizes: [""])
        presenter.showProductPage(product: receivedProduct)
        XCTAssertTrue(router.isProductPageVCWasShown)
        XCTAssertEqual(receivedProduct, router.product)
    }

}

class ProductListInteractorMock: ProductsListInteractorProtocol {
    
    func fetchProductsList() {
        pres?.productsListFetched(products: productsToSend)
    }
    
    weak var pres: ProductsListPresenterProtocol?
    
    var productsToSend: [Product]?
    
}

class ProductListRouterMock: ProductsListRouterProtocol {
    
    var isProductPageVCWasShown: Bool = false
    
    var product: Product?
    
    func showProductPage(product: Product) {
        isProductPageVCWasShown = true
        self.product = product
    }
    
}

class ProductListViewMock: ProductsListViewProtocol {
    
    var products: [Product]?
    
    var isErrorAlertWasShown: Bool = false
    
    func showProducts(products: [Product]) {
        self.products = products
    }
    
    func showErrorAlert() {
        isErrorAlertWasShown = true
    }
    
}
