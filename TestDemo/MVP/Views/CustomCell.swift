//
//  CustomCell.swift
//  TestDemo
//
//  Created by macos on 1/22/22.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let planLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.frame = CGRect(x: 95, y: 15, width: 180, height: 20)
    return label
  }()
  let planTimeLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = UIColor.init(red: 124/255, green: 126/255, blue: 128/255, alpha: 1.0)
    label.frame = CGRect(x: 95, y: 40, width: 50, height: 20)
    return label
  }()
  let planDescriptionLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = UIColor.init(red: 124/255, green: 126/255, blue: 128/255, alpha: 1.0)
    label.frame = CGRect(x: 150, y: 40, width: 250, height: 20)
    return label
  }()
  

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(index: NSInteger,  plan: Plan) {
    
    let planView = UIView()
    let screenSize: CGRect = UIScreen.main.bounds
    planView.frame = CGRect(x: 15, y: 5, width: screenSize.width - 30 , height: 70)
    planView.layer.cornerRadius = 15
    
    let image = plan.image
    let view = UIView()
    let imageView = UIImageView(image: image)
    view.layer.cornerRadius = 15
    view.frame = CGRect(x: 35, y: 15, width: 30, height: 30)
    
    let pluslabel = UILabel()
    pluslabel.textColor = .white
    pluslabel.backgroundColor = .black
    pluslabel.text = "+"
    pluslabel.textAlignment = .center
    pluslabel.layer.cornerRadius = 20
    pluslabel.layer.masksToBounds = true
    pluslabel.font = UIFont.boldSystemFont(ofSize: 22.0)
   
    var topPoint = CGPoint(x: 50, y: 0)
    var bottomPoint = CGPoint(x: 50, y: 80)
    
    switch index {
      case 0:
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        planLabel.frame = CGRect(x: 80, y: 20, width: 140, height: 20)
        topPoint = CGPoint(x: 50, y: 50)
        bottomPoint = CGPoint(x: 50, y: 80)
        planView.addDashedLine(from: topPoint, to: bottomPoint)
      case 1:
        view.backgroundColor = UIColor.init(red: 235/255, green: 116/255, blue: 112/255, alpha: 1.0)
        imageView.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
        planView.addDashedLine(from: topPoint, to: bottomPoint)
      case 2:
        view.backgroundColor = UIColor.init(red: 235/255, green: 197/255, blue: 187/255, alpha: 1.0)
        imageView.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
        planView.addDashedLine(from: topPoint, to: bottomPoint)
      case 3:
        view.backgroundColor = UIColor.init(red: 235/255, green: 116/255, blue: 112/255, alpha: 1.0)
        imageView.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
        planView.backgroundColor = .white
        pluslabel.frame = CGRect(x: 300, y: 15, width: 40, height: 40)
        topPoint = CGPoint(x: 50, y: 0)
        bottomPoint = CGPoint(x: 50, y: 0)
        planView.addDashedLine(from: topPoint, to: bottomPoint)
      case 4:
        view.backgroundColor = UIColor.init(red: 235/255, green: 197/255, blue: 187/255, alpha: 1.0)
        imageView.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
        planView.backgroundColor = .white
        pluslabel.frame = CGRect(x: 300, y: 15, width: 40, height: 40)
      case 5:
        view.backgroundColor = UIColor.init(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
        imageView.frame = CGRect(x: 7, y: 7, width: 0, height: 0)
        pluslabel.textColor = UIColor.init(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
        pluslabel.backgroundColor = .clear
        pluslabel.layer.borderWidth = 1
        pluslabel.layer.borderColor = UIColor.init(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0).cgColor
        pluslabel.frame = CGRect(x: 300, y: 20, width: 40, height: 40)
        planView.addDashedBorder()
      case 6:
        view.backgroundColor = UIColor.init(red: 134/255, green: 188/255, blue: 238/255, alpha: 1.0)
        imageView.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
        planView.addDashedLine(from: topPoint, to: bottomPoint)
      case 7:
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        planLabel.frame = CGRect(x: 80, y: 20, width: 140, height: 20)
        topPoint = CGPoint(x: 50, y: 0)
        bottomPoint = CGPoint(x: 50, y: 20)
        planView.addDashedLine(from: topPoint, to: bottomPoint)
      default:
        view.backgroundColor = .red
        imageView.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
    }
    
    view.addSubview(imageView)
    
    planView.addSubview(pluslabel)
    planView.addSubview(planLabel)
    planView.addSubview(planTimeLabel)
    planView.addSubview(planDescriptionLabel)
    planView.addSubview(view)
    
    
    addSubview(planView)
    
    planLabel.text = plan.title
    switch plan.time {
      case "":
        planTimeLabel.text = plan.time
        planTimeLabel.frame = CGRect(x: 95, y: 25, width: 0, height: 20)
        planDescriptionLabel.frame = CGRect(x: 95, y: 40, width: 250, height: 20)
      default:
        planTimeLabel.text = plan.time + ","
    }
    
    planDescriptionLabel.text = plan.description
  }
}


extension UIView{

  func addDashedBorder() {
    let color = UIColor.init(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0).cgColor
     
     let shapeLayer:CAShapeLayer = CAShapeLayer()
     let frameSize = self.frame.size
     let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
     
     shapeLayer.bounds = shapeRect
     shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
     shapeLayer.fillColor = UIColor.clear.cgColor
     shapeLayer.strokeColor = color
     shapeLayer.lineWidth = 2
     shapeLayer.lineJoin = CAShapeLayerLineJoin.round
     shapeLayer.lineDashPattern = [6,3]
     shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 4).cgPath
     
     self.layer.addSublayer(shapeLayer)
   }
  
  func addDashedLine(from point1: CGPoint, to point2: CGPoint) {
    let shapeLayer = CAShapeLayer()
      shapeLayer.strokeColor = UIColor.init(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0).cgColor
      shapeLayer.lineWidth = 2
      shapeLayer.lineDashPattern = [1,1]

      let path = CGMutablePath()
      path.addLines(between: [point1,point2])
      shapeLayer.path = path
      layer.addSublayer(shapeLayer)
  }

}

