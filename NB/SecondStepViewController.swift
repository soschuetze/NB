//
//  SecondStepViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/11/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class SecondStepViewController: UIViewController {

    @IBAction func actionButtonTapped(_ sender: UIButton) {
        if let pageController = parent as? MainPageViewController{
            pageController.pushNext()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
