//
//  Previews+Provider.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

extension Constants.Previews {
    
    struct Provider {
        
        static let netflix = MoneySplitter.Provider(name: "Netflix", logo: URL(string: "https://1000logos.net/wp-content/uploads/2017/05/Netflix-Logo-2006.png")!)
        static let apple = MoneySplitter.Provider(name: "Apple", logo: URL(string: "https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png")!)
        static let revolut = MoneySplitter.Provider(name: "Revolut", logo: URL(string: "https://1000logos.net/wp-content/uploads/2022/08/Revolut-Symbol.png")!)
        static let digi = MoneySplitter.Provider(name: "Digi", logo: URL(string: "https://radiolive247.ro/wp-content/uploads/2021/07/digi1.jpg")!)
        static let sonyPlaystation = MoneySplitter.Provider(name: "Digi", logo: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/PlayStation_logo.svg/2560px-PlayStation_logo.svg.png")!)
        static let enel = MoneySplitter.Provider(name: "Digi", logo: URL(string: "https://openinnovability.enel.com/etc.clientlibs/enel-common/clientlibs/clientlib-bundle/resources/img/logo/logo-enel-v2.png")!)
        
    }
}
