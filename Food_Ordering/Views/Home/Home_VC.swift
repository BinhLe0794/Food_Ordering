//
//  Home_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import UIKit
import ProgressHUD


class Home_VC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionview: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
//    var categories : [DishCategory] = [
//        .init(id: "id1", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
//        .init(id: "id2", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
//        .init(id: "id3", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
//        .init(id: "id4", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
//        .init(id: "id5", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
//        .init(id: "id6", name: "Salas", image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
//    ]
//
//    var populars : [Dish] = [
//        .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//        .init(id: "id2", name: "Beafsteak", description: "Published on September 6, 2017 - https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//        .init(id: "id3", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//    ]
//
//    var specials : [Dish] = [
//        .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//        .init(id: "id2", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//        .init(id: "id3", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//    ]
    var categories : [DishCategory] = []
    var populars : [Dish] = []
    var specials : [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        NetworkService.shared.myFirstRequest { data in
//
//            switch data {
//            case .success(let data):
//                print("data is: \(data)")
//
//            case .failure(let error):
//                ProgressHUD.showSuccess(error.localizedDescription, interaction: true)
//                print("error")
//            }
//        }
        
        registerCell()
        ProgressHUD.show()
        
        NetworkService.shared.fetchAllCategories { [weak self] resultApi in
            switch resultApi {
            case .success(let allDishes):
//                print(allDishes)
                ProgressHUD.dismiss()
                // Get json data
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                //update to the UI
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionview.reloadData()
                self?.specialCollectionView.reloadData()
            case .failure(let error):
                print("Error ->>>> \(error.localizedDescription)")
            }
        }
        
    }

    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),
                                        forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionview.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil),
                                       forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil),
                                       forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
}
extension Home_VC : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            case categoryCollectionView:
                return categories.count
            case popularCollectionview:
                return populars.count
            case specialCollectionView:
            return specials.count
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
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier,                                            for: indexPath) as!  DishLandscapeCollectionViewCell
        
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }

        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let controller = LishDishes_VC.instantiate()
            
            controller.category = categories[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = DishDetail_VC.instantiate()
            
            controller.dish = collectionView == popularCollectionview ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
}//end extension
