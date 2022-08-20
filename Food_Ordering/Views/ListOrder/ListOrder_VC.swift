//
//  ListOrder_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 20/08/2022.
//

import UIKit

class ListOrder_VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1", name: "Binh", dish: .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200)),
        .init(id: "id1", name: "Binh", dish: .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200)),
        .init(id: "id1", name: "Binh", dish: .init(id: "id1", name: "Beafsteak", description: "Published on September 6, 2017", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", calories: 200)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        // Do any additional setup after loading the view.
        registerCells()
    }

    private func registerCells () {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}// end class
extension ListOrder_VC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(Order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetail_VC.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}// end extension
