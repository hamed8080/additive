//
//  NSManagedObjectContext+.swift
//  Additive
//
//  Created by hamed on 3/1/23.
//

import CoreData
public extension NSManagedObjectContext {
    func perform(_ block: @escaping () throws -> Void, errorCompeletion: ((Error) -> Void)? = nil ) {
        perform {
            do {
                try block()
            } catch {
                errorCompeletion?(error)
            }
        }
    }
}
