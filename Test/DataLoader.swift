//
//  DataLoader.swift
//  Test
//
//  Created by lim lee jing on 20/06/2021.
//  Copyright © 2021 lim lee jing. All rights reserved.
//

import Foundation

public class DataLoader {
    @Published var userData = [UserData]()
    
    //when create an object then it will call the load function
    init() {
        load()
        //sort()
    }
    
    func load(){
        
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json"){
           
            //do catch in case of an error
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                
                //decode the json into an array of userdata
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
                print(self.userData)
            }catch{
                print(error)
            }
        }
    }
    
//    func sort(){
//        //sort customer id in ascending sequence
//        self.userData = self.userData.sorted(by: {$0.id < $1.id})
//    }
    
}

