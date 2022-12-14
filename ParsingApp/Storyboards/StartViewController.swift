//
//  StartViewController.swift
//  ParsingApp
//
//  Created by Elena Mikhailova on 14.12.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    
    
    @IBAction func startButton() {
      startData()
    }
    
    
}
extension StartViewController {
    
    private func startData() {
        guard let url = URL(string: "https://api.agify.io/?name=bella") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(Data.self, from: data)
                print(data)
                
            } catch let error {
                print(error)
                
            }
            
        }.resume()
    }
}
