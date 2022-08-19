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
     
        _ = NetworkService.shared.myFirstRequest { result in
            switch result {
            case .success(let data):
                print("Decoded data is \(data)")
            case .failure(let error):
                print("The error is : \(error.localizedDescription)")
            }
        }
        
    }


}

