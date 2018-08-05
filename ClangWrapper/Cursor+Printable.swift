//
//  Cursor+Printable.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



extension Cursor: CustomStringConvertible {
	public var description:String {
		get {
			let	extras	=	getExtras(self)
			let	extras1	=	extras == nil ? "" : ", \(extras!)"
			return	"\(kind):\(type), [\(spelling)](\(extent))\(extras1)"
		}
	}
}



private func getExtras(_ c:Cursor) -> String? {
	if c.kind == CursorKind.cxxAccessSpecifier {
	}
	switch c.kind {
	case .cxxAccessSpecifier:	return	"CXXAccessSpecifier = \(c.CXXAccessSpecifier.description)"
	case .enumDecl:				return	"underlying type = \(c.enumDeclarationIntegerType)"
	case .enumConstantDecl:		return	"constant value = \(c.enumConstantDeclarationValue), constant unsigned value = \(c.enumConstantDeclarationUnsignedValue)"
//	case .CXXMethod:
//		let	a	=	c.argumentCursors.map({ x in x.spelling })
//		let	b	=	join(", ", a)
//		return	"(\(b)) -> \(c.resultType)"
	default:					return	nil
	}
}
