//
//  DishListTableViewCell.swift
//  Food_Ordering
//
//  Created by Huy Binh on 20/08/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var dishTitleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dishCategory: Dish){
        
        dishImageView.kf.setImage(with: dishCategory.image?.asUrl)
        
        dishTitleLbl.text = dishCategory.name
        descriptionLbl.text = dishCategory.description
    }
    
    func setup(Order: Order){
        
        dishImageView.kf.setImage(with: Order.dish?.image?.asUrl)
        
        dishTitleLbl.text = Order.name
        descriptionLbl.text = Order.dish?.description
    }
}
