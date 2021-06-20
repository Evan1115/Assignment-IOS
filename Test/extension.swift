//
//  extension.swift
//  Test
//
//  Created by lim lee jing on 20/06/2021.
//  Copyright © 2021 lim lee jing. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIView{
 
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive =  true
         leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive =  true
         trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive =  true
         bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive =  true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
        left : NSLayoutXAxisAnchor? = nil,
        bottom : NSLayoutYAxisAnchor? = nil,
        right : NSLayoutXAxisAnchor? = nil ,
        paddingTop: CGFloat = 0,
        paddingLeft: CGFloat = 0,
        paddingBottom : CGFloat = 0,
        paddingRight : CGFloat = 0,
        width : CGFloat? = nil,
        height : CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { // if top is not nil then equal to top
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left  = left {
            leftAnchor.constraint(equalTo: left, constant:  paddingLeft).isActive = true
            
        }
        if let bottom  = bottom {
            bottomAnchor.constraint(equalTo: bottom ,constant:  -paddingBottom).isActive = true
            //if want to move the element upside from bottm  on screen toward the center then the paddingBottom must be negative
            
        }
        if let right  = right {
            rightAnchor.constraint(equalTo: right, constant:  -paddingRight).isActive = true
            //if want to move the element on screen move to right side toward the center then the paddingRight must be negative
            
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
            
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
            
        }

        
        
    }
    
    func centerX(inView view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func centerY(inView view: UIView, leftAnchor : NSLayoutXAxisAnchor? = nil, paddingLeft : CGFloat = 0, constant: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimension(height : CGFloat , width : CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func addShadow(){
         
                  layer.cornerRadius = 10
                  layer.cornerRadius = 10
                  layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0,                        blue: 0/255.0, alpha: 1.0).cgColor
                  layer.shadowOffset = CGSize(width: 0, height: 1.75)
                   layer.shadowOpacity = 0.2
                   layer.shadowRadius = 10
    }
}
