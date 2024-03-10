//
//  ViewController.swift
//  ios_tableView
//
//  Created by r_murata on 2024/03/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath) as! CustomCell
            cell.sampleLabel.text = "テスト\(indexPath.row)"
            cell.sampleImageView.image = UIImage(named: "icon")
            
            return cell
        }
    }
