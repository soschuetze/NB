//
//  TarotViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/6/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class TarotViewController: UIViewController {

    @IBOutlet weak var flip1: UIImageView!
    @IBOutlet weak var flip2: UIImageView!
    @IBOutlet weak var flip3: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    
    
    var imageView = UIButton()

    var tarotCards: [UIImage] = [
        UIImage(named: "card1")!,
        UIImage(named: "card2")!,
        UIImage(named: "card3")!,
        UIImage(named: "card4")!,
        UIImage(named: "card5")!,
        UIImage(named: "card6")!,
        UIImage(named: "card7")!,
        UIImage(named: "card8")!,
        UIImage(named: "card9")!,
        UIImage(named: "card10")!,
        UIImage(named: "card11")!,
        UIImage(named: "card12")!,
        UIImage(named: "card13")!,
        UIImage(named: "card14")!,
        UIImage(named: "card15")!,
        UIImage(named: "card16")!,
        UIImage(named: "card17")!,
        UIImage(named: "card18")!,
        UIImage(named: "card19")!,
        UIImage(named: "card20")!,
        UIImage(named: "card21")!,
        UIImage(named: "card22")!
    ]
    
    
    var images = [UIImage]()
    @objc func cardSelector1(){
        let randCardNum1 = Int.random(in: 0...21)
        imageView.setImage(tarotCards[randCardNum1], for: .normal)
        flip1.layer.zPosition = -5
        card1.image = tarotCards[randCardNum1]
    }
    @objc func cardSelector2(){
        let randCardNum2 = Int.random(in: 0...21)
        imageView.setImage(tarotCards[randCardNum2], for: .normal)
        flip2.layer.zPosition = -5
        card2.image = tarotCards[randCardNum2]
    }
    @objc func cardSelector3(){
        let randCardNum3 = Int.random(in: 0...21)
        imageView.setImage(tarotCards[randCardNum3], for: .normal)
        flip3.layer.zPosition = -5
        card3.image = tarotCards[randCardNum3]
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back")]
        scrollView.isUserInteractionEnabled = true
        scrollView.delaysContentTouches = false
        
        for i in 0..<images.count {
            imageView = UIButton()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x/2, y: 0, width: self.view.frame.width/2, height: self.view.frame.height/2.5)
            imageView.contentMode = .scaleAspectFit
            imageView.setImage(images[i], for: .normal)
                    
            scrollView.contentSize.width = scrollView.frame.size.width * 4
            scrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
            
            imageView.addTarget(self, action: #selector(cardSelector1), for: .touchUpInside)
            imageView.addTarget(self, action: #selector(cardSelector2), for: .touchUpInside)
            imageView.addTarget(self, action: #selector(cardSelector3), for: .touchUpInside)
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ReadingViewController {
            let vc = segue.destination as? ReadingViewController
            vc?.card1R = card1.image ?? #imageLiteral(resourceName: "back")
            vc?.card2R = card2.image ?? #imageLiteral(resourceName: "back")
            vc?.card3R = card3.image ?? #imageLiteral(resourceName: "back")
        }
    }
}
