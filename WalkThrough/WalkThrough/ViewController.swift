//
//  ViewController.swift
//  WalkThrough
//
//  Created by 松田翔大 on 2018/05/08.
//  Copyright © 2018年 松田翔大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var scrollView: UIScrollView = UIScrollView()
    private var pageControl: UIPageControl = UIPageControl()
    private let walkThroughNum: CGFloat = 5
    private var image: UIImage?
    private var imageView: UIImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image = UIImage(named: "9FIFQqpk")
        self.imageView.image = self.image
        self.scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.pageControl.frame = CGRect(x: self.view.frame.width / 2 - self.pageControl.frame.width / 2, y: self.view.frame.height - 50, width: self.pageControl.frame.width, height: self.pageControl.frame.height)
        self.view.addSubview(self.scrollView)
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size = CGSize(width: scrollView.frame.size.width, height: self.view.frame.height)
        
        let contentRect = CGRect(x: 0, y: 0, width: size.width * 4, height: size.height)
        let contentView = UIView(frame: contentRect)
        imageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let subContentView = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        subContentView.backgroundColor = .clear
        subContentView.addSubview(imageView)
        contentView.addSubview(subContentView)
        
        let secondContentView = UIView(frame: CGRect(x: size.width, y: 0, width: size.width, height: size.height))
        secondContentView.backgroundColor = .clear
        secondContentView.addSubview(imageView)
        contentView.addSubview(secondContentView)
        
        let thirdContentView = UIView(frame: CGRect(x: size.width * 2, y: 0, width: size.width, height: size.height))
        thirdContentView.backgroundColor = .clear
        thirdContentView.addSubview(imageView)
        contentView.addSubview(thirdContentView)
        
        let fourthContentView = UIView(frame: CGRect(x: size.width * 3, y: 0, width: size.width, height: size.height))
        fourthContentView.backgroundColor = .clear
        fourthContentView.addSubview(imageView)
        contentView.addSubview(fourthContentView)
        
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        scrollView.contentOffset = CGPoint(x: size.width, y: 0)
        // ページ数の設定
        self.pageControl.numberOfPages = 4
        // 現在ページの設定
        self.pageControl.currentPage = 1
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 0.22, green: 0.38, blue: 0.06, alpha: 1)
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.view.addSubview(self.pageControl)
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //スクロール距離 = 1ページ(画面幅)
        if fmod(self.scrollView.contentOffset.x, self.scrollView.frame.width) == 0 {
            //ページの切り替え
            self.pageControl.currentPage = Int(self.scrollView.contentOffset.x / self.scrollView.frame.width)
        }
    }
}

