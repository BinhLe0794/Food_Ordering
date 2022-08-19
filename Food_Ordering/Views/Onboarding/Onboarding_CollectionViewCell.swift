//
//  Onboarding_CollectionViewCell.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import UIKit

class Onboarding_CollectionViewCell: UICollectionViewCell {
    
    static let identitier = String(describing: Onboarding_CollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var lbl_slideTittle: UILabel!
    @IBOutlet weak var lbl_slideDescription: UILabel!
    
    func setup(_ slide : OnboardingSlide){
        slideImageView.image = slide.image
        lbl_slideTittle.text = slide.title
        lbl_slideDescription.text = slide.description
    }
}
