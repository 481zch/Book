//
//  ch06.swift
//  Book
//
//  Created by zangconghui on 2025/8/28.
//

import UIKit
import SnapKit
import RxSwift
import Then

//final class Ch06VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupStickMan()
//    }
//
//    private func setupStickMan() {
//        let path = UIBezierPath()
//        
//        path.addArc(withCenter: CGPoint(x: 150, y: 150), radius: 25, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//        
//        path.move(to: CGPoint(x: 150, y: 175))
//        path.addLine(to: CGPoint(x: 150, y: 250))
//        
//        path.move(to: CGPoint(x: 150, y: 190))
//        path.addLine(to: CGPoint(x: 120, y: 220))
//        
//        path.move(to: CGPoint(x: 150, y: 190))
//        path.addLine(to: CGPoint(x: 180, y: 220))
//        
//        path.move(to: CGPoint(x: 150, y: 250))
//        path.addLine(to: CGPoint(x: 120, y: 300))
//        
//        path.move(to: CGPoint(x: 150, y: 250))
//        path.addLine(to: CGPoint(x: 180, y: 300))
//        
//        let stickMan = CAShapeLayer()
//        stickMan.path = path.cgPath
//        stickMan.strokeColor = UIColor.black.cgColor
//        stickMan.fillColor = UIColor.clear.cgColor
//        stickMan.lineWidth = 4
//        stickMan.lineCap = .round
//        stickMan.lineJoin = .round
//        
//        view.layer.addSublayer(stickMan)
//    }
//}

// final class Ch06VC: UIViewController {
    
//     override func viewDidLoad() {
//         super.viewDidLoad()
//         view.backgroundColor = .white
//         setupSubviews()
//     }
    
//     private func setupSubviews() {
//         let layer = CATextLayer()
//         layer.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
//         layer.string = "Hello, CATextLayer! This is a sample text to demonstrate CATextLayer capabilities."
//         layer.fontSize = 20
//         layer.foregroundColor = UIColor.black.cgColor
//         layer.alignmentMode = .left
//         layer.contentsScale = UIScreen.main.scale
//         layer.isWrapped = true
//         view.layer.addSublayer(layer)
//     }
// }

//final class Ch06VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let layer = CATextLayer()
//        layer.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
//        
//        let attributedString = NSMutableAttributedString(string: "Hello, CATextLayer! This is a sample text to demonstrate CATextLayer capabilities.")
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: NSRange(location: 0, length: attributedString.length))
//        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 20, length: 5))
//        
//        layer.string = attributedString
//        layer.alignmentMode = .left
//        layer.contentsScale = UIScreen.main.scale
//        layer.isWrapped = true
//        view.layer.addSublayer(layer)
//    }
//}

