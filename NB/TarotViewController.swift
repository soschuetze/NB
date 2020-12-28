//
//  TarotViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 6/13/20.
//  Copyright © 2020 Necessary Behavior. All rights reserved.
//

import UIKit

struct ItemTarot {
var tarotItemName: String
}

class TarotViewController: UIViewController {

    lazy var screenSize:CGRect = {
        return UIScreen.main.bounds
    }()
    lazy var screenWidth:CGFloat = {
        return screenSize.width
    }()
    lazy var screenHeight:CGFloat = {
        return screenSize.height
    }()
      
    
    @IBAction func singleCardButton(_ sender: Any) {
    number = 0
    originalSize()
    shuffleCards()
    }
    @IBAction func doubleCardButton(_ sender: Any) {
        addDoubleCard()
        number = 0
        numberDouble = 0
        shuffleCards()
        shuffleDouble()
    }
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var doubleLabel: UILabel!
    @IBOutlet weak var tarotImage: UIImageView!
    
    @IBOutlet weak var cardIsLabel: UILabel!
    @IBOutlet weak var doubleImage: UIImageView!
    
    
   
    var tImages = (1...22).compactMap { ItemTarot(tarotItemName: "card\($0)") }
    
   
    var timer = Timer()
    var number = 1
    var numberDouble = 1
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
            shuffleCards()
            setupTarot()
       
     
    }

    private func timerSetup(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shuffleCards), userInfo: nil, repeats: false)
        
    }
   private func timerSetup2(){
          timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shuffleDouble), userInfo: nil, repeats: false)
          
      }
    @objc private func shuffleCards(){
       
        if number < tImages.count{
            timerSetup()
            let flip = Int.random(in: 1..<3)
            
            if flip == 1{
                let cardNum = Int.random(in: 0..<tImages.count-1)
                tarotImage.image = UIImage(named: tImages[cardNum].tarotItemName)
                self.tarotImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                if number == (tImages.count)-1{
                cardLabel.text = tImages[cardNum].tarotItemName + " reversed"
                }
                
            }else{
                let cardNum = Int.random(in: 0..<tImages.count-1)
                tarotImage.image = UIImage(named: tImages[cardNum].tarotItemName)
                self.tarotImage.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                if number == (tImages.count)-1{
                cardLabel.text = tImages[cardNum].tarotItemName
                }
            }
            
            number += 1
            
        }
       
        
    }
 
    private func setupTarot(){
           
          
           tarotImage.image = UIImage(named: tImages[Int.random(in: 0..<tImages.count-1)].tarotItemName)
           
       }
    
    
    private func addDoubleCard(){
        tarotImage.frame = CGRect(x: screenWidth/4, y: screenHeight/5.5, width: screenWidth * 0.5, height:screenHeight * 0.3)
        doubleImage.frame = CGRect(x: screenWidth/4, y: screenHeight/1.8, width: screenWidth * 0.5, height:screenHeight * 0.3)
        cardLabel.text = ""
        cardLabel.frame = CGRect(x: screenWidth/7.5, y: screenHeight/7, width: screenWidth * 0.75, height: cardLabel.frame.size.height)
        cardLabel.font = cardLabel.font.withSize(20)
        doubleLabel.frame = CGRect(x: screenWidth/7.5, y: screenHeight/2, width: screenWidth * 0.75, height: cardLabel.frame.size.height)
        doubleLabel.font = doubleLabel.font.withSize(20)
        
    }
    
    @objc private func shuffleDouble(){
        if numberDouble < tImages.count{
                   timerSetup2()
                   let flip2 = Int.random(in: 1..<3)
                   
                   if flip2 == 1{
                    let cardNum2 = Int.random(in: 0..<tImages.count-1)
                       doubleImage.image = UIImage(named: tImages[cardNum2].tarotItemName)
                       self.doubleImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                       if numberDouble == (tImages.count)-1{
                       doubleLabel.text = tImages[cardNum2].tarotItemName + " reversed"
                       }
                       
                   }else{
                    let cardNum2 = Int.random(in: 0..<tImages.count-1)
                       doubleImage.image = UIImage(named: tImages[cardNum2].tarotItemName)
                       self.doubleImage.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                       if numberDouble == (tImages.count)-1{
                       doubleLabel.text = tImages[cardNum2].tarotItemName
                       }
                   }
                   
                   numberDouble += 1
                   
               }
        
    }
    private func originalSize(){
     
        doubleImage.image = nil
        doubleLabel.text = nil
        cardLabel.text = ""
        tarotImage.frame = CGRect(x: screenWidth/7.40, y: screenHeight/5, width: (screenWidth*0.75), height:screenHeight * 0.75)
        cardLabel.textAlignment = NSTextAlignment.center
        cardLabel.frame = CGRect(x: screenWidth/9, y: screenHeight/5.5, width: screenWidth * 0.9, height: 30)
         cardLabel.font = cardLabel.font.withSize(30)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
