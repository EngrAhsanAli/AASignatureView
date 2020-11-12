//
//  AASignatureView.swift
//  AASignatureView
//
//  Created by Engr. Ahsan Ali on 12/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit


/// IBDesignable class for AASignatureView
/// Extended from UIView
/// Main class for drawing signature

@IBDesignable open class AASignatureView: UIView {

    /// IBInspectable - Drawing line width IBInspectable
    @IBInspectable open var lineWidth: CGFloat = 3.0 {
        didSet {
            path.lineWidth = lineWidth
            setNeedsDisplay()
        }
    }
    
    /// IBInspectable - Drawing line color IBInspectable
    @IBInspectable open var lineColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Counter for number of control points
    var ctr: Int = 0
    
    /// Saves touche points for drawing
    var touches = [CGPoint](repeating: CGPoint(), count:5)
    
    /// Drawing path
    var path = UIBezierPath() {
        didSet {
            path.lineJoinStyle = .round
            setNeedsDisplay()
        }
    }
    
    /// Check for empty view
    open var isEmpty: Bool {
        get {
            guard !self.path.isEmpty else {
                return true
            }
            return false
        }
    }
    
    /// AASignatureView - Interface View
    open override func prepareForInterfaceBuilder() {
        let label = UILabel(frame: self.bounds)
        label.text = "AASignatureView"
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.textAlignment = .center
        label.font = UIFont(name: "Gill Sans", size: bounds.width/10)
        label.sizeThatFits(intrinsicContentSize)
        self.addSubview(label)
        self.backgroundColor = UIColor(rgb: 0x2891B1)
        
    }
    
    /// Default draw function, will call on touch
    ///
    /// - Parameter rect: drawing view frame
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        lineColor.setStroke()
        path.stroke()
        setNeedsDisplay()
    }
    
    /// default init
    ///
    /// - Parameter frame: view frame
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    /// touchesBegan
    ///
    /// - Parameters:
    ///   - touch: Initial Touch
    ///   - event: touch event
    override open func touchesBegan(_ touch: Set<UITouch>, with event: UIEvent?)
    {
        let point = touch.first!.location(in: self)
        insertTouch(touch: point, at: 0)
        super.touchesBegan(touch, with: event)
        
    }
    
    /// touchesMoved
    ///
    /// - Parameters:
    ///   - touch: Moving touches
    ///   - event: touch event
    override open func touchesMoved(_ touch: Set<UITouch>, with event: UIEvent?)
    {
        let point = touch.first!.location(in: self) // It must come in any case
        
        guard ctr == 4 else {
            insertTouch(touch: point, at: ctr+1)
            return
        }
        
        touches[1] = path.moveWithCurve(a: touches[1], b: touches[2], c: touches[3], d: point)
        
        insertTouch(touch: point, at: 2)
        
        setNeedsDisplay()
        
        super.touchesMoved(touch, with: event)
    }
    
    /// touchesEnded
    ///
    /// - Parameters:
    ///   - touch: Last Touch
    ///   - event: touch event
    override open func touchesEnded(_ touch: Set<UITouch>, with event: UIEvent?)
    {
        guard ctr == 0 else {
            ctr = 0
            return
        }
        
        path.addDot(origin: touches.first!, size: lineWidth)
        setNeedsDisplay()
        super.touchesEnded(touch, with: event)
        
    }
    
    /// Clear the view
    open func clear() {
        path.removeAllPoints()
        setNeedsDisplay()
    }
    
    /// Get captured view
    open var signature: UIImage? {
        guard !isEmpty else {
            return nil
        }
        return UIImage(view: self)
    }
    
}
