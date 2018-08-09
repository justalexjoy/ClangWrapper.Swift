//
//  AppDelegate.swift
//  Workbench
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//

import Cocoa
import ClangWrapper

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification) {
		func run(_ f:()->()) {
			f()
		}
		
//		run {
//			let	path		=	NSBundle.mainBundle().pathForResource("Sample", ofType: "c")!
//			
//			let	idx			=	Index(excludeDeclarationsFromPCH: false, displayDiagnostics: false)
//			let	transunit	=	idx.parseTranslationUnit(path)
//			
//			transunit.diagnostics.map { (d:Diagnostic)->() in
//				println(d.spelling)
//			}
//			
//			println(transunit)
//		}
//		
//		run {
//			let	path		=	NSBundle.mainBundle().pathForResource("Sample2", ofType: "h")!
//			
//			let	idx			=	Index(excludeDeclarationsFromPCH: false, displayDiagnostics: false)
//			let	transunit	=	idx.parseTranslationUnit(path, commandLineArguments: ["-std=c++11"])
//			
//			transunit.diagnostics.map { (d:Diagnostic)->() in
//				println(d.spelling)
//			}
//			
//			println(transunit)
//		}
		
		
		run {
            let p = Bundle.main.resourcePath!
            
            let args: [String] = [
                "-ObjC++",
                "-isysroot", "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk",
                "-F\(p)",
            ]
            
            let path = Bundle.main.path(forResource: "chrome_url_util", ofType: "h")!
			let	idx			=	Index(excludeDeclarationsFromPCH: false, displayDiagnostics: false)
			let	transunit	=	idx.parseTranslationUnit(path, commandLineArguments: args)

			print(transunit)
            
            let coursors = transunit.cursor.children.filter { $0.location.fileName == path}
            
            print(coursors)
		}
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}





extension Cursor {
	var sourceCode:String {
		get {
            return	stringOfRange(translationUnit, range: extent)
		}
	}
}

func stringOfRange(_ unit:TranslationUnit, range:SourceRange) -> String {
	var	a		=	[] as [String]
	let	tkseq	=	unit.tokenize(range)
	for tk in tkseq {
		a.append(tk.spelling)
	}
	return a.joined(separator: " ")
}





