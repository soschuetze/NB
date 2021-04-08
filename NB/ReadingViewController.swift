//
//  ReadingViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/7/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class ReadingViewController: UIViewController {
    
    var card1R: UIImage = #imageLiteral(resourceName: "back")
    var card2R: UIImage = #imageLiteral(resourceName: "back")
    var card3R: UIImage = #imageLiteral(resourceName: "back")

    @IBOutlet weak var card1IV: UIImageView!
    @IBOutlet weak var card2IV: UIImageView!
    @IBOutlet weak var card3IV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card1IV.image = card1R
        card2IV.image = card2R
        card3IV.image = card3R
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