//final class Ch06VC: UIViewController {
//
//    class LayerLabel: UIView {
//        override class var layerClass: AnyClass {
//            return CATextLayer.self
//        }
//
//        var textLayer: CATextLayer {
//            return layer as! CATextLayer
//        }
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        var text: String? {
//            get {
//                return (textLayer.string as? String)
//            }
//            set {
//                textLayer.string = newValue
//            }
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let label = LayerLabel(frame: CGRect(x: 50, y: 100, width: 300, height: 50))
//        label.text = "Hello, LayerLabel!"
//        label.textLayer.fontSize = 24
//        label.textLayer.alignmentMode = .center
//        label.textLayer.contentsScale = UIScreen.main.scale
//        view.addSubview(label)
//    }
//}

//final class Ch06VC: UIViewController {
//    
//    private let containerView = UIView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        var identity = CATransform3DIdentity
//        identity.m34 = -1.0 / 500.0
//        containerView.layer.sublayerTransform = identity
//
//        view.addSubview(containerView)
//        containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
//        containerView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(200)
//        }
//        
//        let transformLayer = CATransformLayer()
//        transformLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        transformLayer.position = CGPoint(x: 100, y: 100)
//        containerView.layer.addSublayer(transformLayer)
//
//        // Front face
//        var i1 = CATransform3DIdentity
//        i1 = CATransform3DTranslate(i1, 0, 0, 50)
//        transformLayer.addSublayer(createFaceLayer(i1, color: .red, label: "Front"))
//        
//        // Right face
//        var i2 = CATransform3DIdentity
//        i2 = CATransform3DTranslate(i2, 50, 0, 0)
//        i2 = CATransform3DRotate(i2, .pi / 2, 0, 1, 0)
//        transformLayer.addSublayer(createFaceLayer(i2, color: .green, label: "Right"))
//        
//        // Back face
//        var i3 = CATransform3DIdentity
//        i3 = CATransform3DTranslate(i3, 0, 0, -50)
//        i3 = CATransform3DRotate(i3, .pi, 0, 1, 0)
//        transformLayer.addSublayer(createFaceLayer(i3, color: .blue, label: "Back"))
//        
//        // Left face
//        var i4 = CATransform3DIdentity
//        i4 = CATransform3DTranslate(i4, -50, 0, 0)
//        i4 = CATransform3DRotate(i4, -.pi / 2, 0, 1, 0)
//        transformLayer.addSublayer(createFaceLayer(i4, color: .yellow, label: "Left"))
//        
//        // Top face
//        var i5 = CATransform3DIdentity
//        i5 = CATransform3DTranslate(i5, 0, -50, 0)
//        i5 = CATransform3DRotate(i5, .pi / 2, 1, 0, 0)
//        transformLayer.addSublayer(createFaceLayer(i5, color: .cyan, label: "Top"))
//        
//        // Bottom face
//        var i6 = CATransform3DIdentity
//        i6 = CATransform3DTranslate(i6, 0, 50, 0)
//        i6 = CATransform3DRotate(i6, -.pi / 2, 1, 0, 0)
//        transformLayer.addSublayer(createFaceLayer(i6, color: .magenta, label: "Bottom"))
//
//        var ct = CATransform3DIdentity
//        ct = CATransform3DTranslate(ct, 100, 100, 0)
//        ct = CATransform3DRotate(ct, -.pi / 4, 1, 0, 0)
//        ct = CATransform3DRotate(ct, -.pi / 4, 0, 1, 0)
//        transformLayer.transform = ct
//    }
//
//    private func createFaceLayer(_ transform: CATransform3D, color: UIColor, label: String) -> CALayer {
//        let layer = CALayer()
//        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = color.withAlphaComponent(0.7).cgColor
//        layer.transform = transform
//
//        return layer
//    }
//}

//final class Ch06VC: UIViewController {
//    
//    private let containerView = UIView()
//    private let gradientLayer = CAGradientLayer()
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
//            make.width.height.equalTo(200)
//            make.center.equalToSuperview()
//        }
//        
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.random().cgColor, UIColor.blue.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.locations = [0.0, 0.25, 0.5]
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//        containerView.layer.addSublayer(gradientLayer)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gradientLayer.frame = containerView.bounds
//    }
//}

//final class Ch06VC: UIViewController {
//    
//    private let containerView = UIView()
//    private let replicator = CAReplicatorLayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .gray
//        view.addSubview(containerView)
//        containerView.backgroundColor = .green.withAlphaComponent(0.2)
//        containerView.snp.makeConstraints { make in
//            make.width.height.equalTo(220)
//            make.center.equalToSuperview()
//        }
//        containerView.layer.addSublayer(replicator)
//        replicator.instanceCount = 10
//        
//        // 以容器中心为圆心
//        let radius: CGFloat = 80
//        let size: CGFloat = 30
//        let center = CGPoint(x: 110, y: 110)
//        
//        var transform = CATransform3DIdentity
//        transform = CATransform3DTranslate(transform, center.x, center.y - radius, 0)
//        transform = CATransform3DTranslate(transform, -center.x, -(center.y - radius), 0)
//        transform = CATransform3DTranslate(transform, center.x, center.y - radius, 0)
//        transform = CATransform3DTranslate(transform, -center.x, -(center.y - radius), 0)
//        transform = CATransform3DMakeTranslation(0, -radius, 0)
//        transform = CATransform3DTranslate(transform, center.x, center.y, 0)
//        transform = CATransform3DTranslate(transform, -center.x, -center.y, 0)
//        transform = CATransform3DMakeRotation(.pi * 2 / CGFloat(replicator.instanceCount), 0, 0, 1)
//        replicator.instanceTransform = CATransform3DMakeRotation(.pi * 2 / CGFloat(replicator.instanceCount), 0, 0, 1)
//        
//        replicator.instanceBlueOffset = -0.1
//        replicator.instanceGreenOffset = -0.1
//        
//        let layer = CALayer()
//        layer.frame = CGRect(x: center.x - size/2, y: center.y - radius - size/2, width: size, height: size)
//        layer.backgroundColor = UIColor.white.cgColor
//        layer.cornerRadius = size / 2
//        replicator.addSublayer(layer)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        replicator.frame = containerView.bounds
//    }
//}

//final class Ch06VC: UIViewController {
//    
//    private var sparkEmitter: CAEmitterLayer!
//    
//    override func viewDidLoad() {
//        view.backgroundColor = .black
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        sparkEmitter = CAEmitterLayer()
//        sparkEmitter.emitterShape = .circle
//        sparkEmitter.emitterMode = .points
//        sparkEmitter.renderMode = .additive
//        sparkEmitter.emitterPosition = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        
//        let cell = CAEmitterCell()
//        cell.contents = UIImage(named: "snowmanv")?.cgImage
//        cell.birthRate = 0
//        cell.lifetime = 0.4
//        cell.velocity = 150
//        cell.velocityRange = 50
//        cell.emissionRange = .pi * 2
//        cell.scale = 0.05
//        cell.scaleRange = 0.02
//        cell.alphaSpeed = -1.0
//        cell.yAcceleration = 150
//        
//        sparkEmitter.emitterCells = [cell]
//        
//        view.layer.addSublayer(sparkEmitter)
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            sparkEmitter.emitterPosition = touch.location(in: view)
//            sparkEmitter.setValue(300, forKeyPath: "emitterCells.cell.birthRate")
//            sparkEmitter.birthRate = 1
//            (sparkEmitter.emitterCells?.first)?.birthRate = 300
//        }
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            sparkEmitter.emitterPosition = touch.location(in: view)
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        (sparkEmitter.emitterCells?.first)?.birthRate = 0
//    }
//}
