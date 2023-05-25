//
//  ViewController.swift
//  calculate
//
//  Created by dan on 18.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var holder: UIView!
    
    
    var firstNumber = 0
    var resultNumber = 0
    var currentOperation: Operation?
    
    // перечисление с операциями калькулятора
    enum Operation {
        case add, subtract, multiply, divide
    }
    
    
    let resultLabel: UILabel = {
       let label = UILabel()
        // текст по умолчания будет 0
        label.text = "0"
        // увет текста будет белый
        label.textColor = .white
        // отцентровка справа
        label.textAlignment = .right
        // подбор шрифта
        label.font = UIFont(name: "Helvetica", size: 60)
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNumberPad()
    }
    
    // создание интерфейса с цифрами
    func setupNumberPad() {
        // размет каждой кнопки с цифрой это 1/4 от ширины экрана
        let buttonSize: CGFloat = view.frame.size.width / 4
        
        let zeroButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height - buttonSize, width: buttonSize * 3, height: buttonSize))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = .systemFont(ofSize: 60, weight: .regular)
        zeroButton.tag = 1
        zeroButton.layer.borderWidth = 1
        holder.addSubview(zeroButton)
        
        
        zeroButton.addTarget(self, action: #selector(zeroTapped), for: .touchUpInside)
        
        for x in 0..<3 {
            // создание кнопок и определение местоположения
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 2), width: buttonSize, height: buttonSize))
            // цвет цифр внутри кнопки
            button1.setTitleColor(.black, for: .normal)
            // цвет самой кнопки
            button1.backgroundColor = .white
            // вставка цифр от 1 до 3 включительно
            button1.setTitle("\(x+1)", for: .normal)
            // добавление кнопок на экран
            holder.addSubview(button1)
            // tag нужен чтобы знать порядок кнопки
            button1.tag = x + 2
            // font для размера шрифта, в данном примере 100 пикселей
            button1.titleLabel?.font = .systemFont(ofSize: 60, weight: .regular)
            // рамки вокруг кнопой
            button1.layer.borderWidth = 1
            // при нажати на кнопку у нас вызовется функция numberPressed которую мы создаем унизу
            button1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3 {
            // создание кнопок и определение местоположения
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 3), width: buttonSize, height: buttonSize))
            // цвет цифр внутри кнопки
            button2.setTitleColor(.black, for: .normal)
            // цвет самой кнопки
            button2.backgroundColor = .white
            // вставка цифр от 1 до 3 включительно
            button2.setTitle("\(x+4)", for: .normal)
            // добавление кнопок на экран
            holder.addSubview(button2)
            // tag нужен чтобы знать порядок кнопки
            button2.tag = x + 5
            // font для размера шрифта, в данном примере 100 пикселей
            button2.titleLabel?.font = .systemFont(ofSize: 60, weight: .regular)
            // рамки вокруг кнопой
            button2.layer.borderWidth = 1
            // при нажати на кнопку у нас вызовется функция numberPressed которую мы создаем унизу
            button2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3 {
            // создание кнопок и определение местоположения
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 4), width: buttonSize, height: buttonSize))
            // цвет цифр внутри кнопки
            button3.setTitleColor(.black, for: .normal)
            // цвет самой кнопки
            button3.backgroundColor = .white
            // вставка цифр от 1 до 3 включительно
            button3.setTitle("\(x+7)", for: .normal)
            // добавление кнопок на экран
            holder.addSubview(button3)
            // tag нужен чтобы знать порядок кнопки
            button3.tag = x + 8
            // font для размера шрифта, в данном примере 100 пикселей
            button3.titleLabel?.font = .systemFont(ofSize: 60, weight: .regular)
            // рамки вокруг кнопой
            button3.layer.borderWidth = 1
            // при нажати на кнопку у нас вызовется функция numberPressed которую мы создаем унизу
            button3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        
        let additional = ["AC", ",", "%"]
        for x in 0..<3 {
            // создание кнопок и определение местоположения
            let button4 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 5), width: buttonSize, height: buttonSize))
            // цвет цифр внутри кнопки
            button4.setTitleColor(.black, for: .normal)
            // цвет самой кнопки
            button4.backgroundColor = .white
            // вставка цифр от 1 до 3 включительно
            button4.setTitle(additional[x], for: .normal)
            // добавление кнопок на экран
            holder.addSubview(button4)
            // tag нужен чтобы знать порядок кнопки
