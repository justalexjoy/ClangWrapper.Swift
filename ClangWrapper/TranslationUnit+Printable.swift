//
//  TranslationUnit+Printable.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//

import Foundation

extension TranslationUnit: CustomStringConvertible {
	public var description: String {
		get {
			var	s = ""
			runOverChildrenOf(cursor, 0, &s)
			return s
		}
	}
}


private func runOverChildrenOf<O: TextOutputStream>(_ c:Cursor, _ depth:Int, _ s:inout O) {
	let	indent = repeatElement("  ", count: depth).joined(separator: "")
	let	desc = c.description
	s.write("\(indent)\(desc)")
	s.write("\n")
    
    
    let pointS = withUnsafeMutablePointer(to: &s) { (point) -> UnsafeMutablePointer<O> in
        return point
    }
    
	c.visitChildrenWithBlock { (cursor, parent) -> ChildVisitResult in
        var s2 = pointS.pointee
        
        runOverChildrenOf(cursor, depth+1, &s2)
		return	ChildVisitResult.continue
	}
}


