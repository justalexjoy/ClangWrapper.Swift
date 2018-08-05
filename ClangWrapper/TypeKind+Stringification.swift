//
//  TypeKind+Stringification.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//





extension TypeKind: CustomStringConvertible {
	public var description:String {
		get {
			let	a	=	[firstNameOf(self)] + aliasesOf(self)
			return	a.joined(separator: "/")
		}
	}
}





private func aliasesOf(_ v:TypeKind) -> [String] {
	if v == TypeKind.FirstBuiltin {
		return	["FirstBuiltin"]
	}
	if v == TypeKind.LastBuiltin {
		return	["LastBuiltin"]
	}
	return	[]
}

private func firstNameOf(_ v:TypeKind) -> String {
	switch v {
	case TypeKind.invalid: return "Invalid"
	case TypeKind.unexposed: return "Unexposed"
	case TypeKind.void: return "Void"
	case TypeKind.bool: return "Bool"
	case TypeKind.char_U: return "Char_U"
	case TypeKind.uChar: return "UChar"
	case TypeKind.char16: return "Char16"
	case TypeKind.char32: return "Char32"
	case TypeKind.uShort: return "UShort"
	case TypeKind.uInt: return "UInt"
	case TypeKind.uLong: return "ULong"
	case TypeKind.uLongLong: return "ULongLong"
	case TypeKind.uInt128: return "UInt128"
	case TypeKind.char_S: return "Char_S"
	case TypeKind.sChar: return "SChar"
	case TypeKind.wChar: return "WChar"
	case TypeKind.short: return "Short"
	case TypeKind.int: return "Int"
	case TypeKind.long: return "Long"
	case TypeKind.longLong: return "LongLong"
	case TypeKind.int128: return "Int128"
	case TypeKind.float: return "Float"
	case TypeKind.double: return "Double"
	case TypeKind.longDouble: return "LongDouble"
	case TypeKind.nullPtr: return "NullPtr"
	case TypeKind.overload: return "Overload"
	case TypeKind.dependent: return "Dependent"
	case TypeKind.objCId: return "ObjCId"
	case TypeKind.objCClass: return "ObjCClass"
	case TypeKind.objCSel: return "ObjCSel"
	case TypeKind.complex: return "Complex"
	case TypeKind.pointer: return "Pointer"
	case TypeKind.blockPointer: return "BlockPointer"
	case TypeKind.lValueReference: return "LValueReference"
	case TypeKind.rValueReference: return "RValueReference"
	case TypeKind.record: return "Record"
	case TypeKind.enum: return "Enum"
	case TypeKind.typedef: return "Typedef"
	case TypeKind.objCInterface: return "ObjCInterface"
	case TypeKind.objCObjectPointer: return "ObjCObjectPointer"
	case TypeKind.functionNoProto: return "FunctionNoProto"
	case TypeKind.functionProto: return "FunctionProto"
	case TypeKind.constantArray: return "ConstantArray"
	case TypeKind.vector: return "Vector"
	case TypeKind.incompleteArray: return "IncompleteArray"
	case TypeKind.variableArray: return "VariableArray"
	case TypeKind.dependentSizedArray: return "DependentSizedArray"
	case TypeKind.memberPointer: return "MemberPointer"
	}
}






