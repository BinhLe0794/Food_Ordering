//
//  DishDetail_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 20/08/2022.
//

import UIKit
import ProgressHUD


class DishDetail_VC: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    @IBAction func placeOrderBtn_Clicked(_ sender: Any) {
        
        guard let name  = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name .isEmpty else {
            ProgressHUD.showError("Please enter the name")
            return
        }
        ProgressHUD.showSuccess("Order \(name) Successfully", interaction: true)
        
     }
}
