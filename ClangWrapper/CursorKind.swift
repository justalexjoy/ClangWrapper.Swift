//
//  CursorKind.swift
//  libclang_example1
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//




public enum CursorKind: UInt32 {
	/* Declarations */
	/**
	* \brief A declaration whose specific kind is not exposed via this
	* interface.
	*
	* Unexposed declarations have the same operations as any other kind
	* of declaration; one can extract their location information,
	* spelling, find their definitions, etc. However, the specific kind
	* of the declaration is not reported.
	*/
	case unexposedDecl                 = 1
	/** \brief A C or C++ struct. */
	case structDecl                    = 2
	/** \brief A C or C++ union. */
	case unionDecl                     = 3
	/** \brief A C++ class. */
	case classDecl                     = 4
	/** \brief An enumeration. */
	case enumDecl                      = 5
	/**
	* \brief A field (in C) or non-static data member (in C++) in a
	* struct, union, or C++ class.
	*/
	case fieldDecl                     = 6
	/** \brief An enumerator constant. */
	case enumConstantDecl              = 7
	/** \brief A function. */
	case functionDecl                  = 8
	/** \brief A variable. */
	case varDecl                       = 9
	/** \brief A function or method parameter. */
	case parmDecl                      = 10
	/** \brief An Objective-C \@interface. */
	case objCInterfaceDecl             = 11
	/** \brief An Objective-C \@interface for a category. */
	case objCCategoryDecl              = 12
	/** \brief An Objective-C \@protocol declaration. */
	case objCProtocolDecl              = 13
	/** \brief An Objective-C \@property declaration. */
	case objCPropertyDecl              = 14
	/** \brief An Objective-C instance variable. */
	case objCIvarDecl                  = 15
	/** \brief An Objective-C instance method. */
	case objCInstanceMethodDecl        = 16
	/** \brief An Objective-C class method. */
	case objCClassMethodDecl           = 17
	/** \brief An Objective-C \@implementation. */
	case objCImplementationDecl        = 18
	/** \brief An Objective-C \@implementation for a category. */
	case objCCategoryImplDecl          = 19
	/** \brief A typedef */
	case typedefDecl                   = 20
	/** \brief A C++ class method. */
	case cxxMethod                     = 21
	/** \brief A C++ namespace. */
	case namespace                     = 22
	/** \brief A linkage specification, e.g. 'extern "C"'. */
	case linkageSpec                   = 23
	/** \brief A C++ constructor. */
	case constructor                   = 24
	/** \brief A C++ destructor. */
	case destructor                    = 25
	/** \brief A C++ conversion function. */
	case conversionFunction            = 26
	/** \brief A C++ template type parameter. */
	case templateTypeParameter         = 27
	/** \brief A C++ non-type template parameter. */
	case nonTypeTemplateParameter      = 28
	/** \brief A C++ template template parameter. */
	case templateTemplateParameter     = 29
	/** \brief A C++ function template. */
	case functionTemplate              = 30
	/** \brief A C++ class template. */
	case classTemplate                 = 31
	/** \brief A C++ class template partial specialization. */
	case classTemplatePartialSpecialization = 32
	/** \brief A C++ namespace alias declaration. */
	case namespaceAlias                = 33
	/** \brief A C++ using directive. */
	case usingDirective                = 34
	/** \brief A C++ using declaration. */
	case usingDeclaration              = 35
	/** \brief A C++ alias declaration */
	case typeAliasDecl                 = 36
	/** \brief An Objective-C \@synthesize definition. */
	case objCSynthesizeDecl            = 37
	/** \brief An Objective-C \@dynamic definition. */
	case objCDynamicDecl               = 38
	/** \brief An access specifier. */
	case cxxAccessSpecifier            = 39
	
//	case FirstDecl                     = CXCursor_UnexposedDecl,
//	case LastDecl                      = CXCursor_CXXAccessSpecifier,
	
