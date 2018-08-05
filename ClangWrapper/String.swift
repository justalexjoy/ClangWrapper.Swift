//
//  String.swift
//  libclang_example1
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//

import Foundation

func toSwiftString(_ s:CXString, disposeCXString:Bool) -> String? {
	guard let p = clang_getCString(s) else { return nil }
    
    let charP: UnsafePointer<CChar> = p
    let s1 = String(cString: charP, encoding: .utf8)
    
	if disposeCXString {
		clang_disposeString(s)
	}
	return	s1
}
