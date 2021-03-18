//
//  ShopViewController.swift
//  Ex2
//
//  Created by LozyLoop on 16/03/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit
import ImageSlideshow

class ShopViewController: UIViewController, ImageSlideshowDelegate {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var contentText: UILabel!
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setUpUI()
        createSlideShow()
        // Do any additional setup after loading the view.
        
    }
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
           print("current page:", page)
       }
    
    func createSlideShow(){
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        slideshow.pageIndicator = UIPageControl.withSlideshowColors()
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    private func setUpUI(){
        searchView.layer.cornerRadius = 8
    }
    
    private func setupNavigation(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}
