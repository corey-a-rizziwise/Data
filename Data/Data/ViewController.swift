//
//  ViewController.swift
//  Data
//
//  Created by Samuel Wang on 10/3/15.
//  Copyright (c) 2015 Samuel Wang. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //CreateNode()
        RetrieveUserData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func CreateNode(){
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        
        let node = Node()
        
        node.setProp("email", propertyValue: email)
        node.setProp("FirstName", propertyValue: firstName)
        node.setProp("LastName", propertyValue: lastName)
        node.setProp("password", propertyValue: password)
        node.addLabel("customLabelForNode_")
        
        theo.createNode(node, completionBlock: {(node, error) in
            println("new node \(node)")
        });
    }*/
    func RetrieveUserData()
    {
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
                
        //fetch meta for a graph
        theo.metaDescription({(meta, error) in
            println("meta in success \(meta) error \(error)")
        })
        
        theo.fetchNode("115", completionBlock: {(node, error) in
            
            println("meta in success \(node!.meta) node \(node) error \(error)")
            println("\n")
            var x = node
            println(x)
        })
        
        var x = theo.fetchNode("115", completionBlock: {(node, error) in
            println("meta in success \(node!.meta) node \(node) error \(error)")
        })
        println(x)
    }
    
    /*func RetrieveUserData()
    {
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        let cyperQuery: String = "MATCH(n {Email: 'corey.a.rizziwise@gmail.com'}) Return n.FirstName, n.LastName"
        let cyperParams: Dictionary<String, AnyObject> = ["user" : "neo4j"]
/*
        let cyperQuery: String = "MATCH (u:User {FirstName: {Corey} }) WITH u MATCH (u)-[:FOLLOWS*0..1]->f WITH DISTINCT f,u MATCH f-[:LASTPOST]-lp-[:NEXTPOST*0..3]-p RETURN p.contentId as contentId, p.title as title, p.tagstr as tagstr, p.timestamp as timestamp, p.url as url, f.username as username, f=u as owner"
        let cyperParams: Dictionary<String, AnyObject> = ["user" : "ajordan"]
*/
            theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: {(cypher, error) in
            var data = cypher!
            println(data.data[0])
        })
    }*/
}