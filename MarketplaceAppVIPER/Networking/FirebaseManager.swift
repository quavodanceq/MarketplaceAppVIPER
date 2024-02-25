//
//  FirebaseManager.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Firebase

class FirebaseManager {
    
    private init() {}
    
    static let shared = FirebaseManager()
    
    private let db = Firestore.firestore()
    
    func fetchProducts(completion: @escaping([Product]?) -> Void) {
        var products = [Product]()
        
        db.collection("products").getDocuments { snapshot, error in
            if snapshot != nil {
                for document in snapshot!.documents {
                    let product = Product(imageName: document["imageName"] as! String, name: document["name"] as! String, price: document["price"] as! String, imagesNames: document["imagesNames"] as! [String], sizes: document["sizes"] as! [String], size: nil)
                    products.append(product)
                    completion(products)
                }
                
            } else {
                completion(nil)
            }

        }
    }
    
    func addOrderToFirebase(cart: [Product]) {
        let userDefaults = UserDefaults.standard
        let name = userDefaults.object(forKey: "name") as! String
        let city = userDefaults.object(forKey: "city") as! String
        let street = userDefaults.object(forKey: "street") as! String
        let homeNumber = userDefaults.object(forKey: "homeNumber") as! String
        let phoneNumber = userDefaults.object(forKey: "phone") as! String
        
        var order = OrderModel(order: [OrderProduct](), address: Adress(city: city, street: street, homeNumber: homeNumber, name: name, phoneNumber: phoneNumber))
        var orderString = ""
        for product in cart {
            let orderProduct = OrderProduct(name: product.name, size: product.size ?? "XS")
            order.order.append(orderProduct)
            orderString.append("\(orderProduct.name) \(orderProduct.size), ")
        }
        let orderStringToPush = orderString.dropLast(2)
        var orderData = [String : String]()
        for i in 0..<order.order.count {
            orderData["\(i)"] = "\(order.order[i].name) \(order.order[i].size)"
        }
        orderData["city"] = order.address.city
        orderData["street"] = order.address.street
        orderData["homeNumber"] = order.address.homeNumber
        orderData["name"] = order.address.name
        orderData["phoneNumber"] = order.address.phoneNumber
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        dateFormatter.string(from: date)
        orderData["date"] = dateFormatter.string(from: date)
        db.collection("orders").addDocument(data: orderData) { error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
        db.collection("users").document(Auth.auth().currentUser!.uid).collection("orders").addDocument(data: ["order" : orderStringToPush, "date" : dateFormatter.string(from: date), "deliveryStatus" : "Created"])
    }
    
    func fetchOrders(completion: @escaping ([FetchedOrder]?) -> Void) {
        db.collection("users").document(Auth.auth().currentUser!.uid).collection("orders").getDocuments(source: .server) { snapshot, err in
            
            var orders = [FetchedOrder]()
            if snapshot != nil {
                var orders = [FetchedOrder]()
                for document in snapshot!.documents {
                    let order = FetchedOrder(order: document["order"] as! String, date: document["date"] as! String, deliveryStatus: document["deliveryStatus"] as! String)
                    orders.append(order)
                }
                completion(orders)
                
            } else {
                completion(nil)
            }
        }
            }
    
    
}
