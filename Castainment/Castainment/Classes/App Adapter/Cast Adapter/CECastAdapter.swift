//
//  CECastAdapter.swift
//  Castainment
//
//  Created by Kanwar Zorawar Singh Rana on 3/11/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Foundation

class CECastAdapter {

    static let sharedCastAdapter = CECastAdapter()
    private init() {}
    
    fileprivate let sessionManager : GCKSessionManager = {
        let castOptions = GCKCastOptions.init(receiverApplicationID: kGCKMediaDefaultReceiverApplicationID)
        GCKCastContext.setSharedInstanceWith(castOptions)
        return GCKCastContext.sharedInstance().sessionManager
    }()
    
    fileprivate let castController : GCKUIMediaController = {
        return GCKUIMediaController.init()
    }()
    
    fileprivate let castSession : GCKCastSession? = {
        return GCKCastContext.sharedInstance().sessionManager.currentCastSession
    }()
    
}

extension CECastAdapter {
    
    func castSessionManager() ->  GCKSessionManager{
        return sessionManager
    }
    
    func castMediaController() -> GCKUIMediaController {
        return castController
    }
    
    func castCurrentSession() -> GCKCastSession {
        return castSession!
    }
    
}
