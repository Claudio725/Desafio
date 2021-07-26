//
//  DetalheViewController.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 23/07/21.
//

import UIKit
import Alamofire
import AlamofireImage

class DetalheViewController: UIViewController {
    
    var icone: String!
    var vicinity: String!
    @IBOutlet var icon: UIImageView!
    @IBOutlet var vici : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Carrega o poster do filme
        if icone != nil {
            let StrUrl: URL = URL(string:icone!)!

            icon.af.setImage(withURL: StrUrl)
        }
        vici.text = vicinity

        //titulo do controller
        title = "Detalhes do Local"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
