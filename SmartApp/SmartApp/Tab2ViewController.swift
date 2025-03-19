//
//  Tab2ViewController.swift
//  Group_project
//  როგორც იქნა დავასრულეთ პროექტი
//  
//

import UIKit

class Tab2ViewController: UIViewController {
    private let numberOneTextField = UITextField()
    private let numberThwoTextField = UITextField()
    private let resultLabel = UILabel()
    private let  errorlabel = UILabel()
    private let switcher = UISwitch()
    private let tabBar = UITabBar()
    private var resultButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("check result for", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 5
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        callAllFuncs()
    }
    private func callAllFuncs() {
        view.backgroundColor = .orange
        addTextFields()
        addResultLabel()
        addResultButton()
        // checkInputs()
        //actionResultButton()
        addswitcher()
        addTabBar() 
    }
    private  func addTextFields() {
        view.addSubview(numberOneTextField)
        view.addSubview(numberThwoTextField)
        numberOneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberThwoTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberOneTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        numberThwoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberThwoTextField.topAnchor.constraint(equalTo: numberOneTextField.bottomAnchor, constant: 20).isActive = true
        numberOneTextField.borderStyle = .roundedRect
        numberThwoTextField.borderStyle = .roundedRect
        numberOneTextField.placeholder = "Enter number "
        numberThwoTextField.placeholder = "Enter number "
        // numberOneTextField.keyboardType = .numberPad
        // numberThwoTextField.keyboardType = .numberPad
    }
    private func addResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: numberThwoTextField.bottomAnchor, constant: 50).isActive = true
        resultLabel.backgroundColor = .green
        resultLabel.textAlignment = .center
        resultLabel.text = "Click Switch Icon"
        resultLabel.layer.cornerRadius = 10
    }
    private func addResultButton() {
        view.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40)
        ])
    }
    /*  private func actionResultButton(){
     resultButton.addAction(UIAction (handler : {[weak self] action in
     self?.checkInputs()
     }), for: .touchUpInside)
     } */
    /*   private func checkInputs() {
     if let input = numberOneTextField.text, let input2 = numberThwoTextField.text {
     if let result = Int(input),  let result2 = Int(input2){
     if result2 == 0 {
     self.resultLabel.text = "Cannot be divided by 0"
     } else {
     var x = result
     var y = result2
     while y != 0 {
     let temp = y
     y = x % y
     x = temp
     }
     resultLabel.text = "Greatest Common Divisor is : "
     self.resultLabel.text?.append("\(x)")
     }
     }else {
     
     
     errorlabel.text = "Please enter  number"
     view.addSubview(errorlabel)
     errorlabel.translatesAutoresizingMaskIntoConstraints = false
     errorlabel.textColor = .red
     errorlabel.backgroundColor = .white
     errorlabel.layer.cornerRadius = 10
     errorlabel.clipsToBounds = true
     NSLayoutConstraint.activate([
     errorlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
     errorlabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 80),
     ])
     }
     if let input = numberThwoTextField.text, let input2 = numberOneTextField.text {
     if let _ = Int(input), let _ = Int(input2) {
     errorlabel.removeFromSuperview( )
     
     }
     }
     }
     } */
   private func addswitcher(){
        switcher.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switcher)
        NSLayoutConstraint.activate([
            switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switcher.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 30)])
        switcher.isOn = false
       // switcher.tintColor = .white
        switcher.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        
    }
    
    @objc  func switchToggled(_ sender:UISwitch) {
        if sender.isOn {
            resultLabel.text = "Greatest Common Divisor is : "
            // addSwichActionOn()
            resultButton.addAction(UIAction (handler : {[weak self] action in
                self?.addSwichActionOn()
            }), for: .touchUpInside)
        } else {
            resultLabel.text = "Least Common Multiple is :"
            //addSwichActionOff()
            resultButton.addAction(UIAction (handler : {[weak self] action in
                self?.addSwichActionOff()
            }), for: .touchUpInside)
        }
    }
    
    func addSwichActionOn(){
        //  resultLabel.text = "Greatest Common Divisor is : "
        if let input = numberOneTextField.text, let input2 = numberThwoTextField.text {
            if let result = Int(input),  let result2 = Int(input2){
                if result2 == 0 {
                    self.resultLabel.text = "Cannot be divided by 0"
                } else {
                    var x = result
                    var y = result2
                    while y != 0 {
                        let temp = y
                        y = x % y
                        x = temp
                    }
                    resultLabel.text = "Greatest Common Divisor is : "
                    self.resultLabel.text?.append("\(x)")
                }
            }else {
                errorlabel.text = "Please enter  number"
                view.addSubview(errorlabel)
                errorlabel.translatesAutoresizingMaskIntoConstraints = false
                errorlabel.textColor = .red
                errorlabel.backgroundColor = .white
                errorlabel.layer.cornerRadius = 10
                errorlabel.clipsToBounds = true
                NSLayoutConstraint.activate([
                    errorlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    errorlabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 80),
                ])
            }
            if let input = numberThwoTextField.text, let input2 = numberOneTextField.text {
                if let _ = Int(input), let _ = Int(input2) {
                    errorlabel.removeFromSuperview( )
                }
            }
        }
    }
    
    func addSwichActionOff(){
       // resultLabel.text = "Least Common Multiple is"
        if let input = numberOneTextField.text, let input2 = numberThwoTextField.text,
           let result = Int(input), let result2 = Int(input2) {
            if result2 == 0 {
                resultLabel.text = "Cannot be divided by 0"
            } else {
                var x = result
                var y = result2
                // Greatest Common Divisor (GCD) calculation
                while y != 0 {
                    (x, y) = (y, x % y)
                }
                // Least Common Multiple (LCM) calculation
                let lcm = (result * result2) / x
                resultLabel.text = "Least Common Multiple is: \(lcm)"
            }
            
        }else {
            errorlabel.text = "Please enter  number"
            view.addSubview(errorlabel)
            errorlabel.translatesAutoresizingMaskIntoConstraints = false
            errorlabel.textColor = .red
            errorlabel.backgroundColor = .white
            errorlabel.layer.cornerRadius = 10
            errorlabel.clipsToBounds = true
            NSLayoutConstraint.activate([
                errorlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                errorlabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 80),
            ])
        }
        if let input = numberThwoTextField.text, let input2 = numberOneTextField.text {
            if let _ = Int(input), let _ = Int(input2) {
                errorlabel.removeFromSuperview()
                
            }
        }
    }
  private func addTabBar() {
      tabBar.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(tabBar)
      NSLayoutConstraint.activate([
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}



