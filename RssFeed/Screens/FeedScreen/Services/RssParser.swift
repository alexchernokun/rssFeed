//
//  XMLParser.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import Foundation

class RssParser: NSObject {
    
    private enum RssFeedItemAttributes: String {
        case item
        case title
        case link
        case description
        case date = "pubDate"
    }
    
    let networkService: NetworkService
    var xmlParser: XMLParser?
    
    var temporaryElementName = String()
    var rssFeedItem: RssFeedItem?
    var rssFeedItems = [RssFeedItem]()
    
    func getXML(completion: @escaping (Result<[RssFeedItem], Error>) -> Void) {
        networkService.getDataFromRss { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let rssData):
                // for refreshes
                self.rssFeedItems.removeAll()
                self.startParsing(rssData)
                completion(.success(self.rssFeedItems))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Private methods
    private func startParsing(_ data: Data) {
        xmlParser = XMLParser(data: data)
        xmlParser?.delegate = self
        xmlParser?.parse()
    }
}

// MARK: - XML Parser Conformance
extension RssParser: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == RssFeedItemAttributes.item.rawValue {
            rssFeedItem = RssFeedItem(title: "", description: "", link: "", rawDate: "")
        }
        self.temporaryElementName = elementName
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == RssFeedItemAttributes.item.rawValue {
            guard let rssFeedItem = rssFeedItem else { return }
            rssFeedItems.append(rssFeedItem)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if !data.isEmpty {
            if self.temporaryElementName == RssFeedItemAttributes.title.rawValue {
                rssFeedItem?.title += data
            } else if self.temporaryElementName == RssFeedItemAttributes.link.rawValue {
                rssFeedItem?.link += data
            } else if self.temporaryElementName == RssFeedItemAttributes.description.rawValue {
                rssFeedItem?.description += data
            } else if self.temporaryElementName == RssFeedItemAttributes.date.rawValue {
                rssFeedItem?.rawDate += data
            }
        }
    }
}
