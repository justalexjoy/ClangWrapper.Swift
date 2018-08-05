//
//  CursorKind+Aliases.swift
//  libclang_example1
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



public extension CursorKind {
//	case FirstDecl                     = UnexposedDecl,
	public static var FirstDecl:CursorKind {
		get {
			return	unexposedDecl
		}
	}
	
//	case LastDecl                      = CXXAccessSpecifier,
	public static var LastDecl:CursorKind {
		get {
			return	cxxAccessSpecifier
		}
	}
	
//	case ObjCSuperClassRef             = 40
	public static var ObjCSuperClassRef:CursorKind {
		get {
			return	CursorKind.fromRaw(raw: CXCursor_ObjCSuperClassRef)
		}
	}
	
//	case LastRef                       = VariableRef,
	public static var LastRef:CursorKind {
		get {
			return	variableRef
		}
	}
	
//	case InvalidFile                   = 70
	public static var InvalidFile:CursorKind {
		get {
			return	CursorKind.fromRaw(raw: CXCursor_InvalidFile)
		}
	}
	
//	case LastInvalid                   = InvalidCode,
	public static var LastInvalid:CursorKind {
		get {
			return	invalidCode
		}
	}
	
//	
//	/**
//	* \brief An expression whose specific kind is not exposed via this
//	* interface.
//	*
//	* Unexposed expressions have the same operations as any other kind
//	* of expression; one can extract their location information,
//	* spelling, children, etc. However, the specific kind of the
//	* expression is not reported.
//	*/
//	case UnexposedExpr                 = 100
	public static var UnexposedExpr:CursorKind {
		get {
			return	CursorKind.fromRaw(raw: CXCursor_UnexposedExpr)
		}
	}
	
//	
//	case LastExpr                      = ObjCSelfExpr,
	public static var LastExpr:CursorKind {
		get {
			return	objCSelfExpr
		}
	}
	
	
//	
//	/**
//	* \brief A statement whose specific kind is not exposed via this
//	* interface.
//	*
//	* Unexposed statements have the same operations as any other kind of
//	* statement; one can extract their location information, spelling,
//	* children, etc. However, the specific kind of the statement is not
//	* reported.
//	*/
//	case UnexposedStmt                 = 200
	public static var UnexposedStmt:CursorKind {
		get {
			return	CursorKind.fromRaw(raw: CXCursor_UnexposedStmt)
		}
	}
	
//	
//	case AsmStmt                       = GCCAsmStmt,
	public static var AsmStmt:CursorKind {
		get {
			return	gccAsmStmt
		}
	}
	
//	
//	case LastStmt                      = OMPTeamsDirective,
	public static var LastStmt:CursorKind {
		get {
			return	ompTeamsDirective
		}
	}
	
//	
//	/**
//	* \brief An attribute whose specific kind is not exposed via this
//	* interface.
//	*/
//	case UnexposedAttr                 = 400
	public static var UnexposedAttr:CursorKind {
		get {
			return	CursorKind.fromRaw(raw: CXCursor_UnexposedAttr)
		}
	}
	
//	
//	case LastAttr                      = CUDASharedAttr,
	public static var LastAttr:CursorKind {
		get {
			return	cudaSharedAttr
		}
	}
	
	
//	
//	case MacroInstantiation            = MacroExpansion,
	public static var MacroInstantiation:CursorKind {
		get {
			return	macroExpansion
		}
	}
	
	
//	
//	case FirstPreprocessing            = PreprocessingDirective,
	public static var FirstPreprocessing:CursorKind {
		get {
			return	preprocessingDirective
		}
	}
	
	
//	case LastPreprocessing             = InclusionDirective,
	public static var LastPreprocessing:CursorKind {
		get {
			return	inclusionDirective
		}
	}
	
	
//	
//	case FirstExtraDecl                = ModuleImportDecl,
	public static var FirstExtraDecl:CursorKind {
		get {
			return	moduleImportDecl
		}
	}
	
	
//	case LastExtraDecl                 = ModuleImportDecl
	public static var LastExtraDecl:CursorKind {
		get {
			return	moduleImportDecl
		}
	}
	
	
//	

}





