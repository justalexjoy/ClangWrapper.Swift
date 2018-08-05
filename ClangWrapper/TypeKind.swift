//
//  TypeKind.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



/**
 * @}
 */
    
/**
 * \defgroup CINDEX_TYPES Type information for CXCursors
 *
 * @{
 */

/**
 * \brief Describes the kind of type
 */
public enum TypeKind: UInt32 {
	/**
	* \brief Represents an invalid type (e.g., where no type is available).
	*/
	case invalid = 0
	
	/**
	* \brief A type whose specific kind is not exposed via this
	* interface.
	*/
	case unexposed = 1
	
	/* Builtin types */
	case void = 2
	case bool = 3
	case char_U = 4
	case uChar = 5
	case char16 = 6
	case char32 = 7
	case uShort = 8
	case uInt = 9
	case uLong = 10
	case uLongLong = 11
	case uInt128 = 12
	case char_S = 13
	case sChar = 14
	case wChar = 15
	case short = 16
	case int = 17
	case long = 18
	case longLong = 19
	case int128 = 20
	case float = 21
	case double = 22
	case longDouble = 23
	case nullPtr = 24
	case overload = 25
	case dependent = 26
	case objCId = 27
	case objCClass = 28
	case objCSel = 29
//	case FirstBuiltin = case Void
//	case LastBuiltin  = case ObjCSel
	
	case complex = 100
	case pointer = 101
	case blockPointer = 102
	case lValueReference = 103
	case rValueReference = 104
	case record = 105
	case `enum` = 106
	case typedef = 107
	case objCInterface = 108
	case objCObjectPointer = 109
	case functionNoProto = 110
	case functionProto = 111
	case constantArray = 112
	case vector = 113
	case incompleteArray = 114
	case variableArray = 115
	case dependentSizedArray = 116
	case memberPointer = 117
	
	
};






internal extension TypeKind {
	static func fromRaw(raw r:CXTypeKind) -> TypeKind {
		return	self.init(raw: r)
	}
	///	Doesn't work well in Swift 1.2.
	///	Use `fromRaw` instead of.
	init(raw: CXTypeKind) {
		self	=	TypeKind(rawValue: raw.rawValue)!
	}
	var raw:CXTypeKind {
		get {
			return	CXTypeKind(self.rawValue)
		}
	}
}
public extension TypeKind {
	public static var FirstBuiltin:TypeKind {
		get {
			return	void
		}
	}
	public static var LastBuiltin:TypeKind {
		get {
			return	objCSel
		}
	}
}

extension TypeKind {
	public var spelling:String {
		get {
			let	s	=	clang_getTypeKindSpelling(raw)
			let	s1	=	toSwiftString(s, disposeCXString: true)
			return	s1!
		}
	}
}











