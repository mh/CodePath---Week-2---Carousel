//
//  TutorialViewController.swift
//  Carousel
//
//  Created by matt hunter on 9/28/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    @IBOutlet weak var takeCarouselForASpinButton: UIButton!
    

    @IBOutlet weak var backUpPhotosSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 320)
        
        takeCarouselForASpinButton.alpha = 0
        backUpPhotosSwitch.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        
        tutorialPageControl.currentPage = page
        
        print(page)
        
        if page == 3 {
            takeCarouselForASpinButton.alpha = 1
            backUpPhotosSwitch.hidden = false
        } else {
            takeCarouselForASpinButton.alpha = 0
            backUpPhotosSwitch.hidden = true
        }
    }

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
