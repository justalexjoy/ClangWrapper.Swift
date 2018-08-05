//
//  TokenSequence.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



//public struct TokenSequence: CollectionType {
public struct TokenSequence: Sequence {
	public func dispose() {
		index.allTokenSequences.untrack(self)
		clang_disposeTokens(rawtu, rawptr, rawcount)
	}
	public var startIndex:Int {
		get {
			return	0
		}
	}
	public var endInded:Int {
		get {
			return	Int(rawcount)
		}
	}
	public subscript(index:Int) -> Token {
		get {
			precondition(index < Int(rawcount))
			return	Token(sequence: self, index: index)
		}
	}
	public func makeIterator() -> AnyIterator<Token> {
		var	i	=	0
		return	AnyIterator { 
			if i == Int(self.rawcount) {
				return	nil
			} else {
				let	tk	=	Token(sequence: self, index: i)
				i += 1
				return	tk
			}
		}
	}
	
	////
	
	init(index:UnmanagedIndexRef, rawtu:CXTranslationUnit, rawptr: UnsafeMutablePointer<CXToken>?, rawcount:UInt32) {
		self.index		=	index
		self.rawtu		=	rawtu
		self.rawptr		=	rawptr
		self.rawcount	=	rawcount
	}
	
	let	index:UnmanagedIndexRef
	let	rawtu:CXTranslationUnit
	let	rawptr:UnsafeMutablePointer<CXToken>?
	let	rawcount:UInt32
}
extension TokenSequence: TrackableRemoteObjectProxy {
	var raw: UnsafeMutablePointer<CXToken> {
		get {
			return	rawptr!
		}
	}
}






