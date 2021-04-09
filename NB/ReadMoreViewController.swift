//
//  ReadMoreViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/8/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class ReadMoreViewController: UIViewController {

    var tarotDescriptions: [UIImage: Array<String>] = [
        #imageLiteral(resourceName: "card5"):["The Fool", "originality, new beginnings, innocence","You’re near the start of something new and exciting. This is something adventurous, maybe traveling or being in a place that you’ve never been to before."],
        #imageLiteral(resourceName: "card1"):["The Magician","skill, manifestation, influence","You have skills others don’t and they set you apart. It’s a perfect time to overcome adversity, you already hold everything you need to move forward."],
        #imageLiteral(resourceName: "card2"):["The High Priestess","intuition, compassion, knowledge","You are forced to listen to your intuition and follow your instincts. Look into yourself for guidance."],
        #imageLiteral(resourceName: "card3"):["The Empress","nature, femininity, beauty","Draw on your feminine energy to connect with the world to create and find pleasure. Discover ways to creatively express yourself."],
        #imageLiteral(resourceName: "card4"):["The Emperor","power, structure, leadership","You might adopt a fatherly role that demands leadership or authority. Remember to rule with a fair but firm hand."],
        #imageLiteral(resourceName: "card6"):["The Hierophant","spiritual wisdom, conformity, and traditions ","Representing spiritual beliefs, The Hierophant encourages you to learn fundamental principles of a trusted source. If you get this card, you might be taking a role of a teacher or mentor where others look to you for your wisdom."],
        #imageLiteral(resourceName: "card7"):["The Lovers","harmony, relationships, choices","This card means you have a soul honoring connection with a loved one. You may have found your soulmate or life partner."],
        #imageLiteral(resourceName: "card8"):["The Chariot","control, success, determination","You are channeling your inner ferocity and determination to manifest your goals. Draw on your willpower to overcome obstacles."],
        #imageLiteral(resourceName: "card9"):["Strength","courage, persuasion, power","You are fueled by inner strength, personal power, and inner calm. You are committed to what you do and do it while showing composure and maturity."],
        #imageLiteral(resourceName: "card10"):["The Hermit","introspection, inner guidance, soul searching","Your sense of knowledge and truth is within yourself."],
        #imageLiteral(resourceName: "card11"):["Wheel of Fortune","luck, opportunity, destiny","The wheel represents life. There is a big, positive change coming soon."],
        #imageLiteral(resourceName: "card12"):["Justice","balance, fairness, responsibility","This card brings justice as we know it. It does not care about outside situations and will fall wherever necessary."],
        #imageLiteral(resourceName: "card13"):["The Hanged Man","letting go, suspension, breaking old patterns","This card signifies that you are suspended in time, perhaps surrendering to something that lies below."],
        #imageLiteral(resourceName: "card14"):["Death","endings, change, letting go","While this card most likely does not represent actual death, it can bring about a metaphorical death of something, bringing an increase of self-awareness and profound change."],
        #imageLiteral(resourceName: "card15"):["Temperance","balance, harmony, looking for divine intervention","You should consider avoiding extremes right now to best gain a sense of balance."],
        #imageLiteral(resourceName: "card16"):["The Devil","fear, materialism, unhealthy relationships","You might be feeling extra drawn to materialistic things right now or feeling like you’re trapped in some way."],
        #imageLiteral(resourceName: "card17"):["The Tower","destruction, crisis, liberation","The tower is a sign that quick, unforeseen destruction is near. This is likely something that will be very sudden."],
        #imageLiteral(resourceName: "card18"):["The Star","hope, inspiration, opportunities","You are likely feeling inspired! This is a sign of renewed faith and might be feeling extra love from the universe."],
        #imageLiteral(resourceName: "card19"):["The Moon","deception, fear, something is hidden","The moon signals deception. Something might not be the way that you see it."],
        #imageLiteral(resourceName: "card20"):["The Sun","joy, success, vitality","The sun signals good fortune, happiness and harmony. The universe agrees with what you’re doing and is helping you along the way."],
        #imageLiteral(resourceName: "card21"):["Judgement","awakening, decision making, redemption","Signalling a sense of rebirth, you are ending a cycle of your life and starting to prepare for the next."],
        #imageLiteral(resourceName: "card22"):["The World","achievement, fulfillment, possibility","The world signals the end of a cycle and you might feel a pause in your life. A big change is coming to take you to the next cycle."],

    ]
    
    
    var mainCard: UIImage = #imageLiteral(resourceName: "back")
    @IBOutlet weak var mainCardIV: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardTheme: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainCardIV.image = mainCard
        cardName.text = tarotDescriptions[mainCard]?[0]
        cardTheme.text = tarotDescriptions[mainCard]?[1]
        cardDescription.text = tarotDescriptions[mainCard]?[2]
        // Do any additional setup after loading the view.
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
