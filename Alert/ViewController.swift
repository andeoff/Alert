//
//  ViewController.swift
//  Alert
//
//  Created by Andrey on 03.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winOrLoseLabel: UILabel!
    
    @IBOutlet weak var resultCountsLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var additionLabel: UILabel!
    
    //MARK: - property
    var result : Int = 0
    var counter : Int = 0 {
        didSet {
            countLabel.text = "Count : \(counter)"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = ""
        additionLabel.text = ""
        winOrLoseLabel.text = ""
        resultCountsLabel.text = ""
    }

    //MARK: - Guess game
    @IBAction func guessTapped(_ sender: UIButton) {
        
        let randomNumber = generateNumber()
        print("Random number is \(randomNumber)")
     
       
        alertForGenerateNumber(title: "try guess number ",
                               message: "Write number",
                               style: .alert ,
                               randomNumber: randomNumber)
        counter += 1
        result = counter
    }
    //MARK: - Addition two numbers
    @IBAction func additionTapped(_ sender: UIButton) {
        
        alertForName(title: "Hello", message: "I can addition two numbers", style: .alert)
        
    }
    

    

    //MARK: - Generate random number
    func generateNumber () -> Int {
        let generate = Int.random(in: 1...10)
        return generate
    }
    
    //MARK: - alert for names
    
    func alertForName (title : String , message : String , style : UIAlertController.Style) {
        let alert = UIAlertController (title: title, message: message, preferredStyle: style)
        let action = UIAlertAction (title: "Ok", style: .default, handler: { (action) in
            let someOne = alert.textFields?.first?.text
            let someTwo = alert.textFields?.last?.text
            if isBool(string: someOne) , isBool(string: someTwo) {
                let unwrappedOne = Int(String(someOne!))!
                let unwrappedTwo = Int(String(someTwo!))!
                    let result = unwrappedOne + unwrappedTwo
                    self.additionLabel.text = String(result)
                self.additionLabel.text = "You addition is  \(result)"
            }
        })
        
        alert.addAction(action)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
        
    }
    //MARK: - alert for generate numbers
    
    func alertForGenerateNumber (title : String , message : String , style : UIAlertController.Style , randomNumber : Int) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Guess", style: .default) { (action) in
            let number = alert.textFields?.first?.text
            if isBool(string: number ) {
                let myInt = Int(String(number!))!
                if randomNumber == myInt {
                    newGame(labelOne: self.winOrLoseLabel,
                            labelTwo: self.resultCountsLabel,
                            attempts: self.counter)
                    self.counter = 0
                } else {
                    self.winOrLoseLabel.text = "You lose!"
                }
            }
        }
        alert.addAction(action)
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
        
    }
   
   
}
//MARK: - check my numbers are strint or integer
func isBool (string : String? ) -> Bool {
    return Int(string!) != nil
}

func newGame (labelOne: UILabel , labelTwo : UILabel , attempts : Int ) {
    
    labelOne.text = "You win!"
    labelTwo.text = "You spend \(attempts) items"
    
}
//self.winOrLoseLabel.text = "You win!"
//self.resultCountsLabel.text = "You spend \(self.result) items"
//self.counter = 0




