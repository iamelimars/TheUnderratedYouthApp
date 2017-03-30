//
//  HomeController.swift
//  UnderratedYouth
//
//  Created by Eli MArshall on 3/28/17.
//  Copyright © 2017 Eli MArshall. All rights reserved.
//

import UIKit
import Moltin

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "categoryCell"
    var selectedId = ""
//    var allCategories: NSArray = []
    
//    var cats: [Category] = {
//       var firstCategory = Category()
//        firstCategory.title = "Shirts"
//        firstCategory.status = 1
//        
//        var secondCategory = Category()
//        secondCategory.title = "Hats"
//        secondCategory.status = 1
//        
//        return [firstCategory, secondCategory]
//    }()
    
    var categories: [Category]?
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchCategories()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories?.count ?? 0
    }
    
    func fetchCategories(){
        Moltin.sharedInstance().category.listing(withParameters: ["limit": 10], success: { (response) -> Void in
            let results = response?["result"] as! NSArray
            self.categories = [Category]()
            
            for dictionary in results as! [[String: AnyObject]] {
                
                let category = Category()
                category.title = (dictionary["title"] as! String)
                category.id = dictionary["id"] as! String
                self.categories?.append(category)
                
//                print(dictionary)
            }
            
            
            
            self.collectionView?.reloadData()
        }, failure: { (response, error) -> Void in
            print("Couldn't get products, something went wrong...")
            print(error as Any)
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.category = categories?[indexPath.item]
        
        cell.backgroundColor = UIColor.init(colorLiteralRed: 237/255.0, green: 238/255.0, blue: 239/255.0, alpha: 1)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCat: Category = categories![indexPath.item]
        
//        print(selectedCat.title)
//        print(selectedCat.id)
        
        self.selectedId = selectedCat.id
        
        let productVc = ProductController()
        productVc.categoryId = selectedCat.id
//        self.present(productVc, animated: true, completion: nil)
        navigationController?.pushViewController(productVc, animated: true)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 2)
    }
    
    
    

   
}
