//
//  SecondStepViewController.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/11/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import UIKit

class SecondStepViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var instructions: [String] = ["The future is in your hands","Your personal horoscope","Your voice matters"]
    var frame = CGRect.zero
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        if let pageController = parent as? MainPageViewController{
            pageController.pushNext()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = instructions.count
            setupScreens()

            scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    func setupScreens() {
        for index in 0..<instructions.count {
            // 1.
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            // 2.
            let textLabel = UILabel(frame: frame)
            textLabel.text = instructions[index]
            textLabel.textAlignment = .center

            self.scrollView.addSubview(textLabel)
        }

        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(instructions.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
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
