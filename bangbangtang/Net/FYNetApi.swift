//
//  FYNetApi.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit
import Moya
import CommonCrypto

enum FYNetApi {
  case feedList//登录
  case shopList //商城首页
}

extension FYNetApi : TargetType {
    var baseURL: URL {
         return URL(string: "https://mapi.bbtkids.cn/")!
    }
    
    var path: String {
        switch self {
        case .feedList:
            return "4.1/uiforum/getFeedList"
        case .shopList:
            return "2.4/uimall/getPrevItemFeedList"
        }
       
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .feedList:
        return .requestCompositeParameters(bodyParameters:["num" :1,"feedListType" : "recommend"] , bodyEncoding: JSONEncoding.default, urlParameters: [:])
        case .shopList:
            return .requestCompositeParameters(bodyParameters:["boundaryId" :0,"num" : 20,"isapp" : "iOS4.3.0.6"] , bodyEncoding: JSONEncoding.default, urlParameters: [:])
        }
    }
    
    var headers: [String : String]? {
        return ["sysv" : "ios13.3.1",
                "hw":"iPhone11",
                "version":"ios4.3.0.6",
                "openudid":"f7e769ed5273b628adf929654c49d5b882963b2a",
                "width":UIScreen.main.bounds.size.width.description,
                "height":kScreenHeight.description,
                "ts":"1587901077",
                "bbtid":"ec5f857b4a7756a712699c5e86f2e16d",
                "timeMachine":"1587901077"]
    }
    
    
    
}

// MARK: - 默认的网络提示请求插件
let spinerPlugin = NetworkActivityPlugin { (state,target) in
    if state == .began {
        print("我开始请求")
//        IDLoading.id_show(onView: getCurrentController().view)
    } else {
        print("我结束请求")
//        IDLoading.id_dismiss()
    }
}

// MARK: - 设置请求超时时间
let requestClosure = {(endpoint: Endpoint, done: @escaping MoyaProvider<FYNetApi>.RequestResultClosure) in
    do {
        var request: URLRequest = try endpoint.urlRequest()
        request.timeoutInterval = 20    //设置请求超时时间
        done(.success(request))
    } catch  {
        print("错误了 \(error)")
//        IDLoading.id_dismiss()
    }
}

// MARK: - 设置请求头部信息
var endpointClosure = { (target: FYNetApi) -> Endpoint in
    let sessionId =  ""
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    var endpoint: Endpoint = Endpoint(
        url: url,
        sampleResponseClosure: {.networkResponse(200, target.sampleData)},
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    return endpoint.adding(newHTTPHeaderFields: [
        "Content-Type" : "application/json; charset=utf-8;",
        "COOKIE" : "JSESSIONID=\(sessionId)",
        "Accept": "application/json;application/octet-stream;text/html,text/json;text/plain;text/javascript;text/xml;application/x-www-form-urlencoded;image/png;image/jpeg;image/jpg;image/gif;image/bmp;image/*"

        ])
}
let provider = MoyaProvider<FYNetApi>(endpointClosure: endpointClosure, requestClosure : requestClosure,plugins:[spinerPlugin])

class FYNetManager: NSObject {
    //成功的闭包
    typealias SuccessJSONClosure = (_ result:Any) -> Void
    static let shared = FYNetManager()
    
    func post(target:FYNetApi,  successClosure: @escaping SuccessJSONClosure)  {
            provider.request(target) { (result) in
                switch result {
                case let .success(response):
                    do {
                        let jsonString : NSDictionary = try response.mapJSON() as! NSDictionary
                        ACLog(jsonString)
                         let jsonData = try JSONSerialization.data(withJSONObject: jsonString["data"] as Any, options: [])
                        successClosure(jsonData)
                    } catch {
                        //系统异常
                        ACLog("失败")
                    }
                    //
                    
                case .failure(_):
    //                print(result.error as Any)
                    break
                }
            }
        }
}

