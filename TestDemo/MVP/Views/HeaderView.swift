//
//  ExampleView.swift
//  TestDemo
//
//  Created by macos on 1/21/22.
//

import UIKit

class HeaderView: UIView {
  
  private let Headerlabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 16.0)
    return label
  }()
 
  private let OnlineView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 5
    view.backgroundColor = .white
    view.frame = CGRect(x: 0, y: 7, width: 10, height: 10)
    
    let label = UILabel()
    label.textColor = .white
    label.text = "ONLINE"
    label.font = UIFont.boldSystemFont(ofSize: 16.0)
    label.frame = CGRect(x: 20, y: 0, width: 60, height: 24)
    
    let image = UIImage(named: "ic_message")
    let imageView = UIImageView(image: image!)
    imageView.frame = CGRect(x: 90, y: 0, width: 24, height: 24)
    
    let countlabel = UILabel()
    countlabel.textColor = .white
    countlabel.backgroundColor = .systemRed
    countlabel.text = "3"
    countlabel.textAlignment = .center
    countlabel.layer.cornerRadius = 12
    countlabel.layer.masksToBounds = true
    countlabel.font = UIFont.boldSystemFont(ofSize: 16.0)
    countlabel.frame = CGRect(x: 100, y: 0, width: 24, height: 24)
    
    let onlineView = UIView()
    onlineView.addSubview(view)
    onlineView.addSubview(label)
    onlineView.addSubview(imageView)
    onlineView.addSubview(countlabel)
    return onlineView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.init(red: 53/255, green: 120/255, blue: 248/255, alpha: 1.0)
    addSubview(Headerlabel)
    addSubview(OnlineView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init has not been implemented ")
  }
  
  public func configure(with name: String) {
    Headerlabel.text = name
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  
    Headerlabel.frame = CGRect(x: 10, y: 60, width: frame.size.width / 2, height: 24 )
    OnlineView.frame = CGRect(x: frame.size.width / 2 + 50, y: 60, width: 150, height: 24)
  }

}
