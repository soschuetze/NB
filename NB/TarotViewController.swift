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
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back"),#imageLiteral(resourceName: "back")]
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x/2, y: 0, width: self.view.frame.width/2, height: self.view.frame.height/2)
            imageView.contentMode = .scaleAspectFit
            imageView.image = images[i]
                    
            scrollView.contentSize.width = scrollView.frame.size.width * 4//CGFloat(i + 1)
            scrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
    }

}
}
