//
//  DetailsViewController.swift
//  superHeroBook
//
//  Created by İrem Yılmaz on 23.08.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var secilenKahramanIsmi = ""
    var secilenKahramanResmi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageView.image = UIImage(named: secilenKahramanResmi)
        label.text = secilenKahramanIsmi
    }
    


}
