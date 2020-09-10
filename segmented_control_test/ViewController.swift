//
//  ViewController.swift
//  segmented_control_test
//
//  Created by Yuki Shinohara on 2020/09/10.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//https://program-life.com/1553

import UIKit

class ViewController: UIViewController {
    
    let vc1 = Sample1ViewController()
    let vc2 = Sample2ViewController()
    let vc3 = Sample3ViewController()
    let vc4 = Sample4ViewController()
    
    let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["男湯","女湯","基本情報", "サ活"])
        sc.selectedSegmentIndex = 0
        sc.backgroundColor = .systemGray6
        // 選択時の背景色（iOS13から選択時の背景はselectedSegmentTintColorで指定するようになりました）
        if #available(iOS 13.0, *) {
            sc.selectedSegmentTintColor = UIColor.orange
        }
        else {
            sc.tintColor = UIColor.orange
        }
        // 文字色
        sc.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor:UIColor.white], for: .normal)
        
        return sc
    }()
    //
    //    let scrollview: (UIScrollView) = {
    //       let v = UIScrollView()
    //        v.backgroundColor = .systemGray6
    //        return v
    //    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(segmentedControl)
        setup()
        //        view.addSubview(scrollview)
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentedControl.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 50)
        
    }
    
    private func setup(){
        addChild(vc1)
        addChild(vc2)
        addChild(vc3)
        addChild(vc4)
        
        view.addSubview(vc1.view)
        view.addSubview(vc2.view)
        view.addSubview(vc3.view)
        view.addSubview(vc4.view)
        
        vc1.didMove(toParent: self)
        vc2.didMove(toParent: self)
        vc3.didMove(toParent: self)
        vc4.didMove(toParent: self)
        
        vc1.view.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: view.frame.height - 150)
        vc2.view.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: view.frame.height - 150)
        vc3.view.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: view.frame.height - 150)
        vc4.view.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: view.frame.height - 150)
        vc2.view.isHidden = true
        vc3.view.isHidden = true
        vc4.view.isHidden = true
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl){
        
        vc1.view.isHidden = true
        vc2.view.isHidden = true
        
        switch sender.selectedSegmentIndex {
        case 0:
            vc1.view.isHidden = false
            break
        case 1:
            vc2.view.isHidden = false
            break
        case 2:
            vc3.view.isHidden = false
            break
        case 3:
            vc4.view.isHidden = false
            break
        default:
            print("Error")
            break
        }
    }
    
}

