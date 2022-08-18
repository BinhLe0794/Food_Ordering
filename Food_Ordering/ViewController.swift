//
//  ViewController.swift
//  Food_Ordering
//
//  Created by Huy Binh on 18/08/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = NetworkService()
        let request = service.createRequest(route: .temp, method: .post, parameters: ["username":"huybinh", "password":"123123"])
        print("urlRequest: \(request?.url)")
        
    }


}

