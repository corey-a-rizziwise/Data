//
//  ViewController.swift
//  Data
//
//  Created by Samuel Wang on 10/3/15.
//  Copyright (c) 2015 Samuel Wang. All rights reserved.
//
import UIKit


var value: String!

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddRelationship()
        //CreateNode()
//        println(RetrieveUserData())
        
        //RetrieveUserData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func AddRelationship() {
        
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        
        /**
        * Setup dispatch group since you to make a 2 part transation
        */
        
        let nodeFetchQueueName: String           = "com.theo.node.fetch.queue"
        let fetchDispatchGroup: dispatch_group_t = dispatch_group_create()
        
        var parentNode: Node?
        var relatedNode: Node?
        var relationship: Relationship = Relationship()
        
        /**
        * Fetch the parent node
        */
        
        dispatch_group_enter(fetchDispatchGroup)
        theo.fetchNode("115", completionBlock: {(node, error) in
            
            println("meta in success \(node!.meta) node \(node) error \(error)")
            
            if let nodeObject: Node = node {
                parentNode = nodeObject
            }
            
            dispatch_group_leave(fetchDispatchGroup)
        })
        
        /**
        * Fetch the related node
        */
        
        dispatch_group_enter(fetchDispatchGroup)
        theo.fetchNode("146", completionBlock: {(node, error) in
            
            println("meta in success \(node!.meta) node \(node) error \(error)")
            
            if let nodeObject: Node = node {
                relatedNode = nodeObject
            }
            
            dispatch_group_leave(fetchDispatchGroup)
        })
        
        /**
        * End it
        */
        
        dispatch_group_notify(fetchDispatchGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            relationship.relate(parentNode!, toNode: relatedNode!, type: RelationshipType.REVIEW)
            relationship.setProp("REVIEW", propertyValue: "Poop")
            
            theo.createRelationship(relationship, completionBlock: {(rel, error) in
                
            })
        })
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
    /*func RetrieveUserData()
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
    }*/
    
    
    /*func RetrieveUserData()
    {
//        var value = "test"
        let url: String = "http://ec2-52-3-120-155.compute-1.amazonaws.com"
        let theo: Client = Client(baseURL: url, user: "neo4j", pass: "7ducksrw")
        let cyperQuery: String = "MATCH(n {Email: 'corey.a.rizziwise@gmail.com'}) Return n.FirstName, n.LastName"
        let cyperParams: Dictionary<String, AnyObject> = ["user" : "neo4j"]

        theo.executeCypher(cyperQuery, params: cyperParams, completionBlock: {(cypher, error) in
            value = cypher!.data[0]["n.FirstName"]! as! String
            println(value)
        })
//        return value
    }*/
    
//    func returnValue(value: String) -> String {
//        return value
//    }
}