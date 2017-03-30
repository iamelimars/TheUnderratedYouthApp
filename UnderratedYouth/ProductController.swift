//
//  ProductController.swift
//  UnderratedYouth
//
//  Created by Eli MArshall on 3/29/17.
//  Copyright © 2017 Eli MArshall. All rights reserved.
//

import UIKit
import Moltin

class ProductController: UIViewController {
    
    var categoryId: String = ""
    
    override func viewDidLoad() {
        view.backgroundColor = .white
//        print(categoryId)
        getProductsFromCategory()
    }
    
    func getProductsFromCategory(){
        Moltin.sharedInstance().product.listing(withParameters: ["category": categoryId, "limit": 10], success: { (response) -> Void in
            let results = response?["result"] as! NSArray
            
//            print(results)
            
            for product in results as! [[String: AnyObject]] {
                print(product["title"] as Any)
            }
            
            
//            self.collectionView?.reloadData()
        }, failure: { (response, error) -> Void in
            print("Couldn't get products, something went wrong...")
            print(error as Any)
        })
    }
}
