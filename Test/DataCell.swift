//
//  DataCell.swift
//  Test
//
//  Created by lim lee jing on 20/06/2021.
//  Copyright © 2021 lim lee jing. All rights reserved.
//

import UIKit

protocol DataCellDelegate: class {
    func delete(cell: DataCell)
    
    func edit(cell: DataCell)
}

class DataCell: UITableViewCell {
    
    weak var delegate : DataCellDelegate?
    
    var userData : UserData?
    
    public var circleView : UIView = {
       let view = UIView()
        view.backgroundColor = .orange
       
       
       
        return view
    }()
    
    public var customername : UILabel = {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: 18)
           label.textColor = .darkGray
           
           
           return label
       }()
    
    public let editButton : UILabel = {
        let label = UILabel()
        label.text = "Edit"
        label.font =  UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .orange
        
       
        
        return label
    }()
    
    public let deleteButton : UILabel = {
        let label = UILabel()
        label.text = "Delete"
        label.font =  UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .red
        
       
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(circleView)
        circleView.centerY(inView: self)
        
        circleView.anchor( left: self.leftAnchor, paddingLeft: 15 ,width: 60,height: 60)
        circleView.layer.cornerRadius = 60/2
        
         contentView.addSubview(customername)
        customername.centerY(inView: self)
        customername.anchor( left: circleView.rightAnchor, paddingLeft: 15 , height: 18)
        
//        contentView.addSubview(editButton)
//        editButton.centerY(inView: self)
//               editButton.anchor( right: self.rightAnchor, paddingRight: 70, width: 30, height: 20)
//               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleEdit))
//               editButton.isUserInteractionEnabled = true
//               editButton.addGestureRecognizer(tapGesture)
//               
//               contentView.addSubview(deleteButton)
//        deleteButton.centerY(inView: self)
//               deleteButton.anchor( left: editButton.rightAnchor, paddingLeft: 10, width: 50, height: 20)
//               let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleDelete))
//                    deleteButton.isUserInteractionEnabled = true
//                    deleteButton.addGestureRecognizer(tapGesture2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDelete(){
           print("debug delete")
            delegate?.delete(cell: self)
       }
       
       @objc func handleEdit(){
           print("edit")
        delegate?.edit(cell: self)
           
       }
    
    func set(data: UserData){
        print(data.firstName)
        self.userData = data
        guard let firstName = self.userData?.firstName else { return }
         guard let lastName = self.userData?.lastName else { return }
        customername.text = "\(firstName) \(lastName)"
    }

}
