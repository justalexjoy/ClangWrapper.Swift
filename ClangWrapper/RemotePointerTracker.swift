//
//  RemotePointerTracker.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//







protocol TrackableRemoteObjectProxy {
	associatedtype	Ptr: Hashable
	
	var raw:Ptr { get }
	
	///	Performs early-freeing of this resource.
	func dispose()
}




final class RemotePointerTracker<T:TrackableRemoteObjectProxy> {
	var	items	:	[T.Ptr:T]
	
	init() {
		self.items	=	[:]
	}
	deinit {
		killAll()
	}
	func track(_ v:T) {
		items[v.raw]	=	v
	}
	func untrack(_ v:T) {
		items.removeValue(forKey: v.raw)
	}
	func kill(_ v:T) {
		untrack(v)
		v.dispose()
	}
	func killAll() {
		for (k,v) in items {
			v.dispose()
		}
	}
}
