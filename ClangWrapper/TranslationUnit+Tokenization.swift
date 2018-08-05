//
//  TranslationUnit+Tokenization.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



public extension TranslationUnit {
	public func tokenize(_ range:SourceRange) -> TokenSequence {
        var	tkrawptr: UnsafeMutablePointer<CXToken>? = nil
        var	tkrawcount: UInt32 = 0
        
        var mutTkrawptr = withUnsafeMutablePointer(to: &tkrawptr) { (mutablePointer) -> UnsafeMutablePointer<UnsafeMutablePointer<CXToken>?> in
            return mutablePointer
        }
        
		clang_tokenize(raw, range.raw, mutTkrawptr, &tkrawcount)
		return	TokenSequence(index: index, rawtu: raw, rawptr: tkrawptr, rawcount: tkrawcount)
	}
//	public func annotateTokens(tokens:TokenSequence, cursors:[Cursor]) {
//	}
}
