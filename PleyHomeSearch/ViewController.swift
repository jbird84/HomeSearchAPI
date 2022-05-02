//
//  ViewController.swift
//  PleyHomeSearch
//
//  Created by Kinney Kare on 4/29/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tempAddressData: [String] = []
    var searchString = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempAddressData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "address", for: indexPath) as? AddressTableViewCell else {
            return UITableViewCell()
        }
        
        cell.addressLabel.text = tempAddressData[indexPath.row]
        
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            tempAddressData = []
            // TODO: show a screen that say to search for house.
        } else {
            searchString = searchText
            fetchAddresses()
            tempAddressData = []
        }
        tableView.reloadData()
    }
    
        func fetchAddresses() {
        
        //Create URL:
        
            let escapedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            
            //let u = searchString.addingPercentEncoding(withAllowedCharacters: NSMutableCharacterSet.alphanumeric())
        
            
            
            guard let url = URL(string: "https://realty-in-us.p.rapidapi.com/locations/auto-complete?input=\(escapedString ?? "")") else {
            fatalError("Invalid url string.")
        }

        //create request to add headers:
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = ["Content-Type" : "application/json", "X-RapidAPI-Host" : "realty-in-us.p.rapidapi.com", "X-RapidAPI-Key":"5f1255b221msh51110a82d9d5917p1c66ecjsne29d780398ba"]
        let session = URLSession.init(configuration: config)
        
        
        //Create URL session data task
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                fatalError("Unable to unwrap date from api call.")
            }
            
            do {
                //Parse the JSON data
                let autoCompleteResult = try JSONDecoder().decode(AddressResult.self, from: data)
                //print("Successfully received the data \(autoCompleteResult.autocomplete)")
                DispatchQueue.main.async {
                    for address in autoCompleteResult.autocomplete {
                        self.tempAddressData.append("\(address.line ?? "") \(address.city), \(address.stateCode) \(address.postalCode ?? "")")
                        self.tableView.reloadData()
                    }
                }
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        task.resume()
    }

    
}

