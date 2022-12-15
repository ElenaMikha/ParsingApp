//
//  StartViewController.swift
//  ParsingApp
//
//  Created by Elena Mikhailova on 14.12.2022.
//

import UIKit

class StartViewController: UIViewController {
    let dataUrl = "https://api.agify.io/?name=bella"
    
    @IBAction func startButton() {
        getData()
    }
}
extension StartViewController {
    
    private func getData() {
        guard let url = URL(string: dataUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(PersonData.self, from: data)
                print(data)
                
            } catch let error {
                print(error)
                
            }
            
        }.resume()
    }
}