//            button4.tag = x + 8
            // font для размера шрифта, в данном примере 100 пикселей
            button4.titleLabel?.font = .systemFont(ofSize: 60, weight: .regular)
            // рамки вокруг кнопой
            button4.layer.borderWidth = 1
            // при нажати на кнопку у нас вызовется функция numberPressed которую мы создаем унизу
            button4.addTarget(self, action: #selector(clearResult(_:)), for: .touchUpInside)
        }
        
        
        let operations = ["=", "+", "-", "x", "/"]
        for x in 0..<5 {
            // создание кнопок и определение местоположения
            let button5 = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height - (buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
            // цвет цифр внутри кнопки
            button5.setTitleColor(.black, for: .normal)
            // цвет самой кнопки
            button5.backgroundColor = .white
            // вставка цифр от 1 до 3 включительно
            button5.setTitle(operations[x], for: .normal)
            // добавление кнопок на экран
            holder.addSubview(button5)
            // tag нужен чтобы знать порядок кнопки
            button5.tag = x+1
            // font для размера шрифта, в данном примере 100 пикселей
            button5.titleLabel?.font = .systemFont(ofSize: 60, weight: .regular)
            // рамки вокруг кнопой
            button5.layer.borderWidth = 1
            // при нажати на кнопку у нас вызовется функция numberPressed которую мы создаем унизу
            button5.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        }
        
        resultLabel.frame = CGRect(x: 0, y: 200, width: holder.frame.size.width, height: 100)
//        resultLabel.text = "0"
//        holder.addSubview(resultLabel)
        view.addSubview(resultLabel)
    }
    
    @objc func operationPressed(_ sender: UIButton) {
        let tag = sender.tag
        
        if let text = resultLabel.text, let value = Int(text), firstNumber == 0 {
            firstNumber = value
            resultLabel.text = "\(firstNumber)"
        }
        
        if tag == 1 {
            if let operation = currentOperation {
                var secondNumber = 0
                if let text = resultLabel.text, let value = Int(text) {
                    secondNumber = value
                }
                
                switch operation {
                case .add:
                    let result = firstNumber + secondNumber
                    resultLabel.text = "\(result)"
                    print(resultLabel.text!)
                    break
                case .subtract:
                    let result = firstNumber - secondNumber
                    resultLabel.text = "\(result)"
                    print(resultLabel.text!)
                    break
                case .multiply:
                    let result = firstNumber * secondNumber
                    resultLabel.text = "\(result)"
                    print(resultLabel.text!)
                    break
                case .divide:
                    let result = firstNumber / secondNumber
                    resultLabel.text = "\(result)"
                    break
                }
            }
        }
        
        else if tag == 2 {
            currentOperation = .add
//            print("ADD")
        }
        
        else if tag == 3 {
            currentOperation = .subtract
//            print("SUBTRACT")
        }
        
        else if tag == 4 {
            currentOperation = .multiply
//            print("MULTIPLY")
        }
        
        else if tag == 5 {
            currentOperation = .divide
//            print("DIVIDE")
        }
    }
    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        
        if resultLabel.text == "0" {
            resultLabel.text = "\(tag)"
            print(tag)
        }
        else if let text = resultLabel.text {
            resultLabel.text = "\(text)"
            print(resultLabel.text!)
        }
    }
    
    @objc func clearResult(_ sender: UIButton) {
        resultLabel.text = "0"
        currentOperation = nil
        firstNumber = 0
    }
    
    

    @objc func zeroTapped() {
        if resultLabel.text != "0" {
            if let text = resultLabel.text {
                resultLabel.text = "\(text)\(0)"
            }
        }
    }

}