	/* References */
	case firstRef                      = 40  /* Decl references */
//	case ObjCSuperClassRef             = 40
	case objCProtocolRef               = 41
	case objCClassRef                  = 42
	/**
	* \brief A reference to a type declaration.
	*
	* A type reference occurs anywhere where a type is named but not
	* declared. For example, given:
	*
	* \code
	* typedef unsigned size_type;
	* size_type size;
	* \endcode
	*
	* The typedef is a declaration of size_type (CXCursor_TypedefDecl),
	* while the type of the variable "size" is referenced. The cursor
	* referenced by the type of size is the typedef for size_type.
	*/
	case typeRef                       = 43
	case cxxBaseSpecifier              = 44
	/**
	* \brief A reference to a class template, function template, template
	* template parameter, or class template partial specialization.
	*/
	case templateRef                   = 45
	/**
	* \brief A reference to a namespace or namespace alias.
	*/
	case namespaceRef                  = 46
	/**
	* \brief A reference to a member of a struct, union, or class that occurs in
	* some non-expression context, e.g., a designated initializer.
	*/
	case memberRef                     = 47
	/**
	* \brief A reference to a labeled statement.
	*
	* This cursor kind is used to describe the jump to "start_over" in the
	* goto statement in the following example:
	*
	* \code
	*   start_over:
	*     ++counter;
	*
	*     goto start_over;
	* \endcode
	*
	* A label reference cursor refers to a label statement.
	*/
	case labelRef                      = 48
	
	/**
	* \brief A reference to a set of overloaded functions or function templates
	* that has not yet been resolved to a specific function or function template.
	*
	* An overloaded declaration reference cursor occurs in C++ templates where
	* a dependent name refers to a function. For example:
	*
	* \code
	* template<typename T> void swap(T&, T&);
	*
	* struct X { ... };
	* void swap(X&, X&);
	*
	* template<typename T>
	* void reverse(T* first, T* last) {
	*   while (first < last - 1) {
	*     swap(*first, *--last);
	*     ++first;
	*   }
	* }
	*
	* struct Y { };
	* void swap(Y&, Y&);
	* \endcode
	*
	* Here, the identifier "swap" is associated with an overloaded declaration
	* reference. In the template definition, "swap" refers to either of the two
	* "swap" functions declared above, so both results will be available. At
	* instantiation time, "swap" may also refer to other functions found via
	* argument-dependent lookup (e.g., the "swap" function at the end of the
	* example).
	*
	* The functions \c clang_getNumOverloadedDecls() and
	* \c clang_getOverloadedDecl() can be used to retrieve the definitions
	* referenced by this cursor.
	*/
	case overloadedDeclRef             = 49
	
	/**
	* \brief A reference to a variable that occurs in some non-expression
	* context, e.g., a C++ lambda capture list.
	*/
	case variableRef                   = 50
	
//	case LastRef                       = CXCursor_VariableRef,
	
	/* Error conditions */
	case firstInvalid                  = 70
//	case InvalidFile                   = 70
	case noDeclFound                   = 71
	case notImplemented                = 72
	case invalidCode                   = 73
//	case LastInvalid                   = CXCursor_InvalidCode,
	
	/* Expressions */
	case firstExpr                     = 100
	
	/**
	* \brief An expression whose specific kind is not exposed via this
	* interface.
	*
	* Unexposed expressions have the same operations as any other kind
	* of expression; one can extract their location information,
	* spelling, children, etc. However, the specific kind of the
	* expression is not reported.
	*/
//	case UnexposedExpr                 = 100
	
	/**
	* \brief An expression that refers to some value declaration, such
	* as a function, variable, or enumerator.
	*/
	case declRefExpr                   = 101
	
	/**
	* \brief An expression that refers to a member of a struct, union,
	* class, Objective-C class, etc.
	*/
	case memberRefExpr                 = 102
	
	/** \brief An expression that calls a function. */
	case callExpr                      = 103
	
	/** \brief An expression that sends a message to an Objective-C
	object or class. */
	case objCMessageExpr               = 104
	
	/** \brief An expression that represents a block literal. */
	case blockExpr                     = 105
	
	/** \brief An integer literal.
	*/
	case integerLiteral                = 106
	
	/** \brief A floating point number literal.
	*/
	case floatingLiteral               = 107
	
	/** \brief An imaginary number literal.
	*/
	case imaginaryLiteral              = 108
	
	/** \brief A string literal.
	*/
	case stringLiteral                 = 109
	
	/** \brief A character literal.
	*/
	case characterLiteral              = 110
	
	/** \brief A parenthesized expression, e.g. "(1)".
	*
	* This AST node is only formed if full location information is requested.
	*/
	case parenExpr                     = 111
	
	/** \brief This represents the unary-expression's (except sizeof and
	* alignof).
	*/
	case unaryOperator                 = 112
	
	/** \brief [C99 6.5.2.1] Array Subscripting.
	*/
	case arraySubscriptExpr            = 113
	
