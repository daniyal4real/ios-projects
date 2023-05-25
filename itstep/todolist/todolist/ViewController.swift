//
//  ViewController.swift
//  todolist
//
//  Created by dan on 20.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: ItemCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ItemCell.identifier)
        return table
    }()
    
    // массив со всему задачами
    private var tasks: [ToDoListItem] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список задач"
        
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        getAllItems()
        
        // добавление плюсика справа наверху
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusTapped))
    }
    
    @objc func plusTapped() {
//        print("Нажали на плюс")
    
        let alert = UIAlertController(title: "Добавить", message: "Введите новую задачу", preferredStyle: .alert)
        alert.addTextField(configurationHandler: .none)
        alert.addAction(UIAlertAction(title: "Готово", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self?.createItem(name: text)
        }))
        present(alert, animated: true)
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.created = Date()
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Ошибка при созданий задачи")
        }
    }
    
    func getAllItems() {
        do {
            // данные сохраняются в массиве
            tasks = try context.fetch(ToDoListItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch {
            print("Ошибка при получений данных из базы")
        }
    }
    
    func editItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Ошибка при изменений")
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Ошибка при удалений")
        }
    }
    
    
    
    // метод для описания сколько будет срок
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // метод для описания каждой строки и как она выглядит
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // создание ячейки
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.nameLabel.text = task.name
        cell.createdLabel?.text = task.created?.formatted()
        return cell
    }
    

    // нажатие на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let bubble = UIAlertController(title: "Редактировать", message: nil, preferredStyle: .actionSheet)
        let item = tasks[indexPath.row]
        bubble.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        bubble.addAction(UIAlertAction(title: "Редактирова", style: .default, handler: { _ in
            
            let alert = UIAlertController(title: "Редактировать", message: "", preferredStyle: .alert)
            alert.addTextField(configurationHandler: .none)
            alert.addAction(UIAlertAction(title: "Сохранить", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                    return
                }
                self?.editItem(item: item, newName: newName)
            }))
            self.present(alert, animated: true)
        }))
        bubble.addAction(UIAlertAction(title: "Удалить", style: .default, handler: { [weak self] _ in
            self?.deleteItem(item: item)
        }))
        present(bubble, animated: true)
    }
}

