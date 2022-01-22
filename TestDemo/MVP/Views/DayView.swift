//
//  dayView.swift
//  TestDemo
//
//  Created by macos on 1/21/22.
//

import UIKit
import TimelineTableViewCell

class DayView: UIView, UITableViewDelegate, UITableViewDataSource {
  
  var plans: [Plan] = []
  
  private let dayTitleView: UIView = {
    
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .black
    label.backgroundColor = .white
    label.text = "Plan for Today"
    label.font = UIFont.boldSystemFont(ofSize: 22.0)
    label.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
    
    let label1 = UILabel()
    label1.textAlignment = .center
    label1.textColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0)
    label1.backgroundColor = .white
    label1.text = "Tomorrow"
    label1.font = UIFont.boldSystemFont(ofSize: 18)
    label1.frame = CGRect(x: 170, y: 0, width: 100, height: 30)
    
    let label2 = UILabel()
    label2.textAlignment = .center
    label2.textColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0)
    label2.backgroundColor = .white
    label2.text = "Friday"
    label2.font = UIFont.boldSystemFont(ofSize: 18)
    label2.frame = CGRect(x: 270, y: 0, width: 100, height: 30)
    
    
    let dayTitleView = UIView()
    dayTitleView.backgroundColor = .white
    dayTitleView.addSubview(label)
    dayTitleView.addSubview(label1)
    dayTitleView.addSubview(label2)
    return dayTitleView
    
  }()
  
  var tableView = UITableView()
  
  let cardView: UIView = {
     let view = UIView()
     view.layer.cornerRadius = 14
     view.translatesAutoresizingMaskIntoConstraints = false
     return view
  }()
  
  private let timeLineView: UIView = {
    let timeView = UIView()
    return timeView
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    plans = fetchData()
    
    setup()
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    tableView.rowHeight = 80
    tableView.separatorColor = .clear
    
    addSubview(dayTitleView)
    addSubview(timeLineView)
  }
  
  func setup() {
    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height * 2))
    tableView.addSubview(cardView)
    timeLineView.addSubview(tableView)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return plans.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
    let plan = plans[indexPath.row]
    cell.set(index: indexPath.row, plan: plan)
    cell.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
    return cell
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init has not been implemented ")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  
    dayTitleView.frame = CGRect(x: 10, y: 0, width: frame.size.width - 20, height: 30 )
    timeLineView.frame = CGRect(x: 0, y: 50, width: frame.size.width, height: frame.size.height )
  }
  
}

extension DayView {
  
  func fetchData() -> [Plan] {
    let plan0 = Plan(image: Images.morning!, title: "June 4th 2026", time: "", description: "")
    let plan1 = Plan(image: Images.blood!, title: "Blood Glucose", time: "08:50", description: "205.6mg/DL, Fasting")
    let plan2 = Plan(image: Images.insulin!, title: "Insulin", time: "09:12", description: "12u")
    let plan3 = Plan(image: Images.blood!, title: "Blood Glucose", time: "", description: "Log reading")
    let plan4 = Plan(image: Images.insulin!, title: "Insulin", time: "", description: "Log dosage")
    let plan5 = Plan(image: Images.blood!, title: "Log somethign else", time: "", description: "")
    let plan6 = Plan(image: Images.blood!, title: "Asprin 5mg", time: "", description: "Due this afternooon")
    let plan7 = Plan(image: Images.night!, title: "Sleep Well!", time: "", description: "")
    
    return [plan0, plan1, plan2, plan3, plan4, plan5, plan6, plan7]
  }
}
