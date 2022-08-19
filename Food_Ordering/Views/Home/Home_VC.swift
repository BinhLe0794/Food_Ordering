//
//  Home_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import UIKit

class Home_VC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionview: UICollectionView!
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id2", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id3", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id4", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id5", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id6", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
    ]
    
    var populars : [Dish] = [
        .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
        .init(id: "id2", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
        .init(id: "id3", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),
                                        forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionview.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil),
                                       forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
}
extension Home_VC : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            case categoryCollectionView:
                return categories.count
            case popularCollectionview:
                return populars.count
            default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            case categoryCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier,
                                                              for: indexPath) as!  CategoryCollectionViewCell
                cell.setup(category: categories[indexPath.row])
                return cell
            case popularCollectionview:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier,                                            for: indexPath) as!  DishPortraitCollectionViewCell
            
                cell.setup(dish: populars[indexPath.row])
                return cell
        default:
            return UICollectionViewCell()
        }

        
       
    }

}
