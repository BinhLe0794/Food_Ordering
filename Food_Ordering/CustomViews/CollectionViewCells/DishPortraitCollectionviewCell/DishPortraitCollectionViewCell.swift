//
//  DishPortraitCollectionViewCell.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: "DishPortraitCollectionViewCell")
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish : Dish){
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }

}