	/** \brief A builtin binary operation expression such as "x + y" or
	* "x <= y".
	*/
	case binaryOperator                = 114
	
	/** \brief Compound assignment such as "+=".
	*/
	case compoundAssignOperator        = 115
	
	/** \brief The ?: ternary operator.
	*/
	case conditionalOperator           = 116
	
	/** \brief An explicit cast in C (C99 6.5.4) or a C-style cast in C++
	* (C++ [expr.cast]), which uses the syntax (Type)expr.
	*
	* For example: (int)f.
	*/
	case cStyleCastExpr                = 117
	
	/** \brief [C99 6.5.2.5]
	*/
	case compoundLiteralExpr           = 118
	
	/** \brief Describes an C or C++ initializer list.
	*/
	case initListExpr                  = 119
	
	/** \brief The GNU address of label extension, representing &&label.
	*/
	case addrLabelExpr                 = 120
	
	/** \brief This is the GNU Statement Expression extension: ({int X=4; X;})
	*/
	case stmtExpr                      = 121
	
	/** \brief Represents a C11 generic selection.
	*/
	case genericSelectionExpr          = 122
	
	/** \brief Implements the GNU __null extension, which is a name for a null
	* pointer constant that has integral type (e.g., int or long) and is the same
	* size and alignment as a pointer.
	*
	* The __null extension is typically only used by system headers, which define
	* NULL as __null in C++ rather than using 0 (which is an integer that may not
	* match the size of a pointer).
	*/
	case gnuNullExpr                   = 123
	
	/** \brief C++'s static_cast<> expression.
	*/
	case cxxStaticCastExpr             = 124
	
	/** \brief C++'s dynamic_cast<> expression.
	*/
	case cxxDynamicCastExpr            = 125
	
	/** \brief C++'s reinterpret_cast<> expression.
	*/
	case cxxReinterpretCastExpr        = 126
	
	/** \brief C++'s const_cast<> expression.
	*/
	case cxxConstCastExpr              = 127
	
	/** \brief Represents an explicit C++ type conversion that uses "functional"
	* notion (C++ [expr.type.conv]).
	*
	* Example:
	* \code
	*   x = int(0.5);
	* \endcode
	*/
	case cxxFunctionalCastExpr         = 128
	
	/** \brief A C++ typeid expression (C++ [expr.typeid]).
	*/
	case cxxTypeidExpr                 = 129
	
	/** \brief [C++ 2.13.5] C++ Boolean Literal.
	*/
	case cxxBoolLiteralExpr            = 130
	
	/** \brief [C++0x 2.14.7] C++ Pointer Literal.
	*/
	case cxxNullPtrLiteralExpr         = 131
	
	/** \brief Represents the "this" expression in C++
	*/
	case cxxThisExpr                   = 132
	
	/** \brief [C++ 15] C++ Throw Expression.
	*
	* This handles 'throw' and 'throw' assignment-expression. When
	* assignment-expression isn't present, Op will be null.
	*/
	case cxxThrowExpr                  = 133
	
	/** \brief A new expression for memory allocation and constructor calls, e.g:
	* "new CXXNewExpr(foo)".
	*/
	case cxxNewExpr                    = 134
	
	/** \brief A delete expression for memory deallocation and destructor calls,
	* e.g. "delete[] pArray".
	*/
	case cxxDeleteExpr                 = 135
	
	/** \brief A unary expression.
	*/
	case unaryExpr                     = 136
	
	/** \brief An Objective-C string literal i.e. @"foo".
	*/
	case objCStringLiteral             = 137
	
	/** \brief An Objective-C \@encode expression.
	*/
	case objCEncodeExpr                = 138
	
	/** \brief An Objective-C \@selector expression.
	*/
	case objCSelectorExpr              = 139
	
	/** \brief An Objective-C \@protocol expression.
	*/
	case objCProtocolExpr              = 140
	
	/** \brief An Objective-C "bridged" cast expression, which casts between
	* Objective-C pointers and C pointers, transferring ownership in the process.
	*
	* \code
	*   NSString *str = (__bridge_transfer NSString *)CFCreateString();
	* \endcode
	*/
	case objCBridgedCastExpr           = 141
	
