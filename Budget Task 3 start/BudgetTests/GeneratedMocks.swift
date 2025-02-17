// MARK: - Mocks generated from file: Budget/UrlSession.swift at 2022-08-03 10:49:49 +0000

//
//  UrlSession.swift
//  Budget

import Cuckoo
@testable import Budget

import Foundation






 class MockUrlSession: UrlSession, Cuckoo.ClassMock {
    
     typealias MocksType = UrlSession
    
     typealias Stubbing = __StubbingProxy_UrlSession
     typealias Verification = __VerificationProxy_UrlSession

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: UrlSession?

     func enableDefaultImplementation(_ stub: UrlSession) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var url: URL? {
        get {
            return cuckoo_manager.getter("url",
                superclassCall:
                    
                    super.url
                    ,
                defaultCall: __defaultImplStub!.url)
        }
        
        set {
            cuckoo_manager.setter("url",
                value: newValue,
                superclassCall:
                    
                    super.url = newValue
                    ,
                defaultCall: __defaultImplStub!.url = newValue)
        }
        
    }
    
    
    
    
    
     override var session: URLSession? {
        get {
            return cuckoo_manager.getter("session",
                superclassCall:
                    
                    super.session
                    ,
                defaultCall: __defaultImplStub!.session)
        }
        
        set {
            cuckoo_manager.setter("session",
                value: newValue,
                superclassCall:
                    
                    super.session = newValue
                    ,
                defaultCall: __defaultImplStub!.session = newValue)
        }
        
    }
    
    
    
    
    
     override var apiUrl: String? {
        get {
            return cuckoo_manager.getter("apiUrl",
                superclassCall:
                    
                    super.apiUrl
                    ,
                defaultCall: __defaultImplStub!.apiUrl)
        }
        
        set {
            cuckoo_manager.setter("apiUrl",
                value: newValue,
                superclassCall:
                    
                    super.apiUrl = newValue
                    ,
                defaultCall: __defaultImplStub!.apiUrl = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func getSourceUrl(apiUrl: String) -> URL {
        
    return cuckoo_manager.call(
    """
    getSourceUrl(apiUrl: String) -> URL
    """,
            parameters: (apiUrl),
            escapingParameters: (apiUrl),
            superclassCall:
                
                super.getSourceUrl(apiUrl: apiUrl)
                ,
            defaultCall: __defaultImplStub!.getSourceUrl(apiUrl: apiUrl))
        
    }
    
    
    
    
    
     override func callApi(url: URL) -> String {
        
    return cuckoo_manager.call(
    """
    callApi(url: URL) -> String
    """,
            parameters: (url),
            escapingParameters: (url),
            superclassCall:
                
                super.callApi(url: url)
                ,
            defaultCall: __defaultImplStub!.callApi(url: url))
        
    }
    
    

     struct __StubbingProxy_UrlSession: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var url: Cuckoo.ClassToBeStubbedOptionalProperty<MockUrlSession, URL> {
            return .init(manager: cuckoo_manager, name: "url")
        }
        
        
        
        
        var session: Cuckoo.ClassToBeStubbedOptionalProperty<MockUrlSession, URLSession> {
            return .init(manager: cuckoo_manager, name: "session")
        }
        
        
        
        
        var apiUrl: Cuckoo.ClassToBeStubbedOptionalProperty<MockUrlSession, String> {
            return .init(manager: cuckoo_manager, name: "apiUrl")
        }
        
        
        
        
        
        func getSourceUrl<M1: Cuckoo.Matchable>(apiUrl: M1) -> Cuckoo.ClassStubFunction<(String), URL> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: apiUrl) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockUrlSession.self, method:
    """
    getSourceUrl(apiUrl: String) -> URL
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func callApi<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.ClassStubFunction<(URL), String> where M1.MatchedType == URL {
            let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockUrlSession.self, method:
    """
    callApi(url: URL) -> String
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_UrlSession: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var url: Cuckoo.VerifyOptionalProperty<URL> {
            return .init(manager: cuckoo_manager, name: "url", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var session: Cuckoo.VerifyOptionalProperty<URLSession> {
            return .init(manager: cuckoo_manager, name: "session", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var apiUrl: Cuckoo.VerifyOptionalProperty<String> {
            return .init(manager: cuckoo_manager, name: "apiUrl", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func getSourceUrl<M1: Cuckoo.Matchable>(apiUrl: M1) -> Cuckoo.__DoNotUse<(String), URL> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: apiUrl) { $0 }]
            return cuckoo_manager.verify(
    """
    getSourceUrl(apiUrl: String) -> URL
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func callApi<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.__DoNotUse<(URL), String> where M1.MatchedType == URL {
            let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
            return cuckoo_manager.verify(
    """
    callApi(url: URL) -> String
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class UrlSessionStub: UrlSession {
    
    
    
    
     override var url: URL? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URL?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var session: URLSession? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URLSession?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var apiUrl: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func getSourceUrl(apiUrl: String) -> URL  {
        return DefaultValueRegistry.defaultValue(for: (URL).self)
    }
    
    
    
    
    
     override func callApi(url: URL) -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
    
}




