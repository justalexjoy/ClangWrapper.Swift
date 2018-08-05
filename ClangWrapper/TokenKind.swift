//
//  TokenKind.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//




/**
* \brief Describes a kind of token.
*/
public enum TokenKind: UInt32 {
	/**
	* \brief A token that contains some kind of punctuation.
	*/
	case punctuation
	
	/**
	* \brief A language keyword.
	*/
	case keyword
	
	/**
	* \brief An identifier (that is not a keyword).
	*/
	case identifier
	
	/**
	* \brief A numeric, string, or character literal.
	*/
	case literal
	
	/**
	* \brief A comment.
	*/
	case comment
}

extension TokenKind {
	static func fromRaw(raw r:CXTokenKind) -> TokenKind {
		return	self.init(raw: r)
	}
	
	///	Doesn't work well in Swift 1.2.
	///	Use `fromRaw` instead of.
	init(raw: CXTokenKind) {
		switch raw.rawValue {
		case CXToken_Punctuation.rawValue:
			self	=	.punctuation
		case CXToken_Keyword.rawValue:
			self	=	.keyword
		case CXToken_Identifier.rawValue:
			self	=	.identifier
		case CXToken_Literal.rawValue:
			self	=	.literal
		case CXToken_Comment.rawValue:
			self	=	.comment
		default:
			fatalError("Unknown token-kind constant value: \(raw.rawValue)")
		}
	}
	var raw:CXTokenKind {
		get {
			switch self {
			case .punctuation:
				return	CXToken_Punctuation
			case .keyword:
				return	CXToken_Keyword
			case .identifier:
				return	CXToken_Identifier
			case .literal:
				return	CXToken_Literal
			case .comment:
				return	CXToken_Comment
			}
		}
	}
}
