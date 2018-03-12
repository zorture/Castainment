//
//  ViewController.swift
//  Castainment
//
//  Created by Kanwar Zorawar Singh Rana on 3/11/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var castButton: GCKUICastButton!
    
    var kReceiverAppID:String = {
        // You can add your own app id here that you get by registering with the
        // Google Cast SDK Developer Console https://cast.google.com/publish
        return kGCKMediaDefaultReceiverApplicationID
    }()
    
    
    let sessionManager : GCKSessionManager = {
        let castOptions = GCKCastOptions.init(receiverApplicationID: kGCKMediaDefaultReceiverApplicationID)
        GCKCastContext.setSharedInstanceWith(castOptions)
        return GCKCastContext.sharedInstance().sessionManager
    }()
    
    //var castSession : GCKCastSession?
    
    let castMediaController : GCKUIMediaController = {
        return GCKUIMediaController.init()
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sessionManager.add(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMedia() {

        
        let metadata = GCKMediaMetadata(metadataType: .movie)

        let mediaInfo = GCKMediaInformation(contentID: "http://techslides.com/demos/samples/sample.mp4", streamType: .buffered, contentType: "video/mp4", metadata: metadata, streamDuration: 11, mediaTracks: nil, textTrackStyle: nil, customData: nil)
        let castSession: GCKCastSession? = sessionManager.currentCastSession
        if castSession != nil {
            castSession?.remoteMediaClient?.loadMedia(mediaInfo, autoplay: true)
        }
        
        GCKCastContext.sharedInstance().presentDefaultExpandedMediaControls()
    }

    @IBAction func castButtonAction(_ sender: GCKUICastButton) {
        
        GCKCastContext.sharedInstance().presentCastInstructionsViewControllerOnce()
    }
    
    @IBAction func loadVideoAction(_ sender: UIButton) {
        loadMedia()
    }
    
}

extension ViewController: GCKSessionManagerListener {
}

