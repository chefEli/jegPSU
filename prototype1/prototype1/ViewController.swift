//
//  ViewController.swift
//  prototype1
//
//  Created by Elias Khamisy on 11/2/19.
//  Copyright © 2019 Paxton. All rights reserved.
//

import UIKit

struct Event {
    var name: String;
    var desc: String;
    var id: Int;
}
struct EventInCalender {
    var id2: Int;
    var startTime: Int;
    var endTime: Int;
}

class ViewController: UIViewController,UIScrollViewDelegate,XMLParserDelegate {

    var events: [Event] = [];
    var schedule: [EventInCalender] = [];
    var elementName: String = String()
    
    var name = String();
    var desc = String();
    var id = Int();
    var id2 = Int();
    var startTime = Int();
    var endTime = Int();
            

    @IBOutlet weak var scroll: UIScrollView!

    private var lastContentOffset: CGFloat = 0

 
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            print("up")
        }
        else {
            print("down")
        }
    }
    

    

    override func viewDidLoad() {
    
        super.viewDidLoad()

        scrollViewDidScroll(scroll);
        
    }

    func printArray(_ arr: [Event]) {
        for i in arr {
            print(i.name);
            print(i.desc);
            print(i.id);
        }
        print("done")
    }
    func printArray(_ arr: [EventInCalender]) {
        for i in arr {
            print(i.id2);
            print(i.startTime);
            print(i.endTime);
        }
        print("done")
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == "event" {
            name = String()
            desc = String()
            id = Int();
            print("cool");
        }
        else if elementName == "calendarEvent" {
            id2 = Int();
            startTime  = Int();
            endTime = Int();
            print("cool2");
        }

        self.elementName = elementName
    }

    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "event" {
            let event = Event(name: name, desc: desc, id: id)
            events.append(event)
            print("hjgyjh");
        } else if elementName == "calendarEvent" {
            let eventCalendar = EventInCalender(id2: id2, startTime: startTime, endTime: endTime)
            schedule.append(eventCalendar)
            print("hjgyjh");
        }
    }

    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if (!data.isEmpty) {
            if self.elementName == "name" {
                name += data
            } else if self.elementName == "description" {
                desc += data
            } else if self.elementName == "id" {
                id = Int(data) ?? -1;
            }  else if self.elementName == "id2" {
                id2 = Int(data) ?? -1;
            } else if self.elementName == "startTime" {
                startTime = Int(data) ?? -1;
            }  else if self.elementName == "endTime" {
                endTime = Int(data) ?? -1;
            }
        }
    }
}

    
    


