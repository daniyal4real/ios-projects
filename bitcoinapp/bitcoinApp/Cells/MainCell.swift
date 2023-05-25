//
//  MainCell.swift
//  bitcoinApp
//
//  Created by Daniyal on 15.02.2021.
//

import UIKit

class MainCell: UICollectionViewCell {

    public static let identifier: String = "MainCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CustomCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CustomCell.identifier)
    }

}

extension MainCell: UITableViewDelegate {
    
}

extension MainCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        return cell
    }
    
}


