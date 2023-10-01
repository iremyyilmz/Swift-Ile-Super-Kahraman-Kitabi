//
//  ViewController.swift
//  superHeroBook
//
//  Created by İrem Yılmaz on 23.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TableView: UITableView!
    var secilenKahraman = ""
    var secilenKahramanGorsel = ""
    var superHeros = [String]()
    var superHerosImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
        superHeros.append("Kim Possible")
        superHeros.append("PowerPuff Girls")
        superHeros.append("Batman")
        superHeros.append("Superman")
        superHeros.append("Hulk")
        superHeros.append("Captain America")
        superHeros.append("Iron Man")
        
        
        superHerosImage.append("kimpossible")
        superHerosImage.append("pwf")
        superHerosImage.append("batman")
        superHerosImage.append("superman")
        superHerosImage.append("114738")
        superHerosImage.append("kaptanamerika")
        superHerosImage.append("ironman")
    }
    
    //numberOfRowsInSection -> kaç row olacak
    //cellForRowAt indexPath -> hücrenin içinde neler gösterilecek
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeros[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeros.remove(at: indexPath.row)
            superHerosImage.remove(at: indexPath.row)
            TableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenKahraman = superHeros[indexPath.row]
        secilenKahramanGorsel = superHerosImage[indexPath.row]
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVc" {
            let destinationVc = segue.destination as! DetailsViewController
            destinationVc.secilenKahramanIsmi = secilenKahraman
            destinationVc.secilenKahramanResmi = secilenKahramanGorsel
        }
    }

}

