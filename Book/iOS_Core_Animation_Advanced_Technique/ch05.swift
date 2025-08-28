//
//  ch05.swift
//  Book
//
//  Created by zangconghui on 2025/8/28.
//

import UIKit
import SnapKit
import RxSwift
import Then

//final class Ch05VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        view.layer.addSublayer(layer)
//        
//        let identity = CGAffineTransform.identity
//        var transform = CGAffineTransformConcat(identity, CGAffineTransformMakeTranslation(100, 100))
//        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeRotation(.pi / 4))
//        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(2.0, 2.0))
//        layer.setAffineTransform(transform)
//    }
//}

//final class Ch05VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        view.layer.addSublayer(layer)
//        
//        // -y, y
//        var transform = CGAffineTransform.identity
//        transform.c = -1
//        transform.b = 0
//        layer.setAffineTransform(transform)
//    }
//}

//final class Ch05VC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 200, 200)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        view.layer.addSublayer(layer)
//
//        var transform = CATransform3DMakeRotation(.pi / 4, 0, 1, 0)
//        transform.m34 = -1.0 / 500
//        layer.transform = transform
//    }
//}

//final class Ch05VC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 400, 200)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        view.layer.addSublayer(layer)
//
//        let layer1 = CALayer()
//        layer1.frame = CGRectMake(0, 0, 200, 200)
//        layer1.contents = UIImage(named: "combine4")?.cgImage
//        layer.addSublayer(layer1)
//        
//        let layer2 = CALayer()
//        layer2.frame = CGRectMake(200, 0, 200, 200)
//        layer2.contents = UIImage(named: "combine4")?.cgImage
//        layer.addSublayer(layer2)
//        
//        var transform = CATransform3DIdentity
//        transform.m34 = -1.0 / 500
//        layer.sublayerTransform = transform
//        
//        layer1.transform = CATransform3DMakeRotation(.pi, 0, 1, 0)
//        layer2.transform = CATransform3DMakeRotation(-.pi, 0, 1, 0)
//        
//        layer1.isDoubleSided = false
//        layer2.isDoubleSided = false
//    }
//}

// 扁平化图层
//final class Ch05VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        
//        let layer1 = CALayer()
//        layer1.frame = CGRectMake(0, 0, 200, 200)
//        layer1.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer1.backgroundColor = UIColor.black.cgColor
//        
//        let layer2 = CALayer()
//        layer2.frame = CGRectMake(0, 0, 75, 75)
//        layer2.position = CGPoint(x: layer1.bounds.midX, y: layer1.bounds.midY)
//        layer2.backgroundColor = UIColor.white.cgColor
//        layer1.addSublayer(layer2)
//        
//        view.layer.addSublayer(layer1)
//        
//        var transform = CATransform3DIdentity
//        transform.m34 = -1.0 / 500
//        layer1.transform = CATransform3DRotate(transform, .pi / 4, 0, 1, 0)
//        
//        var transform1 = CATransform3DIdentity
//        transform1.m34 = -1.0 / 500
//        layer2.transform = CATransform3DRotate(transform1, -.pi / 4, 0, 1, 0)
//        
//    }
//}

//final class Ch05VC: UIViewController {
//    
//    private let views: [UIView] = {
//        return (0..<6).map { index in
//            let v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//            v.backgroundColor = .red
//            let label = UILabel()
//            label.text = String(index + 1)
//            label.textAlignment = .center
//            v.addSubview(label)
//            label.snp.makeConstraints { make in
//                make.center.equalToSuperview()
//            }
//            return v
//        }
//    }()
//    private let containerView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        view.addSubview(containerView)
//        containerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        var identity = CATransform3DIdentity
//        identity.m34 = -1.0 / 500
//        
//        let side: CGFloat = 100, half = side / 2
//        createInterface(index: 0, transform: CATransform3DMakeTranslation(0, 0, half))
//
//        var t1 = CATransform3DMakeTranslation(0, 0, -half)
//        t1 = CATransform3DRotate(t1, .pi, 0, 1, 0)
//        createInterface(index: 1, transform: t1)
//
//        var t2 = CATransform3DMakeTranslation(0, -half, 0)
//        t2 = CATransform3DRotate(t2, .pi / 2, 1, 0, 0)
//        createInterface(index: 2, transform: t2)
//
//        var t3 = CATransform3DMakeTranslation(0, half, 0)
//        t3 = CATransform3DRotate(t3, -.pi / 2, 1, 0, 0)
//        createInterface(index: 3, transform: t3)
//
//        var t4 = CATransform3DMakeTranslation(-half, 0, 0)
//        t4 = CATransform3DRotate(t4, .pi / 2, 0, 1, 0)
//        createInterface(index: 4, transform: t4)
//
//        var t5 = CATransform3DMakeTranslation(half, 0, 0)
//        t5 = CATransform3DRotate(t5, -.pi / 2, 0, 1, 0)
//        createInterface(index: 5, transform: t5)
//        
//        var transform = CATransform3DRotate(identity, .pi / 4, 0, 1, 0)
//        transform = CATransform3DRotate(transform, .pi / 8, 1, 0, 0)
//        containerView.layer.sublayerTransform = transform
//    }
//    
//    private func createInterface(index: Int, transform: CATransform3D) {
//        containerView.addSubview(views[index])
//        views[index].center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        views[index].layer.transform = transform
//    }
//}
