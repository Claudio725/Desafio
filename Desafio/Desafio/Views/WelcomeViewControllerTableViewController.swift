//
//  WelcomeViewControllerTableViewController.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 21/07/21.
//

import UIKit
import MapKit
import CoreLocation

class WelcomeViewControllerTableViewController: UITableViewController {
    
    var welcome: Welcome? = nil
    var results: [Result] = []
    var longitude: Double?
    var latitude: Double?
    var registroSelecionado: Int!
    
    @IBOutlet weak var gridPlaces: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations

        
        //1 - Busca dados da API com a localizaçao do dispositivo do usuario
        //welcome = Bundle.main.decode(latitude: -22.9519, longitude: -43.1852)
        welcome = Bundle.main.decode(latitude: -33.8670522, longitude: -151.1957362)
        
        //2 - Popula matriz de resultados
        results = welcome?.results ?? []
        
        //2.1 - Sort by rating
        results.sort {
            $0.rating < $1.rating
        }
        
        //3. Filtrar por Bars, Cafes e Restaurants
        let filtro: [String] = ["bar","restaurant", "cafe"]
        results = results.filter { $0.types.contains (filtro[0]) ||
            $0.types.contains(filtro[1]) || $0.types.contains(filtro[2])
        }
        
        createSpinnerView()
        
        //4. Montar a lista com o Nome do lugar, Open now e Rating
        //5 - setar o datasource e o delegate

        self.gridPlaces.delegate = self
        self.gridPlaces.dataSource = self
        
        self.gridPlaces.reloadData()
        
        //titulo do controller
        title = "Best Places"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        latitude = locValue.latitude
        longitude = locValue.longitude
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell
        let cellIdentifier = "cell"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WelcomeCellViewControllerTableViewCell
        
        celula.Name?.text = results[indexPath.row].name
        if results[indexPath.row].openingHours.openNow == true {
            celula.OpenNow?.text = "Aberto" } else {
                celula.OpenNow?.text = "Fechado"
            }

        celula.Rating?.text = String(format: "%.1f", results[indexPath.row].rating)

        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        registroSelecionado = indexPath.row

    }

    //Passar os dados pesquisados para a página Detalhada com o lugar selecionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            //Passar campos de Imagem e User Reviews
            if identifier == "detalhar" {
                if (registroSelecionado) != nil {
                    let detalheViewController = segue.destination as! DetalheViewController
                //Passa os detalhes do filme
                    detalheViewController.icone = results[registroSelecionado].icon
                    detalheViewController.vicinity = results[registroSelecionado].vicinity

                }
            }
        }
    }
    
    func createSpinnerView() {
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }

}

extension UICollectionView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        //let messageLabel = UILabel(frame: CGRect(x: 50,y: 50,width: 300,height: 21))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        messageLabel.sizeToFit()
        
        messageLabel.text = message
        messageLabel.textAlignment = .center
        
        let image: UIImage = UIImage(named: "smiley")!

        var bgImage: UIImageView?
        bgImage = UIImageView(image: image)
        bgImage!.frame = CGRect(x: 155,y: 220,width: 60,height: 60)
        
        messageLabel.addSubview(bgImage!)
        
        self.backgroundView = messageLabel
        //self.separatorStyle = .none
    }
    

    func restore() {
        self.backgroundView = nil
        //self.separatorStyle = .singleLine
    }
}
