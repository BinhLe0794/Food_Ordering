//
//  Home_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import UIKit

class Home_VC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id2", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id3", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id4", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id5", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        .init(id: "id6", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),
                                        forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}
extension Home_VC : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as!  CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }

}