	/** \brief Represents a C++0x pack expansion that produces a sequence of
	* expressions.
	*
	* A pack expansion expression contains a pattern (which itself is an
	* expression) followed by an ellipsis. For example:
	*
	* \code
	* template<typename F, typename ...Types>
	* void forward(F f, Types &&...args) {
	*  f(static_cast<Types&&>(args)...);
	* }
	* \endcode
	*/
	case packExpansionExpr             = 142
	
	/** \brief Represents an expression that computes the length of a parameter
	* pack.
	*
	* \code
	* template<typename ...Types>
	* struct count {
	*   static const unsigned value = sizeof...(Types);
	* };
	* \endcode
	*/
	case sizeOfPackExpr                = 143
	
	/* \brief Represents a C++ lambda expression that produces a local function
	* object.
	*
	* \code
	* void abssort(float *x, unsigned N) {
	*   std::sort(x, x + N,
	*             [](float a, float b) {
	*               return std::abs(a) < std::abs(b);
	*             });
	* }
	* \endcode
	*/
	case lambdaExpr                    = 144
	
	/** \brief Objective-c Boolean Literal.
	*/
	case objCBoolLiteralExpr           = 145
	
	/** \brief Represents the "self" expression in an Objective-C method.
	*/
	case objCSelfExpr                  = 146
	
//	case LastExpr                      = CXCursor_ObjCSelfExpr,
	
	/* Statements */
	case firstStmt                     = 200
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
	
	/** \brief A labelled statement in a function.
	*
	* This cursor kind is used to describe the "start_over:" label statement in
	* the following example:
	*
	* \code
	*   start_over:
	*     ++counter;
	* \endcode
	*
	*/
	case labelStmt                     = 201
	
	/** \brief A group of statements like { stmt stmt }.
	*
	* This cursor kind is used to describe compound statements, e.g. function
	* bodies.
	*/
	case compoundStmt                  = 202
	
	/** \brief A case statement.
	*/
	case caseStmt                      = 203
	
	/** \brief A default statement.
	*/
	case defaultStmt                   = 204
	
	/** \brief An if statement
	*/
	case ifStmt                        = 205
	
	/** \brief A switch statement.
	*/
	case switchStmt                    = 206
	
	/** \brief A while statement.
	*/
	case whileStmt                     = 207
	
	/** \brief A do statement.
	*/
	case doStmt                        = 208
	
	/** \brief A for statement.
	*/
	case forStmt                       = 209
	
	/** \brief A goto statement.
	*/
	case gotoStmt                      = 210
	
	/** \brief An indirect goto statement.
	*/
	case indirectGotoStmt              = 211
	
	/** \brief A continue statement.
	*/
	case continueStmt                  = 212
	
	/** \brief A break statement.
	*/
	case breakStmt                     = 213
	
	/** \brief A return statement.
	*/
	case returnStmt                    = 214
	
	/** \brief A GCC inline assembly statement extension.
	*/
	case gccAsmStmt                    = 215
//	case AsmStmt                       = CXCursor_GCCAsmStmt,
	
	/** \brief Objective-C's overall \@try-\@catch-\@finally statement.
	*/
	case objCAtTryStmt                 = 216
	
	/** \brief Objective-C's \@catch statement.
	*/
	case objCAtCatchStmt               = 217
	
	/** \brief Objective-C's \@finally statement.
	*/
	case objCAtFinallyStmt             = 218
	
	/** \brief Objective-C's \@throw statement.
	*/
	case objCAtThrowStmt               = 219
	
	/** \brief Objective-C's \@synchronized statement.
	*/
	case objCAtSynchronizedStmt        = 220
	
	/** \brief Objective-C's autorelease pool statement.
	*/
	case objCAutoreleasePoolStmt       = 221
	
	/** \brief Objective-C's collection statement.
	*/
	case objCForCollectionStmt         = 222
	
	/** \brief C++'s catch statement.
	*/
	case cxxCatchStmt                  = 223
	
	/** \brief C++'s try statement.
	*/
	case cxxTryStmt                    = 224
	
	/** \brief C++'s for (* : *) statement.
	*/
	case cxxForRangeStmt               = 225
	
	/** \brief Windows Structured Exception Handling's try statement.
	*/
	case sehTryStmt                    = 226
	
	/** \brief Windows Structured Exception Handling's except statement.
	*/
	case sehExceptStmt                 = 227
	
	/** \brief Windows Structured Exception Handling's finally statement.
	*/
	case sehFinallyStmt                = 228
	
	/** \brief A MS inline assembly statement extension.
	*/
	case msAsmStmt                     = 229
	
