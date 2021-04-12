//
//  MainPageViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/11/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    private var viewControllerList: [UIViewController] = {
        let storyboard = UIStoryboard.onboarding
        let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstStepVC")
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondStepVC")
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdStepVC")
        return [firstVC, secondVC, thirdVC]
    }()
    
    private var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewControllers([viewControllerList[0]], direction: .forward, animated: false, completion: nil)
    }
    // MARK: - Functions
    func pushNext() {
        if currentIndex + 1 < viewControllerList.count {
          self.setViewControllers([self.viewControllerList[self.currentIndex + 1]], direction: .forward, animated: true, completion: nil)
            currentIndex += 1
        }
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
