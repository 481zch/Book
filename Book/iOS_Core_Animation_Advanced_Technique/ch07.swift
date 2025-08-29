//
//  ch07.swift
//  Book
//
//  Created by zangconghui on 2025/8/29.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Then

//final class Ch07VC: UIViewController {
//    
//    private let bag = DisposeBag()
//    private let containerView = UIView()
//    private let layer = CALayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        containerView.backgroundColor = .white
//        view.addSubview(containerView)
//        containerView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
//            make.center.equalToSuperview()
//        }
//        
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: containerView.bounds.midX, y: containerView.bounds.midY)
//        containerView.layer.addSublayer(layer)
//        
//        let transition = CATransition()
//        transition.type = .push
//        transition.subtype = .fromLeft
//        layer.actions = ["backgroundColor": transition]
//        
//        let button = UIButton()
//        button.backgroundColor = .blue
//        view.addSubview(button)
//        button.snp.makeConstraints { make in
//            make.width.equalTo(100)
//            make.height.equalTo(40)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(containerView.snp.bottom).offset(10)
//        }
//        button.rx.tap.subscribeNext { [weak self] in
//            guard let self else { return }
//            CATransaction.begin()
//            CATransaction.setAnimationDuration(5)
//            CATransaction.setCompletionBlock {
//                print("hello world")
//            }
//            layer.backgroundColor = UIColor.random().cgColor
//            CATransaction.commit()
//        }.disposed(by: bag)
//        
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let point = touch.location(in: view)
//        let presentationL = layer.presentation()!
//        if presentationL.hitTest(point) != nil {
//            layer.backgroundColor = UIColor.random().cgColor
//        } else {
//            CATransaction.begin()
//            CATransaction.setAnimationDuration(5)
//            layer.position = point;
//            CATransaction.commit()
//        }
//    }
//}
