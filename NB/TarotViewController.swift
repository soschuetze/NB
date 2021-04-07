//
//  TarotViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/6/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class TarotViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    
    
    var images = [UIImage]()
    @objc func cardSelector1(){
        card1.image = #imageLiteral(resourceName: "back")
    }
    @objc func cardSelector2(){
        card2.image = #imageLiteral(resourceName: "back")
    }
    @objc func cardSelector3(){
        card3.image = #imageLiteral(resourceName: "back")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back")]
        scrollView.isUserInteractionEnabled = true
        scrollView.delaysContentTouches = false
        
        for i in 0..<images.count {
            let imageView = UIButton()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x/2, y: 0, width: self.view.frame.width/2, height: self.view.frame.height/2.5)
            imageView.contentMode = .scaleAspectFit
            imageView.setImage(images[i], for: .normal)
                    
            scrollView.contentSize.width = scrollView.frame.size.width * 4//CGFloat(i + 1)
            scrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
            
            imageView.addTarget(self, action: #selector(cardSelector1), for: .touchUpInside)
            imageView.addTarget(self, action: #selector(cardSelector2), for: .touchUpInside)
            imageView.addTarget(self, action: #selector(cardSelector3), for: .touchUpInside)
    }
       
}
}
