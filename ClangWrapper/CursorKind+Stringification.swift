//
//  CursorKind+Stringification.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//




extension CursorKind: CustomStringConvertible {
	public var description:String {
		get{
			let	a	=	[firstNameOf(self)] + aliasesOf(self)
			let	s	=	a.joined(separator: "/")
			return	s
		}
	}
}














private func firstNameOf(_ kind:CursorKind) -> String {
	switch kind {
		
	case CursorKind.unexposedDecl                 : return	"UnexposedDecl"
		
	case CursorKind.structDecl                    : return	"StructDecl"
		
	case CursorKind.unionDecl                     : return	"UnionDecl"
		
	case CursorKind.classDecl                     : return	"ClassDecl"
		
	case CursorKind.enumDecl                      : return	"EnumDecl"
		
	case CursorKind.fieldDecl                     : return	"FieldDecl"
		
	case CursorKind.enumConstantDecl              : return	"EnumConstantDecl"
		
	case CursorKind.functionDecl                  : return	"FunctionDecl"
		
	case CursorKind.varDecl                       : return	"VarDecl"
		
	case CursorKind.parmDecl                      : return	"ParmDecl"
		
	case CursorKind.objCInterfaceDecl             : return	"ObjCInterfaceDecl"
		
	case CursorKind.objCCategoryDecl              : return	"ObjCCategoryDecl"
		
	case CursorKind.objCProtocolDecl              : return	"ObjCProtocolDecl"
		
	case CursorKind.objCPropertyDecl              : return	"ObjCPropertyDecl"
		
	case CursorKind.objCIvarDecl                  : return	"ObjCIvarDecl"
		
	case CursorKind.objCInstanceMethodDecl        : return	"ObjCInstanceMethodDecl"
		
	case CursorKind.objCClassMethodDecl           : return	"ObjCClassMethodDecl"
		
	case CursorKind.objCImplementationDecl        : return	"ObjCImplementationDecl"
		
	case CursorKind.objCCategoryImplDecl          : return	"ObjCCategoryImplDecl"
		
	case CursorKind.typedefDecl                   : return	"TypedefDecl"
		
	case CursorKind.cxxMethod                     : return	"CXXMethod"
		
	case CursorKind.namespace                     : return	"Namespace"
		
	case CursorKind.linkageSpec                   : return	"LinkageSpec"
		
	case CursorKind.constructor                   : return	"Constructor"
		
	case CursorKind.destructor                    : return	"Destructor"
		
	case CursorKind.conversionFunction            : return	"ConversionFunction"
		
	case CursorKind.templateTypeParameter         : return	"TemplateTypeParameter"
		
	case CursorKind.nonTypeTemplateParameter      : return	"NonTypeTemplateParameter"
		
	case CursorKind.templateTemplateParameter     : return	"TemplateTemplateParameter"
		
	case CursorKind.functionTemplate              : return	"FunctionTemplate"
		
	case CursorKind.classTemplate                 : return	"ClassTemplate"
		
	case CursorKind.classTemplatePartialSpecialization : return	"ClassTemplatePartialSpecialization"
		
	case CursorKind.namespaceAlias                : return	"NamespaceAlias"
		
	case CursorKind.usingDirective                : return	"UsingDirective"
		
	case CursorKind.usingDeclaration              : return	"UsingDeclaration"
		
	case CursorKind.typeAliasDecl                 : return	"TypeAliasDecl"
		
	case CursorKind.objCSynthesizeDecl            : return	"ObjCSynthesizeDecl"
		
	case CursorKind.objCDynamicDecl               : return	"ObjCDynamicDecl"
		
	case CursorKind.cxxAccessSpecifier            : return	"CXXAccessSpecifier"
		
		
		
	case CursorKind.firstRef                        : return	"FirstRef"
	case CursorKind.objCProtocolRef               : return	"ObjCProtocolRef"
	case CursorKind.objCClassRef                  : return	"ObjCClassRef"
		
	case CursorKind.typeRef                       : return	"TypeRef"
	case CursorKind.cxxBaseSpecifier              : return	"CXXBaseSpecifier"
		
	case CursorKind.templateRef                   : return	"TemplateRef"
		
	case CursorKind.namespaceRef                  : return	"NamespaceRef"
		
	case CursorKind.memberRef                     : return	"MemberRef"
		
	case CursorKind.labelRef                      : return	"LabelRef"
		
		
	case CursorKind.overloadedDeclRef             : return	"OverloadedDeclRef"
		
		
	case CursorKind.variableRef                   : return	"VariableRef"
		
		
		
	case CursorKind.firstInvalid                  : return	"FirstInvalid"
	case CursorKind.noDeclFound                   : return	"NoDeclFound"
	case CursorKind.notImplemented                : return	"NotImplemented"
	case CursorKind.invalidCode                   : return	"InvalidCode"
		
		
	case CursorKind.firstExpr                     : return	"FirstExpr"
		
		
		
		
	case CursorKind.declRefExpr                   : return	"DeclRefExpr"
		
		
	case CursorKind.memberRefExpr                 : return	"MemberRefExpr"
		
		
	case CursorKind.callExpr                      : return	"CallExpr"
		
		
	case CursorKind.objCMessageExpr               : return	"ObjCMessageExpr"
		
		
	case CursorKind.blockExpr                     : return	"BlockExpr"
		
		
	case CursorKind.integerLiteral                : return	"IntegerLiteral"
		
		
	case CursorKind.floatingLiteral               : return	"FloatingLiteral"
		
		
	case CursorKind.imaginaryLiteral              : return	"ImaginaryLiteral"
		
		
	case CursorKind.stringLiteral                 : return	"StringLiteral"
		
		
	case CursorKind.characterLiteral              : return	"CharacterLiteral"
		
		
	case CursorKind.parenExpr                     : return	"ParenExpr"
		
		
	case CursorKind.unaryOperator                 : return	"UnaryOperator"
		
		
	case CursorKind.arraySubscriptExpr            : return	"ArraySubscriptExpr"
		
		
	case CursorKind.binaryOperator                : return	"BinaryOperator"
		
		
	case CursorKind.compoundAssignOperator        : return	"CompoundAssignOperator"
		
		
	case CursorKind.conditionalOperator           : return	"ConditionalOperator"
		
		
	case CursorKind.cStyleCastExpr                : return	"CStyleCastExpr"
		
		
	case CursorKind.compoundLiteralExpr           : return	"CompoundLiteralExpr"
		
		
	case CursorKind.initListExpr                  : return	"InitListExpr"
		
		
	case CursorKind.addrLabelExpr                 : return	"AddrLabelExpr"
		
		
	case CursorKind.stmtExpr                      : return	"StmtExpr"
		
		
	case CursorKind.genericSelectionExpr          : return	"GenericSelectionExpr"
		
		
	case CursorKind.gnuNullExpr                   : return	"GNUNullExpr"
		
		
	case CursorKind.cxxStaticCastExpr             : return	"CXXStaticCastExpr"
		
		
	case CursorKind.cxxDynamicCastExpr            : return	"CXXDynamicCastExpr"
		
		
	case CursorKind.cxxReinterpretCastExpr        : return	"CXXReinterpretCastExpr"
		
		
	case CursorKind.cxxConstCastExpr              : return	"CXXConstCastExpr"
		
		
	case CursorKind.cxxFunctionalCastExpr         : return	"CXXFunctionalCastExpr"
		
		
	case CursorKind.cxxTypeidExpr                 : return	"CXXTypeidExpr"
		
		
	case CursorKind.cxxBoolLiteralExpr            : return	"CXXBoolLiteralExpr"
		
		
	case CursorKind.cxxNullPtrLiteralExpr         : return	"CXXNullPtrLiteralExpr"
		
		
	case CursorKind.cxxThisExpr                   : return	"CXXThisExpr"
		
		
	case CursorKind.cxxThrowExpr                  : return	"CXXThrowExpr"
		
		
	case CursorKind.cxxNewExpr                    : return	"CXXNewExpr"
		
		
	case CursorKind.cxxDeleteExpr                 : return	"CXXDeleteExpr"
		
		
	case CursorKind.unaryExpr                     : return	"UnaryExpr"
		
		
	case CursorKind.objCStringLiteral             : return	"ObjCStringLiteral"
		
		
	case CursorKind.objCEncodeExpr                : return	"ObjCEncodeExpr"
		
		
	case CursorKind.objCSelectorExpr              : return	"ObjCSelectorExpr"
		
		
	case CursorKind.objCProtocolExpr              : return	"ObjCProtocolExpr"
		
		
	case CursorKind.objCBridgedCastExpr           : return	"ObjCBridgedCastExpr"
		
		
	case CursorKind.packExpansionExpr             : return	"PackExpansionExpr"
		
		
	case CursorKind.sizeOfPackExpr                : return	"SizeOfPackExpr"
		
		
	case CursorKind.lambdaExpr                    : return	"LambdaExpr"
		
		
	case CursorKind.objCBoolLiteralExpr           : return	"ObjCBoolLiteralExpr"
		
		
	case CursorKind.objCSelfExpr                  : return	"ObjCSelfExpr"
		
		
		
	case CursorKind.firstStmt                     : return	"FirstStmt"
		
		
	case CursorKind.labelStmt                     : return	"LabelStmt"
		
		
	case CursorKind.compoundStmt                  : return	"CompoundStmt"
		
		
	case CursorKind.caseStmt                      : return	"CaseStmt"
		
		
	case CursorKind.defaultStmt                   : return	"DefaultStmt"
		
		
	case CursorKind.ifStmt                        : return	"IfStmt"
		
		
	case CursorKind.switchStmt                    : return	"SwitchStmt"
		
		
	case CursorKind.whileStmt                     : return	"WhileStmt"
		
		
	case CursorKind.doStmt                        : return	"DoStmt"
		
		
	case CursorKind.forStmt                       : return	"ForStmt"
		
		
	case CursorKind.gotoStmt                      : return	"GotoStmt"
		
		
	case CursorKind.indirectGotoStmt              : return	"IndirectGotoStmt"
		
		
	case CursorKind.continueStmt                  : return	"ContinueStmt"
		
		
	case CursorKind.breakStmt                     : return	"BreakStmt"
		
		
	case CursorKind.returnStmt                    : return	"ReturnStmt"
		
		
	case CursorKind.gccAsmStmt                    : return	"GCCAsmStmt"
		
		
	case CursorKind.objCAtTryStmt                 : return	"ObjCAtTryStmt"
		
		
	case CursorKind.objCAtCatchStmt               : return	"ObjCAtCatchStmt"
		
		
	case CursorKind.objCAtFinallyStmt             : return	"ObjCAtFinallyStmt"
		
		
	case CursorKind.objCAtThrowStmt               : return	"ObjCAtThrowStmt"
		
		
	case CursorKind.objCAtSynchronizedStmt        : return	"ObjCAtSynchronizedStmt"
		
		
	case CursorKind.objCAutoreleasePoolStmt       : return	"ObjCAutoreleasePoolStmt"
		
		
	case CursorKind.objCForCollectionStmt         : return	"ObjCForCollectionStmt"
		
		
	case CursorKind.cxxCatchStmt                  : return	"CXXCatchStmt"
		
		
	case CursorKind.cxxTryStmt                    : return	"CXXTryStmt"
		
		
	case CursorKind.cxxForRangeStmt               : return	"CXXForRangeStmt"
		
		
	case CursorKind.sehTryStmt                    : return	"SEHTryStmt"
		
		
	case CursorKind.sehExceptStmt                 : return	"SEHExceptStmt"
		
		
	case CursorKind.sehFinallyStmt                : return	"SEHFinallyStmt"
		
		
	case CursorKind.msAsmStmt                     : return	"MSAsmStmt"
		
		
	case CursorKind.nullStmt                      : return	"NullStmt"
		
		
	case CursorKind.declStmt                      : return	"DeclStmt"
		
		
	case CursorKind.ompParallelDirective          : return	"OMPParallelDirective"
		
		
	case CursorKind.ompSimdDirective              : return	"OMPSimdDirective"
		
		
	case CursorKind.ompForDirective               : return	"OMPForDirective"
		
		
	case CursorKind.ompSectionsDirective          : return	"OMPSectionsDirective"
		
		
	case CursorKind.ompSectionDirective           : return	"OMPSectionDirective"
		
		
	case CursorKind.ompSingleDirective            : return	"OMPSingleDirective"
		
		
	case CursorKind.ompParallelForDirective       : return	"OMPParallelForDirective"
		
		
	case CursorKind.ompParallelSectionsDirective  : return	"OMPParallelSectionsDirective"
		
		
	case CursorKind.ompTaskDirective              : return	"OMPTaskDirective"
		
		
	case CursorKind.ompMasterDirective            : return	"OMPMasterDirective"
		
		
	case CursorKind.ompCriticalDirective          : return	"OMPCriticalDirective"
		
		
	case CursorKind.ompTaskyieldDirective         : return	"OMPTaskyieldDirective"
		
		
	case CursorKind.ompBarrierDirective           : return	"OMPBarrierDirective"
		
		
	case CursorKind.ompTaskwaitDirective          : return	"OMPTaskwaitDirective"
		
		
	case CursorKind.ompFlushDirective             : return	"OMPFlushDirective"
		
		
	case CursorKind.sehLeaveStmt                  : return	"SEHLeaveStmt"
		
		
	case CursorKind.ompOrderedDirective           : return	"OMPOrderedDirective"
		
		
	case CursorKind.ompAtomicDirective            : return	"OMPAtomicDirective"
		
		
	case CursorKind.ompForSimdDirective           : return	"OMPForSimdDirective"
		
		
	case CursorKind.ompParallelForSimdDirective   : return	"OMPParallelForSimdDirective"
		
		
	case CursorKind.ompTargetDirective            : return	"OMPTargetDirective"
		
		
	case CursorKind.ompTeamsDirective             : return	"OMPTeamsDirective"
		
		
		
	case CursorKind.translationUnit               : return	"TranslationUnit"
		
		
	case CursorKind.firstAttr                     : return	"FirstAttr"
		
	case CursorKind.ibActionAttr                  : return	"IBActionAttr"
	case CursorKind.ibOutletAttr                  : return	"IBOutletAttr"
	case CursorKind.ibOutletCollectionAttr        : return	"IBOutletCollectionAttr"
	case CursorKind.cxxFinalAttr                  : return	"CXXFinalAttr"
	case CursorKind.cxxOverrideAttr               : return	"CXXOverrideAttr"
	case CursorKind.annotateAttr                  : return	"AnnotateAttr"
	case CursorKind.asmLabelAttr                  : return	"AsmLabelAttr"
	case CursorKind.packedAttr                    : return	"PackedAttr"
	case CursorKind.pureAttr                      : return	"PureAttr"
	case CursorKind.constAttr                     : return	"ConstAttr"
	case CursorKind.noDuplicateAttr               : return	"NoDuplicateAttr"
	case CursorKind.cudaConstantAttr              : return	"CUDAConstantAttr"
	case CursorKind.cudaDeviceAttr                : return	"CUDADeviceAttr"
	case CursorKind.cudaGlobalAttr                : return	"CUDAGlobalAttr"
	case CursorKind.cudaHostAttr                  : return	"CUDAHostAttr"
	case CursorKind.cudaSharedAttr                : return	"CUDASharedAttr"
		
		
	case CursorKind.preprocessingDirective        : return	"PreprocessingDirective"
	case CursorKind.macroDefinition               : return	"MacroDefinition"
	case CursorKind.macroExpansion                : return	"MacroExpansion"
	case CursorKind.inclusionDirective            : return	"InclusionDirective"
		
	case CursorKind.moduleImportDecl              : return	"ModuleImportDecl"
		
    default:
        return "Other Kind"
    }
	
}








