//
//  ChildVisitResult.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//


/**
* \brief Describes how the traversal of the children of a particular
* cursor should proceed after visiting a particular child cursor.
*
* A value of this enumeration type should be returned by each
* \c CXCursorVisitor to indicate how clang_visitChildren() proceed.
*/
public enum ChildVisitResult: UInt32 {
	/**
	* \brief Terminates the cursor traversal.
	*/
	case `break`
	/**
	* \brief Continues the cursor traversal with the next sibling of
	* the cursor just visited, without visiting its children.
	*/
	case `continue`
	/**
	* \brief Recursively traverse the children of this cursor, using
	* the same visitor and client data.
	*/
	case recurse
}








internal extension ChildVisitResult {
	init(raw: CXChildVisitResult) {
		switch raw.rawValue {
		case CXChildVisit_Break.rawValue:
			self	=	.`break`
			
		case CXChildVisit_Continue.rawValue:
			self	=	.`continue`
			
		case CXChildVisit_Recurse.rawValue:
			self	=	.recurse
			
		default:
			fatalError("Unknown `CXChildVisitResult` constant value.")
		}
	}
	
	var raw:CXChildVisitResult {
		get {
			switch self {
			case .break:		return	CXChildVisit_Break
			case .continue:		return	CXChildVisit_Continue
			case .recurse:		return	CXChildVisit_Recurse
			}
		}
	}
}