	/** \brief The null statement ";": C99 6.8.3p3.
	*
	* This cursor kind is used to describe the null statement.
	*/
	case nullStmt                      = 230
	
	/** \brief Adaptor class for mixing declarations with statements and
	* expressions.
	*/
	case declStmt                      = 231
	
	/** \brief OpenMP parallel directive.
	*/
	case ompParallelDirective          = 232
	
	/** \brief OpenMP SIMD directive.
	*/
	case ompSimdDirective              = 233
	
	/** \brief OpenMP for directive.
	*/
	case ompForDirective               = 234
	
	/** \brief OpenMP sections directive.
	*/
	case ompSectionsDirective          = 235
	
	/** \brief OpenMP section directive.
	*/
	case ompSectionDirective           = 236
	
	/** \brief OpenMP single directive.
	*/
	case ompSingleDirective            = 237
	
	/** \brief OpenMP parallel for directive.
	*/
	case ompParallelForDirective       = 238
	
	/** \brief OpenMP parallel sections directive.
	*/
	case ompParallelSectionsDirective  = 239
	
	/** \brief OpenMP task directive.
	*/
	case ompTaskDirective              = 240
	
	/** \brief OpenMP master directive.
	*/
	case ompMasterDirective            = 241
	
	/** \brief OpenMP critical directive.
	*/
	case ompCriticalDirective          = 242
	
	/** \brief OpenMP taskyield directive.
	*/
	case ompTaskyieldDirective         = 243
	
	/** \brief OpenMP barrier directive.
	*/
	case ompBarrierDirective           = 244
	
	/** \brief OpenMP taskwait directive.
	*/
	case ompTaskwaitDirective          = 245
	
	/** \brief OpenMP flush directive.
	*/
	case ompFlushDirective             = 246
	
	/** \brief Windows Structured Exception Handling's leave statement.
	*/
	case sehLeaveStmt                  = 247
	
	/** \brief OpenMP ordered directive.
	*/
	case ompOrderedDirective           = 248
	
	/** \brief OpenMP atomic directive.
	*/
	case ompAtomicDirective            = 249
	
	/** \brief OpenMP for SIMD directive.
	*/
	case ompForSimdDirective           = 250
	
	/** \brief OpenMP parallel for SIMD directive.
	*/
	case ompParallelForSimdDirective   = 251
	
	/** \brief OpenMP target directive.
	*/
	case ompTargetDirective            = 252
	
	/** \brief OpenMP teams directive.
	*/
	case ompTeamsDirective             = 253
	
//	case LastStmt                      = CXCursor_OMPTeamsDirective,
	
	/**
	* \brief Cursor that represents the translation unit itself.
	*
	* The translation unit cursor exists primarily to act as the root
	* cursor for traversing the contents of a translation unit.
	*/
	case translationUnit               = 300
	
	/* Attributes */
	case firstAttr                     = 400
//	/**
//	* \brief An attribute whose specific kind is not exposed via this
//	* interface.
//	*/
//	case UnexposedAttr                 = 400
	
	case ibActionAttr                  = 401
	case ibOutletAttr                  = 402
	case ibOutletCollectionAttr        = 403
	case cxxFinalAttr                  = 404
	case cxxOverrideAttr               = 405
	case annotateAttr                  = 406
	case asmLabelAttr                  = 407
	case packedAttr                    = 408
	case pureAttr                      = 409
	case constAttr                     = 410
	case noDuplicateAttr               = 411
	case cudaConstantAttr              = 412
	case cudaDeviceAttr                = 413
	case cudaGlobalAttr                = 414
	case cudaHostAttr                  = 415
	case cudaSharedAttr                = 416
//	case LastAttr                      = CXCursor_CUDASharedAttr,
	
	/* Preprocessing */
	case preprocessingDirective        = 500
	case macroDefinition               = 501
	case macroExpansion                = 502
//	case MacroInstantiation            = CXCursor_MacroExpansion,
	case inclusionDirective            = 503
//	case FirstPreprocessing            = CXCursor_PreprocessingDirective,
//	case LastPreprocessing             = CXCursor_InclusionDirective,
	
	/* Extra Declarations */
	/**
	* \brief A module import declaration.
	*/
	case moduleImportDecl              = 600
//	case FirstExtraDecl                = CXCursor_ModuleImportDecl,
//	case LastExtraDecl                 = CXCursor_ModuleImportDecl
}


