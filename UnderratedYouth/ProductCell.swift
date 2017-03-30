//
//  ProductCell.swift
//  UnderratedYouth
//
//  Created by Eli MArshall on 3/29/17.
//  Copyright © 2017 Eli MArshall. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var category: Category? {
        didSet {
            catLabel.text = category?.title
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let catLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        addSubview(catLabel)
        catLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        catLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        catLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        catLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
