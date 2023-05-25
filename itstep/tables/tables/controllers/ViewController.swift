//
//  ViewController.swift
//  tables
//
//  Created by dan on 25.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // МАССИВ ИЗ ДАННЫХ
    var lineArray: [String] = ["text1", "text2", "text3", "last"]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New menu"
        
        // ОБЯЗАТАТЕЛЬНО НУЖНО ДОБАВИТЬ
        tableView.dataSource = self
        // РЕГИСТРАЦИЯ ЯЧЕЙКИ ВНУТРИ ТАБЛИЦЫ
        tableView.register(UINib(nibName: ContentCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ContentCell.identifier)
    }
    
    // СКОЛЬКО СТРОЧЕК ВНУТРИ ТАБЛИЦЫ
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineArray.count
    }
    
    
    // ДИЗАЙН КАЖДОЙ ЯЧЕЙКИ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // создание ячейки из класса ContentCell
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        
        // вставка данных в label из массива lineArray
        cell.contentLabel.text = lineArray[indexPath.row]
        // возврат каждой ячейки
        return cell
    }


}

