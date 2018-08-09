//
//  SourceLocation.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//




public struct SourceLocation {
    let raw: CXSourceLocation
    
	public var spelling:(line:UInt32, column:UInt32) {
		get {
			var	line: UInt32    = .max
			var	column: UInt32  = .max
			clang_getSpellingLocation(raw, nil, &line, &column, nil)
			return	(line, column)
		}
	}
	
    public var fileLocation:(line:UInt32, column:UInt32, file: String?) {
        get {
            var file: CXFile?
            var line: UInt32    = .max
            var column: UInt32  = .max
            
            clang_getFileLocation(raw, &file, &line, &column, nil);
            let fileName = toSwiftString(clang_getFileName(file), disposeCXString: true)
        
            return (line, column, fileName)
        }
    }
    public var fileName: String? {
        get {
            var file: CXFile?
            
            clang_getSpellingLocation(raw, &file, nil, nil, nil)
            return toSwiftString(clang_getFileName(file), disposeCXString: true)
        }
    }
	
	init(raw: CXSourceLocation) {
		self.raw	=	raw
	}
}

public struct SourceRange {
	public var start:SourceLocation {
		get {
			return	SourceLocation(raw: clang_getRangeStart(raw))
		}
	}
	public var end:SourceLocation {
		get {
			return	SourceLocation(raw: clang_getRangeEnd(raw))
		}
	}
	
	////
	
	let	raw:CXSourceRange
	
	init(raw: CXSourceRange) {
		self.raw	=	raw
	}
}



