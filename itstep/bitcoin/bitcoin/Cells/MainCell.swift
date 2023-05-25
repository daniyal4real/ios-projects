//
//  MainCell.swift
//  bitcoin
//
//  Created by dan on 03.04.2023.
//

import UIKit

class MainCell: UICollectionViewCell {

    @IBOutlet weak var tableVIew: UITableView!
    
    
    public static let identifier = "MainCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(UINib(nibName: CustomCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CustomCell.identifier)
    }

}

extension MainCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        return cell
    }
    
    
}
