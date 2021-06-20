//
//  ViewController.swift
//  Test
//
//  Created by lim lee jing on 20/06/2021.
//  Copyright © 2021 lim lee jing. All rights reserved.
//

import Foundation

import UIKit



class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
   
    let tableView = UITableView()
    var data = DataLoader().userData
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        print(data)
        
        view.addSubview(tableView)
        tableView.register(DataCell.self, forCellReuseIdentifier: Cells.dataCell)
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
       
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    struct Cells{
        static let dataCell = "DataCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.dataCell) as! DataCell
        
        //set delegate
        cell.delegate = self
        
        cell.set(data: data[indexPath.row])
        
        
        return cell
       }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = EditViewController()
//        let nav = UINavigationController(rootViewController: vc)
//        nav.isModalInPresentation = true
//        nav.modalPresentationStyle = .fullScreen
//        self.present(nav, animated: true, completion: nil)
        
       
        let vc = EditViewController(userData: self.data[indexPath.row], indexPath: indexPath)
                
               vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
    }
    
    func confirmDetele(indexPath : IndexPath){
        print("delete")
        self.data.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        self.tableView.reloadData()
        
    }


}

extension ViewController: DataCellDelegate{
    func delete(cell: DataCell) {
        guard let index = tableView.indexPath(for: cell) else { return}
        
        confirmDetele(indexPath: index)
        print("\(index)")
        
    }
    
    func edit(cell: DataCell) {
         guard let index = tableView.indexPath(for: cell) else { return}
        let vc = EditViewController(userData: cell.userData!, indexPath: index)
         
        vc.delegate = self
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: EditViewControllerDelegate{
    func editData(userData: UserData, indexpath indexPath : IndexPath) {
        self.data[indexPath.row] = userData
        self.tableView.reloadData()
    }
    
    
}

