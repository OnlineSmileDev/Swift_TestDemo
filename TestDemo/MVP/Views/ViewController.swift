//
//  ViewController.swift
//  TestDemo
//
//  Created by macos on 1/21/22.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewWillAppear(_ animated: Bool) {
      self.navigationController?.setNavigationBarHidden(true, animated: animated)
      super.viewWillAppear(animated)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let myView = HeaderView(frame: CGRect(x:0, y: 0, width: screenSize.width, height: 100))
    myView.configure(with: "Monitored By UCHealth")
    view.addSubview(myView)
    
    let dayView = DayView(frame: CGRect(x:0, y: 130, width: screenSize.width, height: screenSize.height))
    view.addSubview(dayView)
  }

}

