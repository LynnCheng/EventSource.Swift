//
//  ViewController.swift
//  EventSourceSwiftDemo
//
//  Created by Haris Amin on 1/21/15.
//  Copyright (c) 2015 Haris Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EventSourceDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let source = EventSource(url: "http://127.0.0.1:8000/")
        source.addEventListener("hello_event", handler: { (e:Event) -> Void in
            print("Event: \(e.event) Data: \(e.data)")
        })
        
        source.onOpen { (e:Event) -> Void in
            print("Connection opened!")
        }
        
        source.onError { (e:Event) -> Void in
            print("Error: \(e.error?.userInfo)")
        }
        
        source.onMessage { (e:Event) -> Void in
            print("Message: \(e.data)");
        }
        
//        source.delegate = self;
    }
    
func eventSourceOpenedConnection(event: Event) {
    print("DELEGATE: OPENED CONNECTION")
}

func eventSourceReceivedError(event: Event, error: NSError) {
    print("DELEGATE: Received Error: \(error)")
}

func eventSourceReceivedMessage(event: Event, message: String) {
    print("DELEGATE: RECEIVED MESSAGE: \(message)")
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

