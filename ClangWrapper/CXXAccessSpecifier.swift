//
//  CXXAccessSpecifier.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



public enum CXXAccessSpecifier {
	case invalidAccessSpecifier
	case `public`
	case protected
	case `private`
}

extension CXXAccessSpecifier: CustomStringConvertible {
	public var description:String {
		get {
			switch self {
			case .invalidAccessSpecifier:	return	"InvalidAccessSpecifier"
			case .public:					return	"Public"
			case .protected:				return	"Protected"
			case .private:					return	"Private"
			}
		}
	}
}

internal extension CXXAccessSpecifier {
	init(raw: CX_CXXAccessSpecifier) {
		self	=	select(raw)
	}
	var	raw:CX_CXXAccessSpecifier {
		get {
			switch self {
			case .invalidAccessSpecifier:	return	CX_CXXInvalidAccessSpecifier
			case .public:					return	CX_CXXPublic
			case .protected:				return	CX_CXXProtected
			case .private:					return	CX_CXXPrivate
			}
		}
	}
}




private func select(_ v:CX_CXXAccessSpecifier) -> CXXAccessSpecifier {
	switch v.rawValue {
	case CX_CXXInvalidAccessSpecifier.rawValue:		return	CXXAccessSpecifier.invalidAccessSpecifier
	case CX_CXXPublic.rawValue:						return	CXXAccessSpecifier.public
	case CX_CXXProtected.rawValue:						return	CXXAccessSpecifier.protected
	case CX_CXXPrivate.rawValue:						return	CXXAccessSpecifier.private
	default:
		fatalError("Unknown value for `CX_CXXAccessSpecifier` enum.")
	}
}
