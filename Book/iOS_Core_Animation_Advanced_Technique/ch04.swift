//
//  ch04.swift
//  Book
//
//  Created by zangconghui on 2025/8/26.
//

import UIKit
import SnapKit
import RxSwift
import Then

//// 使用额外图层来解决阴影裁剪问题
//final class Ch04VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        
//        let shadowLayer = CALayer()
//        shadowLayer.frame = CGRectMake(0, 0, 200, 200)
//        shadowLayer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        shadowLayer.shadowOpacity = 0.8
//        shadowLayer.shadowRadius = 5.0
//        shadowLayer.shadowOffset = CGSize(width: 0, height: 3)
//        shadowLayer.borderWidth = 4
//        shadowLayer.masksToBounds = false
//        view.layer.addSublayer(shadowLayer)
//        
//        let contentsLayer = CALayer()
//        contentsLayer.contents = UIImage(named: "snowman")?.cgImage
//        contentsLayer.frame = shadowLayer.bounds
//        contentsLayer.shadowOffset = CGSize(width: 0, height: 3)
//        contentsLayer.masksToBounds = true
//        shadowLayer.addSublayer(contentsLayer)
//    }
//}

//final class Ch04VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        
//        let layer = CALayer()
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        layer.frame = CGRectMake(0, 0, 200, 200)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        
//        let squarePath = CGPath(rect: CGRectMake(0, 0, 200, 200), transform: nil)
//        layer.shadowPath = squarePath
//        layer.shadowRadius = 5.0
//        layer.shadowOpacity = 0.5
//        view.layer.addSublayer(layer)
//    }
//}

//final class Ch04VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let layer1 = CALayer()
//        layer1.backgroundColor = UIColor.blue.withAlphaComponent(0.8).cgColor
//        layer1.frame = view.bounds
//        let layer2 = CALayer()
//        layer2.contents = UIImage(named: "bird")?.cgImage
//        layer2.frame = CGRectMake(0, 0, 100, 100)
//        layer2.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer1.mask = layer2
//        view.layer.addSublayer(layer1)
//    }
//}

//final class Ch04VC: UIViewController {
//    
//    private let layer1: CALayer = CALayer()
//    private let layer2: CALayer = CALayer()
//    private let layer3: CALayer = CALayer()
//    private let layer4: CALayer = CALayer()
//    private let layer5: CALayer = CALayer()
//    private let layer6: CALayer = CALayer()
//        
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        
//        layer1.contents = UIImage(named: "digit")?.cgImage
//        layer1.frame = CGRectMake(40, view.bounds.midY, 40, 100)
//        layer1.magnificationFilter = .nearest
//        
//        layer2.contents = UIImage(named: "digit")?.cgImage
//        layer2.frame = CGRectMake(100, view.bounds.midY, 40, 100)
//        layer2.magnificationFilter = .nearest
//        
//        layer3.contents = UIImage(named: "digit")?.cgImage
//        layer3.frame = CGRectMake(160, view.bounds.midY, 40, 100)
//        layer3.magnificationFilter = .nearest
//        
//        layer4.contents = UIImage(named: "digit")?.cgImage
//        layer4.frame = CGRectMake(220, view.bounds.midY, 40, 100)
//        
//        layer5.contents = UIImage(named: "digit")?.cgImage
//        layer5.frame = CGRectMake(280, view.bounds.midY, 40, 100)
//        
//        layer6.contents = UIImage(named: "digit")?.cgImage
//        layer6.frame = CGRectMake(340, view.bounds.midY, 40, 100)
//        
//        view.layer.addSublayer(layer1)
//        view.layer.addSublayer(layer2)
//        view.layer.addSublayer(layer3)
//        view.layer.addSublayer(layer4)
//        view.layer.addSublayer(layer5)
//        view.layer.addSublayer(layer6)
//        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
//            guard let self else { return }
//            tick()
//        }
//    }
//    
//    private func tick() {
//        let now = Date()
//        let calendar = Calendar.current
//        let startOfToday = calendar.startOfDay(for: now)
//        let intervals = Int(now.timeIntervalSince(startOfToday))
//        
//        var hour = String(intervals / 3600)
//        var second = String(intervals % 60)
//        var minute = String(intervals / 60 - Int(hour)! * 60)
//        
//        func padZero(_ str: String) -> String {
//            return str.count < 2 ? "0" + str : str
//        }
//        
//        hour = padZero(hour)
//        minute = padZero(minute)
//        second = padZero(second)
//        
//        let hour_0 =  Int(String(hour[hour.index(hour.startIndex, offsetBy: 0)]))
//        layer1.contentsRect = CGRectMake(0.1 * CGFloat(hour_0!), 0, 0.1, 1.0)
//        let hour_1 =  Int(String(hour[hour.index(hour.startIndex, offsetBy: 1)]))
//        layer2.contentsRect = CGRectMake(0.1 * CGFloat(hour_1!), 0, 0.1, 1.0)
//        
//        let minute_0 =  Int(String(minute[minute.index(minute.startIndex, offsetBy: 0)]))
//        layer3.contentsRect = CGRectMake(0.1 * CGFloat(minute_0!), 0, 0.1, 1.0)
//        let minute_1 =  Int(String(minute[minute.index(minute.startIndex, offsetBy: 1)]))
//        layer4.contentsRect = CGRectMake(0.1 * CGFloat(minute_1!), 0, 0.1, 1.0)
//        
//        let second_0 =  Int(String(second[second.index(second.startIndex, offsetBy: 0)]))
//        layer5.contentsRect = CGRectMake(0.1 * CGFloat(second_0!), 0, 0.1, 1.0)
//        let second_1 =  Int(String(second[second.index(second.startIndex, offsetBy: 1)]))
//        layer6.contentsRect = CGRectMake(0.1 * CGFloat(second_1!), 0, 0.1, 1.0)
//
//    }
//}

//// MARK: 组透明已经默认开启，尝试后无法关闭
//final class Ch04VC: UIViewController {
//    
//    private let containerView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        view.addSubview(containerView)
//        containerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        let button1 = customButton()
//        button1.center = CGPoint(x: 50, y: 150)
//        containerView.addSubview(button1)
//        
//        // 创建半透明按钮
//        let button2 = customButton()
//        button2.center = CGPoint(x: 250, y: 150)
//        button2.alpha = 0.5
//        containerView.addSubview(button2)
//        
//        button2.layer.allowsGroupOpacity = false
////        // 开启半透明按钮的光栅化
////        button2.layer.shouldRasterize = true
////        button2.layer.rasterizationScale = UIScreen.main.scale
//    }
//    
//    private func customButton() -> UIButton {
//        let frame = CGRect(x: 0, y: 0, width: 150, height: 50)
//        let button = UIButton(frame: frame)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 10
//        
//        let labelFrame = CGRect(x: 20, y: 10, width: 110, height: 30)
//        let label = UILabel(frame: labelFrame)
//        label.text = "Hello World"
//        label.textAlignment = .center
//        button.addSubview(label)
//        
//        return button
//    }
//}
