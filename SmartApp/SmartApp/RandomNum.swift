
import UIKit
import Foundation

class  RandomNum: UIViewController{
    
    let textField = UITextField()
    let guessButton = UIButton()
    let greenLabel = UILabel()
    let redLabel = UILabel()
    let jumpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        inputField()
        greenLab()
        submitButton()
        jumpToPage()
    }
    
    func greenLab() {
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.text = ""
        greenLabel.backgroundColor = .green
        view.addSubview(greenLabel)
        
        greenLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        greenLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
    }
    
    func inputField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .darkGray
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.textColor = .white
        textField.placeholder = "  "
        view.addSubview(textField)
        
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func submitButton() {
        guessButton.translatesAutoresizingMaskIntoConstraints = false
        guessButton.setTitle("submit", for: .normal)
        guessButton.setTitleColor(.green, for: .normal)
        view.addSubview(guessButton)
        
        guessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50).isActive = true
        guessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        guessButton.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    @objc func action() {
        let randomNumber = Int.random(in: 1...10)
        
        guard let txt = textField.text, !txt.isEmpty && Int(txt)! <= 10 else {
            let alerti = UIAlertController(
                title: "Error!",
                message: "Please input a number between 1 and 10",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                print("ok")
            }
            
            alerti.addAction(action)
            present(alerti, animated: true, completion: nil)
            return
        }
        
        if txt == String(randomNumber) {
            greenLabel.backgroundColor = .green
            greenLabel.text = "Correct!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.greenLabel.text = ""
                self.textField.text?.removeAll()
            }
        } else {
            greenLabel.backgroundColor = .red
            greenLabel.text = "Incorrect... Try again"
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.greenLabel.text = ""
            }
        }
    }
    
    func jumpToPage() {
        jumpButton.translatesAutoresizingMaskIntoConstraints = false
        jumpButton.setTitle("Next Page", for: .normal)
        jumpButton.backgroundColor = .green
        jumpButton.setTitleColor(.black, for: .normal)
        view.addSubview(jumpButton)
        
        jumpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        jumpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

import SwiftUI

#Preview {
    RandomNum()
}
