//
//  CCharArrayOfCCharArray.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//

import Foundation



func aaa<T>(_ strings:[String], block:@escaping (UnsafePointer<UnsafePointer<Int8>?>)->T) -> T {
	///	Keep this in memory until the `block` to be finished.
	let	a	=	strings.map { (s:String) -> NSMutableData in
		let	b	=	s.cString(using: String.Encoding.utf8)!
		assert(b[b.endIndex-1] == 0)
		return	(Data.fromCCharArray(b) as NSData).mutableCopy() as! NSMutableData
	}
	
    let aa: UnsafePointer<Int8>? = nil
    
	let	a1	=	a.map { (d:NSMutableData) -> UnsafePointer<Int8> in
		return UnsafePointer<Int8>(d.mutableBytes.assumingMemoryBound(to: Int8.self))
		} + [aa]
	
	return	a1.withUnsafeBufferPointer { (p:UnsafeBufferPointer<UnsafePointer<Int8>?>) -> T in
		return	block(p.baseAddress! )
	}
}




///	Copied from https://github.com/Eonil/PseudoTeletypewriter.Swift/blob/master/BSD/BSD/BSD.swift
///	Apply any patches to there.
///
///	Generates proper pointer arrays for `exec~` family calls.
///	Terminatin `NULL` is required for `exec~` family calls.
func withCPointerToNullTerminatingCArrayOfCStrings(_ strings:[String], _ block:@escaping ([UnsafePointer<CChar>?])->()) {
	///	Keep this in memory until the `block` to be finished.
	let	a	=	strings.map { (s:String) -> NSMutableData in
		let	b	=	s.cString(using: .utf8)!
		assert(b[b.endIndex-1] == 0)
		return	(Data.fromCCharArray(b) as NSData).mutableCopy() as! NSMutableData
	}
    withArrayOfCStringsCast(strings) { (pointsArray) -> Void in
        let array = pointsArray.map({ (mutPointer) -> UnsafePointer<CChar>? in
            return UnsafePointer(mutPointer)
        })
        
        
        block(array)
    }
    
    //let aa: UnsafeMutablePointer<Int8>? = nil
    
//    let    a1 = a.map { (d:NSMutableData) -> UnsafeMutablePointer<Int8> in
//        return    UnsafeMutablePointer<Int8>(d.mutableBytes.assumingMemoryBound(to: Int8.self))
//        } //+ [aa]
//
//    a1.withUnsafeBufferPointer { (p:UnsafeBufferPointer<UnsafeMutablePointer<Int8>>) -> () in
//        block(p.baseAddress! )
//    }
}
 // needed for strdup and free

public func withArrayOfCStringsCast<R>(
    _ args: [String],
    _ body: ([UnsafeMutablePointer<CChar>?]) -> R
    ) -> R {
    var cStrings = args.map { strdup($0) }
    cStrings.append(nil)
    defer {
        cStrings.forEach { free($0) }
    }
    return body(cStrings)
}





private extension Data {
	func toUInt8Array() -> [UInt8] {
		let	p	=	(self as NSData).bytes
        let	p1: UnsafePointer<UInt8> = p.assumingMemoryBound(to: UInt8.self)
		
		var	bs	=	[] as [UInt8]
		for i in 0..<self.count {
			bs.append(p1[i])
		}
		
		return	bs
	}
	func toString() -> String {
		return	NSString(data: self, encoding: String.Encoding.utf8.rawValue)! as String
	}
	static func fromUInt8Array(_ bs:[UInt8]) -> Data {
		var	r	=	nil as Data?
		bs.withUnsafeBufferPointer { (p:UnsafeBufferPointer<UInt8>) -> () in
			let	p1	=	UnsafeRawPointer(p.baseAddress)
			r		=	Data(bytes: p1!.assumingMemoryBound(to: UInt8.self), count: p.count)
		}
		return	r!
	}
	
	///	Assumes `cCharacters` is C-string.
	static func fromCCharArray(_ cCharacters:[CChar]) -> Data {
		precondition(cCharacters.count == 0 || cCharacters[(cCharacters.endIndex - 1)] == 0)
		var	r	=	nil as Data?
		cCharacters.withUnsafeBufferPointer { (p:UnsafeBufferPointer<CChar>) -> () in
			let	p1	=	UnsafeRawPointer(p.baseAddress)
			r		=	Data(bytes: p1!.assumingMemoryBound(to: UInt8.self), count: p.count)
		}
		return	r!
	}
}
