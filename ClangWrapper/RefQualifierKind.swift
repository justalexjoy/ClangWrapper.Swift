//
//  RefQualifierKind.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/22.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



public enum RefQualifierKind: UInt32 {
	///	No ref-qualifier was provided.
	case none	=	0
	
	///	An lvalue ref-qualifier was provided (&).
	case lValue
	
	///	An rvalue ref-qualifier was provided (&&).
	case rValue
}

extension RefQualifierKind {
	static func fromRaw(raw r:CXRefQualifierKind) -> RefQualifierKind {
		return	self.init(raw: r)
	}
	///	Doesn't work well in Swift 1.2.
	///	Use `fromRaw` instead of.
	init(raw: CXRefQualifierKind) {
		switch raw.rawValue {
		case CXRefQualifier_None.rawValue:		self	=	.none
		case CXRefQualifier_LValue.rawValue:	self	=	.lValue
		case CXRefQualifier_RValue.rawValue:	self	=	.rValue
		default:
			fatalError("Unknown `CXRefQualifierKind` value: \(raw)")
		}
	}
	var raw:CXRefQualifierKind {
		get {
			switch self {
			case .none:		return	CXRefQualifier_None
			case .lValue:	return	CXRefQualifier_LValue
			case .rValue:	return	CXRefQualifier_RValue
			}
		}
	}
}
