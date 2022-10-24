//
//  ViewController.swift
//  My Own Project
//
//  Created by Христина Мізинюк on 10/16/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = ["Estonia", "France", "Germany", "UK", "Ireland", "Italy", "Poland", "Nigeria", "USA", "Spain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    
    }
}


