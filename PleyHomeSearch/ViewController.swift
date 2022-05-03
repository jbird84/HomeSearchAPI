//
//  ViewController.swift
//  PleyHomeSearch
//
//  Created by Kinney Kare on 4/29/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: - Variable Declarations
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tempAddressData: [String] = []
    var searchString = ""
    
    
    // MARK: - ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        initSearchController()
    }
    
    
    // MARK: - SearchBar Methods
    func initSearchController() {
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            tempAddressData = []
        } else {
            searchString = searchText
            fetchMovies()
            tempAddressData = []
        }
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Methods
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
    
    func fetchMovies() {
        
        let escapedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=ded8832144473857c6386251e89f89af&language=en-US&query=\(escapedString ?? ""))&page=1&include_adult=true") else {
            print("Invalid url string")
            return
        }
        
                //Create URL session data task
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data = data, error == nil else {
                        print(error ?? "Unable to unwrap date from api call.")
                        return
                    }
        
                    do {
                        //Parse the JSON data
                        let autoCompleteResult = try JSONDecoder().decode(MovieResult.self, from: data)
                        //print("Successfully received the data \(autoCompleteResult.autocomplete)")
                        DispatchQueue.main.async {
                            for movie in autoCompleteResult.results {
                                self.tempAddressData.append(movie.originalTitle)
                                self.tableView.reloadData()
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
                task.resume()
    }
}



//    // MARK: - API Method
//    // TODO: - This will be moved to "AddressFetcher" when it is compleated.
//    func fetchAddresses() {
//
//        let escapedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//
//        //Create URL:
//        guard let url = URL(string: "https://realty-in-us.p.rapidapi.com/locations/auto-complete?input=\(escapedString ?? "")") else {
//            print("Invalid url string.")
//            return
//        }
//
//        //create request to add headers:
//        var request = URLRequest.init(url: url)
//        request.httpMethod = "GET"
//        let config = URLSessionConfiguration.default
//        config.httpAdditionalHeaders = ["Content-Type" : "application/json", "X-RapidAPI-Host" : "realty-in-us.p.rapidapi.com", "X-RapidAPI-Key":"5f1255b221msh51110a82d9d5917p1c66ecjsne29d780398ba"]
//        let session = URLSession.init(configuration: config)
//
//
//        //Create URL session data task
//        let task = session.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                print(error ?? "Unable to unwrap date from api call.")
//                return
//            }
//
//            do {
//                //Parse the JSON data
//                let autoCompleteResult = try JSONDecoder().decode(AddressResult.self, from: data)
//                //print("Successfully received the data \(autoCompleteResult.autocomplete)")
//                DispatchQueue.main.async {
//                    for address in autoCompleteResult.autocomplete {
//                        self.tempAddressData.append("\(address.line ?? "") \(address.city), \(address.stateCode) \(address.postalCode ?? "")")
//                        self.tableView.reloadData()
//                    }
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }


