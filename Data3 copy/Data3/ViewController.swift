//
//  ViewController.swift
//  Data3
//
//  Created by Samuel Wang on 10/22/15.
//  Copyright © 2015 Samuel Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        CreateUserNode()
        //RetrieveName()
        //RetrieveNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func CreateUserNode(){
//        let x = "bob"
//        let url: String = "http://ec2-52-22-243-65.compute-1.amazonaws.com"
//        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
//        let node = Node()
//        //node.setProp("PracticeArray", propertyValue: array)
//        node.setProp("Name", propertyValue: "BOB")
//
//        node.addLabel("test_008_succesfullyAddNodeWithLabel_" + x)
//        
//        theo.createNode(node, completionBlock: {(node, error) in
//            print("new node \(node)")
//        });
//    }
//    func RetrieveData(){
//        
//        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
//        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
//        let cyperQuery: String = "MATCH (n) WHERE n.Email = 'aomoussa@asu.edu' MATCH (n)-[r:REVIEW]-(b) RETURN b.ID, b.Name, b.Longitude, b.Latitude, b.Type, b.Address"
//        let cyperParams: Dictionary<String, AnyObject> = ["user" : "neo4j"]
//        //let completionBlock: TheoCypherQueryCompletionBlock
//        //theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: )
//        theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: {(cypher, error) in
//            print(cypher!.data[0]["b.Name"]!)
//            print(cypher!.data[0]["b.ID"]!)
//            print(cypher!.data[0]["b.Type"]!)
//            print(cypher!.data[0]["b.Address"]!)
//            print(cypher!.data[0]["b.Longitude"]!)
//            print(cypher!.data[0]["b.Latitude"]!)
//            glblUser.places.append(googlePlace(name:kugasd, address: l;ihsd;cih /*all that shit*/)
//            
//            //                self.name = cypher!.data[0]["n.Name"]! as! String
//            
//        })
//    }
    /*func RetrieveNumber(){
        
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        let cyperQuery: String = "MATCH (n) WHERE n.Email = 'b@gmail.com' MATCH (n)-[r:REVIEW]-(b) RETURN count(b)"
        let cyperParams: Dictionary<String, AnyObject> = ["user" : "neo4j"]
        //let completionBlock: TheoCypherQueryCompletionBlock
        //theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: )
        theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: {(cypher, error) in
            print(cypher!.data[0]["count(b)"]!)

            
        })
    }*/
    func RetrieveUsers(){
        
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        let cyperQuery: String = "MATCH n WHERE n : User RETURN n.FirstName, n.LastName, n.Email, id(n)"
        let cyperParams: Dictionary<String, AnyObject> = ["user" : "neo4j"]
        //let completionBlock: TheoCypherQueryCompletionBlock
        //theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: )
        theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: {(cypher, error) in
            print(cypher!.data[0]["n.FirstName"]!)
            print(cypher!.data[0]["n.LastName"]!)
            print(cypher!.data[0]["n.Email"]!)
            print(cypher!.data[0]["id(n)"]!)
        })
    }
    func RetrieveNumberUsers(){
        
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        let cyperQuery: String = "MATCH n WHERE n : User return count(n)"
        let cyperParams: Dictionary<String, AnyObject> = ["user" : "neo4j"]
        //let completionBlock: TheoCypherQueryCompletionBlock
        //theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: )
        theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: {(cypher, error) in
            print(cypher!.data[0]["count(n)"]!)
            
            
        })
    }
    
    

}

