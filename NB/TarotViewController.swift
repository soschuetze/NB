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
/*get the dimensions of the phone screen
     used later in resizing the cards*/
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
        descLabel.text = ""
        descLabel2.text = ""
        number = 0
    originalSize()
    shuffleCards()
    }
    @IBAction func doubleCardButton(_ sender: Any) {
        descLabel.text = ""
        descLabel2.text = ""
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
    
    var tarotDict = [1:["Magician","Themes: skill, manifestation, influence Description: You have skills others don’t and they set you apart. It’s a perfect time to overcome adversity, you already hold everything you need to move forward."],
                     2:["High Priestess","Themes: intuition, compassion, knowledge Description: You are forced to listen to your intuition and follow your instincts. Look into yourself for guidance."],
                     3:["Empress","Themes: nature, femininity, beauty Description: Draw on your feminine energy to connect with the world to create and find pleasure. Discover ways to creatively express yourself."],
                     4:["Emporer","Themes: power, structure, leadership Description: You might adopt a fatherly role that demands leadership or authority. Remember to rule with a fair but firm hand."],
                     5:["Fool","Themes: originality, new beginnings, innocence Description: You’re near the start of something new and exciting. This is something adventurous, maybe traveling or being in a place that you’ve never been to before."],
                     6:["Hierophant","Themes: spiritual wisdom, conformity, and traditions Description: Representing spiritual beliefs, The Hierophant encourages you to learn fundamental principles of a trusted source. If you get this card, you might be taking a role of a teacher or mentor where others look to you for your wisdom."],
                     7:["Lovers","Themes: harmony, relationships, choices Description: This card means you have a soul honoring connection with a loved one. You may have found your soulmate or life partner."],
                     8:["Chariot","Themes: control, success, determination Description” You are channeling your inner ferocity and determination to manifest your goals. Draw on your willpower to overcome obstacles."],
                     9:["Strength","Themes: courage, persuasion, power Description: You are fueled by inner strength, personal power, and inner calm. You are committed to what you do and do it while showing composure and maturity."],
                     10:["Hermit","Themes: introspection, inner guidance, soul searching Description: Your sense of knowledge and truth is within yourself."],
                     11:["Fortune","Themes: luck, opportunity, destiny Description: The wheel represents life. There is a big, positive change coming soon."],
                     12:["Justice","Themes: balance, fairness, responsibility Description: This card brings justice as we know it. It does not care about outside situations and will fall wherever necessary."],
                     13:["Hanged Man","Themes: letting go, suspension, breaking old patterns Description: This card signifies that you are suspended in time, perhaps surrendering to something that lies below."],
                     14:["Death","Themes: endings, change, letting go Description: While this card most likely does not represent actual death, it can bring about a metaphorical death of something, bringing an increase of self-awareness and profound change."],
                     15:["Temperance","Themes: balance, harmony, looking for divine intervention Description: You should consider avoiding extremes right now to best gain a sense of balance."],
                     16:["Devil","Themes: fear, materialism, unhealthy relationships Description: You might be feeling extra drawn to materialistic things right now or feeling like you’re trapped in some way."],
                     17:["Tower","Themes: destruction, crisis, liberation Description: The tower is a sign that quick, unforeseen destruction is near. This is likely something that will be very sudden."],
                     18:["Star","Themes: hope, inspiration, opportunities Description: You are likely feeling inspired! This is a sign of renewed faith and might be feeling extra love from the universe."],
                     19:["Moon","Themes: deception, fear, something is hidden Description: The moon signals deception. Something might not be the way that you see it."],
                     20:["Sun","Themes: joy, success, vitality Description: The sun signals good fortune, happiness and harmony. The universe agrees with what you’re doing and is helping you along the way."],
                     21:["Judgement","Themes: awakening, decision making, redemption Description: Signalling a sense of rebirth, you are ending a cycle of your life and starting to prepare for the next."],
                     22:["World","Themes: achievement, fulfillment, possibility Description: The world signals the end of a cycle and you might feel a pause in your life. A big change is coming to take you to the next cycle."]]
   

    override func viewDidLoad() {
        super.viewDidLoad()
            shuffleCards()
            setupTarot()
       
     
    }

    private func timerSetup(){
        /*timer responsible for determining how long shuffling animation takes and repeating shuffling function*/
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shuffleCards), userInfo: nil, repeats: false)
        
    }
   private func timerSetup2(){
    /*timer responsible for the second card that is added*/
          timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shuffleDouble), userInfo: nil, repeats: false)
          
      }
    
    let descLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let descLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))

    
    @objc private func shuffleCards(){
       
        if number < tImages.count{
            
            timerSetup()
            let flip = Int.random(in: 1..<3)
            /*determines whether cards will be "reversed" by getting a random number of either 1 or 2*/
            if flip == 1{
                let cardNum = Int.random(in: 0..<tImages.count-1)//gets random number to determine which card in array is chosen
                
                tarotImage.image = UIImage(named: tImages[cardNum].tarotItemName)
                self.tarotImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)) //rotates card so that it is reversed
                if number == (tImages.count)-1{
                    cardLabel.center = CGPoint(x: tarotImage.frame.midX, y: tarotImage.frame.minY-20)
                    cardLabel.text = tarotDict[cardNum]?[0] ?? "" + " reversed"
                    descLabel.frame = CGRect(x: 0, y: 0, width: tarotImage.frame.width, height: tarotImage.frame.height)
                    descLabel.center = CGPoint(x: tarotImage.frame.midX, y: tarotImage.frame.midY)
                    descLabel.textAlignment = .center
                    descLabel.text = tarotDict[cardNum]?[1] ?? ""
                    descLabel.numberOfLines = 0
                    descLabel.sizeToFit()
                    self.view.addSubview(descLabel)
                }
                
            }else{
                let cardNum = Int.random(in: 0..<tImages.count-1)
                tarotImage.image = UIImage(named: tImages[cardNum].tarotItemName)
                self.tarotImage.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                if number == (tImages.count)-1{
                    cardLabel.center = CGPoint(x: tarotImage.frame.midX, y: tarotImage.frame.minY-20)
                    cardLabel.text = tarotDict[cardNum]?[0] ?? ""
                    descLabel.frame = CGRect(x: 0, y: 0, width: tarotImage.frame.width, height: tarotImage.frame.height)
                    descLabel.center = CGPoint(x: tarotImage.frame.midX, y: tarotImage.frame.midY)
                    descLabel.textAlignment = .center
                    descLabel.text = tarotDict[cardNum]?[1] ?? ""
                    descLabel.numberOfLines = 0
                    descLabel.sizeToFit()
                    self.view.addSubview(descLabel)
                }
            }
            number += 1
            }
            
        }
        
    
 
    private func setupTarot(){
           
           tarotImage.image = UIImage(named: tImages[Int.random(in: 0..<tImages.count-1)].tarotItemName)
           
       }
    
    
    private func addDoubleCard(){
        /*second card and label is adding using proportions of screen*/
        tarotImage.frame = CGRect(x: screenWidth/4, y: screenHeight/5.5, width: screenWidth * 0.5, height:screenHeight * 0.3)
        doubleImage.frame = CGRect(x: screenWidth/4, y: screenHeight/1.8, width: screenWidth * 0.5, height:screenHeight * 0.3)
        cardLabel.text = ""
        cardLabel.frame = CGRect(x: screenWidth/7.5, y: screenHeight/7, width: screenWidth * 0.75, height: cardLabel.frame.size.height)
        cardLabel.font = cardLabel.font.withSize(20)
        doubleLabel.frame = CGRect(x: screenWidth/7.5, y: screenHeight/2, width: screenWidth * 0.75, height: cardLabel.frame.size.height)
        doubleLabel.font = doubleLabel.font.withSize(20)
        
    }
    
    @objc private func shuffleDouble(){
        /*does same function as the initial shuffle function except to the second card*/
        if numberDouble < tImages.count{
                   timerSetup2()
                   let flip2 = Int.random(in: 1..<3)
                   
                   if flip2 == 1{
                    let cardNum2 = Int.random(in: 0..<tImages.count-1)
                       doubleImage.image = UIImage(named: tImages[cardNum2].tarotItemName)
                       self.doubleImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)) //rotates image so that it is reversed
                       if numberDouble == (tImages.count)-1{
                        doubleLabel.text = tarotDict[cardNum2]?[0] ?? "" + " reversed"
                        descLabel2.frame = CGRect(x: 0, y: 0, width: doubleImage.frame.width, height: doubleImage.frame.height)
                        descLabel2.center = CGPoint(x: doubleImage.frame.midX, y: doubleImage.frame.midY)
                        descLabel2.textAlignment = .center
                        descLabel2.text = tarotDict[cardNum2]?[1] ?? ""
                        descLabel2.numberOfLines = 0
                        descLabel2.sizeToFit()
                        self.view.addSubview(descLabel2)
                       }
                       
                   }else{
                    let cardNum2 = Int.random(in: 0..<tImages.count-1)
                       doubleImage.image = UIImage(named: tImages[cardNum2].tarotItemName)
                       self.doubleImage.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                       if numberDouble == (tImages.count)-1{
                        doubleLabel.text = tarotDict[cardNum2]?[0] ?? ""
                        descLabel2.frame = CGRect(x: 0, y: 0, width: doubleImage.frame.width, height: doubleImage.frame.height)
                        descLabel2.center = CGPoint(x: doubleImage.frame.midX, y: doubleImage.frame.midY)
                        descLabel2.textAlignment = .center
                        descLabel2.text = tarotDict[cardNum2]?[1] ?? ""
                        descLabel2.numberOfLines = 0
                        descLabel2.sizeToFit()
                        self.view.addSubview(descLabel2)
                       }
                   }
                   
                   numberDouble += 1
                   
               }
        
    }
    private func originalSize(){
     /*makes second card/label not visible and resizes original card to the intial size using the dimensions of the screen*/
        descLabel.text = ""
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

    
    

