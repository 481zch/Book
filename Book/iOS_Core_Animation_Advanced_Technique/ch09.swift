//
//  ch09.swift
//  Book
//
//  Created by zangconghui on 2025/9/1.
//

import UIKit
import SnapKit
import RxSwift
import Then

//final class Ch09VC: UIViewController {
//
//    private var containerView = UIView()
//    private var doorLayer = CALayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(containerView)
//        containerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        doorLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 256)
//        doorLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
//        doorLayer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        doorLayer.contents = UIImage(named: "door")?.cgImage
//        containerView.layer.addSublayer(doorLayer)
//        
//        var perspective = CATransform3DIdentity
//        perspective.m34 = -1.0 / 500.0
//        containerView.layer.sublayerTransform = perspective
//        
//        doorLayer.speed = 0.0
//        
//        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
//        animation.toValue = -CGFloat.pi / 2
//        animation.duration = 1.0
//        doorLayer.add(animation, forKey: nil)
//        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        view.addGestureRecognizer(pan)
//    }
//    
//    @objc private func handlePan(_ pan: UIPanGestureRecognizer) {
//        var x = pan.translation(in: view).x
//        x /= 200.0
//        
//        var timeOffset = doorLayer.timeOffset
//        timeOffset = min(0.999, max(0.0, timeOffset - Double(x)))
//        
//        doorLayer.timeOffset = timeOffset
//        
//        pan.setTranslation(.zero, in: view)
//    }
//}
