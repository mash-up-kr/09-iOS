//
//  JSGrowingTextView.swift
//  JSGrowingTextView
//
//  Created by jeasung.lee on 2017. 12. 12..
//  Copyright © 2017년 jeasungLEE. All rights reserved.
//

import UIKit

//MARK: -
public class JSGrowingTextView: UITextView {
    public var placeHolder: String? = "내용"                                         //플레이스홀더
    public var placeHolderColor: UIColor = UIColor(white: 0.8, alpha: 1.0)     //플레이스홀더 컬러
    
    //MARK: - init
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentMode = .redraw
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: .UITextViewTextDidChange, object: self)wafwa
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        if text.isEmpty {
            drawPlaceHolder(rect)
        }
    }
}

//MARK: - custom func
extension JSGrowingTextView {
    private func getPlaceHolderAttribues() -> [NSAttributedStringKey: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        var attributes: [NSAttributedStringKey: Any] = [
            .foregroundColor: placeHolderColor,
            .paragraphStyle: paragraphStyle
        ]
        if let font = font {
            attributes[.font] = font
        }
        
        return attributes
    }
    
    private func drawPlaceHolder(_ rect: CGRect) {
        let xValue = textContainerInset.left + 5
        let yValue = textContainerInset.top
        let width = rect.size.width - xValue - textContainerInset.right
        let height = rect.size.height - yValue - textContainerInset.bottom
        let placeHolderRect = CGRect(x: xValue, y: yValue, width: width, height: height)
        
        if let placeHolder = placeHolder {
            guard let gc = UIGraphicsGetCurrentContext() else { return }
            gc.saveGState()
            defer { gc.restoreGState() }
            
            placeHolder.draw(in: placeHolderRect, withAttributes: getPlaceHolderAttribues())
        }
    }
}

extension JSGrowingTextView {
    @objc private func textDidChange(notification: Notification) {
        if let sender = notification.object as? JSGrowingTextView, sender == self {
            setNeedsDisplay()
        }
    }
}
