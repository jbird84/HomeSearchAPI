//
//  AddressFetcher.swift
//  PleyHomeSearch
//
//  Created by Kinney Kare on 4/29/22.
//

import Foundation
import UIKit


struct AddressFetcher {

  //  let vc = ViewController()
    

//    func fetchAddresses(searchString: String, tableView: UITableView ) {
//
//    //Create URL:
//
//        let escapedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//
//        //let u = searchString.addingPercentEncoding(withAllowedCharacters: NSMutableCharacterSet.alphanumeric())
//
//
//
//        guard let url = URL(string: "https://realty-in-us.p.rapidapi.com/locations/auto-complete?input=\(escapedString ?? "")") else {
//        fatalError("Invalid url string.")
//    }
//
//    //create request to add headers:
//    var request = URLRequest.init(url: url)
//    request.httpMethod = "GET"
//    let config = URLSessionConfiguration.default
//        config.httpAdditionalHeaders = ["Content-Type" : "application/json", "X-RapidAPI-Host" : "realty-in-us.p.rapidapi.com", "X-RapidAPI-Key":"5f1255b221msh51110a82d9d5917p1c66ecjsne29d780398ba"]
//    let session = URLSession.init(configuration: config)
//
//
//    //Create URL session data task
//    let task = session.dataTask(with: url) { data, _, error in
//        guard let data = data, error == nil else {
//            fatalError("Unable to unwrap date from api call.")
//        }
//
//        do {
//            //Parse the JSON data
//            let autoCompleteResult = try JSONDecoder().decode(AddressResult.self, from: data)
//            //print("Successfully received the data \(autoCompleteResult.autocomplete)")
//            DispatchQueue.main.async {
//                for address in autoCompleteResult.autocomplete {
//                    vc.addressData.append("\(address.line ?? "") \(address.city), \(address.stateCode) \(address.postalCode ?? "")")
//                    tableView.reloadData()
//                }
//            }
//        } catch {
//            fatalError(error.localizedDescription)
//        }
//    }
//    task.resume()
//}
    
}