private func aliasesOf(_ kind: CursorKind) -> [String] {
	var	s	=	[] as [String]
	
	if kind == CursorKind.FirstDecl { s.append("FirstDecl") }
	
	if kind == CursorKind.LastDecl { s.append("LastDecl") }
	
	if kind == CursorKind.ObjCSuperClassRef { s.append("ObjCSuperClassRef") }
	
	if kind == CursorKind.LastRef { s.append("LastRef") }
	
	if kind == CursorKind.InvalidFile { s.append("InvalidFile") }
	
	if kind == CursorKind.LastInvalid { s.append("LastInvalid") }
	
	if kind == CursorKind.UnexposedExpr { s.append("UnexposedExpr") }
	
	if kind == CursorKind.LastExpr { s.append("LastExpr") }
	
	if kind == CursorKind.UnexposedStmt { s.append("UnexposedStmt") }
	
	if kind == CursorKind.AsmStmt { s.append("AsmStmt") }
	
	if kind == CursorKind.LastStmt { s.append("LastStmt") }
	
	if kind == CursorKind.UnexposedAttr { s.append("UnexposedAttr") }
	
	if kind == CursorKind.LastAttr { s.append("LastAttr") }
	
	if kind == CursorKind.MacroInstantiation { s.append("MacroInstantiation") }
	
	if kind == CursorKind.FirstPreprocessing { s.append("FirstPreprocessing") }
	
	if kind == CursorKind.LastPreprocessing { s.append("LastPreprocessing") }
	
	if kind == CursorKind.FirstExtraDecl { s.append("FirstExtraDecl") }
	
	if kind == CursorKind.LastExtraDecl { s.append("LastExtraDecl") }
	

	return	s
}








