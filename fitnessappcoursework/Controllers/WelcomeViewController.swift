//
//  WelcomeViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-17.
//

import UIKit

class WelcomeViewController: UIViewController,UIScrollViewDelegate  {
    private let scrollView = UIScrollView()
        private let pageControl = UIPageControl()
        private var timer: Timer?
        
        private let images = ["welcome_image.jpg", "welcome_image2.jpg", "welcome_image3.webp"] // Replace with your actual image names
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupScrollView()
            setupPageControl()
            startAutoScroll()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
           
        }
        
        private func setupScrollView() {
            scrollView.delegate = self
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(scrollView)
            
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            for (index, imageName) in images.enumerated() {
                let imageView = UIImageView(image: UIImage(named: imageName))
                imageView.contentMode = .scaleAspectFill
                imageView.translatesAutoresizingMaskIntoConstraints = false
                
                scrollView.addSubview(imageView)
                
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(index) * view.bounds.width),
                    imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
                ])
            }
            
            scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(images.count), height: view.bounds.height)
        }
        
        private func setupPageControl() {
            pageControl.numberOfPages = images.count
            pageControl.currentPage = 0
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(pageControl)
            
            NSLayoutConstraint.activate([
                pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            ])
        }
        
        private func startAutoScroll() {
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
        }
        
        @objc private func scrollToNextPage() {
            let currentPage = pageControl.currentPage
            let nextPage = (currentPage + 1) % images.count
            
            let nextPageXOffset = CGFloat(nextPage) * view.bounds.width
            scrollView.setContentOffset(CGPoint(x: nextPageXOffset, y: 0), animated: true)
            
            pageControl.currentPage = nextPage
        }
        
        // MARK: - UIScrollViewDelegate
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            // Invalidate the timer when the user starts interacting with the scroll view
            timer?.invalidate()
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // Update the page control when the scroll view finishes decelerating
            let pageIndex = Int(scrollView.contentOffset.x / scrollView.bounds.width)
            pageControl.currentPage = pageIndex
        }
    }
