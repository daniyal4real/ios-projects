//
//  DBManager.swift
//  sql_practice
//
//  Created by dan on 27.03.2023.
//

import Foundation
import SQLite3

// класс для управление базой данных
class DBManager {
    
    // путь к файлу который содержит саму базу с таблицами
    let dbPath: String = "test1.sqlite"
    // перменная которая дает доступ обращатся к самой базе
    var db: OpaquePointer?
    
    init() {
        // срабает инит
        // первым делом он открывает базу
        db = openDatabase()
        createTable()
    }
    
    // метод для открытия базы
    // ? нужен потому что может придти другой тип возврата, в данном примере nil
    func openDatabase() -> OpaquePointer? {
        // try нужен чтобы вызвать файловый мэнэджер
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        // пока что подключение равно нулю
        var db: OpaquePointer? = nil
        
        
        // проверка на успешность подключения
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            // в случает ошибки на пример не получается открыть файл с базой, он выдаст ошибку
            debugPrint("Не удается подключится к базе данных")
            // в слючае ошибки он возвратит пустоту
            return nil
        } else {
            // если файл открылся значит подключение прошло успешно
            print("Подключение к базе данных прошло успешно")
            // возврат поключения к базе
            return db
        }
    }
    
    
    // метод для создания таблицы
    func createTable() {
        // sql код который я записал как строку
        let createTableString = "CREATE TABLE IF NOT EXISTS person(ID INTEGER PRIMARY KEY, name TEXT, phone TEXT);"
        // переменная которая отвечает за подключение
        var createTableStatement: OpaquePointer? = nil
        
        // используем готовый метод из sqlite3
        // сама база данных, sql код, байты, команда которая проверяет на выполнение sql кода, пустота
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // запуск команды для создания таблицы
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Таблица была создана")
            } else {
                print("Таблица не была создана")
            }
        } else {
            // если при подключений произошла ошибка
            print("Команда не была запущена")
        }
        // последний шаг пример с колой
        sqlite3_finalize(createTableStatement)
    }
    
    func read() -> [Person]{
        let selectStmtString = "select * from person;"
        var selectStmt: OpaquePointer? = nil
        var people: [Person] = []
        if sqlite3_prepare_v2(db, selectStmtString, -1, &selectStmt, nil) == SQLITE_OK {
            while sqlite3_step(selectStmt) == SQLITE_ROW {
                let id = sqlite3_column_int(selectStmt, 0)
                let name = String(describing: String(cString: sqlite3_column_text(selectStmt, 1)))
                let phone = String(describing: String(cString: sqlite3_column_text(selectStmt, 2)))
                people.append(Person(id: Int(id), name: name, phone: phone))
            }
        }else {
            print("Select error")
        }
        sqlite3_finalize(selectStmt)
        return people
    }
    
    func insert(id: Int, name: String, phone: String) {
        let persons = read()
        for p in persons {
            if p.id == id {
                return
            }
        }
        let insertStmtString = "insert into person(id, name, phone) values(?, ?, ?);"
        var insertStmt: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStmtString, -1, &insertStmt, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStmt, 1, Int32(id))
            sqlite3_bind_text(insertStmt, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStmt, 3, (phone as NSString).utf8String, -1, nil)
            if sqlite3_step(insertStmt) == SQLITE_DONE {
                print("Success")
            } else {
                print("Error")
            }
        } else {
            print("Insert Error")
        }
        sqlite3_finalize(insertStmt)
    }
    
    
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM person WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    
      func updateByID(id: Int, name: String, phone: String) {
          let updateString = "update person set name = ?, phone = ? where id = ?;"
          var updateStatement: OpaquePointer? = nil
          
          if sqlite3_prepare_v2(db, updateString, -1, &updateStatement, nil) == SQLITE_OK {
              sqlite3_bind_int(updateStatement, 1, Int32(id))
              sqlite3_bind_text(updateStatement, 2, (name as NSString).utf8String, -1, nil)
              sqlite3_bind_text(updateStatement, 3, (phone as NSString).utf8String, -1, nil)
              if sqlite3_step(updateStatement) == SQLITE_DONE {
                  print("Таблица изменена")
              } else {
                  print("Ошибка")
              }
          } else {
              print("БОЛЬШАЯ ОШИБКА")
          }
          sqlite3_finalize(updateStatement)
      }
}
