//
//  NFTLoader.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//

import Foundation

@MainActor
public class NFTLoader: ObservableObject {
  private var address: String
  public var id: String
  
  @Published public var token: NFT?
  
  public init(_ address: String, _ id: String) {
    self.address = address
    self.id = id
    
    Task(priority: .userInitiated) {
      await load()
    }
  }
  
  public func load() async {
    do {
      token = try await ZoraAPI.shared.token(address: address, id: id)
    } catch {
      // Errors...
    }
  }
}
