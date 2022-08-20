//
//  LishDishes_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 20/08/2022.
//

import UIKit
import ProgressHUD

class LishDishes_VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
//    var dishes: [Dish] = [
//        .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//        .init(id: "id2", name: "Beafsteak", description: "Published on September 6, 2017 - https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//        .init(id: "id3", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200),
//    ]
    var dishes: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        // Do any additional setup after loading the view.
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id!) { [weak self] resultApi in
            switch resultApi {
            case .success(let dishes):
//                print(dishes)
                ProgressHUD.dismiss()
                // Get json data
                self?.dishes = dishes
                //update to the UI
                self?.tableView.reloadData()
            case .failure(let error):
                print("Error ->>>> \(error.localizedDescription)")
            }
        }
    }
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: DishListTableViewCell.identifier)
    }


}// end class

extension LishDishes_VC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dishCategory: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetail_VC.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}//end extension
